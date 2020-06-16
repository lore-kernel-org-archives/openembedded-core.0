Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.749.1592327145551971214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 10:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=hiiNYkRb;
 spf=pass (domain: burtonini.com, ip: 209.85.221.66, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f66.google.com with SMTP id l10so21522495wrr.10
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 10:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cDRr5dBoxL1KiZhkh9c6D329UtRVaDhUACRuibybGaY=;
        b=hiiNYkRbEtWDjGjAdeJMs+rjrtZZq49myPI8QdILXWu8MqZBh2f7uEHlXdh+daLAaM
         wzLrjJ1eHoT5BfmTnisv1lUINijZ31fQYSMGf/+3gs0XeWBjct+/nwK/L6PhfKM2jHjQ
         yDEKoBQv20+NgSgMyUPruITjGZI80t+ilRxR4AVdlFLSjdVqWdc5fcrB8n/ufi+fEc9n
         OrGswXMIKiOy/NGMGqL6olV9WUGYuIUmNB5OOEFr8k3YncI286Rgy9/2dkO7BetpgXx3
         37BFW+tm0aEYSNrD26E4BT0VfesYPwE9iW87sklvOKBh29NdpcM1VULzc/yHX1texSy8
         fBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cDRr5dBoxL1KiZhkh9c6D329UtRVaDhUACRuibybGaY=;
        b=iISBlEYV6IetBOBoGc9V4vgSHGfy9sKwOTURy2x/OQ0TLEkYfjqP/AINufKLe7j6jM
         pfLbWbhvmpXxRezwo3FBiw/9Q+kKKodDFDfGy7U28JugtaknzCZgXwmtRHSuUF6fnShp
         VUV6R8lnzK2qxr8larIUZ6omKCwiX9xGT65m6Ao0hh0AiBJntBuvRjE6CGiog6u0Hgex
         IDQ5bgmUPQElro2qy+B/DDIYrTcshdCF72H5OEYTfiStkNC1E76dgRt1WxKleVGMZjnm
         DXxJaGjWTXIBb/QqRpqEF+hj7SbfbFJ08ty6tCe7blS7zuxVPbesGeMd3AI+R/ni9dD+
         tugg==
X-Gm-Message-State: AOAM530r8lWoKxeyJovOit+k2BNVh7dusfYmXl0r9v9HBP/ZDrzvshHs
	GF7GHfxpoGKSfSdh3PlTfUiuEhszbi9huQ==
X-Google-Smtp-Source: ABdhPJx62u7Ou9bmM9Is1WbAtRGFfV9dbvlMHV9920y/LKne9TlI56jppYZyqoj5mBPEF/oYxmlFJw==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr4191435wrp.338.1592327143805;
        Tue, 16 Jun 2020 10:05:43 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id 40sm31820668wrc.15.2020.06.16.10.05.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 10:05:43 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 2/3] tcmode-default: use go-binary-native by default
Date: Tue, 16 Jun 2020 18:05:37 +0100
Message-Id: <20200616170538.1049884-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200616170538.1049884-1-ross@burtonini.com>
References: <20200616170538.1049884-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

go-binary-native is faster and more portable than go-native, so use it
by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/tcmode-default.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index ab4333144b..7103e10d3b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -66,6 +66,10 @@ PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
 PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
 PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
 
+# Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
+# from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
+# go-native.
+PREFERRED_PROVIDER_go-native ?= "go-binary-native"
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
 PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
 PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
-- 
2.26.2

