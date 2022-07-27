Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85ADC00144
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:36 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.14403.1658882494108520411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ufpYdC29;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so586802pjf.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4J1PLbFU76pBZMpNToaMYGLgE3QnnLfuKTr8k9arutE=;
        b=ufpYdC29Qne/K4L9OHiQn3tZuZXPTmuXOPNgoD6fh0jiH55bLtKjhIINspuCE1xoO5
         EZDnLb7xMA5Kuda3sb1/8xPCd2eNE4z8B8v7UsJ/SCeJ/y2IYuAS1YIf4pX80L77YMc9
         aNo5OKwULC/ui2jhega26jW5SlMKlv/vryzFdOXrmS7yC5FACZ+9EuY14bv+pnwAnZtP
         YH3d+9TmR+1Xyw7ZCeWvwK5WJeSy0gKc9ZDvuzHVXbGE7BzYFTXoDa/qsOCk/pxzJ6Bh
         qMsyJF9trTzVV98MvZOTo5YQsSwBp5szFvQN54lF1dNUjWHu4PQEWma+PPAW2K121x2R
         p/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4J1PLbFU76pBZMpNToaMYGLgE3QnnLfuKTr8k9arutE=;
        b=tWgENkzXjTPKfuKdm6HiJwKVelKdcuop6vgKEzIu0iOaabr8Y2g8Q7YZC0LhJOFgR5
         Hs+8f3h6O0dPyhzmrynfjEVAsOd0TfFEkAgsuhZKeyHsSqLa1xMI7XThnrWnHky8CV5f
         s5xt1eAKOMEEEci4kzYjtzHFvOk0e1jDDogony7kaSb+Ue1ngQWaka4K86LpO2VQvPB+
         hXnx/1oAV2bjbRPoc7/4UlxqyUaWyHfXwIhj/ZFFFgPfmPF89FFs/xlZGLcfTvJ0+/k6
         lKzIY0iHy9yM03yzswQhaCj9DiKU1TukJui8Iy6yb+YIRh9Rl0yQE9AAW+W1xdVDZ0qa
         ruhg==
X-Gm-Message-State: AJIora+hPbOkkPSt5wNxuzZl70oP5PqX23vv6WOSnvHy6Fb/is58BAVm
	847FDgHJqTNaelTgkvvtlCYXQqM3+B/qDag+
X-Google-Smtp-Source: 
 AGRyM1tRIXzV3ng6n6WTQu/tDM8uQwrK6XXR7wHFQI/BY+TTkjg8eOWxaCpB357NVvr+tciuiaVLZA==
X-Received: by 2002:a17:90b:4a91:b0:1f0:64c5:2a04 with SMTP id
 lp17-20020a17090b4a9100b001f064c52a04mr1618035pjb.127.1658882493046;
        Tue, 26 Jul 2022 17:41:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/15] gnupg: upgrade to 2.3.7 to fix
 CVE-2022-34903
Date: Tue, 26 Jul 2022 14:40:38 -1000
Message-Id: 
 <c0c7214f8bdc1942a53f9a86b937eb4977e09452.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168530

From: Yue Tao <yue.tao@windriver.com>

Signed-off-by: Yue Tao <yue.tao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/{gnupg_2.3.6.bb => gnupg_2.3.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.3.6.bb => gnupg_2.3.7.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.6.bb b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.3.6.bb
rename to meta/recipes-support/gnupg/gnupg_2.3.7.bb
index f35eb8c75a..da2b1c4deb 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.6.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "21f7fe2fc5c2f214184ab050977ec7a8e304e58bfae2ab098fec69f8fabda9c1"
+SRC_URI[sha256sum] = "ee163a5fb9ec99ffc1b18e65faef8d086800c5713d15a672ab57d3799da83669"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1


