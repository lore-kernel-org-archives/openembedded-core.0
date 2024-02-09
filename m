Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7064AC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 02:19:53 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.2394.1707445191956631333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 18:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HuIciZTR;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2909a632e40so365671a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 18:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707445191; x=1708049991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxACuSRTkcNEneBsaS+apEhLsT697LvMKWxT4yUUJk8=;
        b=HuIciZTRlfXkCKtVpY81j4J8/ISbnHlO1kC9sLOAfR6G/RebKp2JzoxdAdMAH5OlWS
         o6ouFd5kdSdCJLN9YPLZBcNGGn1prTc6Dv1TZs6+nkxcWny83+aQW5oI87uCR5KZVTOb
         KiMnp+UjjTdsSAylJwWkf2L02uFc806FavEyk9k28l2bjPW0gtVShgoKTqzRgRrwtE9D
         a66gfj4P7ZJQGbrluPzRUHd7flicu7Kiiz45xiYrfk9JCDpk/W99/l0yRrYVwNiLyKBY
         X58LQ8646tgZz5HcZefjV14hRnCWEQeSIsm5Lo1I5bZZ4FYiqblm6llrZRyzkGZWdrMB
         d1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707445191; x=1708049991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxACuSRTkcNEneBsaS+apEhLsT697LvMKWxT4yUUJk8=;
        b=nicUpFFanqIn9W42kt7S8NIM04EjiOhAou96fHWxdRrVscNCt96HMQyrzG8M+Au2is
         0d+Zlc/Mi7NDu8zehrVhRBZQd9AL+X7i2sZNCm3XQCSK2euSKwLlkHYv7ECxVfeYUmXx
         MGKr1+MVijYBsN6T+6NdvnGu5DjMSwbF8uD1M5tJBkrM+IGVbvElmDYC4Lb1LF1rImtU
         QGse4+31HYm0B1h9xXWXf8gN/1q9G2mbAPRkLWG6t8StAuo+xBaKXkoPaWbrVuVuThW+
         j9NCpAgjZuFToSGGNNPyNtL2O2L3S180wesyYLCeREUmvRcQtp4cFUq0OVsnGFnXkp3E
         x5UA==
X-Gm-Message-State: AOJu0YxcRu1hcg1m2zQ8wtADZuJvl1ksbQ3uJYILdeC1X+CzKLyuI/IK
	GxXKx8dcLQevlxnAb1+bjZJ5AJaXff8wLV806cexEZEz/3RvuRB3+UkTnNjj
X-Google-Smtp-Source: AGHT+IGEHQRFyX0Svz7QNEXR7JBpY7DKXeXQtrgVF6t6sgcKF6QxFXDDKboxHCjka0ARUOHcvio7qQ==
X-Received: by 2002:a17:90b:d83:b0:295:fb59:5a6d with SMTP id bg3-20020a17090b0d8300b00295fb595a6dmr250758pjb.22.1707445191075;
        Thu, 08 Feb 2024 18:19:51 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:8cbe:e895:b511:86c6])
        by smtp.gmail.com with ESMTPSA id ft10-20020a17090b0f8a00b00296a6175fc5sm498490pjb.36.2024.02.08.18.19.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 18:19:50 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-pyyaml: add PACKAGECONFIG for libyaml
Date: Thu,  8 Feb 2024 18:18:56 -0800
Message-Id: <788a989e8ec584cfffcb2b505972c43b2205a8ad.1707444824.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707444824.git.tim.orling@konsulko.com>
References: <cover.1707444824.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 02:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195185

For some time now, we have probably been susceptible to host contamination
or at least non-deterministic behavior when libyaml was available in the
build environment.

The symptom is:
ERROR: python3-pyyaml-6.0-r0 do_package_qa: QA Issue:
/usr/lib/python3.11/site-packages/yaml/_yaml.cpython-311-aarch64-linux-gnu.so
contained in package python3-pyyaml requires libyaml-0.so.2()(64bit), but no
providers found in RDEPENDS:python3-pyyaml? [file-rdeps]

From the documentation:
"""
By default, the setup.py script checks whether LibYAML is installed and
if so, builds and installs LibYAML bindings. To skip the check and force
installation of LibYAML bindings, use the option --with-libyaml:
python setup.py --with-libyaml install

To disable the check and skip building and installing LibYAML bindings,
use --without-libyaml:
python setup.py --without-libyaml install
"""

Instead of leaving this to chance, add PACKAGECONFIG and by default build
with the faster libyaml bindings.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
index 61f7cbc6b36..102e2f2498b 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
@@ -12,6 +12,9 @@ inherit pypi python_setuptools_build_meta
 SRC_URI += "file://0001-Fix-builds-with-Cython-3.patch"
 SRC_URI[sha256sum] = "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
 
+PACKAGECONFIG ?= "libyaml"
+PACKAGECONFIG[libyaml] = "--with-libyaml,--without-libyaml,libyaml"
+
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-netclient \
-- 
2.34.1


