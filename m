Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C428C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 00:08:54 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.16479.1645315733356400053
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 16:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lFfjDaP+;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k1so20632704wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 16:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q4f8dYNxTs9HKaMpHCflJNWQl1dR+PiIbL97aKWkgzk=;
        b=lFfjDaP+UvF13tUUHFZwDxBSwZYTURQtqxLPHu28jTc/+fRSq9i5cUBDedG7kVCVjj
         HpBZ0Tj7uzxX2xsDj4oCH5j+cQnhN5F6ra2gX6wXI6ANxGdekOSX2CSXjtRASGc2oJ0K
         IS2GvtZ7vWUb1K7/LdFwUGOlExgcz0BsrXP1xTlfGEyJ+SaOmMftfgZw1+Be6r1qLyIv
         Veo2oj7EwhNggfJYFz0bctXHDr7jqeyafczjKVBlzxT426s2ez+FEI1BNl73016nt5OA
         YnLwr7pCBcNQOr3XDu2LM/bUDLKEFTSrMsnAu3KQBz3diDrqbgl8gRnRb26pGVqmbelM
         UGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q4f8dYNxTs9HKaMpHCflJNWQl1dR+PiIbL97aKWkgzk=;
        b=RGerThztZp5yr21o50yySbtNq+3UWbIGjsW4kPYyiRE5oe6sZkVO0pQse/eM25letR
         wZkEBV+eMm+fojLOQRYPjhgJvrPOG8tL+TTIdmMCxuTUCMjdCNhcppscbzKXjOfGBMwS
         uvFAk26MsWg+6IEk9QMs3feOyZa30RgZZzvtdnPHyt2dskeCThihbY6/+Ghk+BJsSfx5
         WUtP/LfqEDBnMeVG7rz/VzF6hUpMRlEfreAFEA76b8VQkocZN9g83W5lKfEETQA83wve
         Ceys/VQ8229gK0KP72PfJSl2CTGZbPV2zHQBJOCo4z7nFZufVFBbATvWWDzJWz/WrVT3
         0/Qg==
X-Gm-Message-State: AOAM530zj96J41RFSSRYf2SmFPQZTmIcn6wJoFNNyEKLfXVV2IvAHFFS
	jsTxI6G2NQRqSfB/irurAYsjWfaZJdg=
X-Google-Smtp-Source: 
 ABdhPJxrTHM51EPvzSUgPw/U3gSSrvBqW8A12R/BP+OXhd3XATw41VaOLrIoU2vxMDPYXUpZFzxvog==
X-Received: by 2002:a05:6000:2aa:b0:1e3:d43:f5c with SMTP id
 l10-20020a05600002aa00b001e30d430f5cmr10570619wry.178.1645315731534;
        Sat, 19 Feb 2022 16:08:51 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 t2sm27446026wrr.55.2022.02.19.16.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 16:08:50 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] meson.bbclass: add exe_wrapper helper
Date: Sun, 20 Feb 2022 00:08:05 +0000
Message-Id: <20220220000805.1567335-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220000805.1567335-1-quaresma.jose@gmail.com>
References: <20220220000805.1567335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Feb 2022 00:08:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161978

When we use the exe_wrapper to run the tests we need
a way to circumvent the limitations of qemu usermode.
So for example we can skip the tests we know will fail.
The ideia of this help script is to handle such cases
before the qemu usermode was launched.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/meson.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index bc15cb8163..11c6b403f0 100644
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


