Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SCBCV-0000AB-OM
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 16:47:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 09589315A7FD;
	Mon, 26 Mar 2012 16:38:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id r28f1r81EKwt; Mon, 26 Mar 2012 16:38:07 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c5e52.pool.mediaWays.net [89.12.94.82])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 580DF315A7FB;
	Mon, 26 Mar 2012 16:38:07 +0200 (CEST)
Message-ID: <4F707F4E.1060908@opendreambox.org>
Date: Mon, 26 Mar 2012 16:38:06 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332250625-18091-1-git-send-email-obi@opendreambox.org>
	<4F6CDB0C.6080809@opendreambox.org> <1593126.6uP6AmPbWl@helios>
	<4F7044F5.30500@opendreambox.org>
In-Reply-To: <4F7044F5.30500@opendreambox.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] scripts/bitbake: Allow to override path to pseudodone, make BUILDDIR optional
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2012 14:47:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 26.03.2012 12:29, Andreas Oberritter wrote:
> On 26.03.2012 12:07, Paul Eggleton wrote:
>> On Friday 23 March 2012 21:20:28 Andreas Oberritter wrote:
>>> how do you propose to go on solving this problem?
>>
>> My original patch solved a problem for many newer users who forget to cd back 
>> to their build directories before running bitbake. At least now they get a 
>> reasonable error message they can understand. I'm not going to support 
>> reverting it unless we have a practical alternative and so far I don't see 
>> one.
>>
>> Your original reason for using the configuration you use was that pseudo was 
>> being rebuilt for every new configuration. I have a fix here locally which will 
>> skip doing this - it just needs to call bitbake -e in order to find out 
>> STAGING_BINDIR_NATIVE if pseudodone hasn't been created.
> 
> Yes, this was my original reason (or better: the first one I mentioned).
> 
> However, I still don't want to export BUILDDIR just to run bitbake. It's
> much more convenient to just have to call bitbake directly from every
> machine's build directory than having to set up the environment every
> single time the machine changes. How are me and my distro's users
> supposed to do this in the future?
> 
> Can't bitbake just print a useful error message on its own if it doesn't
> find a usable configuration?

OK, I managed to find a way that's ok for me. I added a wrapper script that
wraps the bitbake wrapper script and sets BUILDDIR automatically. This way
I can als get rid of oe-core/scripts from PATH.

Can you please ack this patch below, though? This keeps your change intact
and surely causes no trouble for you.

Regards,
Andreas

From 92fd89c65a52e68bb0014e3798dabeeedda52c1c Mon Sep 17 00:00:00 2001
From: Andreas Oberritter <obi@opendreambox.org>
Date: Tue, 20 Mar 2012 14:28:41 +0100
Subject: [PATCH] scripts/bitbake: Allow to override path to pseudodone

* Allows to workaround breakage caused by commit
  b4df1c7c79b5c801658bcf890ba3a8eab3d83189.

* Related thread on OE-core mailing list:
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019136.html

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 scripts/bitbake |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 45c8697..ea24de7 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -52,9 +52,13 @@ if [ "`pwd`" != "$BUILDDIR" ] ; then
     exit 1
 fi
 
+if [ -z "$PSEUDODONE" ]; then
+    PSEUDODONE="$BUILDDIR/pseudodone"
+fi
+
 buildpseudo="1"
-if [ $needpseudo = "1" ] && [ -e "$BUILDDIR/pseudodone" ]; then
-    PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
+if [ $needpseudo = "1" ] && [ -e "$PSEUDODONE" ]; then
+    PSEUDOBINDIR=`cat $PSEUDODONE`
     if [ -e "$PSEUDOBINDIR/pseudo" -a -e "$PSEUDOBINDIR/tar" -a "$needtar" = "1" ]; then
         buildpseudo="0"
     fi
@@ -96,7 +100,7 @@ if [ $buildpseudo = "1" ]; then
     if [ "$ret" != "0" ]; then
         exit 1
     fi
-    echo $PSEUDOBINDIR > $BUILDDIR/pseudodone
+    echo $PSEUDOBINDIR > $PSEUDODONE
     # This needs to exist in case pseudo has to log somewhere
     mkdir -p $PSEUDOBINDIR/../../var/pseudo
 fi
@@ -104,7 +108,7 @@ BITBAKE=`which bitbake`
 export PATH=$OLDPATH
 if [ $needpseudo = "1" ]; then
     export PSEUDO_BUILD=2
-    PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
+    PSEUDOBINDIR=`cat $PSEUDODONE`
     PSEUDO_BINDIR=$PSEUDOBINDIR PSEUDO_LIBDIR=$PSEUDOBINDIR/../lib/pseudo/lib PSEUDO_PREFIX=$PSEUDOBINDIR/../../ PSEUDO_DISABLED=1 $PSEUDOBINDIR/pseudo $BITBAKE $@
 else
     export PSEUDO_BUILD=0


