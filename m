Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF0CCE7CEC
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 08:28:48 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.76269.1727771318160787045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 01:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pYsJOkd8;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fabfc06de3so29467151fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 01:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727771316; x=1728376116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0uDRZA04VsIMktPpDX99/nDrmUPNNj3R7DcNAkt110=;
        b=pYsJOkd8BZcF/lzL8Z1XpDCg1A2IpEtOfAwSHAJN/FichZ/1ZBvmw4vJ7+/d8ie8af
         /CpBok2OPa4RMLHKdUVf5fo8vEE7NF3S49rJsei+ttpNejLh3C2fgFQRBd5ZG9CUAsXF
         K8wwmaxy/tmxvXGA4Qft7vknQ0BTPWRjHviXZZHIIx3IdMv5ETSQ6OM+FYjEXc8rkz9/
         y7a/kQ3ZN/vCh348hf8o/S41egTfOPa3PmdXYT/JX7Tu02FQ6i63LQPTGT1AU/Y0YLyK
         WbKYe93ExRaeguCUxj3GF1tPnujUXdiHG/XOpM04JXMNo+CNmnMBV0Qkm7ZPbXvghzJX
         vKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771316; x=1728376116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0uDRZA04VsIMktPpDX99/nDrmUPNNj3R7DcNAkt110=;
        b=W+BfK1paAS0Wq7b+Ya8GWt+SeBW7XgXnvHLXKxemtap4YDdiGwuCIZdVVdM8hzz6yT
         j2W4AnSVhwOURVxtVsKPpXmRFHSVQh49UGTTbOZSjA9Ry/WEJpVk1DfeenxXMDMs1Kqb
         gacA69q6te9o28zzZOYxypHZerA++EOM+hFTTmXfT36Z9+09KeYiIP2isAT83NN4kPoZ
         nN+ISVdA6wogIuytZbWX+Z0npLD21vR6sGSH0MpCpHav9gPkf6mRWAMQiiVvpXPATQBJ
         HGstwD5k6GkqsQhW/0cmmVz1TvItQ9PS8ESje95oFwPBimMc1muz1ZflHFpXoryfNhOa
         5caA==
X-Gm-Message-State: AOJu0Yz8QJV3qCekBZ7UBfVEYH9jJ8jo/AJfJaOXBBESilyY0vCcsH1i
	gQSVMzgajny4i3hXCquIhH3XWns9tBGsw1dyGY1oVPHoEtXXADivOHTvgaf0GM5+Ew/bJ6sotTJ
	ZRlA=
X-Google-Smtp-Source: AGHT+IGbQbk1kO/Cm13tzpbPEr3vvXtHeOpj2n1Q7gtTCs5dHljRw5eEP25mxxi5EU0HTYn+LDIEYw==
X-Received: by 2002:a2e:a553:0:b0:2f7:663c:48d7 with SMTP id 38308e7fff4ca-2f9d41d3267mr76270751fa.39.1727771316289;
        Tue, 01 Oct 2024 01:28:36 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2facb2ce928sm7734221fa.76.2024.10.01.01.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:28:34 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 01/11] python3-pefile: add recipe from meta-openembedded
Date: Tue,  1 Oct 2024 11:28:11 +0300
Message-ID: <20241001082821.26115-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241001082821.26115-1-mikko.rapeli@linaro.org>
References: <20241001082821.26115-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 08:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205135

It is needed by systemd ukify tool and uki.bbclass to generate
UEFI boot binaries. Added to fast list in ptest-packagelists.inc.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-pefile/run-ptest           |  3 ++
 .../python/python3-pefile_2023.2.7.bb         | 28 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pefile/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-pefile_2023.2.7.bb

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 7b8418654a..4a48188562 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -70,6 +70,7 @@ PTESTS_FAST = "\
     python3-more-itertools \
     python3-packaging \
     python3-pluggy \
+    python3-pefile \
     python3-pyasn1 \
     python3-pytz \
     python3-pyyaml \
diff --git a/meta/recipes-devtools/python/python3-pefile/run-ptest b/meta/recipes-devtools/python/python3-pefile/run-ptest
new file mode 100644
index 0000000000..95ae72306f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pefile/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake --ignore=./tests/pefile_test.py
diff --git a/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
new file mode 100644
index 0000000000..e30b362323
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Python PE parsing module"
+DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
+HOMEPAGE = "https://github.com/erocarrera/pefile"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
+
+inherit setuptools3 ptest
+SRCREV = "1ab2807c4eec16041e791d7a6acc68cc23fd5266"
+SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
+           file://run-ptest"
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install_ptest() {
+   install -d ${D}${PTEST_PATH}/tests
+   cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+    python3-mmap \
+    python3-netclient \
+    python3-stringold \
+"
+RDEPENDS:${PN}-ptest += "\
+    python3-pytest \
+    python3-unittest-automake-output \
+"
-- 
2.34.1


