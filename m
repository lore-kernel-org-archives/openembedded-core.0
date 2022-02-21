Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBBEC4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 08:51:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.8628.1645433515213858941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 00:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BoD8j8i1;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id d3so10079159wrf.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 00:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SKZN6ZEbcAqzO2GraP3ZC8Bsq62J8TGI9Y3psxx3o0E=;
        b=BoD8j8i1pIWdPmTIXZ0+Yz/iPeCNY9+dviVcHDnpPqSNf9TEgsxo1UWg9hRyzb6KYl
         /gfmQbuM/+WpBjaQRI1UAD9x6DWJ+hbEoAlLA4/r9i+KJUaTS6KxCOg/t1aFNuBokTY6
         6GftQrOlk2VAR4krcXtEBbMtnt4fIIWYaQMxFEEaQtMy9QIA6R8oq4IyeH5CtmPQqjcX
         D8gOMsTiUXqczrIFjCdYE/Z3ruFU0XRsz9ffR/vLsCukum9Bagpykh77oC6lT4zP5dl7
         r35juApciz9mthvxGRakGWevHNZ3fDI4yhKE1MFW9ocNs9ILO3VQVDaucxxF/rUJIcFn
         SJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SKZN6ZEbcAqzO2GraP3ZC8Bsq62J8TGI9Y3psxx3o0E=;
        b=p+U6KwVymvSx3c86SvrrlAcZm7vWMQnrMYQDnuhu+PiGkW+hh5o2UrjvQV7pi4ojUa
         rOEIqp6l/pOTe3skukrV4NV/E/jhVW7lHrsKbWHBWbRIxNNPzIgC30H6MHCOkwxsKyNG
         Z+24up0qNr+TtQfTS+M6L1gwcjGIsNqOODUiFgn/p23zLudfoZLaOEf/R4bgDb69lOji
         Twx7vengZND9NPM16PcAoYFPioTUmzdABfQ2ysDqxXlvTPghmAFLp2yhPZvBr9devrG8
         aDfdMAdr0JGpvAQJ7UwGV1ncaWlwFbqOvlusHsYACC0wNab/onkzz00zj482i6lCI+OE
         TGIQ==
X-Gm-Message-State: AOAM5330Fr5+/3Lf0tWgP5ooY4KgBoKoHpB6sLR2uCSKyoBvbsglGPmY
	b6f1mjnIpNw0LaplRLrMFPB5zlaoK1w=
X-Google-Smtp-Source: 
 ABdhPJxATqD1rSPEkbcHB0BrVHwLOof3u3H5SGx3FSddVEFFtmEK3fi5kSADDl0EQ2VoAt2el4S5kA==
X-Received: by 2002:a5d:47cb:0:b0:1e8:593d:d34b with SMTP id
 o11-20020a5d47cb000000b001e8593dd34bmr14161754wrc.124.1645433513595;
        Mon, 21 Feb 2022 00:51:53 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 x11sm6843110wmi.37.2022.02.21.00.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 00:51:53 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 2/2] meson.bbclass: add exe_wrapper helper
Date: Mon, 21 Feb 2022 08:51:18 +0000
Message-Id: <20220221085118.2267900-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221085118.2267900-1-quaresma.jose@gmail.com>
References: <20220221085118.2267900-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 08:51:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162020

When we use the exe_wrapper to run the tests we need a way to
costumize or circumvent some limitations of the qemu usermode.
So for example we can skip the tests we know will fail.

The ideia of this help script is to handle such cases before
the qemu usermode was launched.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/meson.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 020a59a3c0..3a8061bb76 100644
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


