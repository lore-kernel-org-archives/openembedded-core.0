Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522F9C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 15:40:45 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.5689.1647099640324637602
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 07:40:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QJnoTR1z;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id u10so17274546wra.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 07:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MJsppwh3KsQCBW1uL2UDuDMi1zgqt/YYFtBnfE2gz6A=;
        b=QJnoTR1zAsdjJwLatsXnfE0X0IKkouhi1KNXYGCo1t8i8R8baKqAwwFJdQ7n9oDhdL
         NYzr7WG1shh4C8ViJL0To9+0+8SmFNmpuDiMSoFjfem9EMJHcZjkWsEi/u8Wtb66vqAs
         cacXOdNW/9E0oQzWM3bq0QlTasua0liKu8SvhvTNgjs3tqB+vw60hyQAWF3g+RLUj4DH
         soys4MPGnl7YTqRW0NPL6Eq3gXgQxGfCBy6YsLfgJpFVVBQE/0rdz/mvQQd/gwPemCaV
         QhpBlUhaTAukqxv8Fckw/OOZkeH6zgPanshsj7ltiESd0U9BShwr1VBUQSRzX0HThpAd
         BDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MJsppwh3KsQCBW1uL2UDuDMi1zgqt/YYFtBnfE2gz6A=;
        b=BuwecZVasro1Hf/SLelja1c+1UPIzleLxT2t8dpkYDx47IKw+dmRWUw5+LFqefdCMy
         6SU9aeDfMiiJcLXGHNXixAyCJ6QjBk6YchPF2WXttN21DBv54omV+IOb8jUeM1dUEkg2
         sc7Nhhbb2P1JzOoxNTxw9/obHCZsPGfBQxAd8j2y4m5vOtb45zZj6k9TIYTsUpyYzmvU
         fGwEFcUy83Dz9zn39mQPXZ2jWdsuzWJW2GHpcIMWlHfzfntj3L7MZS2BtT3jMTJUAUV9
         GHzxjqUbzRX99KRVC/qUc1pucMns+oT5tm+ylrMP89dGVO/jUklNB0D/7iadacMcrfA6
         yvwg==
X-Gm-Message-State: AOAM532qLYZ4RFwddvfk0zm9EV9fX+S4UpmsSOWMZEBW9vTIUD2+VocK
	6+jrb9aiThZWAvjjB1o5rRph66lfvAg=
X-Google-Smtp-Source: 
 ABdhPJwld22sumTfYqec6pIJt9Ro7tcSmt5vxYhWKyZoEcZw6HzFNclzwmWD316DW3CMLah5PCEIZA==
X-Received: by 2002:a05:6000:1683:b0:1f1:eb7c:be70 with SMTP id
 y3-20020a056000168300b001f1eb7cbe70mr10796678wrd.129.1647099638390;
        Sat, 12 Mar 2022 07:40:38 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 11-20020a05600c22cb00b00382a960b17csm13147967wmg.7.2022.03.12.07.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 07:40:37 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] meson.bbclass: add exe_wrapper helper
Date: Sat, 12 Mar 2022 15:40:11 +0000
Message-Id: <20220312154011.499012-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 15:40:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163092

Sometimes when we use the exe_wrapper we need a way to
costumize or circumvent some limitations of the qemu usermode.
The ideia of this help script is to handle such cases before
the qemu usermode was launched.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/meson.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 0bfe945811..877f5e7794 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -114,6 +114,8 @@ cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
 EOF
 }
 
+MESON_QEMU_WRAPPER_HELPER ?= ""
+
 do_write_config:append:class-target() {
     # Write out a qemu wrapper that will be used as exe_wrapper so that meson
     # can run target helper binaries through that.
@@ -127,10 +129,14 @@ export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
 # meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
 unset LD_LIBRARY_PATH
 
+# import any customization provided in the helper
+test -f "${MESON_QEMU_WRAPPER_HELPER}" && . ${MESON_QEMU_WRAPPER_HELPER}
+
 $qemu_binary "\$@"
 EOF
     chmod +x ${WORKDIR}/meson-qemuwrapper
 }
+do_write_config:class-target[vardeps] += "MESON_QEMU_WRAPPER_HELPER"
 
 # Tell externalsrc that changes to this file require a reconfigure
 CONFIGURE_FILES = "meson.build"
-- 
2.35.1


