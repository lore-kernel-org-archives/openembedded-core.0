Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9C6C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 14:13:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.12492.1707487995415817515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 06:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e6AvcTe7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33b0ecb1965so488832f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 06:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707487993; x=1708092793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NkMhXLEfHNCj5+wCvKoxyooy8+E8jQM4T+RCbQgjiys=;
        b=e6AvcTe7keAtw7xGB0PhRJRdzINWcjkaF4eNSQ9PJibjPwUJFIFi/7tFdQflRUCrcR
         /O+SFQNYeW4H5PGUj2JUiyoNBPeXN41X7EFoHozDYo/gWZorsnBozjTD94Ozzw6/EDYX
         I/J2Do4ssB8rEKfVn3BoKWiwUT9HkrEFDqr/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707487993; x=1708092793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NkMhXLEfHNCj5+wCvKoxyooy8+E8jQM4T+RCbQgjiys=;
        b=Gp9NsPJY0sID9UzB6oL0Bj5m9fI9I1Zc3lcmnVWSgjItxvXXrijSLIN4LIyrGfo6Qg
         n377caHDHtdPlIQ1nY/e81UyD/bY7u5npZRs5dL2Q5y+p4OkWmBiFkU9AT7EW43EtdZP
         uSA0YkC2yES+wzoTLYA57zBQ4K536mCTYzvPX1IV6YL5C0c2MP9OkJcdKXED1ZjLqHlD
         MhcP1DohipVN3bKloYkD97x0NQOnYWig50bb5ob2yNzngev3B10ad4E0+DaaltVC9PPv
         w5S7K5k8h2FxYF7SAixix4d8aSMGUOlA5GwMvoFtN8QdQMct/2Ma0HOaIXb+lbts8IHL
         zdeA==
X-Gm-Message-State: AOJu0Yxg+MZNHmEsZzxqTPVHotW17Yqe/m6Uv7PrfkZL1tp3+1wXhqJS
	MGbRVoRALabhAch/ffVZexm8+jLjDcuMmieQ1wsraT/eRFFMXvp6aEhZKN7hFM9+4ajWhB7y/Uh
	A
X-Google-Smtp-Source: AGHT+IHcAI3bGZzNiA/fxFR6MQ/kc1E03XAefYU3us6D6ARlYQ0yYIM4B6vye8AyJx9mhUQmgl7BUw==
X-Received: by 2002:adf:9d89:0:b0:33b:12eb:f09d with SMTP id p9-20020adf9d89000000b0033b12ebf09dmr1420108wre.34.1707487993382;
        Fri, 09 Feb 2024 06:13:13 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:47e1:ee11:154c:e6b3])
        by smtp.gmail.com with ESMTPSA id w5-20020adfcd05000000b0033b1b01e4fcsm1907925wrm.96.2024.02.09.06.13.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 06:13:13 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] shadow: Improve connection to systemd DISTRO_FEATURES
Date: Fri,  9 Feb 2024 14:13:12 +0000
Message-Id: <20240209141312.3397368-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 14:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195216

The logind feature is effectively tied to systemd, rename since it was
just added and make it configured from the main systemd DISTRO_FEATURES
in the target case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/shadow/shadow.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 16b99a0b60e..79df440b1ff 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -64,7 +64,7 @@ PAM_PLUGINS = "libpam-runtime \
                pam-plugin-shells \
                pam-plugin-rootok"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
 PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} libbsd"
 PACKAGECONFIG:class-nativesdk = ""
@@ -74,7 +74,7 @@ PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux libsemanage"
 PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
-PACKAGECONFIG[logind] = "--enable-logind,--disable-logind,systemd"
+PACKAGECONFIG[systemd] = "--enable-logind,--disable-logind,systemd"
 
 RDEPENDS:${PN} = "shadow-securetty \
                   base-passwd \
-- 
2.40.1


