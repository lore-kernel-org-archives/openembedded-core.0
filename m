Return-Path: <adraszik@digisoft.tv>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3785472207
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 08:06:08 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so82831058wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 01:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CtbgtLYA8EN+OhBNUygxB+eHz6e5qXPKEY7YWrwrrDM=;
	b=H+5MNC1VDl6TvnUGhvx6CBR5iQcG//TufvkK/ab5RwJXWn9ZsI1D4bsCoikRu8hvJF
	JsPAm8hRqAfjnEEoQBi2lJKhnqYwZpcaDPmPXOCR1YZ3vCnA/Lm1p/qREoVKYFdNXB8T
	Uu6+1TkXxmpW063rgvMwsB5+8Vm0eWKy7aTWRF1XAaZe8wEcmqJE8fVsnZHpH0mRJw2c
	esEduFbTIpjsyTfwOXS2N82VeqZfuEsXVTHASQ5Y1j11OkWJGowyF3Qxcc6KFn7d8Y8I
	XTZHkjEPnZHGv1rTOcGCsJbGbOle94qDZFm6Xzo5iK0naTFQwbrshG8xPhlw5gDK+B5A
	7eFA==
X-Gm-Message-State: ALoCoQn0gejWjj2entGC9wHSbCJwEYUkzYk4fNq3D+P7eTGVzMEN7l9M/wkfXCybudkocnd9FQxw
X-Received: by 10.180.87.199 with SMTP id ba7mr20132451wib.81.1431936369783;
	Mon, 18 May 2015 01:06:09 -0700 (PDT)
Received: from i22.digisoft.tv ([212.17.57.102])
	by mx.google.com with ESMTPSA id n1sm11194300wix.0.2015.05.18.01.06.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 01:06:09 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 09:06:01 +0100
Message-Id: <1431936361-10394-2-git-send-email-adraszik@digisoft.tv>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431936361-10394-1-git-send-email-adraszik@digisoft.tv>
References: <1431936361-10394-1-git-send-email-adraszik@digisoft.tv>
Subject: [PATCH] icu-native: fix hard paths in native icu
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
X-List-Received-Date: Mon, 18 May 2015 08:06:11 -0000

The icu recipe installs icu-native twice, once in the usual location,
and once for cross builds into the path given by --with-cross-build.

This latter path is not included in the list of paths recognised by
chrpath.bbclass, hence the binaries in there retain the rpath as used
during compilation. This causes the package to not be relocateable
from sstate
[YOCTO #6851]

We use the infrastructure that is in place already, and simply set
PREPROCESS_RELOCATE_DIRS as necessary, and things start to work.
---
 meta/recipes-support/icu/icu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index f4254b5..cc6f222 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -26,6 +26,7 @@ EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 EXTRA_OECONF_class-native = ""
 EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 
+PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
 do_install_append_class-native() {
 	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
 	cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
-- 
2.1.4


