Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5139065C66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 01:07:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0717ah0005010
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jan 2015 17:07:36 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 17:07:35 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Jan 2015 17:07:35 -0800
Message-ID: <1420592855-20473-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC PATCH] package.bbclass: omit .pyc and .pyo file
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
X-List-Received-Date: Wed, 07 Jan 2015 01:07:42 -0000
Content-Type: text/plain

We should not ship .pyc or .pyo file, but there are a few packages
ship .pyc, should we:
1) Ignore them in package.bbclass as this patch showes ?
Or
2) Add a qa check  then fix it by hand one by one ?

Here is the list of oe-core's world build:
python-smartpm-1.4.1
nativesdk-python-smartpm-1.4.1
python3-distribute-0.6.32
python-pycurl-7.19.5
python-pyrex-0.9.9
python-numpy-1.7.0
python-distribute-0.6.32
python-async-0.6.1
python-docutils-0.12
python-pycairo-1.10.0
python-scons-2.3.2
python-imaging-1.1.7
python-gitdb-0.5.4

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package.bbclass |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fc501fc..6960221 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1022,6 +1022,9 @@ python populate_packages () {
             files.append(file)
 
         for file in files:
+            # Skip .pyc and .pyo file.
+            if file.endswith('.pyc') or file.endswith('.pyo'):
+                continue
             if not cpath.islink(file):
                 if cpath.isdir(file):
                     newfiles =  [ os.path.join(file,x) for x in os.listdir(file) ]
@@ -1083,6 +1086,9 @@ python populate_packages () {
         if not dir:
             dir = os.sep
         for f in (files + dirs):
+            # Skip .pyc and .pyo file.
+            if f.endswith('.pyc') or f.endswith('.pyo'):
+                continue
             path = os.path.join(dir, f)
             if ('.' + path) not in seen:
                 unshipped.append(path)
-- 
1.7.9.5


