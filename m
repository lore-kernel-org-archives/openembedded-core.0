Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D767C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 22:59:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.4065.1645138785606857050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 14:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JQ3/VkIw;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so5111582wml.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 14:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YUm+aM43hcuqUWwoDnajNKlTOEc0M0QdqoJroVW3YWU=;
        b=JQ3/VkIwvsrgZSSVaa8raAad6WamFHDSkdlLBbpFyWK7Tsh3/HEqi0XpDzgTvuZurS
         fE9dG2KY7DT3kFQxQFcgM2mrs68t+qhaDOBImqN9mCj87tqTOCmuC3MtqkW+Q6lk7tou
         XutiM19NoO0s06m32jx2vBrEGwn6Z9upxa4Era/vlW/8Ay2AXDGRWdXKC332ZueG6etl
         YqXfZKi/PGjXXjccyVTHwd1O3mlq7lx+C/htp/fHctU3ElhX+6GoUeN7DpqqS2lcf5GP
         ST+G94pAwwDwYV4jxhGcafExjDcU7JZqdbSSHZRz+KnJIVzeZCeNhzcTbHnXJDFNQbFc
         +oOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YUm+aM43hcuqUWwoDnajNKlTOEc0M0QdqoJroVW3YWU=;
        b=PSNkr9uBinO717fMmLUL+5RIwjuzADotwkPSA/b2y2BtMEnan5V1kztdLi5IPB48dB
         GyjGh0H37veujavERUuxQi+Pvl67sVEXNr6s0lPRuF9KXmOp8HDyDB/IAosqQd9ueFXO
         ftColO9Y8QNQ1OLRMy8G4fnZat3rwNvg41SbeOpg/I0e6jpwfUhK0GriGo6+B5e8OROT
         qAaLGVr6oKarjJnGv1SldbU4uimxROUORXRbHGZmUKm5TtYzlOmqLBh5OauOxQKSu9BP
         KbJ2BJAwpeX7/NbcySKhgrD1X9UwhtF9XXVYd1Me/moy9Y+zpYqpKK8CuS/VLGifLl+a
         LSMg==
X-Gm-Message-State: AOAM530xo+fYWzxtolvOPnI8IeUIxHvrhifqGDggsW1rgjfm5gkqTaJZ
	ABDsr/rBDSvzjKhhMgsZCMnMiyP93oPKkQ==
X-Google-Smtp-Source: 
 ABdhPJykHPoDeiLrodZqNMB49yR7/hH9Q3Jd5+AlvdDxXN4JjBoKe6bKInc4FZWojSnZ83veHnVXJQ==
X-Received: by 2002:a1c:4c0b:0:b0:37c:505:d460 with SMTP id
 z11-20020a1c4c0b000000b0037c0505d460mr8262206wmf.101.1645138783844;
        Thu, 17 Feb 2022 14:59:43 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 b16sm2966669wmj.32.2022.02.17.14.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 14:59:43 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] meson.bbclass: makes the exe_wrapper more configurable
Date: Thu, 17 Feb 2022 22:59:35 +0000
Message-Id: <20220217225935.727335-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217225935.727335-1-quaresma.jose@gmail.com>
References: <20220217225935.727335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 22:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161867

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/meson.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 8c732e6174..4af14300ac 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -70,7 +70,7 @@ cups-config = 'cups-config'
 g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
 g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
 ${@rust_tool(d, "HOST_SYS")}
-${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
+${@"exe_wrapper = '${MESON_QEMU_WRAPPER}'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
 
 [built-in options]
 c_args = ${@meson_array('CFLAGS', d)}
@@ -115,12 +115,13 @@ EOF
 }
 
 MESON_QEMU_WRAPPER_HELPER ?= ""
+MESON_QEMU_WRAPPER_BINARY ?= "${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+MESON_QEMU_WRAPPER ?= "${WORKDIR}/meson-qemuwrapper"
 
 do_write_config:append:class-target() {
     # Write out a qemu wrapper that will be used as exe_wrapper so that meson
     # can run target helper binaries through that.
-    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
-    cat > ${WORKDIR}/meson-qemuwrapper << EOF
+    cat > ${MESON_QEMU_WRAPPER} << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
 # which may then get deleted (or their dependencies) and potentially segfault
@@ -132,9 +133,9 @@ unset LD_LIBRARY_PATH
 # import any customization provided in the helper
 test -f "${MESON_QEMU_WRAPPER_HELPER}" && . ${MESON_QEMU_WRAPPER_HELPER}
 
-$qemu_binary "\$@"
+${MESON_QEMU_WRAPPER_BINARY} "\$@"
 EOF
-    chmod +x ${WORKDIR}/meson-qemuwrapper
+    chmod +x ${MESON_QEMU_WRAPPER}
 }
 
 # Tell externalsrc that changes to this file require a reconfigure
-- 
2.35.1


