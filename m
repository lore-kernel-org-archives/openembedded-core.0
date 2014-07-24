Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B57B70732
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 05:38:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6O5cSTl020586
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:38:28 -0700 (PDT)
Received: from [128.224.163.134] (128.224.163.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 23 Jul 2014 22:38:27 -0700
Message-ID: <53D09B99.2030301@windriver.com>
Date: Thu, 24 Jul 2014 13:37:29 +0800
From: Liu Jian <jian.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] archiver: delete the tail slash in directory name
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
X-List-Received-Date: Thu, 24 Jul 2014 05:38:31 -0000
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit

From: Jian Liu <jian.liu@windriver.com>

If directory names in SRC_URI ended with "/", function
do_ar_original() in layers/oe-core/meta/classes/archiver.bbclass
will generate a tar file whose name is ".tar.gz".
So delete the "/" at the tail of the directory names before use the names.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
meta/classes/archiver.bbclass | 1 +
1 file changed, 1 insertion(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 70ffda5..a95b516 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -149,6 +149,7 @@ python do_ar_original() {
fetch = bb.fetch2.Fetch([], d)
for url in fetch.urls:
local = fetch.localpath(url)
+ local = local.rstrip("/")
if os.path.isfile(local):
shutil.copy(local, ar_outdir)
elif os.path.isdir(local):
-- 
1.8.5.2.233.g932f7e4

-- 
Jian Liu
Email: jian.liu@windriver.com
Office Phone: 86-10-84778539


