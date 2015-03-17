Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 70DD460034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 21:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2HLKLnF016202; Tue, 17 Mar 2015 21:20:21 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vOQl7ZkZ_3ws; Tue, 17 Mar 2015 21:20:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2HLK8WI016192
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 17 Mar 2015 21:20:19 GMT
Message-ID: <1426627208.23698.39.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 17 Mar 2015 21:20:08 +0000
In-Reply-To: <4010D2ED-6067-4B6B-9C27-B2C5FC465DC9@gmail.com>
References: <1426283873-11784-1-git-send-email-jslater@windriver.com>
	<4010D2ED-6067-4B6B-9C27-B2C5FC465DC9@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] package.bbclass: decouple splitting	and stripping
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
X-List-Received-Date: Tue, 17 Mar 2015 21:20:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-03-13 at 23:50 +0100, Bernhard Reutner-Fischer wrote:
> On March 13, 2015 10:57:53 PM GMT+01:00, Joe Slater <jslater@windriver.com> wrote:
> >Fix logic in split_and_strip_files() to allow splitting or
> >stripping independently.  We also return quickly from this
> >function if we have nothing to do.  We seek the following behavior:
> >
> >Strip / Split     Behavior
> >yes   / yes       binaries stripped; debug info and source in -dbg
> >no    / yes       debug info and source in -dbg
> >yes   / no        binaries stripped; -dbg packages empty
> >no    / no        -dbg packages empty (not a very useful case)
> >
> >Currently, no/yes does not work and is the same as no/no.
> >
> >Signed-off-by: Joe Slater <jslater@windriver.com>
> >---
> >meta/classes/package.bbclass |  108
> >++++++++++++++++++++++--------------------
> > 1 file changed, 57 insertions(+), 51 deletions(-)
> >
> >diff --git a/meta/classes/package.bbclass
> >b/meta/classes/package.bbclass
> >index 9f64ed7..ad8771f 100644
> >--- a/meta/classes/package.bbclass
> >+++ b/meta/classes/package.bbclass
> >@@ -812,6 +812,12 @@ python fixup_perms () {
> > }
> > 
> > python split_and_strip_files () {
> 
> >+    for root, dirs, files in cpath.walk(dvar):
> >+        for f in files:
> >+            file = os.path.join(root, f)
> >+            if file.endswith(".ko") and file.find("/lib/modules/") !=
> >-1:
> >+                kernmods.append(file)
> >+                continue
> >  
> >+            # Skip debug files
> >+            if debugappend and file.endswith(debugappend):
> >+                continue
> >+            if debugdir and debugdir in
> >os.path.dirname(file[len(dvar):]):
> >+                continue
> >+
> 
> It's a pity to first construct the files just to throw them away right afterwards.
> Maybe there are other cpath.walk spots that would benefit from file_not_endswith and dir filters?

FWIW cpath is actually a caching wrapper around os.path so there is some
amount of caching going on here behind the scenes. The current code has
been profiled and the worst hot spots worked around with the cache...

Its not perfect and I don't doubt more could be done but these pieces do
seem to help a lot. The best thing we did is avoid a lot of syscall
overhead.

Cheers,

Richard


