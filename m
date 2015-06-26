Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8C6A60167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 06:23:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5Q6NM3n021081
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 23:23:22 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Jun 2015 23:23:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jun 2015 23:23:21 -0700
Message-ID: <7eaec2a8209ca34e5d8b247f31935af496134aea.1435299778.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435299778.git.liezhi.yang@windriver.com>
References: <cover.1435299778.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sanity.bbclass: check /bin/sh is dash or bash
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
X-List-Received-Date: Fri, 26 Jun 2015 06:23:23 -0000
Content-Type: text/plain

The build would fail when /bin/sh links to ksh or csh, we only test dash
and bash AFAIK.

* When /bin/sh -> csh:
  $ bitbake quilt-native
$ bitbake quilt-native -cfetch
Illegal variable name.
Illegal variable name.
[snip]
uname: extra operand `2'
Try `uname --help' for more information.

* When /bin/sh -> ksh:
  If there are only a few tasks running, for example,
  "bitbake quilt-native", the build would be OK, but it would fail if we
  run "bitbake world" for a while, there would be a lot of "Broken pipe"
  errors:
Exception: CalledProcessError: Command
'cd /path/to/xx; find . -type d -print | tar -cf - -C /path/to/sysroot-destdir -p --files-from - --no-recursion | tar -xf - -C /path/to/xxx'
returned non-zero exit status 2 with output tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
find: `standard output': Broken pipe
find: write error

[YOCTO #7917]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d9eff90..2855941 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -835,6 +835,10 @@ def check_sanity_everybuild(status, d):
     if 'vdi' in d.getVar('IMAGE_FSTYPES', True) and 'live' in d.getVar('IMAGE_FSTYPES', True):
         status.addresult("Error, IMAGE_FSTYPES vdi and live can't be built together\n")
 
+    # Check /bin/sh links to dash or bash
+    real_sh = os.path.realpath('/bin/sh')
+    if not real_sh.endswith('/dash') and not real_sh.endswith('/bash'):
+        status.addresult("Error, /bin/sh links to %s, must be dash or bash\n" % real_sh)
 
 def check_sanity(sanity_data):
     class SanityStatus(object):
-- 
1.7.9.5


