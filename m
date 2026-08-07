Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2ABC5AC81
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 05:45:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36423.1786081496763246435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 22:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zq/om85e;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2307639f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 22:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786081495; x=1786686295; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dOfXvbvNtnzYf4JrusFo0tCCaYZP9e8gi9tSd/QUjP0=;
        b=Zq/om85en7vEFXWC+TJzZpL/mWIMJyWLhytd7F/RIJ27syDf5i7yk/tZw8fTFXIanl
         pLH7Z/d/EYWMlVuTQtMGtkTw1QmQhN8W7OHpV/cFlZNhVbB4LeeCehEdEeDRIEyLRB2J
         espqWnTOOC69FKBkaQNg14O0qD8ZCSzgbZLJdLrh5uYYJKdF0DR4dSRjDFYEvI0qWi13
         bk8Gg5xPBQO6KwOWkLt6+HrIGDCHq8PregBwwXyS1zRkPOOEr1bKdj5WGHuKR7CYzcCx
         s8E1L7bJ/pgnyU/POBZyBThNNtId6ak+eH+vL2wYTxdWYW37gJDiaVidMckz7ew9Xcdz
         iWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786081495; x=1786686295;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOfXvbvNtnzYf4JrusFo0tCCaYZP9e8gi9tSd/QUjP0=;
        b=h6PLCa7HfFR5FB9Q/Lltn+HfKZVAcImetkkXUtgrTAcO4t+utuBfp3Ll/kXfvXrSNn
         6Y2UBsSWBnrkR//lh7fSbqVzv/Sh69HMfXu05WCRK7aLq88Cn3E1ZL0DYx9T4JaB/hQ5
         b8+NLwWdXhXIYODw+SY3F94vwNgI3CSZ34G+XijQk5qDmVgGN3O1Wu9aePK8iVjjVpBp
         QhL56K4blxr+qL6/HBtfZCSVQBQdAgky8pBys+BLysRYWOCNlWKnuBu2KVRnPLDBVPbr
         FdkPEWVmecw3WRg9BTLOPljg74NN9cwfmsdYe/u0Fc+7p2PEQFw2ZBZR0cIzykpERkNz
         WN4w==
X-Gm-Message-State: AOJu0YyYvg0fap92MvImU4r8XT90ACcGZ0clNCOOh5XO98e7kW5eCbE/
	KV4pxuUTZidyiZ5Gvvkj/TnyTHU2UU0S2ITdqgZVf0xmp4H+yKNlAL8EIz0/Mw==
X-Gm-Gg: AR+sD1326sL71atNPH7IvhvxkFdRMbyV3qqVIBK6E1o25A2NMtz4O/jQ2oQl1TFVwXW
	i4RZESBOKLk9fHrW5k622QD0DcL7YEwfVPBj3jO438wfAWovAqi+9taZ10gKsyFZJbnMo3+QsPc
	iD7Im5AHxXsOctueVDPKjnm5J/ZBsZftJ9C0KSYR9fyLfUfeCBff4am0kMw7g7X9uC8nPyfsJtL
	2b8mM4NACMYcFp1VO5qtxoXcsMnKKYd6DlZOWVIlpu5rmAZ2OYosdXjZtjaDVS1AwZH8q8ROEq1
	bzM7ux1b990vcIaeanOr1wHknDG9jNKXCNNTWP37FKfSa0+FaB6YZHsSMB1g2Zu/gTD4XrK00lf
	T8ldtiIIrnrN/nfLsZqrE/iVqV8CU5r5nlXf332NbuuYIwjEymPRtqan5o13tMGDcVx86Dd3VH0
	v9DDtlShyQZczonQ17xSy+ahzf86IMsdGruGor73iGuF5ry31nL+E/cbato/qDzDV3oMg/KrtGr
	nGHX2MZ93DveA0VMN04uMy+5VmLSe9cZJ8tdedmZ5Tt+KFpwb3bUKhBNzk5WAzF2/1gmjhedQGX
	we8oGasC0Tjx+FM14eaVCsz6hQ==
X-Received: by 2002:a5d:64e9:0:b0:47f:7964:9887 with SMTP id ffacd0b85a97d-47fec639e6cmr31537732f8f.25.1786081494936;
        Thu, 06 Aug 2026 22:44:54 -0700 (PDT)
Received: from 2A0011100124613F533917970D022288.mobile.pool.telekom.hu (2A0011100124613F533917970D022288.mobile.pool.telekom.hu. [2a00:1110:124:613f:5339:1797:d02:2288])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm2743096f8f.18.2026.08.06.22.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:44:54 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v4 3/3] mesa, mesa-tools-native: Use mesa-libclc
Date: Fri,  7 Aug 2026 07:44:48 +0200
Message-ID: <20260807054448.1301957-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807054448.1301957-1-zboszor@gmail.com>
References: <20260807054448.1301957-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 05:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242983

According to the release notes at
https://lists.freedesktop.org/archives/mesa-dev/2026-August/226690.html

| One important note for packagers is that there is now a Mesa community
| maintained libclc fork that is verified to pass the OpenCL CTS with
| Mesa/Rusticl, and will fix bugs after an upstream libclc major release
| branch goes EoL. The Mesa build system will pick it up when available,
| and fall back to upstream libclc if not. This libclc fork is not
| verified for any other usages or users of libclc outside of Mesa.

Rusticl would complain if about not this libclc fork is used due to
OpenCL CTS compliance.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-tools-native.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.inc             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
index 20207450bf..c495d2e8a8 100644
--- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -11,7 +11,7 @@ PACKAGECONFIG += "gallium-llvm"
 # to PACKAGECONFIG like in mesa.inc
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
 
-DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native"
+DEPENDS += "mesa-libclc-native spirv-tools-native spirv-llvm-translator-native"
 
 EXTRA_OEMESON += " \
     -Dmesa-clc=enabled -Dinstall-mesa-clc=true -Dmesa-clc-bundle-headers=enabled \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 01981de968..a139ebb176 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -108,7 +108,7 @@ PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
 
 # "opencl" also requires libclc and gallium-llvm to be present in PACKAGECONFIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang libclc spirv-tools spirv-llvm-translator"
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang mesa-libclc spirv-tools spirv-llvm-translator"
 
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr xorgproto libxshmfence"
 # "x11" requires "opengl"
@@ -252,7 +252,7 @@ RPROVIDES:libopencl-mesa += "virtual-opencl-icd"
 RPROVIDES:libgles2-mesa += "libgles3-mesa"
 RPROVIDES:libgles2-mesa-dev += "libgles3-mesa-dev"
 
-RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc', '', d)}"
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-libclc', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgallium \
-- 
2.55.0


