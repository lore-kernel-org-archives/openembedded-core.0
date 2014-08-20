Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9580E65D53
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 08:15:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7K8F1FE004327
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 01:15:01 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 20 Aug 2014 01:15:00 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Aug 2014 16:15:00 +0800
Message-ID: <1408522500-11699-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] delete the tail slash in directory name
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
X-List-Received-Date: Wed, 20 Aug 2014 08:15:08 -0000
Content-Type: text/plain

From: Jian Liu <jian.liu@windriver.com>

If directory names in SRC_URI ended with "/", function
do_ar_original() in layers/oe-core/meta/classes/archiver.bbclass
will generate a tar file whose name is ".tar.gz".
So delete the "/" at the tail of the directory names before use the names.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 meta/classes/archiver.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index efd413b..35e5411 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -136,7 +136,7 @@ python do_ar_original() {
     bb.note('Archiving the original source...')
     fetch = bb.fetch2.Fetch([], d)
     for url in fetch.urls:
-        local = fetch.localpath(url)
+        local = fetch.localpath(url).rstrip("/");
         if os.path.isfile(local):
             shutil.copy(local, ar_outdir)
         elif os.path.isdir(local):
-- 
1.7.10.4


