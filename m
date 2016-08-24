Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1C6B27318F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 21:53:40 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id i5so44655695wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 14:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=P1KZlOZ6YcYf82Uyzl3NsIBHqwbGFdWZZEttirZVRlc=;
	b=IGux5sszgxVczR9Pvz4MHQS5O30ergHDpgx4TgI07RumdV8S60sCiw9eRgGpjonm7g
	0B33bUxu3/fEEjiL/v1Eu3nQc5gT4ORH+cSbb7Eleh0N5eFosHmo54pNI7qtgdeRSKfk
	GN5q6ckLrl+lTdORKefhcY35b1m+qn9A5GICjwXv6+5IpEtPA+AuZ4duXMOYkcI/CNKQ
	ZqfmLYsEh1UhbVf8kACwYAu9c10Luii4ODV27ta2+v9IpSA8WPGVro71MjG3YNevePhc
	z7KTvMAnsj1PQ1LD4lMuxtYNG1lbeWfCpSGDFLueNE54ullbFt/K+U1WphRDvuPmkKOE
	uX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=P1KZlOZ6YcYf82Uyzl3NsIBHqwbGFdWZZEttirZVRlc=;
	b=aiP1kg7DXJg5BOXnWMpyUtF9iocVkZDtwrsfDQS9VBx2ULXdanxmJQCDpIcGBWoWlM
	LdrqXheWgUi/J1kOsWTQR/VRbD3KbtlxIsf/tWB9dIQXmCDQLFVlQNKwf2zhMD8js33D
	V4OFHbf74DOT0D8zflAH92gurNGJOIP5fUmGDsaonoeXyxG/9x336H1xM15nY3CUdwN6
	aY6tmDLG3khgSw8uNq3g/SvaoG9zgc8gpE/tZ8u/Gk6uHe05XP2RwzHydJBV2fNvHGUq
	7U0+iVX7sKH2l4xMmMSwX1dMhqttY2J35HhKT9blUKUccKQJ2l58m8u40o1ryKSmYMxQ
	em1A==
X-Gm-Message-State: AE9vXwOUlZH1BykbuJvpyFbJ8J1qE/V7b8YtVP/Issb2Z6rXKtvn7z9CwZuEnCary0JeQ+c/
X-Received: by 10.28.70.5 with SMTP id t5mr3904208wma.46.1472075620589;
	Wed, 24 Aug 2016 14:53:40 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	p71sm35653772wmf.9.2016.08.24.14.53.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Aug 2016 14:53:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 22:53:38 +0100
Message-Id: <1472075618-3211-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] linux-firmware: set a preferred provider for brcmfmac-sdio.bin
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
X-List-Received-Date: Wed, 24 Aug 2016 21:53:41 -0000

This recipe packages six alternatives to brcmfmac-sdio.bin but as they all have
equal priority there is no determinism on what provider will be used if they are
all installed.

Arbitrarily select 4339 to be the highest priority.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 948dfa8..ed0c6ec 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -433,6 +433,7 @@ ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4330-sdio.bin"
 ALTERNATIVE_linux-firmware-bcm4339 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4339[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4339-sdio.bin"
+ALTERNATIVE_PRIORITY_linux-firmware-bcm4339[brcmfmac-sdio.bin] = "20"
 
 RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
-- 
2.8.1


