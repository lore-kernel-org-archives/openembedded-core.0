Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id EAED87ECAA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:44:41 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 7so27530753ljw.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 08:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KnWpNY6AAmqQN2f+TGLVTjWMRVcgw5CDJaDliiyqI4s=;
	b=ojMIk8uU5WUSB1yLUcnOoqp5RGADy3fgs8aM7dywBY1TK7cIywNkgS2WDmBRCNlw6f
	cBWshqxt3zr5GKdH1FmDMgqEodn0ftaJbUpIvQAzVzF3ZXKRkG07YC2/Wv4mmy53SMbN
	NVWZWYp/0J+tGpveObqQbQc9mwp1QE+MXp7gE/tvxjSodTyNCMxItZMaWw1DDX1L49Rm
	O+IroijqQnvw0wZEpEotZTmoBSPCc92QCCgayY0jVXHb9F5OhyLydVMUGCwy09ZVxx6B
	R1t62CtEEcIohj50/XQfFF5EH1twWzlY6nkLv3aMPQS4vctAS9aDseK6kZKsohRssl8f
	NHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KnWpNY6AAmqQN2f+TGLVTjWMRVcgw5CDJaDliiyqI4s=;
	b=JdBheDDYDaoiiPGsfYJ9UHJtfwzEWJSZ+MB3+Ef8n1UY+9vhheyV7WbEEh7FlV7ssa
	cL2gJ2HgzHwYR9snCjeLkEmyLDPJGFaLR55kAs4OQRHrEuMyL3gl6a5EbitZ/wR43mqk
	3zWwhQGzwJWnaNOo3v4m42rvODP3fqdZBQ4foVHDDIg5reYIfgeDUagChYvAXGOHcsZ5
	/urPX7/pf83wgIhgptTCVcTt8mQF2HPHH3ntLr0eQVLjaKCzs3M2wBQBHeeyTZLGHyZ0
	oxTSDHW9vQ5v8jC38Z07QeGcRyqCqq/dPsFj3jGDI2CcjrtuZF/SvQkg5xL9wQS559Vr
	COag==
X-Gm-Message-State: APjAAAV0XaR3abO19K205zYmACSJ5SjrlDKVG6NQHdW1Iu4X+Lhq3yai
	RTB87r3iRCr9Hv9uTRGfPyOMar9J
X-Google-Smtp-Source: APXvYqzkXNoAP6CB7MpUVPEqHsD5GMAgX54jzxv1GWdviHupD8kWu6lu4s7GT14xsIy333TD3vRXXg==
X-Received: by 2002:a2e:9549:: with SMTP id t9mr26008249ljh.189.1568389481965; 
	Fri, 13 Sep 2019 08:44:41 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.196])
	by smtp.gmail.com with ESMTPSA id
	t1sm6297169lji.101.2019.09.13.08.44.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 08:44:39 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 18:44:27 +0300
Message-Id: <20190913154434.29908-2-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913154434.29908-1-dbaryshkov@gmail.com>
References: <20190913154434.29908-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 2/9] grub-bootconf: switch to uefi.bbclass
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
X-List-Received-Date: Fri, 13 Sep 2019 15:44:42 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from uefi.bbclass instead of hardcoding them in the recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
index 750f8c808a8e..ff3e27e3779b 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -5,6 +5,7 @@ SUMMARY = "Basic grub.cfg for use in EFI systems"
 RPROVIDES_${PN} += "virtual/grub-bootconf"
 
 inherit grub-efi-cfg
+inherit uefi
 
 S = "${WORKDIR}"
 
@@ -20,10 +21,8 @@ python do_configure() {
 do_configure[vardeps] += "APPEND ROOT"
 
 do_install() {
-	install -d ${D}/boot
-	install -d ${D}/boot/EFI
-	install -d ${D}/boot/EFI/BOOT
-	install grub-bootconf ${D}/boot/EFI/BOOT/grub.cfg
+	install -d ${D}${EFI_FILES_PATH}
+	install grub-bootconf ${D}${EFI_FILES_PATH}/grub.cfg
 }
 
-FILES_${PN} = "/boot/EFI/BOOT/grub.cfg"
+FILES_${PN} = "${EFI_FILES_PATH}/grub.cfg"
-- 
2.23.0


