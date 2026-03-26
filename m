Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA41010A62F3
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:52 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49674.1774535443120267182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hbhff6g3;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b2965d4bso834192f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535441; x=1775140241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDLuo+1DNT28AZt2wNtI4uovK6MgckoVedKbetkEv/k=;
        b=hbhff6g3S/dx9kSH+G1N+aMl8Cb0KWyRB7jdoPTvqaPo8f63gtecaUu1DOfKwvoxX7
         jo9QFZ7wpCt28EjmPCP8X9Ko6VOnaTRmmlez2mCIGWEvTgPTa4XNcaXemkCpCv/RBX4Z
         0R1ls3OHcRzoQHEz1ONjEkJlH2s6k6p9ltIQnTssWRmPcJhFEdNeLbs37njcepAArih9
         SDOBPH88QoEm8+oubL7nKrkkJa7L2Ln9CvleLA1xoEMGwUTJGSagIRdCzbUwBXhxsuv6
         +50U/ONDJ3kVqWnvTvdfSFpA78aw9wbJurxhGYpbumgaKaLQZrLCCLrrjcaqeHPePXUm
         Wq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535441; x=1775140241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDLuo+1DNT28AZt2wNtI4uovK6MgckoVedKbetkEv/k=;
        b=TyNVg5+t9Fooc3oaOOpgQD2rjY3Qk2iTAyOMuFh/ALE+PwVgA2WBfOYuDvz64FqGeR
         BZKF00hy4qzih1Lj8Nin0+ts1HdO4klBssE3udmAVQ7RMGHqn9pSmrpEtjYujoBq8rmH
         zW4CM8Zyt0FmuhQPDGddpFUR9zEfqIUJMNInMrph3icwGh3paQQKHbkJLCbRQzVYOFHe
         W+uzdhY796M6F0wYsXaKr9Wr2P/DKIJwQHTiJTNcSWUQdkG7GXYb+5orNo3D9jMepEXj
         w2xhLNDh4N2eJNV3A37AWXRB5E0/RWpR6FV/PZ8JzOmE2Y5pWnaTHhhBvNcEfNGmx4KY
         Q4kQ==
X-Gm-Message-State: AOJu0YwMtReQq/I31FPGOY+jRBOpgM+vbi/jKgvvPVTRfgyDpVUlS67p
	sKR1DDvkuY5HLtk0qfMG5wvj+a4IV0iNmZAGXHVKcr2gH1Tm8+JwuUD16lXKuQ==
X-Gm-Gg: ATEYQzzKV2Ut5gJSyV3PcDskhG9bBvhJRCycON4iepgkzIjMNyNfDjdQJsJechFi2ht
	UC4GsjxFo/rUIz//p7Sg/CVtkZDAdVfHKcsxsMAFdTvihrRpXvbqDVxY7mRrYEKFDxJW7oMa1mX
	Vs4CGVWhLFQvZG9CK7KFrgR0M0vYfPtLc8PXd74bJBuE284H7Wde+4j97npknp6KY19BGUqvmQC
	u+h0oE+IwK/DqwxQBqOk2W8o6ohMD1UlDY/FLGe0A9gOWJEyCYyNEEV+c1MLVqN9+bYA9ANLfma
	nHudnx1u+ewEkXXXyGV0KdzEctyyLtMNPP29u4kqMeRVOwJHwpnV/kIdksYNHBO3P8rCrCf/jHK
	TqRgC48SZcB9m9mOSVb4TvRZBsCn8iu18BCXS7ga0L7PZDR6y5Y2mAD6sy4FFVeC9u/3JwZmzOV
	JbHxziE6OwLIfvSw==
X-Received: by 2002:a05:6000:609:b0:439:abcd:b317 with SMTP id ffacd0b85a97d-43b889a49f9mr12529531f8f.14.1774535441104;
        Thu, 26 Mar 2026 07:30:41 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:40 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 10/12] lttng-ust: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 15:30:18 +0100
Message-ID: <20260326143020.2083293-10-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234013

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


