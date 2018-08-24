Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEBA9795B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 07:00:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7O70Yrb002407
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 00:00:34 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 00:00:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2018 15:00:31 +0800
Message-ID: <1535094031-35363-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] package.bbclass: only one hardlink of separated debug info file in each directory
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
X-List-Received-Date: Fri, 24 Aug 2018 07:00:34 -0000
Content-Type: text/plain

While multiple hardlinks of binary located in different dirs,
there are also multiple hardlinks of separated debug info file
with the same binary name in same debug dirs. But in each dir,
only one debug file with original name works. Because all of
binary hardlinks have one `.gnu_debuglink' which is added in
`splitdebuginfo'. It caused gdb could not find debugging
symbols.

[Before the patch]
$ find .
./usr/bin/foo
./usr/bin/foo-hd1
./usr/bin/.debug
./usr/bin/.debug/foo
./usr/bin/.debug/foo-hd1
./usr/libexec/foo-hd2
./usr/libexec/.debug
./usr/libexec/.debug/foo-hd2

$ readelf --debug-dump usr/libexec/foo-hd2
Contents of the .gnu_debuglink section:
  Separate debug info file: foo

$ gdb usr/libexec/foo-hd2
Reading symbols from usr/libexec/foo-hd2...(no debugging symbols found)...done.
[Before the patch]

[Apply the patch]
$ find .
./usr/bin/foo
./usr/bin/foo-hd1
./usr/bin/.debug
./usr/bin/.debug/foo
./usr/libexec/foo-hd2
./usr/libexec/.debug
./usr/libexec/.debug/foo

$ gdb usr/libexec/foo-hd2
Reading symbols from usr/libexec/foo-hd2...Reading symbols from usr/libexec/.debug/foo...done.
[Apply the patch]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/package.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4ce9de2..a2a45f6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1048,15 +1048,18 @@ python split_and_strip_files () {
         for ref in inodes:
             if len(inodes[ref]) == 1:
                 continue
+
+            target = inodes[ref][0][len(dvar):]
             for file in inodes[ref][1:]:
                 src = file[len(dvar):]
-                dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
+                dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(target) + debugappend
                 fpath = dvar + dest
-                target = inodes[ref][0][len(dvar):]
                 ftarget = dvar + debuglibdir + os.path.dirname(target) + debugdir + "/" + os.path.basename(target) + debugappend
                 bb.utils.mkdirhier(os.path.dirname(fpath))
-                #bb.note("Link %s -> %s" % (fpath, ftarget))
-                os.link(ftarget, fpath)
+                # Only one hardlink of separated debug info file in each directory
+                if not os.access(fpath, os.R_OK):
+                    #bb.note("Link %s -> %s" % (fpath, ftarget))
+                    os.link(ftarget, fpath)
 
         # Create symlinks for all cases we were able to split symbols
         for file in symlinks:
-- 
2.7.4


