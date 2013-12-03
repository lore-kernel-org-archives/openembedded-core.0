Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B357B6DF0D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 10:27:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB3ARKbR002882
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Dec 2013 02:27:20 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Dec 2013 02:27:19 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Dec 2013 18:27:06 +0800
Message-ID: <837855b3a50fc0672000e2419763a8c6ad062ae3.1386066250.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386066249.git.hongxu.jia@windriver.com>
References: <cover.1386066249.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/3] eglibc-locale.inc: use nativesdk override with the PACKAGES_DYNAMIC statement
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
X-List-Received-Date: Tue, 03 Dec 2013 10:27:21 -0000
Content-Type: text/plain

While compiling nativesdk-mtools, there was failure:
...
Nothing PROVIDES 'nativesdk-glibc-gconv-ibm850'. Close matches:
...

Using nativesdk override with the PACKAGES_DYNAMIC statement fixed this issue.

[YOCTO #5623]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 83569da..5e256a5 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -35,6 +35,12 @@ PACKAGES_DYNAMIC = "^locale-base-.* \
                     ^eglibc-gconv-.* ^eglibc-charmap-.* ^eglibc-localedata-.* ^eglibc-binary-localedata-.* \
                     ^glibc-gconv-.*  ^glibc-charmap-.*  ^glibc-localedata-.*  ^glibc-binary-localedata-.*"
 
+PACKAGES_DYNAMIC_class-nativesdk = "^nativesdk-locale-base-.* \
+                    ^nativesdk-eglibc-gconv-.* ^nativesdk-eglibc-charmap-.* \
+                    ^nativesdk-eglibc-localedata-.* ^nativesdk-eglibc-binary-localedata-.* \
+                    ^nativesdk-glibc-gconv-.*  ^nativesdk-glibc-charmap-.*  \
+                    ^nativesdk-glibc-localedata-.*  ^nativesdk-glibc-binary-localedata-.*"
+
 # Create a eglibc-binaries package
 ALLOW_EMPTY_${BPN}-binaries = "1"
 PACKAGES += "${BPN}-binaries"
-- 
1.8.1.2


