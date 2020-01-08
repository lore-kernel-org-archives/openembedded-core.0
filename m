Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 65AE37FED7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:24 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id a5so2495112wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XOHgboQ1P2L01j7Wp99sQP6QlLPDtcq/X7GwIkSooGE=;
	b=TagrZwvRbwLth09yTX2oPQXfeP3V/6duFWDTNdpxW55XOA+qXOHSWnZ+n3EAN+I/aD
	5OnQygsrUH2zW63R9pqsuAuM6dKuevFahsDgAorMyqr7OP+k4AQ9sfV2f+rOjRhpIywQ
	uZalme5jeaQaryqiCaOVFj0DnMtHCgVIqqwvjqAbG4ZufRWm6qhMZUFxsQLQEkVfsEuG
	eSKCKZZaT0dizPiDiTwWYR7GWk+1DW6DfG3p3avdV6YJ3myPrSgt9Bbb1nCluzCEuVU4
	NICKP4e7iyhnmKPbzus2+z9z2Iz3+BXj9BmP6mQYgD1btl7YzwnG9K6wfgWnwXfjf2pb
	hwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XOHgboQ1P2L01j7Wp99sQP6QlLPDtcq/X7GwIkSooGE=;
	b=DmCr7FFmNJXhAbRTgo1yGtjwTXJvsMOeZbGkHx2fyrxP751+T4Q6M9H+gUPz4D3PAj
	V++gsPktUq20RdLd9kYZ4Hy3NGd5StVeb70AZTteWo2ceoR0Jsx3C0/JJi9R83Fhcxup
	hTHG3+Ju+30p61IIMRcy8pST84Yu4ePNpJ0sCqtDnAqlA119nwImAy38Eiw+RSoyRto0
	yT34VfIdz/QlKKraEYddD2jE7RotOHEA23RIaGF4fCbJ+0N1spst0yG4+LpjCsSLMq1l
	62y1MnCGZFgaHB4p1cOIRezl4IkXG/RcN5Feu/Ot5gi7DF7Jzg8a6PvjlSnwTPqi28nX
	+xXg==
X-Gm-Message-State: APjAAAW/50LdEdEGzyTkyjldAx8/iDEXrIDd/Y7oPngzgUWExbpmdTah
	T0pJnFrS2J/45deWzPMo07qx6Rais8w=
X-Google-Smtp-Source: APXvYqzPBZz7T/7GPT6vKQizeDV5ZYjrqHyKfXOlXHZzkCW6vaYhXkanlOuAvcjH0tLz9/tXPtxbsg==
X-Received: by 2002:a1c:e289:: with SMTP id z131mr3712533wmg.18.1578490104853; 
	Wed, 08 Jan 2020 05:28:24 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:49 +0100
Message-Id: <20200108132759.95603-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/28] dummy-sdk-package.inc: do multilib expanesion for RREPLACES as well
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:24 -0000

Otherwise, multilib packages such as lib64-perl aren't properly replaced:
Error:
 Problem: package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with lib64-perl provided by lib64-perl-5.30.1-r0.x86_64
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with lib64-perl-module-strict provided by lib64-perl-5.30.1-r0.x86_64
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with lib64-perl-module-warnings provided by lib64-perl-5.30.1-r0.x86_64
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts with lib64-perl-module-vars provided by lib64-perl-5.30.1-r0.x86_64

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index 61afab1d768..bedde2965ca 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -19,12 +19,13 @@ PR[vardeps] += "DUMMYPROVIDES"
 PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
 DUMMYPROVIDES_PACKAGES ??= ""
-DUMMYPROVIDES += "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
+DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
+DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
 
 python populate_packages_prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
     d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
-    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES_PACKAGES}")
+    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
 }
 
-- 
2.17.1


