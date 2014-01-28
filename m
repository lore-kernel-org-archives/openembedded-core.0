Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38A216E881
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 07:31:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0S7VjrM021028
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 23:31:45 -0800 (PST)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Mon, 27 Jan 2014 23:31:45 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jan 2014 15:31:15 +0800
Message-ID: <1390894275-8072-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.3.3
MIME-Version: 1.0
X-Originating-IP: [128.224.153.21]
Subject: [PATCH] multilib.bbclass: fix Multilib QA Issue
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
X-List-Received-Date: Tue, 28 Jan 2014 07:31:46 -0000
Content-Type: text/plain

Multilib QA warning was observed, as follows:
------
WARNING: Multilib QA Issue: lib32-oprofile package lib32-oprofile -
suspicious values 'kernel-vmlinux' in RRECOMMENDS
------

The package starting with 'kernel-vmlinux' should be ok with multilib QA
checking.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/multilib.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 5eb4a7b..9a1cb1d 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -120,7 +120,7 @@ python do_package_qa_multilib() {
                 i = i[len('virtual/'):]
             if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)) and \
                 (not 'cross-canadian' in i) and (not i.startswith("nativesdk-")) and \
-                (not i.startswith("rtld")):
+                (not i.startswith("rtld")) and (not i.startswith('kernel-vmlinux')):
                 candidates.append(i)
         if len(candidates) > 0:
             bb.warn("Multilib QA Issue: %s package %s - suspicious values '%s' in %s" 
-- 
1.8.3.3


