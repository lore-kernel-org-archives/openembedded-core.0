Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF3F7F2E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 09:30:06 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id r22so4572056lfm.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 02:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KnWpNY6AAmqQN2f+TGLVTjWMRVcgw5CDJaDliiyqI4s=;
	b=rsoMdOygQoPSVF/Idyj5+8HhwpcXiCXRhAYJQ88bvAG2sfAeVQvNOW5MTAy7aR8zr1
	q9ry+DpLKEM9yw2am4RQ1QAcqZgqI+k9SQ/s97HkzurBDu2lzvMAhsbke/Y25b13Qt7b
	3ZlZN96/Ga8h+CBFBF+7EI9msifl4Y20A8kpvLIC8Ykwtg1RKgxAHVmqMcNhxWgJm3zl
	J8xt6DJEuIlEnI8hrWdw59uoZB+R00AxnOaCa9aKWDSIZtWS3JHuiV5pvZfI7xvl5wbf
	Iy5aYnfg35o2v3pSOLE0AD2H2tSor0v/pCzfmyLCYL6RkAzHAM2mXoYVC7ZpiM59e38u
	KE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KnWpNY6AAmqQN2f+TGLVTjWMRVcgw5CDJaDliiyqI4s=;
	b=hhPNgIZulgxEQFwVVc3tYZfTEcDs8xKGCFLp61OQUChfu7xLwNx2i+PFWvJ5uJxvzE
	j4iPlOIxWKycfiqzyIc3QNpa3gtZFD1M/p/SHrcP2FYo85YSmq4Ey5eBoTgoUtAkYoe6
	PJI04K8zUqgQsXnOwaIzQP4xn3unO6tn3vohI++3TjiqvSRX5dQvjxgDLyzYK+f6XTTk
	S1IpvsCPDOecSKYecO4xPo421YD41KPivT0A52peBoD66QP533elaZMHbTjALUe6htV7
	1wahJItSBA7wloWA+f9bXHiikLxuqVRtlqYKL7EJ2+UV70Q1KXkkkax9xzxxpD4UpqON
	l1CQ==
X-Gm-Message-State: APjAAAUUwuKtwoYeKyJCPsBySf2IHWgbJJPzNlQbEwP9w13420ermz04
	6uGCi7EcejNIDRTaRzFy1DsZdlpu
X-Google-Smtp-Source: APXvYqwSc7zrSjWsdKyBNHUN5hFanAyTe4xqTxRIxv/tNq8hY6GZa0fRWE2LnMDVVLW2oQJ6NQYQFg==
X-Received: by 2002:ac2:5bde:: with SMTP id u30mr22457951lfn.59.1568194206298; 
	Wed, 11 Sep 2019 02:30:06 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.24])
	by smtp.gmail.com with ESMTPSA id
	t1sm4509306lji.101.2019.09.11.02.30.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:30:04 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 12:29:54 +0300
Message-Id: <20190911093001.7849-2-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911093001.7849-1-dbaryshkov@gmail.com>
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 2/9] grub-bootconf: switch to uefi.bbclass
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
X-List-Received-Date: Wed, 11 Sep 2019 09:30:06 -0000
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


