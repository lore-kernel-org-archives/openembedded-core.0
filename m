Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFABC77B7A
	for <webhook@archiver.kernel.org>; Sat,  3 Jun 2023 08:07:13 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.8003.1685779628924307987
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jun 2023 01:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=G9A2iOsY;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3078cc99232so2661210f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 01:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685779626; x=1688371626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxcKuDthoBylwsUSRBKayZeKLPCiJOy5nugEtOXMNV4=;
        b=G9A2iOsYGf20xLuMjsTY6XCAGuL2RsnRmc+CivJ/VlKdBUJjukcCrgMhrAm/6TrMp1
         21JmosPy9GBgQFoSdGZEkBwmvOLqCYjNnW0SVdWBkUQYUx0iRS2WxDYbMpiKgQX7SFP0
         lYLo4aGGgtMUuSh+sb/XdGAkT2Ku2pCsM/wGLURmCcomz/jjjr5zLru0V7/DUfLvVVCD
         lx8RkYrZOadYg6tS+DbGvM8CreC0vo+Z8ySa1MsqWDexOhmH+9HTRlvCJI1qbLZraCBT
         /uXTtnYeK3ia9Aw95a+fx2OEWvfxV3qln67pGXC10+VOX4M3Ttdcn6EVMA3MY6ymUPqz
         unGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685779626; x=1688371626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxcKuDthoBylwsUSRBKayZeKLPCiJOy5nugEtOXMNV4=;
        b=EIqL2NMuNGReUaPDeUTmtcC0p6/v9HrmaTtfI1KvS8Gig2ANM75ppiDUA5IF22Jqmc
         psMNCP+GA9rVusuFPDlVVhUUL0HuIA1x/pxNuN0c5N6T9yLsQsCxzNJIiJ/28FRZZX3A
         kb5+Nu95AxnuL16Mu0eYIMVcR+ijc01fWv3wAzrikTMlwfL4p3Txt7Ze9+miCeI8/cja
         1CD/WJknlTcGeOfle/MUk1PEvMK7Sp4qgxlFgW7j+PZBoywgr2vaKul7DZZXwm5zzR7I
         GQSNBRo3TaJ9KOeaPgVIOJ9Qvs+xmITFIk1jhldWOy1q3UU4lGqZwUfES+XDIr2QIKrD
         1TaA==
X-Gm-Message-State: AC+VfDyeRGmys7ff4TEXeR1RWk22gZelEL6nwJDtbQwFDhMmGsPtL4dN
	amwfJUu032PajktRdcnuOLxp4nkuOKY=
X-Google-Smtp-Source: ACHHUZ7bLGSJq9IjWp9jFP98pIGpDTtyvbdWXcML1s0xL3cn+HweSwiDtBCdDA0W4FPjRmZuYFD0HQ==
X-Received: by 2002:a5d:440f:0:b0:30a:e647:fc2e with SMTP id z15-20020a5d440f000000b0030ae647fc2emr1747150wrq.19.1685779626402;
        Sat, 03 Jun 2023 01:07:06 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id i8-20020adfdec8000000b0030796e103a1sm3801902wrn.5.2023.06.03.01.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 01:07:06 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v4 2/3] python3-meson-python: New recipe
Date: Sat,  3 Jun 2023 10:07:02 +0200
Message-Id: <20230603080703.1400571-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230603080703.1400571-1-zboszor@gmail.com>
References: <20230603080703.1400571-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 08:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182348

This python module adds support for a new PEP517 build backend
used by recent versions of scikit-image, scipy and others.

The previously added python_mesonpy.bbclass uses it

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-meson-python_0.13.1.bb     | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-meson-python_0.13.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index cae9d36135..a0093001c2 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -647,6 +647,7 @@ RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-python3-meson-python = "Zoltán Böszörményi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ndg-httpsclient = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
new file mode 100644
index 0000000000..6b9ff24f2a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Meson Python build backend (PEP 517)"
+HOMEPAGE = "https://github.com/mesonbuild/meson-python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
+
+DEPENDS = " \
+	meson-native ninja-native patchelf-native \
+	python3-pyproject-metadata-native \
+"
+
+PYPI_PACKAGE = "meson_python"
+
+inherit pypi python_mesonpy
+SRC_URI[sha256sum] = "63b3170001425c42fa4cfedadb9051cbd28925ff8eed7c40d36ba0099e3c7618"
+
+DEPENDS:remove:class-native = "python3-meson-python-native"
+
+RDEPENDS:${PN} = " \
+	meson ninja patchelf \
+	python3-pyproject-metadata \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.40.1


