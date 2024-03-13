Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AB4C54E68
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 21:49:09 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.8413.1710366543576025612
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 14:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RrDqzCth;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e6b5aa0b52so333470b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710366543; x=1710971343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGda8R+JB0CT20aMqoq3pbGuVVwit8KQz1dE5RTyw0U=;
        b=RrDqzCthUYkc4Ax49Ju9M5oV++Kbji1jxGBgJdGw/FC6cjBrRAwQmHCPzJ/9jrlS+/
         hL2IlgdMcF2H0p6Tfu/0G+XRVIdcVTog8xF79knMIN8+NZ+FJP0XMNKCtI0F5ObONhzV
         TYrM/+j3vISs4x9YgUpKCVJMLXbniQCBjsfq73BY92+E551RHmn62Ov5+MF+gyU8260t
         Lm4RfL0I8KbvFgRMa50vd7t5Pf2mHFB2LGgOI3xyx8QDmd6gyKLsUvzsIY1lf+YJo6jw
         vqZPGvZMi1N83QD1c0nryNOLzriYpGm7Y1lbu3XvrM/2jyt5gZIIDMMeVNNk8hxjBx0I
         Gztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366543; x=1710971343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGda8R+JB0CT20aMqoq3pbGuVVwit8KQz1dE5RTyw0U=;
        b=ZKBoYgo5wQjm+NsVoin9LGJejrHBpSupinWBfvsHDMDsztQKdMH16XVJ+fwVT2q//+
         B9U/XayHn1hJigZsNoEJdnj1A1svJEr3wFp71W3AanV8kU8PSsiM8xjkvbYvde1/9D1B
         Ca5shX7O5C2t8uqnttU0JhAOPcOBy+EME+gCHbIzqC2reB210E0MngyRuRYOF8AQdvkB
         9t0n2L+nTu63kC/dTI8grFxGkn1xMqSQf42UXdX8ORk+EcRGfMJpf92t26Y+jMBNfNCV
         7L/I1+rsZ/2rwLZtZHkfjH+ati+aZVgjh5zrB2NHI21oi/oL4Tek3XMf23A6n3sHuAG5
         8HVw==
X-Gm-Message-State: AOJu0YyHgTbgomB3JQ/ccJUb7RzJR7WKRJ4wmLROLb5gMicnUdrtWdbe
	IYTIqzp1Z7JZYAc4u23q+K3JYqYCBL00e7qNkWTJcZlKi7YI6UzJzjOOEIxu1NsxTGAOAOhwqGk
	rJmM=
X-Google-Smtp-Source: AGHT+IGC+J3N+6oxBk9uU1LFSsjKlTwc/hTSRpgIMPTTKhbaJZf2kjsZRJYsZDJFqB8m062fu4ipAQ==
X-Received: by 2002:a05:6a20:3c87:b0:1a3:3382:5106 with SMTP id b7-20020a056a203c8700b001a333825106mr256443pzj.15.1710366542911;
        Wed, 13 Mar 2024 14:49:02 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id it17-20020a056a00459100b006e6b2beb030sm87226pfb.48.2024.03.13.14.49.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:49:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 7/7] gnutls: Upgrade 3.8.2 -> 3.8.3
Date: Wed, 13 Mar 2024 11:48:45 -1000
Message-Id: <f40a53370eac89df38b2fab47c411a61d4df4fc0.1710366394.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710366394.git.steve@sakoman.com>
References: <cover.1710366394.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 21:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197091

From: Simone Weiß <simone.p.weiss@posteo.com>

Upgrade version to adress recent CVE findings.

Changelog
=========
** libgnutls: Fix more timing side-channel inside RSA-PSK key exchange
   [GNUTLS-SA-2024-01-14, CVSS: medium] [CVE-2024-0553]

** libgnutls: Fix assertion failure when verifying a certificate chain with a
   cycle of cross signatures
   [GNUTLS-SA-2024-01-09, CVSS: medium] [CVE-2024-0567]

** libgnutls: Fix regression in handling Ed25519 keys stored in PKCS#11 token
   certtool was unable to handle Ed25519 keys generated on PKCS#11
   with pkcs11-tool (OpenSC). This is a regression introduced in 3.8.2.

(cherry-pick from Oe-Core rev 705d2972b38efc9f331e3635c07ca92f8812b365)

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-support/gnutls/{gnutls_3.8.2.bb => gnutls_3.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.2.bb => gnutls_3.8.3.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.2.bb b/meta/recipes-support/gnutls/gnutls_3.8.3.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.2.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.3.bb
index 43fb5c4c4e..27d6753be0 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.2.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.3.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "e765e5016ffa9b9dd243e363a0460d577074444ee2491267db2e96c9c2adef77"
+SRC_URI[sha256sum] = "f74fc5954b27d4ec6dfbb11dea987888b5b124289a3703afcada0ee520f4173e"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.34.1


