Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AF9C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:16:45 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.3666.1647299804409377318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fp2C95W6;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id j26so26421554wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fe0Jm2nqW5UT4U0gayd/L/LzH4PskdC04AE+ETPsA7Q=;
        b=fp2C95W6ne/JtURpmiJE/va++L7fS2ZESStVYWIrhO/iiCKIGRgdFkkVuIKvQ2/VB7
         WPa1lVbZq2Dv+WwHMRpRXAJLbzg1tKTJvZo4ygZuCNAP/Xd+7vdaI1KYrdrJxGG9Axwo
         LHJYMGekxQoOQPxXOotIlMOX60tUeAos/cD2vS1wBO4DfRVdW8LKIE2of64rArc9Q/Eg
         ps4XPfQDUNXQ/Drz3HcW8zH9QBDf0Fse3xf01CfDAnTOnUV+0fp8PR9RMSdFAwYTmmIB
         ut09GlXBcc5RXQGQaoZwW/2y8+CyPA/NqObqXeGYHhsyRgmCYiPbVukD+HGOnObe5XsH
         70kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fe0Jm2nqW5UT4U0gayd/L/LzH4PskdC04AE+ETPsA7Q=;
        b=W1VEu0HQFwczBEsfrf/8KUF+ja8UO6l0pOHCyn2KPeyDPzfTUZr0yO8DZgIZfQRyoG
         pQpzsHRopaQrNJ1uuy+KRH+4mkIzte63WLvOiwYYSEjWL+FhjDr6ci4/y17Iaa9O77rC
         PQc/5jJyUeh8SL9IRDXOY5r8y7x85/vKA3rsd3EBoDD2y0LkE09mQMudtDcvGF0tDmvw
         UYIJhkDM32obAVfp+pYP09PRr6x8h4nDzAno4UH/IubUyZ4cCdGEtsceqchvegzS9nZK
         0ru/Y8HdK8TRd96cFfDfaDNd0tDqr5lpQEapcTAjxRlAhLTd77d0jHjf+/XhFhBpD9ps
         M4sg==
X-Gm-Message-State: AOAM533orsLBOIEVWaTPnBwdMNYc3PPVA0Tt3gWR5z/pV1AanzayGjp9
	6+aZRoFqTXM7nVO38CB94VHR4BBJiW0=
X-Google-Smtp-Source: 
 ABdhPJwZQTlgChgbryen95k4m+sW/ijDlKm35M+ERjn4FUy7E30y7ihhr6/aC0aYqDz/5Nn6G9z0VA==
X-Received: by 2002:a05:6000:11d0:b0:1f1:f6ea:f9a with SMTP id
 i16-20020a05600011d000b001f1f6ea0f9amr18380203wrx.40.1647299802602;
        Mon, 14 Mar 2022 16:16:42 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm23231761wri.0.2022.03.14.16.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:16:42 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2] meson.bbclass: add exe_wrapper helper
Date: Mon, 14 Mar 2022 23:16:37 +0000
Message-Id: <20220314231637.296654-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:16:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163204

Sometimes when we use the exe_wrapper we need a way to
costumize or circumvent some limitations of the qemu usermode.
The ideia of this help script is to handle such cases before
the qemu usermode was launched.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/meson.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 0bfe945811..8c732e6174 100644
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
@@ -127,6 +129,9 @@ export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
 # meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
 unset LD_LIBRARY_PATH
 
+# import any customization provided in the helper
+test -f "${MESON_QEMU_WRAPPER_HELPER}" && . ${MESON_QEMU_WRAPPER_HELPER}
+
 $qemu_binary "\$@"
 EOF
     chmod +x ${WORKDIR}/meson-qemuwrapper
-- 
2.35.1


