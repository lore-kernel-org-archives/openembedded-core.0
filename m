Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCA7C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 16:41:00 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.576.1646412059546748817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 08:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MuH24syH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so6324478wms.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 08:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E5dEJgkMCsBVzFbShHdu+odMLn5QDii7Uf6jYIc6NBw=;
        b=MuH24syHCczAmg2sJWCdGAf95ucaLuMTOfwf/ZxargX0iv/Z0A9KFSVreirx5LPgmW
         95OAqJ4A1MwoBtvESTf+c8WkiMG9a8QLf8g7MSu6BTOLEyiuJYGOzwMsf43xrLKpKC2J
         uJX2Si4c5nISa38k7VC3/jag1W1gPiT7yMktM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E5dEJgkMCsBVzFbShHdu+odMLn5QDii7Uf6jYIc6NBw=;
        b=by99sQd09gWAM+c96t5FFxBcK4Z0erDFG0r7ZFdyZFR/ohUesE6QDN9NIB7GokIsoY
         4b+kTKPcnsOnmnN2e7ToaXyoE6ecW24L1/uxfid7+NqjfwxBuA3wi5ytqVZ0QtYheGDL
         njlZHJWGC/ImTOpeFItGzVo2qPCSO94Fw+ER5cPHqIzyRBMJxxa6krWPcW3yFCYkqNtQ
         jxHGZ2kzNI+28qV8I1aldzKatHVJAd+8weLeE2CW4agvFr7dm57RaOyZg9MT+y7GsflM
         3z1h5fKrVa3ndGyTm523V9ezvvplBM7gj23434MyZPPd6s5pkMBp63onY+MrdxxC/jci
         7wiQ==
X-Gm-Message-State: AOAM532GDtlvy3QWQ3DfPr3JHFF55iwBS8TmLuX2e23ewdihBN4GvDhl
	xLuClgBGMj6XBZXucqNFdTyUUyEjUVMYsNVK
X-Google-Smtp-Source: 
 ABdhPJxvGiAz5Cjh07tuOHJdQOcGyKZ5alvH6VuY3duJJpHR/zIeZg1vTzjAnk6ixqB/B5KyNLLSdw==
X-Received: by 2002:a05:600c:2250:b0:383:bab2:9df5 with SMTP id
 a16-20020a05600c225000b00383bab29df5mr8442519wmm.162.1646412057866;
        Fri, 04 Mar 2022 08:40:57 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f5cf:8b05:e0eb:94af])
        by smtp.gmail.com with ESMTPSA id
 d8-20020a056000114800b001f045f3435asm6970536wrx.108.2022.03.04.08.40.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 08:40:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] layer.conf: Add libarchive-native e2fsprogs-native
 exclusion from sysroot
Date: Fri,  4 Mar 2022 16:40:54 +0000
Message-Id: <20220304164055.379402-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304164055.379402-1-richard.purdie@linuxfoundation.org>
References: <20220304164055.379402-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 16:41:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162740

Currently, libarchive-native pulls e2fsprogs and all it's dependencies into
the sysroot. Since only headers are needed at buildtime and there is no
runtime dependency, we can avoid this and shrink the native sysroots.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 8f30de5f6b4..3eda0b0ded9 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -91,6 +91,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 # (e.g. X -> Y -> binutils-cross -> bison-native) no longer meet the
 # dependency incidentally. This improves determinism and avoids build
 # failures when people switch to external toolchains.
+# libarchive only needs e2fsprogs headers at buildtime
 SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->autoconf-native \
     .*->automake-native \
@@ -104,6 +105,7 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->gperf-native \
     .*->gtk-doc-native \
     .*->texinfo-native \
+    libarchive-native->e2fsprogs-native \
 "
 # Nothing needs to depend on libc-initial
 # base-passwd/shadow-sysroot don't need their dependencies
-- 
2.32.0


