Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD893E77177
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:46 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.25425.1733344598712242539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FHuu/0Ck;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7ea9739647bso181390a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344598; x=1733949398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6a+vxoG6EkK3gbHFHiqi7pPDsbf+3SP52gtm4iGEEQ=;
        b=FHuu/0CkO+avB8MtzXOZNSy27s13d4ybigbrhnzc+wgXG/ZEeeHa3/NhYMQ33XWAjS
         BmRiMW21wjooVdI2zPgF0ybwSiNbaxmHTB7fLg2xfr0I53laPo33ABM0ZOKNKjYzXs4Y
         /rvvPWeZiTBy1+eU374sdh2Tg663iTsuBKBapabtt+eh00ywLs98OO+kBGnkqIi/Hnpz
         2mWieg/HPhhc0WXb4MtbuV95MLqUpu8dWmMnMAZ6xPjAoT633ORNNBtUAXifWXLagi9Z
         VXPsODQ07FCPVcrti9PfuRh8LSFnCU7H7Rh5PLPrqvw/20ZXHoiXzMlqRS+j9LtPiaJK
         t6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344598; x=1733949398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6a+vxoG6EkK3gbHFHiqi7pPDsbf+3SP52gtm4iGEEQ=;
        b=ZrEUTB9/cT9rgcIJv25I6T4EY+DhPsf4ivMzVlqTxLhRHRKAdqQ9iMmnAYHq4kJHvg
         eYM4dUoTuFdAjH8iHeexdVazAxZKrtEyYaiz/sHMW0Y8xoxW7XO/Oh+cSbF1GXNJQO6z
         BN+hJeDeTpP3GdZ8ByROR2SBPPKSsqPZny70nsgxTdxd97Pzc5VaCqEMELCJNQyhFXLp
         kjtfC4UcQZhuDd4vA/agz7FOuPb4gt2Gl6oiWA6a9YrdMCR7Nhc0SfJFtRuk3IPM+DR2
         g2tVmd9Gr3dujjODVnFApymElCvDcYSIZZjlzELh8XVsjDU5EuXW1vzEyW7cBo3aywNR
         YR+g==
X-Gm-Message-State: AOJu0YxgHnKja0Aa+9hR8l+xq00R71cZuCXelCUhW5KgQyjY0L23/COn
	qEi5g663kGG7CFpu8uFJGXI9yiUFgOgrZVjGrIFDZ67y1o4IJALeGJAjr205jOB5fEPW61nXn5k
	w
X-Gm-Gg: ASbGnctpU6HyVbYb4fx69RFFY0Z8hRUSWAknLvXKWwBTGgiFmHaNNc60iZ296FP0hca
	v9RiO+CG3K+z9Qe8xo3hMt83wexr3KDNnRgyPe20u1O9HxI9Jy6i9UJZqZiKj2c9QyafOI1hIgQ
	6r6hsyC24PHqO2NQOO2c4fb77iMb1sA2gcPmJrJ/BSNmCttdgme0PKMM7Aa3q4BQHB8hRNIrG2R
	0QLcnINBp0uoLBkW8cGhSDeKv+bHz4pJyM+uak=
X-Google-Smtp-Source: AGHT+IFLzunGPf22qX1sj2Wtz4tyqu5N/R9G8OKtG1WlrRYAf+frQTJng+MNnCNVqjZzVgDiDpcU6g==
X-Received: by 2002:a05:6a20:748f:b0:1e0:ed9b:14f6 with SMTP id adf61e73a8af0-1e1653f3ebamr10974524637.32.1733344598004;
        Wed, 04 Dec 2024 12:36:38 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/15] selftest/reproducible: Clean up pathnames
Date: Wed,  4 Dec 2024 12:36:13 -0800
Message-Id: <44ee8f69db5e008b5ac5e0dbf390bb4fcf704f07.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208334

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are several problems with these paths. Firstly they contain full
system paths which depend upon where the test was run. These are pretty
pointless and just take up a lot of space making the results files large.

Secondly, they contain the same path twice. The reference and target path
will always be the same thing in two different locations.

Strip off the prefix and remove the duplication. This does change the output
data but that can't really be avoided. It does shrink the results data and makes
it more readable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81a44de36e864b08687451fd85aeba7c529fd7f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 139c43c7e0..7c5c1a996c 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -205,7 +205,7 @@ class ReproducibleTests(OESelftestTestCase):
 
     def write_package_list(self, package_class, name, packages):
         self.extraresults['reproducible']['files'].setdefault(package_class, {})[name] = [
-                {'reference': p.reference, 'test': p.test} for p in packages]
+                p.reference.split("/./")[1] for p in packages]
 
     def copy_file(self, source, dest):
         bb.utils.mkdirhier(os.path.dirname(dest))
-- 
2.34.1


