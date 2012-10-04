Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TJjxc-0003Bz-4L
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 13:51:24 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Oct 2012 04:38:21 -0700
Received: by mail-we0-f175.google.com with SMTP id t44so251160wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 04:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=6a8346BoFGXuocnx0Voc08qRIjVCJHlU45sXp/Ch6T4=;
	b=cHQl9TvEMstLJY2IQp6xvvNFag+mzBOspDFs+8CjDhIdTYMGJ2j8xULk0D5XyIyPLj
	Zf4EHoQFiqcTQZFTApculywgdz8wcEJTa0ZtX7UYi88etaVPc91sXLMi0BOFATV435MK
	rK1rwFDEpX6/t0gJtei1qvb2pYDgoFV15baKnE7ZhnQOS10Ln3b/pmxjhnp1G4o7TITH
	kBgt5xQwbXr4Yfk7IQSSENj+SGhXt2UODz9Io99lywSA8dowOhW42N7ICRbiW/iXuwTo
	xyfzuzBJFHvu72mO/Vtjf23D3UAlBgWVc6wkB3zdpjs0ZP5ZX3tOsS309M3UCp8sntdi
	dJgQ==
Received: by 10.216.227.101 with SMTP id c79mr283132weq.31.1349350699599;
	Thu, 04 Oct 2012 04:38:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm31968186wib.10.2012.10.04.04.38.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 04:38:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2012 12:37:19 +0100
Message-Id: <1349350639-24126-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmO3f1aa8G7cm620RUqmVCosicK3Bc4qPU8VaLLpMpBPkZH87tl9lr8qixpBBLZjSM4sGcV
Subject: [PATCH] shutdown-desktop: ensure the postinst script succeeds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 11:51:24 -0000

When the hostname isn't qemuarm the grep fails so the postinst fails. Stop this
happening by explicitly evaluating true.

[YOCTO #3224]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
index d0f507e..c5096c1 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 SRC_URI = "file://shutdown.desktop"
 
+PR = "r1"
+
 S = "${WORKDIR}"
 
 do_install() {
@@ -14,7 +16,8 @@ do_install() {
 
 pkg_postinst_${PN} () {
     grep -q qemuarm $D${sysconfdir}/hostname && \
-        sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/'
+        sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/' \
+        || true
 }
 
 inherit allarch
-- 
1.7.10



