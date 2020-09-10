Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.20731.1599740691841254340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VQx3HVds;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id w2so5442390wmi.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YXp8a3X5K5qyNbyjM/rv4MZuPXplHr9LAawfOE86f84=;
        b=VQx3HVdsffelQF1zSsU58TtoulFyujyCVm9FVeg9ONcxZv5UebdIZKXnVfg3rAChDm
         xDzX4OXkSbqcdN0QsVtJJKf9lbO4g323U6xtquJcVwF1Hb7Vt6pQGGbq9duuhBN/UY46
         Lb7lQ2QlSGf8F9HPUQptJwhMlNDgBC0H71iCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YXp8a3X5K5qyNbyjM/rv4MZuPXplHr9LAawfOE86f84=;
        b=ImdbqBeuya3kivw8SWit/rzkndeoEsXCFb9s0gSPTk7r3sVRm3ZHbrQ5rcb/ywKpGb
         3feXGf5iWym82csfMJ2qH1MdqktRQxoysdzn2eIG9Bd5yFlEcL0QUNn5EkiWZ1XGky2d
         dHgfu58O4w0CPLycLGBsCbTvoSBpoOJhQeHrS2PGN8bejR+1r5/l6XUZRSXlc3vPnry5
         PVU6fvAymNC/khUWGiEtYbHKDUI6cbMqtMmE89izMQfq9KnwxngF/lh6zlTRUHbLBPOV
         MfXJ7/qeTCm/Zs5/ohhpJxi/ce1waepBiOwSTbv73K/3xckT2puFOvZpeU8CSS7h61m9
         LEfg==
X-Gm-Message-State: AOAM533VTs+H8m4prdoqBiMHV0gB2BxaCEAjOOdU3BvqrTfSdCqdth9r
	oR7tKlXOyRbb4rOljvwzh1LpvTyWFbyILA==
X-Google-Smtp-Source: ABdhPJzxb8NUlEUTN6SnB2q2HXJ4qN+5m8qznnQmDh6f0eicK4GR0XG/BpsnqroRm/5zCddTRO49AQ==
X-Received: by 2002:a7b:c059:: with SMTP id u25mr8179954wmc.103.1599740690152;
        Thu, 10 Sep 2020 05:24:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:49 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH][thud 17/29] buildtools-tarball: export OPENSSL_CONF in environment setup
Date: Thu, 10 Sep 2020 13:24:21 +0100
Message-Id: <20200910122433.2040293-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steve Sakoman <steve@sakoman.com>

The autobuilder has been experiencing SSL: CERTIFICATE_VERIFY_FAILED
errors during error report uploads when using buildtools due to looking
for certs in /opt/poky

(From OE-Core rev: 197f1d5d14b8e57295f5a81c03c86abba5328614)

(From OE-Core rev: 35c6ab2501672083cf8b974d8b9c3daa3202de36)

(From OE-Core rev: 0cb479a5e99289b75e89b2ed5058f33605f15936)

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 95ebda7fa15..aba10b4cd69 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -72,6 +72,7 @@ create_sdk_files_append () {
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
 	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
-- 
2.25.1

