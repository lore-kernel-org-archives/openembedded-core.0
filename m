Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A224C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:08 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.5724.1645406887198258621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KGMF05tb;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id c3so1969109plh.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w5vYj4dN8/6RAb6stdS86RKrgkFXRw63eHj4LIq40QU=;
        b=KGMF05tbLDW/s+TnXG++CPjIHxAGxBkeHCABsZs/24jxHkUHdVjIje8wDOMshn6SQp
         vSHDU6Vzc/mSr25GBcebYHdALdmsJR2dvnsX9HOHwUlxibH3Vvzbaxu7/RHHFBEI4cRB
         O4nF/sGf+v69huzKbWs+OQGGr3yq3WxUm7YhnZWOvvBe5Ebd/Sw41HjNOzqJWAh8DG7+
         Nx3oDB+kr06sxFA29DD6aAWl5B3u7l7VGQCNSIBVov3yZmyAcetI50/aFrteTq4Ufiy7
         0xrOOk9AM7KNaRcZsMZPfu6oXY/CwYuKzB4YY/dYA+rC1QLcEj+3FUm8uTxCiLGNnW62
         AKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w5vYj4dN8/6RAb6stdS86RKrgkFXRw63eHj4LIq40QU=;
        b=GXxTqcqoTcXOXgOa8rns6yJbdqQ2eG79BIqrxO/llfswthUH9zLPo8eQD6hRcPTHVf
         pwNnjYcIJ37JrxsvBRNH37BmXiDVoo55mRh2UcD93VnJvPVzItg0b4zF1oCA9RHfojRt
         BjKRB+GMQH7DbRHxHa7YYIPBUyfv9owLg8B0m7BleSfRfe+N/Cg+j/AeBFSiIrRnwJ4o
         MrfCPx1poEW5pTCPtrCDYFLeBNQhkTRs+gPEhAtwjfXE/7DQon6NOhZQpYXBxcrstX7Y
         /ZFSOQ4sAAjAGkI/M7SzoyDQ/7R3tNxUG7d2lHYoJ5bB0eJ+XLSkAzQulIk12xE+UyK1
         Z/Uw==
X-Gm-Message-State: AOAM530rM6JXLYNGl3k5/gsm/VCMlqNgag/zlwPX4aSa53MgbqCP80PK
	n1CBPVbtGrZfR3Ro+inb1tu1Dc5Vj4iDOw==
X-Google-Smtp-Source: 
 ABdhPJzyT4O0dWhGf+WloMnfM/iI1Heg9lkBBTXiCMvXm8on87OGyzd3BGoo4LwqvH6fF8LZuO+6+g==
X-Received: by 2002:a17:90b:28f:b0:1bc:299d:39a8 with SMTP id
 az15-20020a17090b028f00b001bc299d39a8mr4503844pjb.37.1645406886301;
        Sun, 20 Feb 2022 17:28:06 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:05 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/19] pip_install_wheel.bbclass: add helper class
Date: Sun, 20 Feb 2022 17:27:35 -0800
Message-Id: 
 <9104cb801378efce74bc32462816fe885b4bcb7f.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161998

Provide a helper class to use pip to install wheels built by either
bdist_wheel or a PEP-517 backend.

By passings --no-deps and --no-index we avoid finicky dependency
checking (pip expects wheels in its cache) and avoid trying to fetch
wheels from pypi.org. This is basically the same behavior we have now,
the dependencies should be declared in the recipe.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/pip_install_wheel.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes/pip_install_wheel.bbclass

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
new file mode 100644
index 00000000000..e6a6801227f
--- /dev/null
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -0,0 +1,18 @@
+DEPENDS:append = " python3-pip-native"
+
+PIP_INSTALL_PACKAGE ?= "${PYPI_PACKAGE}"
+PIP_INSTALL_DIST_PATH ?= "${B}/dist"
+PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl"
+
+pip_install_wheel_do_install:prepend () {
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+}
+
+export PYPA_WHEEL
+
+pip_install_wheel_do_install () {
+    nativepython3 -m pip install -vvvv --no-deps --no-index --target ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} ||
+    bbfatal_log "Failed to pip install wheel. Check the logs."
+}
+
+EXPORT_FUNCTIONS do_install
-- 
2.30.2


