Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A10DC7618D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:50 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.8796.1678888909558157735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=krSqZAO9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so2096328pjz.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTW4hM0VSF7LFJ/NCK6iG+tETSGyjR8S+zmadiTpiUs=;
        b=krSqZAO9AIW3lnPPRDiNpi0yN/3CW39hRv7XrODssFRT6Ui3OpL4Aj8PIOzeIVlx1m
         8nlrEJtpZYBeY90bam840Rm+/THqpAStiwyPisWDmLqwY2IGN9Mj4AoTdrs1q7akfe25
         I9yuFltQ9tDOYBeQXVUJKVP4oPWiMUuTm6TfXeUkP0c/51Z4XLY1M8Ie5RKeoiIY4uYg
         xaY6nap7hmg9SzppAnAeYRkUZa4rV1AuL/EhyjBlcPFsg8ABWpmi3y+Q9jy2Rbd8gAFh
         //9qre9g6tgeHvXvWq+RXhyOE66d18GKjgAX0XIAOVhvMnWwwALp6w33knvIdh+ahh7W
         7yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTW4hM0VSF7LFJ/NCK6iG+tETSGyjR8S+zmadiTpiUs=;
        b=spN1gsAGRBrv7P49qj/VvERFenexZHzvZTyHK/193mrPHZcgC0vjJkh7+vfIHu9+Mc
         ko5osemD3rCiKhDStI08NqWE6fxuIizkPaNXC7r10qvZhiIw+2fmZRtnVkxrEm0Hz/bg
         FZmM+IHOOzVYlK3GN0zzS+r37GTd8KxYqOCX7zKQhy19pY2qRcx1/nobDEBt4FoJWRDp
         ZwlEWBWypq4YZW4B+17w4ct+uU+30Kx5aJseYF3Q3Zj30R58FSanTUrAjA5n2Q6j3gmA
         N6jJqsnZCk+c2kvQvJs0xDH8FfqtyJuhmJCi0A0NFzXGvpk6z5o8Vcwobz5nNf/syLJ7
         wOog==
X-Gm-Message-State: AO0yUKWjF/8bv9/91aeUloPaOzlhK18hz0i4mGB/foLBNRMulVEKahC2
	lfPdt/Z74o6ZZm2Km+pqPFxwAo3eX1OFcLJGtdY=
X-Google-Smtp-Source: AK7set+qn60U9RVmQS+J4Kq6xOjl5UBbS16O+iICyH4wtQsO+BdLMom21H52UowP0QOhEzvQMkaz9A==
X-Received: by 2002:a17:903:187:b0:19c:dc38:3eb5 with SMTP id z7-20020a170903018700b0019cdc383eb5mr3240504plg.14.1678888908589;
        Wed, 15 Mar 2023 07:01:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/22] python3-setuptools-rust-native: Add direct dependency of native python3 modules
Date: Wed, 15 Mar 2023 04:01:05 -1000
Message-Id: <0ae1ed426e97d9d53fb31a9751de5a3f1898b16b.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178565

From: Poonam <Poonam.Jadhav@kpit.com>

Add direct dependency of below native python3 modules
to fix the compile issue 

python3-semantic-version-native
python3-setuptools-native
python3-setuptools-scm-native
python3-toml-native
python3-typing-extensions-native
python3-wheel-native

This issue is not seen in the upstream yocto but in the project,
where the python modules are not built by any other dependency.
They have to be explicitly pulled.

This fixes below error:

  File "<path to file>/python3-setuptools-rust-native/1.1.2-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config.py", line 422, in _parse_attr
    module = importlib.import_module(module_name)
  File "<path to file>/python3-setuptools-rust-native/1.1.2-r0/recipe-sysroot-native/usr/lib/python3.10/importlib/__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1006, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 688, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 883, in exec_module
  File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
  File "<path to file>/python3-setuptools-rust-native/1.1.2-r0/setuptools-rust-1.1.2/setuptools_rust/__init__.py", line 1, in <module>
    from .build import build_rust
  File "<path to file>/python3-setuptools-rust-native/1.1.2-r0/setuptools-rust-1.1.2/setuptools_rust/build.py", line 23, in <module>
    from typing_extensions import Literal
ModuleNotFoundError: No module named 'typing_extensions'

Signed-off-by: Poonam Jadhav <Poonam.Jadhav@kpit.com>
Signed-off-by: Poonam Jadhav <ppjadhav456@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3-setuptools-rust-native_1.1.2.bb            | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
index 8ec9a86f00..c11116a1f4 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
@@ -14,9 +14,7 @@ SRC_URI[sha256sum] = "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a
 
 inherit cargo pypi python_setuptools_build_meta native
 
-DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
-
-RDEPENDS:${PN}:class-native += " \
+DEPENDS += " \
     python3-semantic-version-native \
     python3-setuptools-native \
     python3-setuptools-scm-native \
-- 
2.34.1


