Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5A56C17F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 09:46:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAE9kSLI015499
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 01:46:38 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 14 Nov 2018 01:46:04 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Nov 2018 17:46:03 +0800
Message-ID: <1542188763-117364-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] oepydevshell-internal.py: decode only when readdata is valid
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
X-List-Received-Date: Wed, 14 Nov 2018 09:46:47 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below problem:
pydevshell raises exception when maximize the python shell window.
when click maximize, rlist of select return ready object, but the
pty.read is None, so throw exception of 'NoneType' object has no
attribute 'decode', change to only decode when readdata is valid.

[YOCTO #11875]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 scripts/oepydevshell-internal.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index 04621ae..2f7d5d4 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -63,7 +63,9 @@ try:
             (ready, _, _) = select.select([pty, sys.stdin], writers , [], 0)
             try:
                 if pty in ready:
-                    i = i + pty.read().decode('utf-8')
+                    readdata = pty.read()
+                    if readdata:
+                        i = i + readdata.decode('utf-8')
                 if i:
                     # Write a page at a time to avoid overflowing output 
                     # d.keys() is a good way to do that
-- 
2.7.4


