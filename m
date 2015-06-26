Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3426759DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 02:27:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5Q2RTvO008030
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 19:27:29 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 25 Jun 2015 19:27:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jun 2015 10:27:49 +0800
Message-ID: <171f6ecb0bdde9a767463c02843319217ef5a9e0.1435285616.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435285616.git.Qi.Chen@windriver.com>
References: <cover.1435285616.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kmod: upgrade to 21
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
X-List-Received-Date: Fri, 26 Jun 2015 02:27:28 -0000
Content-Type: text/plain

Upgrade kmod to 21.
Fix cross compilation problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/kmod/kmod.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 53574b6..e9aa67d 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -16,9 +16,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools gtk-doc
 
-SRCREV = "d9c71758595cad72c8278179eabf17017615f704"
+SRCREV = "0d833715eaa65636dda2705b89359a1e0154dc58"
 # Lookout for PV bump too when SRCREV is changed
-PV = "20+git${SRCPV}"
+PV = "21+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
@@ -37,3 +37,7 @@ PACKAGECONFIG[logging] = " --enable-logging,--disable-logging"
 do_configure_prepend () {
         gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/docs/gtk-doc.make
 }
+
+do_configure_append () {
+	sed -i 's#}libtool#}${TARGET_SYS}-libtool#' ${B}/doltlibtool
+}
-- 
1.9.1


