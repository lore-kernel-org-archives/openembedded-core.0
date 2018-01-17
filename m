Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5037869E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:23:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 143so13653373wma.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 01:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=xIom6G4mejvpbLCoJX9tyR47nLM5JZgXfqPk6DNy+QE=;
	b=nHClqltadFzJbT1Ham/sFJNihs0wTkE0AVwEJx6J30zRJpqSqM2cXGtVGGH1MUmccu
	ZWMVsdGrl4d7F7J6WkD8wyDbr5dbdg4JjVdppCq6i2TnG08AAnZkbDTDbTnha0y9f0WH
	sAsjWZvdPe8mSR6OUzA9JBGzBUAfuENhtd+hSftoZ9f3La6oA/pwovIEBKud7Fs//3UA
	HsetDINhqavBCY7hoZKzd/TEW4h5Yb/f5h/RIgtb3o7BMDpaI6U6QAz0ZEdFhQtZkf+y
	u00pzqOHPvHd9/YEt+HUreG08YnSiInkkeYOkmumPzt7SjRnbtcp4vecuHdEYvYgr5NN
	PU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=xIom6G4mejvpbLCoJX9tyR47nLM5JZgXfqPk6DNy+QE=;
	b=lFDYD1JYgFAK6pRp36MW6nCHdsDypLC99ttayGcIf6KtbTmXDkfX5Ier+Ck7Jv+/Pu
	sb//fn3jN9GeL0o741s58xXHVFhfHbCZvaolMnHvI+EwssFQsWhKY+IluBmaBtJKZJsQ
	/F9IVi5ziTtrmSL9K7JRGQHbd+YVzZ3jaR1a+hjpufkx3CYvroSyd1v2b0GtyQTmEDD/
	uWNcspKnwR62R+8hMsvVnnqa8+hy5vif1H/iVhTmrvUM5251J80cEGtTQdmdEeD9ul6N
	Hp3YdovBt56ScCef40Vpu8DWtw8uDSO4jqVIO0d8VbP/XL2+qUKxfe9czNJ8E9ISZILm
	Qzlg==
X-Gm-Message-State: AKwxytcYESabaAjl74WUTWOyJvc9601NcuKpsg2gbndW91xL8YO+bcjY
	oWk5tAf8yfytdPkdQ+p38xp7Bnyf
X-Google-Smtp-Source: ACJfBotDZ4JyR0NSAowIubcSbnKHKzhB4izW9jS15MHDr6imEB0Km540JRZJCt9+ZzUBZdgpBBXx7A==
X-Received: by 10.28.22.67 with SMTP id 64mr1528637wmw.28.1516180989794;
	Wed, 17 Jan 2018 01:23:09 -0800 (PST)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	127sm6132753wmk.14.2018.01.17.01.23.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 01:23:09 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 10:23:07 +0100
Message-Id: <20180117092307.22703-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Cc: Thomas Perrot <thomas.perrot@sigfox.com>
Subject: [PATCH] uboot-sign: avoid a circular dependency with the task to assemble a fitimage
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
X-List-Received-Date: Wed, 17 Jan 2018 09:23:09 -0000

Between do_concat_dtb and do_assemble_fitimage when UBOOT_SIGN_ENABLE is active:

Dependency loop #1 found:
  do_concat_dtb (dependent Tasks ['linux-yocto_4.10.bb:do_assemble_fitimage'])
  do_install (dependent Tasks ['pseudo_1.8.2.bb:do_populate_sysroot', 'u-boot_2017.01.bb:do_compile', 'u-boot_2017.01.bb:do_concat_dtb'])
  do_deploy (dependent Tasks ['u-boot_2017.01.bb:do_deploy_dtb', 'u-boot_2017.01.bb:do_install'])
  do_assemble_fitimage (dependent Tasks ['linux-yocto_4.10.bb:do_compile', 'u-boot_2017.01.bb:do_deploy'])

Signed-off-by: Thomas Perrot <thomas.perrot@sigfox.com>
---
 meta/classes/uboot-sign.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 8ee904e7df..f36f9dfda1 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -74,7 +74,7 @@ do_concat_dtb () {
 			cd ${DEPLOYDIR}
 			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
 		else
-			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+			bbfatal "Failure while adding public key to u-boot binary. Verified boot won't be available."
 		fi
 	fi
 }
@@ -82,7 +82,6 @@ do_concat_dtb () {
 python () {
 	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
 	if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == uboot_pn:
-		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
 
 		# u-boot.dtb and u-boot-nodtb.bin are deployed _before_ do_deploy
 		# Thus, do_deploy_setscene will also populate them in DEPLOY_IMAGE_DIR
@@ -91,5 +90,5 @@ python () {
 		# do_concat_dtb is scheduled _before_ do_install as it overwrite the
 		# u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
 		bb.build.addtask('do_concat_dtb', 'do_install', None, d)
-		d.appendVarFlag('do_concat_dtb', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
+		d.appendVarFlag('do_concat_dtb', 'depends', ' %s:do_deploy_dtb' % uboot_pn)
 }
-- 
2.13.6


