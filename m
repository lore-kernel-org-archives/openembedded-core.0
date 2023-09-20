Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C46CE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 05:42:50 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.30682.1695188561243013848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 22:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b1jiU2qh;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c46b30a1ceso30338465ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 22:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695188560; x=1695793360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zcm7E5cUFjDCcIT5hSgf9jFWbfU5bKUH1ZAUhtPKIK8=;
        b=b1jiU2qhTzy3GB6D7BfQFDLo3gg+lxEYd4onhVY9TXYIau+6JghGM62lA0EuFRPYgk
         96cVDSLatE0R1xmRGKorIr4BuQyoAXolPXE1rXkmNmUqt+JZDjKlmfm9RXm+SRaiN/3i
         e/+0JcrgFW7bvpwuPapKMn/IwP2Cw1lo13sCXSBJlFr7BoIXIoyOZ5nHj/oOixgBx+oj
         rfRmk/xLafD0beseLcgzvPYVXVnMaffEQDrWYjcuEcLHMSzB8XHUgj4KGdPXf74jzAHQ
         3NmTrEDeZSkHzZ6Y2NxHTjn9dVM8vzYeuRmn9UHJxq8NJFajT1u+HIPX/NhenULGxn8w
         X15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695188560; x=1695793360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zcm7E5cUFjDCcIT5hSgf9jFWbfU5bKUH1ZAUhtPKIK8=;
        b=NXgQVFokM3srvy16Za9yDkwlcgXKodoTQzYyx8Nbq5JO1q4TMwkf5nXkfb0TYJl2DP
         vjf6XIQxw6CXLS8/rgqAVMUoDGw7zjQOF2Ne+G03qsG/ZFjTmyjHkUe7Gf0mc3rDVYfl
         JUXblevnQMNjLV04Wf1A7b/WgvYwMp5MrjBsH6lK63aMw2aF+S7mVFRFkvyzLZCIwxCg
         BpykklndSP5e9wiWfmCT6QSb/Rv9BE3w58Eh6/m1W06lutaLHPV8vdWOEMwJfjYMFXtn
         YRLAKVBYSj8QAXgzbAV7m/3guX4KNGZN+BwaqNwhB/cKxoV+3e/yKeGnRlTXUdYxgMvq
         g4zw==
X-Gm-Message-State: AOJu0YxJCf7t3pf5T5yjTk2c16W7lcSqxvvOqSdHX4Ojy0FicYcXiu5z
	gv7LqA0KIS1etB5F3Bi21U6B9FSwBfQ=
X-Google-Smtp-Source: AGHT+IF5D526LSs17fN2bj1ijuNpZT8ERoSMf9339jxIPsxgQUtm26ODryOEtLrLBcHopDre9CUfdw==
X-Received: by 2002:a17:902:e74f:b0:1bd:c931:8c47 with SMTP id p15-20020a170902e74f00b001bdc9318c47mr1611025plf.68.1695188560390;
        Tue, 19 Sep 2023 22:42:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id bh3-20020a170902a98300b001c55d591f07sm5134485plb.260.2023.09.19.22.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:42:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] libidn2: Disable error_at_line detection for musl
Date: Tue, 19 Sep 2023 22:42:34 -0700
Message-ID: <20230920054234.2514751-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920054234.2514751-1-raj.khem@gmail.com>
References: <20230920054234.2514751-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 05:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187892

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libidn/libidn2_2.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.4.bb b/meta/recipes-extended/libidn/libidn2_2.3.4.bb
index b48de39fa06..042f4e6a56c 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.4.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.4.bb
@@ -21,6 +21,7 @@ inherit pkgconfig autotools gettext texinfo gtk-doc lib_package
 EXTRA_OECONF += "--disable-rpath \
                  --with-libunistring-prefix=${STAGING_EXECPREFIXDIR} \
                  "
+EXTRA_OECONF:append:libc-musl = " ac_cv_lib_error_at_line=no"
 
 do_install:append() {
 	# Need to remove any duplicate whitespace too for reproducibility
-- 
2.42.0


