Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81EB46D147
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 02:06:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4O265IX032279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 19:06:16 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 23 May 2019 19:05:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 May 2019 10:17:19 +0800
Message-ID: <ff55bb58704a56b9957b36863b704dad3d69ea0f.1558664136.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1558664136.git.Qi.Chen@windriver.com>
References: <cover.1558664136.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: avoid musl specific patches affect glibc systems
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
X-List-Received-Date: Fri, 24 May 2019 02:06:25 -0000
Content-Type: text/plain

systemd upstream only care about glibc. We made musl specific
patches so that systemd could work. But currently these patches
contain potential security issues.

So apply these patches only when the libc is musl.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_242.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 2dda0d0..adb592f 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -27,7 +27,7 @@ SRC_URI += "file://touchscreen.rules \
            "
 
 # patches needed by musl
-SRC_URI += "${SRC_URI_MUSL}"
+SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') == 'musl' else ''}"
 SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
                file://0002-don-t-use-glibc-specific-qsort_r.patch \
                file://0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch \
-- 
1.9.1


