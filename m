Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B246160B21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 10:35:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y17so1572358wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 02:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=koAgHWN41H7IqhLxplPLYGMSFMdeoFtsPlF4YpugOLI=;
	b=gFdqSse4YqRTaqJe4r0Vzy5V96nX3uzJ3EwAw0eD8XckNo91Z6DvHZWn/g1eHl2SJ/
	slTaNp/DrSwjLl1UyUH7zCPcQ3Njjd+q+NuJw1uLuOnnGXygmICPcF0chY3LKuy7ZhTo
	TkCl15g37Mb8j8PjQiBf3QdeHMskFWhWzS+AbljfFvuSDPw6jRHvg8iKxwIV1cqSRhSM
	XoQqrOF0sT1b/8e/41YRYmS4u1NESkDO8IsrP6Gj40GpsNNbvhxhWdwBC1VsUrcy1wzg
	CZ7kMumJnDUOBc+fXjOyUo/klc7bkdjr/2fSM3/DfL8J39J3E6v/XhnrVGHA8P1leT2+
	ZvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=koAgHWN41H7IqhLxplPLYGMSFMdeoFtsPlF4YpugOLI=;
	b=kSohxkuF8yUiBXafH78YetnseCCUY3NsDXN02yGliClgDNakOrosYer2yy0TkY62TH
	s4Hnl3rOxqtN6IAJbtUdUAr8nO70ZMTJLuDltemB+sbpT++xQmvQENIWIATmwX5sFYE+
	blEehgpgYieELvizE9qK46NBxhJOiC7vHRCd6AnIVl9Y2uj/ckto3P3yXBJZTjt15KSc
	a7pEznV+UcPn1/PNXDWBDyHl7krqEAI+yJDxruNADWBgn8nWTmTMlWhOOSUsaayZ11Yz
	xdetXuR47HlOXj1rwVwjiQJVrEYhysTHbym5DqWCLhbYe/40S/LxYSfPCjE79RC8S0+W
	dcLg==
X-Gm-Message-State: APjAAAV00OVb8lGyJKKtA9/rQ9LwRMLIx7+8TfH5lxEuEtb5S2mD/Dls
	A4HXEE8/eidOBbUNtyW7CUBTMMlO
X-Google-Smtp-Source: APXvYqxtFB9sizGGtGJLX+Ia5rxQAU+2T7dEU9CblcLVr0SPy5UqUcIYFELxfagagOwiXwRCueNPKg==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr14972616wrv.9.1581503730076; 
	Wed, 12 Feb 2020 02:35:30 -0800 (PST)
Received: from localhost.localdomain ([195.89.163.130])
	by smtp.gmail.com with ESMTPSA id e6sm204402wme.3.2020.02.12.02.35.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 02:35:29 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 10:35:26 +0000
Message-Id: <20200212103526.61149-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] devicetree.bbclass: include symbols in base DT
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
X-List-Received-Date: Wed, 12 Feb 2020 10:35:30 -0000

When processing overlays, the base device tree must be compiled with
symbols, otherwise attempting to apply overlays in U-Boot will fail
with:

  failed on fdt_overlay_apply(): FDT_ERR_NOTFOUND
  base fdt does did not have a /__symbols__ node
  make sure you've compiled with -@

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/devicetree.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index d8779c794378..c772ab2ab93e 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -59,7 +59,7 @@ DT_BOOT_CPU ??= "0"
 
 DTC_FLAGS ?= "-R ${DT_RESERVED_MAP} -b ${DT_BOOT_CPU}"
 DTC_PPFLAGS ?= "-nostdinc -undef -D__DTS__ -x assembler-with-cpp"
-DTC_BFLAGS ?= "-p ${DT_PADDING_SIZE}"
+DTC_BFLAGS ?= "-p ${DT_PADDING_SIZE} -@"
 DTC_OFLAGS ?= "-p 0 -@ -H epapr"
 
 python () {
-- 
2.17.1


