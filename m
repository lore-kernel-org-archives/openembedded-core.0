Return-Path: <ryan.harkin@linaro.org>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id ACBDB7945F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 16:30:52 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id s9-v6so2570322wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+2ROzr4V8QAXRjjsaBFHndD5m6DInSFzVWYrCdpZOvI=;
	b=CVqo9OrNLt9OiScR2vwX4f2lNDr73PdVag3jiRaG/s0dPPYUfzqrRgtnPG9lQo+0yX
	cLbPA5Qa+j9bTjPPNCW9d9dbfyrRY9UJxU78RE38SyXzy5mh+gfLxkUrdUD02nu8R8pt
	YJEdkNSS4wPmeRWuUTwBe9P4e+ip8969kg8s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+2ROzr4V8QAXRjjsaBFHndD5m6DInSFzVWYrCdpZOvI=;
	b=Yp6xocWkRHTFquDrM0g0SxSUEoMlJW95W17gZMn08uyuZklpe2RCiM5TYDBTQzEDzn
	Lv5xegeo3nLQLugqKu4WgdIf40h0jZpLq94xFEaBZSRq/P/sljkKIYY+rVP/qPMO2iHq
	0Wbm3Lz4WLSSHZH4gsb/2zDGLixnDlmWnvv0fbkqt8y1Oz3E9nn1ZcPh4GsQcmis/mW3
	hwXWZQB54Ci38QmOoNi1uTxj0lwl9weTrpKf1tjDH9/w3nlEoorWMP5AtXiJy8ZP1KlN
	Ezh45vGmpHR3Oj21nuV6/J/FX62tW8KZuFn+zjdsWlDsM0lGj3Y5a/w4jqPuCyF0wdCo
	skVA==
X-Gm-Message-State: APzg51B8lSYKxy8KbH6ED0/1g2Cd90Phzsy122DRs73am1bXzBfKADas
	4X6EqUUk0M0XEwDqtI2EAczG3btTg4s=
X-Google-Smtp-Source: ANB0VdYoroy01jUPjqDHdgh2F9iH26oUb83p1AyoflIE9hSdHyk0ZtRoY8kEzahHnFdiPHUUsmZ52A==
X-Received: by 2002:a1c:3e8f:: with SMTP id
	l137-v6mr2796573wma.132.1534955453253; 
	Wed, 22 Aug 2018 09:30:53 -0700 (PDT)
Received: from localhost.localdomain (82-69-54-187.dsl.in-addr.zen.co.uk.
	[82.69.54.187]) by smtp.gmail.com with ESMTPSA id
	m8-v6sm2802229wrf.93.2018.08.22.09.30.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 09:30:52 -0700 (PDT)
From: Ryan Harkin <ryan.harkin@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:30:36 +0100
Message-Id: <1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
Cc: daiane.angolini@nxp.com, patches@linaro.org
Subject: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Wed, 22 Aug 2018 16:30:53 -0000

The Linux kernel currently expects a single NVRAM file for BCM43430
named brcmfmac43430-sdio.txt.

Allow the machine to specify an override to link its module specific
NVRAM to the filename expected by the kernel.

Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 8c54f28..b647abc 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -226,6 +226,18 @@ do_install() {
 	( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf ti-connectivity/* . )
 }
 
+# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a
+# softlink for the module specific NVRAM file to the filename expected
+# by the Linux kernel
+FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx = " ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
+do_install_append_bcm43430-nvram-mur1dx() {
+	( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
+}
+FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
+do_install_append_bcm43430-nvram-ap6212() {
+	( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)
+}
+
 
 PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-mt7601u-license ${PN}-mt7601u \
-- 
2.7.4


