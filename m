Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE020C982DE
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:04 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1574.1789682882166777159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ewu76ApX;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so1103675e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682880; x=1790287680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VfCP4w+pPYfqf2V11PT5XWippQGNLlPd4lJzZkQUVLo=;
        b=Ewu76ApX7Ee68Ks7GDx2emCz7JH3i/fvc9pBO0gk9YXHKkHljlR0t+Jko5y0/RB6uh
         971K2mEVTi0DwVeVCSUm38SSsapdCC8zhmWWd/53UB/WGjJ+fwjRHXpN4DyAdhLb9jDT
         8mGIQrQb73X2X9qVrkuAXG/BL02CwxSXIJYdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682880; x=1790287680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VfCP4w+pPYfqf2V11PT5XWippQGNLlPd4lJzZkQUVLo=;
        b=MMEseDISM6Dgdg3MidGphzFaz4+Q881CALzYay0FU3Ob9DMWT6W1JZeZ8FvQHkytH3
         8A88RMTaXCBs9OIvIrXqAbWbnxZzuX2tv9feCKD9kR0HFjMVpP6ToiWtxcBkn9Ag4145
         IlHMpieFKrAE2X44vjiYYfxvnx/oz8zcCxCjuuIk7UYQPJdcsMI/dNBtNKPc/W7NEAKq
         h2u2/Xbjyq2UnvT4X9xFYOFAZnY+DLi6myR7nw8I00g8WdwukiRyYxTFywvLG5oeOWYg
         CieJNSNyX1BP1F2LaTsOmULFH3QC0PtOzlB5sE6aECTWm/AOS4/YWBp5cUhOVJuZK4sM
         FR5A==
X-Gm-Message-State: AFuF++mZGBT7OeeAqmgzFKorkYSKafG4rAKwUbRzm3+ATlBIbhiUsPSm
	U/8IYCQrDsMxI8FeykeUFlbjwNIRk6pZLTJmx8o6VD0db7nybz+RKkBYjw/gWTHq9Gu7ToAkb7D
	KEnj0XKg=
X-Gm-Gg: AYBFou0RFSxauAS7hJqIq/m5M1Ope5dvO1SmndtPvNlJ/M+46a6+ZNwwcV2uksXa6rL
	k3AmzPwEeZ9rpYo1XOncSe8CTnpbL+HouMbGaNA6NSkAtfcJFYUmVsUr3OKJcKRpAmRAwAGFbW0
	ixrkzTTCINuXHobbGQt02aUcl3G/H1isAcBX0rQuACGnfcURYYKN/pYALRGl21UgTVffSvCQTh4
	h1gUjTzq17a7ehRMAmByd+VSFY8K3tbxw6WXJS0sn8LXd/JGkbiqDImO1Iv0jWWucEHgQCfe8l2
	1bQn+w3CjjDDUHPCuL3hqURGcOlY7P03ACQwW9LXe/daciqTM/NLVilTg/S8uLXn+AdOczTN7Y3
	JgxpfLJ8dyUiDvk3rrx8+VcBlkrp8zbzZ9mb97jQtyBQ7tw9IOLVMy28IuT8/lHLFxubelFEtjW
	l4oWZz42sOVMHD40IchyHtgs5Ldt4YQUFO31XXI6rK1dLQ9DG8TXPZFNiCGb7AyDIhzgdnrU66x
	hasFahEYvEUVM5FdY8gChMQTPwLq+f5wz5KmLYVpO26WyJBaf2lPu3XtmNGD8Q4u3mabmZFpYhP
	zEouH9RNXA==
X-Received: by 2002:a05:600c:19d1:b0:49c:fc6e:a3d6 with SMTP id 5b1f17b1804b1-49fc574ef3cmr2901705e9.21.1789682880375;
        Thu, 17 Sep 2026 15:08:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/79] python3-sbom-cve-check: update to version 1.3.3
Date: Fri, 18 Sep 2026 00:06:07 +0200
Message-ID: <4705eefd8ee8ff414207ea6ab0f037d267af8f90.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246117

From: Benjamin Robin <benjamin.robin@bootlin.com>

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.3

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 7feb4e30ba17a4b0eb37a1c6dde671d4491bd35d)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC:
 Noticeable change:
   Generate a "not affected" assessment if the vulnerability is disputed
]
---
 ...-sbom-cve-check_1.3.2.bb => python3-sbom-cve-check_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.2.bb => python3-sbom-cve-check_1.3.3.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
index f14901e3008..2aca1005694 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "0a7f07a0c6ce45d40adc6d311ddc25c4466f59bafcbce149b6fb3663791a5d89"
+SRC_URI[sha256sum] = "8b766be1ae92b4eceaa2f694dd4724e310886c6436f44267a6bbc6a7b81ab8b9"
 
 inherit pypi python_hatchling
 

