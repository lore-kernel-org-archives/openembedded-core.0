Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C67A3773E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 00:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v290Ielj002267; Thu, 9 Mar 2017 00:18:40 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G3t-zD8N2s2a; Thu,  9 Mar 2017 00:18:40 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v290IZgr002264
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Mar 2017 00:18:37 GMT
Message-ID: <1489018715.22968.86.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 09 Mar 2017 00:18:35 +0000
In-Reply-To: <20170308184136.GF3279@jama>
References: <cover.1488539819.git.pkj@axis.com>
	<CAEHkU3XyKbGzTCX9XaG7jYXjde+ZRtA9z_MSecxpgOcu6wLMiQ@mail.gmail.com>
	<aca83849e80a444595764b812d5e3394@XBOX02.axis.com>
	<af3c0da4bce549a5b303d828c9728524@XBOX02.axis.com>
	<CAJTo0Laa_WrQOjCyNBBmpWbKkza9Pg=dAiQEQJBrQoiEWab0Bw@mail.gmail.com>
	<1488996030.22968.78.camel@linuxfoundation.org>
	<20170308184136.GF3279@jama>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/5] Add dummy tools to help identify needed dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Mar 2017 00:18:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-08 at 19:41 +0100, Martin Jansa wrote:
> On Wed, Mar 08, 2017 at 06:00:30PM +0000, Richard Purdie wrote:
> > 
> > On Wed, 2017-03-08 at 17:21 +0000, Burton, Ross wrote:
> > > 
> > > 
> > > On 8 March 2017 at 09:43, Peter Kjellerstedt <peter.kjellerstedt@
> > > axis
> > > .com> wrote:
> > > > 
> > > > since I see that you have integrated/staged the two patches
> > > > that
> > > > add
> > > > inherits of pkgconfig, but not the patches that add the dummy
> > > > commands,
> > > > I assume you have some reservations to these patches. What are
> > > > your
> > > > take on the subject of blacklisting vs whitelisting the
> > > > commands
> > > > from
> > > > the build host? I know that having these dummy commands in
> > > > place
> > > > helped
> > > > me a great deal when updating our recipes to build correctly
> > > > with
> > > > RSS.
> > > > 
> > > FWIW I wasn't entirely keen on how the blacklisting had to be
> > > very
> > > careful about how PATH was manipulated, which is why I merged to
> > > my
> > > staging branch the fixes but not the dummy commands.
> > > 
> > > If the majority of people agree that this should be merged I
> > > don't
> > > have a strong opinion either way.
> > Ultimately I think there is a better solution than this but I
> > haven't
> > had time to look at that as yet.
> > 
> > I do worry that it makes assumptions about PATH that may or may not
> > be
> > valid everywhere, equally I do see it could be useful.
> > 
> > So I also have mixed feelings...
> I got many complains about my PNBLACKLISTs saying that the issues
> weren't reproducible elsewhere and in the end it was in 90% one of
> these commonly installed tools like pkgconfig being used from the
> host.
> 
> So I agree that PATH changes are tricky and that whitelisting would
> be even better than this, but still I would prefer to get this merged
> as it will help to identify and fix most common issues and changing
> this to whitelist would be easier in future.

I decided to see how hard adding a whitelist would be. I came up with
the patch below. Admittedly it changes both bitbake and OE-Core,
injects itself into OE-Core's layer.conf and is generally pretty
horrible in some ways but equally it does let me start to run builds.
It crashes and burns somewhere after libtool-native and the list of
tools clearly needs work but it does show what we could do.

I'm therefore torn on Peter's blacklist, or whether its worth a push to
the whitelist now...

How badly do people dislike the patch below?

From: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: bitbake/oe-core: Filter contents of PATH

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
index d6bcfa3..dbb74dd 100644
--- a/bitbake/lib/bb/utils.py
+++ b/bitbake/lib/bb/utils.py
@@ -1526,3 +1526,13 @@ class LogCatcher(logging.Handler):
         self.messages.append(bb.build.logformatter.format(record))
     def contains(self, message):
         return (message in self.messages)
+
+def setup_native_bindir(dest, toolsvar, d):
+    tools = d.getVar(toolsvar).split()
+    path = os.environ.get("PATH")
+    mkdirhier(dest)
+    for tool in tools:
+        desttool = os.path.join(dest, tool)
+        if not os.path.exists(desttool):
+            srctool = which(path, tool)
+            os.symlink(srctool, desttool)
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 87c235f..21265ed 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -59,3 +59,14 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   oprofile->virtual/kernel \
 "
 
+NATIVETOOLS = " \
+    bash sh cut sed gcc ld git rm install which find xargs cat true mktemp \
+    grep tar gzip touch cp mv basename dirname tr getopt sort awk head tail \
+    mkdir patch uniq perl python chmod python3 ar strip expr ls make as \
+    ranlib egrep echo chown cpio tee wc wget bzip2 stat date rmdir od diff \
+    md5sum unlzma dd chrpath file pod2man gunzip python2.7 ln g++ [ \
+    taskset \
+"
+
+DUMMY := "${@bb.utils.setup_native_bindir('${TOPDIR}/nativetools', 'NATIVETOOLS', d)}"
+PATH = "${TOPDIR}/nativetools"


