Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.17633.1590940430418766294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p2Y7mSWU;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id f7so6867695ejq.6
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xih88o4F2Z2HSMsenMCkMhgWv5zCgtWnce3fATM9B4g=;
        b=p2Y7mSWUdv/bsJmgpjhI3e2Enk4utBlJ01avtq4bnqaA/G9TkqNQQaqtqZGSAI+hpW
         BfALcPv5mQEf3UaKenwEh0b9QEuFVAlCnVILT0iCjelTv2hzq2GDfW2S28Op7y6WyQfB
         gj2NRhYE+IVt6UyN7s6i0OTJMBHLmwwKCqRIaqHoUci/AQN8tHi5hqGunITZsKU1UNy4
         h+1Pak515ySuBd5btTQKTMpqMg6RMwdNOs+m2rsiEDAeqZMJDOAz1vLPAe/Ctm2l6pi9
         EPbP83JMDc2BluvAn4Q8SiE1aV5pp3C4jbzh/iGxAptNPKLoIpfpDZg3lwG9syxZ+UHr
         w3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xih88o4F2Z2HSMsenMCkMhgWv5zCgtWnce3fATM9B4g=;
        b=NpMPCBI+bLiSYRsmGTC0v9N6oU+lz/q3A8M8+k4j92sNGWaUgcVCqOaOAdFRxpALTP
         0fryhgHb1KeiSDpN1FrbPZQnqLn5n8dAtQi3bdv3rZ0W4YzKVaBx0+1QSKftUda4sTWT
         LnBgiD2wLDw5EwcWbYb9tmB07ZIA4wn+mMtTNjctn3x9aJzFW/EXoOBiE/R0avrd8QKB
         DIrwfW5cMbmOO/Iuke9j9yDbAr9ZV81j/5cx7i/Zk8AX8Z9xBvrBgxSBmMPxpnf8jrgU
         A9GaAYpzyjOwxnqZUZwyb8fil+eugWMovDi66PzWjO7mNt6P44Ct88Dh5vDRgcYITolc
         Iykg==
X-Gm-Message-State: AOAM532Ig1w9189bBVWz6GupAg6sqxyV6cFYOVnoaiZTw4nOJ0dSRQeX
	KHiFewtWBfE90joSdnPSw3/252b8
X-Google-Smtp-Source: ABdhPJyer+YqRk2RVzOYKwmV8rlpaRutF8W1ehfqEVsezbzJFzaRBws8LW5TVkVXA3RxUj2ZxyvqKQ==
X-Received: by 2002:a17:906:e08a:: with SMTP id gh10mr16735752ejb.512.1590940428845;
        Sun, 31 May 2020 08:53:48 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:48 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/70] stress-ng: mark as incompatible with musl
Date: Sun, 31 May 2020 17:52:09 +0200
Message-Id: <20200531155254.10283-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer versions make use of ustat() which is absent in musl.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
index ba93efc4c8..45f4bb41ad 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
@@ -22,3 +22,5 @@ inherit bash-completion
 do_install() {
     oe_runmake DESTDIR=${D} install
 }
+
+COMPATIBLE_HOST_libc-musl = 'null'
-- 
2.26.2

