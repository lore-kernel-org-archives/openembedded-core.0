Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A4AC021B3
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 05:08:54 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.82867.1740373732454676599
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Feb 2025 21:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aaDwTcBi;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f2f783e4dso3460046f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 21:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740373730; x=1740978530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PNdilyEGuofQlUUeML3ytnX6RbciKIZiCM355h149+s=;
        b=aaDwTcBij2GSlX8fA3nkJuPaw4Vw+aZOHmcruAZQMF3hrv6KAtgYlZHNPZwAr4R5IB
         6s9gdyyktpHTHIyJYMm6tJKz2jHpqDufkhBBgMMoB9xZgyqHYLdgNzKQ5iFKfimCroQP
         RvAu9NQITvjm1jekBjztljdkE/koYktJWIe9OMBMJOIq1OYu7PbWwzUk8FcTb2/AWj2m
         RgjMDHY3rhiYQx2+3MP7v0joPLoTZOK70pBIT0TzNv3zNO22fR0k3UPi83If87Z+ZajT
         1V974y4Hof87ev/XhU4LpWiVusGwg81pjwmoscl1t77wXGHjrLbEQYuZhK0eibuwiSei
         iiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740373730; x=1740978530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNdilyEGuofQlUUeML3ytnX6RbciKIZiCM355h149+s=;
        b=BA0QV8lpLJVQEpf+FN0hELIZhwVPVAakLB/++pHfkMKxlwqWB5iXEYxDiX2vridSKd
         5cbAZyGBbkAzC6u6a+76aJPG89LYxscSjzqKa5CKDElJ6HpEx60HEBNwPGrVQPwozS8O
         fvJTZafDEALvTMoK/FMjZ4Dc7sfb7Gwb1K6pH/aSPMbPB8fijtpoA22RrG7+MWVuyrHT
         o16fYF9UsAYkUH+kjRE3PA2Qir7VJx92HV/CLQ7KKd/AgqDQwYnbLO4a5wr/KcfEGsKj
         R6IJ0O7WdNiV8VtMhcXE+KmmiEDXqH6aPaBXDrVAxiFyLRx7vK20i9AbIk5xCSDsAc10
         hjtQ==
X-Gm-Message-State: AOJu0Yz7bErYFzD0LOGKXHvno590+f7jTkiyesaKTaZ+7hfkNfzm9M+A
	WZSEbibGzxScpQQLir66USU3VjgIHBFR9SnRyehHbnB4AbB/tITfe5hlxg==
X-Gm-Gg: ASbGncvpVq36UVO9oq88xOWOvX1sY6ZfsMRnm+AvxHy8yQFbkAeVj28bAQeozaAM/xN
	NuISvupscKeIIdANsnOKjhUU0lno7N1gD8+W3KlO9wzRpK2f/dTe9Nwa1jv7iqoE+WeRym3CAMI
	REya6D2MlniXRtI+F36aFTTIncK43zuqqAxtiJW1KrMBW32rh9WkdYCw+SRChe/Qat24vzqdbl3
	iEZ4AqngF/fa+E0PTUZhqLJ+rt/FlBWqxLRs9HgyanZjuoq8+gyDk4uNesc0bAqdWTaHbeIaTLV
	qFr4LARjAtDbX3yeaSQFqVHo4K8rDgixo0qX/+OhTpaM/EaSNvL/Wyd1
X-Google-Smtp-Source: AGHT+IEkN7nyk/aFFjDE39Lk+m+wdmjoEO6ezhiQZt4kQ7BCetDmh07r2nVDmAX0+cKrv3zSmbBShA==
X-Received: by 2002:a05:6000:1a86:b0:38f:39e5:6b5d with SMTP id ffacd0b85a97d-38f6f09f959mr10725371f8f.44.1740373730458;
        Sun, 23 Feb 2025 21:08:50 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccd3bsm30573523f8f.22.2025.02.23.21.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 21:08:50 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] rpm-sequoia-crypto-policy: clean up dependencies
Date: Mon, 24 Feb 2025 06:08:47 +0100
Message-ID: <20250224050848.2216918-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 05:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211837

Rely on host-provided python3, coreutils and make.

openssl-native is not needed either, as the build scripts
use crypto functionality via python.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb              | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 098881e3da..dcc0c7264c 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -5,9 +5,7 @@ LICENSE = "LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-DEPENDS = "coreutils-native openssl-native make-native"
-
-inherit allarch python3native
+inherit allarch
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-- 
2.48.1


