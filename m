Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6FEC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:05:11 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.27676.1719410710560127334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nZ7QjaQy;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso101739831fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 07:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719410708; x=1720015508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8MyO20STI4HxvjDr2/9gG+/ttO0g1ZmxZRerP2rqpQQ=;
        b=nZ7QjaQyAC67GjBeC+hSliHNdG5BEP/PgIBfm+2XK9iO2wLQufrjExl842+/nG/zdr
         RsDP/AdgM/vodL+QXR2DxzJlmZgF3Ee+nG67zfjmN7aJO+ywMW9pq2AaCiEtyzBMUVTf
         EJQBce8tw3rx7ITtj0EgUItEEP9ijRSByYDxOMCIMYCV1yBqA0tM+TcYV5TJt7n42T3a
         mwrRk/jTq8ZwC6kt+2soZGGlKaxip04LHACBby/aD3vuM27woTmW3XXnjR9j33whKN8v
         A3vGJSqW++ORhlv4KzVWip3WDACuDpbeShbZhzyyDy+iHtAJ/2fIA/NFa/Sg6OKqRiyX
         Y9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410708; x=1720015508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MyO20STI4HxvjDr2/9gG+/ttO0g1ZmxZRerP2rqpQQ=;
        b=DhS6/AkwLwyWr100idXKJaa4pxV8a4PqzxJj+fdpVJ5Vw82cBTofdyQ2elM4EXOagg
         mMPODxhDjDQ+oMNefYh0ZtWlJFhTQdPTSKcak/nbzCS1VCOII/kSOC1qjyQgr0dvpxuc
         Z8kkoPuwA94S1u1HYGBoYJq4zLE7B4tw5OWLSZ5nXsnepepIYNFnzLv36mUUr8k7MO/8
         kb7xW534AZu6NHa+5BM76SHr8SzvqG6Gn6PCTVFHnR1XfcjUD3HLW5PK6CkBveqH9INO
         bFIgpYwQtZxqybAnr1gj0jxSDmP468QaGM6jFk101IWloleJkjTteHESfrDdxMEKXI6q
         lPXg==
X-Gm-Message-State: AOJu0Yx4g8CTa9GVGEWfIcwy9oGevKORpNE2hmO6npNog4j4qAx7/Vav
	oyJZvyE98OWRAppQzLo9eHVwDra4x4ce9YIJtOlE0wGmpzhXlYT+5FUung==
X-Google-Smtp-Source: AGHT+IFZhQKXwCran+aDFimItGP6qxYs6+DgyIiuaiN4xPKozVDzW2GPaeOh58dPghUZrkttnLbAJw==
X-Received: by 2002:a2e:87c8:0:b0:2ec:a022:880c with SMTP id 38308e7fff4ca-2eca022884fmr25558631fa.22.1719410707456;
        Wed, 26 Jun 2024 07:05:07 -0700 (PDT)
Received: from ubuntu-jammy.qtasks.com (178.72-31-62.static.virginmediabusiness.co.uk. [62.31.72.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c823c1a7sm26639535e9.2.2024.06.26.07.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:05:06 -0700 (PDT)
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sreejith Ravi <sreejith.ravi087@gmail.com>
Subject: [PATCH] package.py: Add Requires.private field in process_pkgconfig
Date: Wed, 26 Jun 2024 14:05:00 +0000
Message-Id: <20240626140500.1857-1-sreejith.ravi087@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 14:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201166

Currently, the process_pkgconfig() only handles the "Requires" key
field from the .pc file and ignores the "Requires.private" field while
generating the dev dependency chain. This results in a broken dependency
list and requires the installation of recommended packages to resolve
the build dependencies when using the dev IPKs. This increases the
hard disk space usage and download time and installs many unnecessary
packages as part of the recommendations.

This patch ensures that the "Requires.private" field is also considered
when creating the dependency list for the dev IPKs. With this, the dev
IPK will have the proper dependencies listed, eliminating the need to
install recommended packages to resolve the build time dependencies.

Example: usr/lib/pkgconfig/libical.pc
----------
Libs: -L${libdir} -lical -licalss -licalvcal
Libs.private: -lpthread
Requires.private: icu-i18n
----------
Depends field generated for libical-dev
Depends: glib-2.0-dev, libical (= 3.0.7-r0)
------------

When trying to resolve the build time dependency with libical
package using “-dev” ipk generated, it will throw the below error.
-----------
Package icu-i18n was not found in the pkg-config search path.
Perhaps you should add the directory containing `icu-i18n.pc'
to the PKG_CONFIG_PATH environment variable
Package 'icu-i18n', required by 'libical', not found
-----------

This patch will fix the broken dependency list.

-------
libical-dev depends field generated with this patch
Depends: glib-2.0-dev, icu-dev, libical (= 3.0.7-r0)
-------

Other examples of packages generated with broken dev dependency.

libflac-dev : https://packages.debian.org/sid/libflac-dev
Without patch:
Depends: flac (= 1.3.3-r0), libflac, libflac++
with patch:
Depends: flac (= 1.3.3-r0), libflac, libflac++, libogg-dev

libglib2.0-dev : https://packages.debian.org/buster/libglib2.0-dev
without patch:
Depends: libffi-dev, libglib-2.0-0 (= 1:2.62.6-r0), libpcre-dev
with patch:
Depends: libffi-dev, libglib-2.0-0 (= 1:2.62.6-r0), libpcre-dev,
         util-linux-dev, zlib-dev

Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d1303f32bf..e6b46a0dc5 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1853,7 +1853,7 @@ def process_pkgconfig(pkgfiles, d):
                         if m:
                             hdr = m.group(1)
                             exp = pd.expand(m.group(2))
-                            if hdr == 'Requires':
+                            if hdr == 'Requires' or hdr == 'Requires.private':
                                 pkgconfig_needed[pkg] += exp.replace(',', ' ').split()
                                 continue
                         m = var_re.match(l)
-- 
2.34.1


