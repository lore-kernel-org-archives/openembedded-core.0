Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id A1BAF65D08
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 09:33:27 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f8so586305wiw.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 02:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/78NkLg7iH0X/PQxQ1VlnCLAe0j0/JDAMVYdtdSadW8=;
	b=F6GoMxVdIalyURdOxd7A1lwYz1kyV8f1cXLddV28Z3SC271Rp4XnG+TvARauysAoiK
	4i5oBHItL3LYi+U8xRv70V7ooHAtINiZYUI8BAOnR7GMx8cltzyxl+K0doCzQHp7XkMe
	Ng4X0pAwWwuJgNJrCiwuLvSmiu6l4HkTBDgfeEz1wv3Gr7akyTy/Hh4ar2jxVQXv9Yx3
	xORxk1CRQ5LoWrksE2P/HIiflKLTZn1QXlTUc6DiCjg8Gj0OYA/jW4Nct/i/X+XOWhb/
	TxwrIs6zQ+qUdQt3QOZZo8FB7G/uBK3I+4wbbPxAwwrBE16uLgUrzWMZQ4V9Gt1aISco
	ph8w==
X-Gm-Message-State: ALoCoQkLaZL4V4fxTlgdPbzzgX4JZsvDOL9eJmwUp1rdfvtbb/fKaFYJgvPFAjijf7X7knXhUwn6
X-Received: by 10.180.76.146 with SMTP id k18mr2712151wiw.5.1398850408633;
	Wed, 30 Apr 2014 02:33:28 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id h3sm2421862wiz.16.2014.04.30.02.33.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Apr 2014 02:33:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 11:33:23 +0200
Message-Id: <1398850403-25671-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv2] xinput-calibrator: fix XDG launch
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
X-List-Received-Date: Wed, 30 Apr 2014 09:33:29 -0000

In the move from meta-oe to OE-core XDG based launched was dropped
without noting it in the commit message, so fix that regression.

Gnome-session will now launch the calibrator again.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 3f97e19..95abfce 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -25,7 +25,11 @@ do_install_append() {
 
     install -d ${D}${sysconfdir}/X11/Xsession.d/
     install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
+
+    install -d ${D}${sysconfdir}/xdg/autostart
+    sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' ${S}/scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
 }
 
+FILES_${PN} += "${sysconfdir}/xdg/autostart"
 RDEPENDS_${PN} = "xinput formfactor"
 RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.9.0


