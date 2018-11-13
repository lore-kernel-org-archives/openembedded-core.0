Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D98F6B6F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 09:04:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAD94eWi006260
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 01:04:40 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 13 Nov 2018 01:04:39 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Nov 2018 17:04:38 +0800
Message-ID: <1542099878-266444-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] oepydevshell-internal.py: decode only when readdata is valid
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
X-List-Received-Date: Tue, 13 Nov 2018 09:04:40 -0000
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
 scripts/oepydevshell-internal.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index 04621ae..2d1bc77 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -63,7 +63,10 @@ try:
             (ready, _, _) = select.select([pty, sys.stdin], writers , [], 0)
             try:
                 if pty in ready:
-                    i = i + pty.read().decode('utf-8')
+                    readdata=pty.read()
+                    if readdata == None:
+                        continue
+                    i = i + readdata.decode('utf-8')
                 if i:
                     # Write a page at a time to avoid overflowing output 
                     # d.keys() is a good way to do that
-- 
2.7.4


