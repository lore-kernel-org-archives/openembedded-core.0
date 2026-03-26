Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8893210A62C0
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:36 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46599.1774529492456852379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SqS6yJRP;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b949bf4easo508773f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529491; x=1775134291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDLuo+1DNT28AZt2wNtI4uovK6MgckoVedKbetkEv/k=;
        b=SqS6yJRPZLmw3ZLBvIISAkYxdiAf3nNNfAcc3+cmrHS8uiYprxMK16Bsx9zQ8/hW+V
         xZuQZKP9Ner7TWzI9tFlBUC9qH/0gcFu5EEGF6d0Ukbe0S2BbMkI/WWSYlZJxu4R6G7q
         KYJh+IlTxWb/DEnWYae6uQNV3nPXpQBa4/l9xwmhOpFILiu7fVMI1lJB4d8pE3ugUt9n
         NlyNLGC27U1zulSYv3mDRLsOllYinqDfaclvd0i3hadGK9o21MEV621r0OjCMOBQOMdT
         BMSoQrBqSIoYGEiDrUfN4+oGmnwrNmMiJBgLReAI/TTJnaSYpmXmgm5SCsPGrM40ZfMM
         bINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529491; x=1775134291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDLuo+1DNT28AZt2wNtI4uovK6MgckoVedKbetkEv/k=;
        b=msCTf67py7m9X/DeFZOSq+QeCBffaYALiT4SiHQ6ma8tJaZfEhK6VcrIFmdgCFlw2k
         SBeQBTmTN3fBUGZlJeXPLFgdoacPWvnzGm3iyjmo8ldf8cQE8fvYq40o9Fy2dhGYKeaC
         usbVePtWaYmZjctfHpzK26NrWFjOk7Q+CZ5wQ3mKG9Xnf5fA/O7H0y96X7kr83gO487w
         /hDGY1N1BN26tk99mlPh6fmtTIIhgh90GKUTfnE9t68BcpUV8Cg12h0MMmvS7LFrWOKm
         0BPxlRdWlXuxuN5940s/jBc6/yOxPu+M6YucM885mEoGvQ/vXr/La2TK450zrBK28sCN
         9upw==
X-Gm-Message-State: AOJu0YyyKYkursedFucNg1oFZE4wo/iFACgqIfjA/v0kYPb+Y9+SD+Br
	NivQJiMuRbX2EdC7LiUsVbeQSHkaFMtYmmqFelRY+x+5gYxI+OvPq9sBGVbIkw==
X-Gm-Gg: ATEYQzzU1XNPOGGQ3wcqpESNU2kIGHI+IisYz3W2hDTu92m72Ff7wxo0vBo1nCC+2oa
	W+jfnp3jpjCmLRecJWgdvdQ00RqgW33cEY5uluZlAwhhP79TTqb+StxTzuv4IvoEigC2kwmVDgB
	IgjK0xZz0WwnxFc5WCfD4BL4y61S6eO0MacaQ4PUp9xKrcYqCXC3NIns6J7lVraFWSORiM2YIOm
	Vt3o2rlpP+r3LSsxXS0JbUTHsU/GBegclTLNpF00iLQUe0480Y5Cc2Ma2eKFmRtfiupvaTV1dFH
	GnKAEuByNwFCNv2NJmf2uBlScv324ufzq/c79PS9u1L0XztwYC5RGiK02x0n/XJBI4rbb2N/7Yc
	6JF32MGDdDMacmf4L3eY9KD4Od84DqvrX+dupWABWUbZ/N73IrxihBltPqTp1akOEeh06YYTqxe
	X9+9SFWp+6sh+R8w==
X-Received: by 2002:a05:6000:2004:b0:43a:4e0:1774 with SMTP id ffacd0b85a97d-43b97a2617bmr2729504f8f.16.1774529490566;
        Thu, 26 Mar 2026 05:51:30 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:29 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 10/13] lttng-ust: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 13:42:31 +0100
Message-ID: <20260326125113.1853869-11-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326125113.1853869-1-zboszor@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233995

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
index 1a15c5b420..5c1c74b7a8 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b04e8f34dbcf08198c6618d05e8fe7b"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
-                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
 "
 
 inherit autotools lib_package manpages python3native pkgconfig
-- 
2.53.0


