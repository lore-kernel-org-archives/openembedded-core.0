Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5D170030
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 14:10:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4PEAKHp020160
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 25 May 2016 07:10:20 -0700
Received: from co-op.corp.ad.wrs.com (128.224.56.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 May 2016 07:10:19 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 25 May 2016 10:10:08 -0400
Message-ID: <1464185408-26346-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] coreutils: revert upstream commit causing havoc with ls output
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
X-List-Received-Date: Wed, 25 May 2016 14:10:28 -0000
Content-Type: text/plain

A recent commit causes ls to have the following behaviour:

   meta-overc:~$ mkdir abc
   meta-overc:~$ cd abc
   meta-overc:~/abc$ touch  aaaa bbbb 'filename with spaces'
   meta-overc:~/abc$ ls
   aaaa  bbbb  'filename with spaces'
   meta-overc:~/abc$

Note the appearance of quotation marks.  This new behaviour was
introduced as "opt-out" and not "opt-in", and further, the opt-out
suggestion causes other breakage.  More details can be found here:

  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=813164

Several large distros are reverting the change, for practical
considerations as per what can be seen above for Debian.

Here we do the same; I've marked the patch as upstream submitted
since there have been enough people vocally annoyed by this change
that it seems implausible that the coreutils team is unaware of it.

Hopefully this change here is just temporary and the coreutils team
will put the default back to the old way it was based on feedback
similar to what is recorded in the above Debian bug.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[v2: reword commit to reflect general hope that the change in OE will
 only be needed temporarily ; change status to "Submitted". ]

 .../coreutils-8.25/disable-ls-output-quoting.patch | 49 ++++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.25.bb      |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.25/disable-ls-output-quoting.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.25/disable-ls-output-quoting.patch b/meta/recipes-core/coreutils/coreutils-8.25/disable-ls-output-quoting.patch
new file mode 100644
index 000000000000..e68c21355060
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.25/disable-ls-output-quoting.patch
@@ -0,0 +1,49 @@
+Subject: revert inconsistent ls quoting
+
+This is a revert of upstream commit 109b9220cead6e979d22d16327c4d9f8350431cc.
+
+Bug-Debian: https://bugs.debian.org/813164
+
+Upstream-Status: Submitted
+
+Originally-by: Adam Borowski <kilobyte@angband.pl>
+[PG: patch from https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=813164#78 ]
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+
+---
+
+--- coreutils-8.25.orig/NEWS
++++ coreutils-8.25/NEWS
+@@ -71,9 +71,6 @@ GNU coreutils NEWS
+   df now prefers sources towards the root of a device when
+   eliding duplicate bind mounted entries.
+ 
+-  ls now quotes file names unambiguously and appropriate for use in a shell,
+-  when outputting to a terminal.
+-
+   join, sort, uniq with --zero-terminated, now treat '\n' as a field delimiter.
+ 
+ ** Improvements
+--- coreutils-8.25.orig/doc/coreutils.texi
++++ coreutils-8.25/doc/coreutils.texi
+@@ -7750,8 +7750,8 @@ this"} in the default C locale.  This lo
+ 
+ You can specify the default value of the @option{--quoting-style} option
+ with the environment variable @env{QUOTING_STYLE}@.  If that environment
+-variable is not set, the default value is @samp{shell-escape} when the
+-output is a terminal, and @samp{literal} otherwise.
++variable is not set, the default value is @samp{literal}, but this
++default may change to @samp{shell} in a future version of this package.
+ 
+ @item --show-control-chars
+ @opindex --show-control-chars
+--- coreutils-8.25.orig/src/ls.c
++++ coreutils-8.25/src/ls.c
+@@ -1581,7 +1581,6 @@ decode_switches (int argc, char **argv)
+       if (isatty (STDOUT_FILENO))
+         {
+           format = many_per_line;
+-          set_quoting_style (NULL, shell_escape_quoting_style);
+           /* See description of qmark_funny_chars, above.  */
+           qmark_funny_chars = true;
+         }
diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes-core/coreutils/coreutils_8.25.bb
index 245969d2b46b..fc8d061d325d 100644
--- a/meta/recipes-core/coreutils/coreutils_8.25.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://fix-selinux-flask.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
+           file://disable-ls-output-quoting.patch \
           "
 
 SRC_URI[tarball.md5sum] = "070e43ba7f618d747414ef56ab248a48"
-- 
2.7.4


