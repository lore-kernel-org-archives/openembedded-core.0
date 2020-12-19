Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.10488.1608392727725254933
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 07:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZTsqnlft;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id e25so6404170wme.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 07:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=elg2LrMSkgVUA9tN3XBm2kWsJmNBBARd7E8KkzF1L3I=;
        b=ZTsqnlftOFpO5EUk+PWmpc/MQe5r4VlW+G44VuWjRVva57VM3gZVgyHPgBK1RusGp0
         XDIDHFZWaUa0NachA+IiuFXySkCJuIWKmDSSSztgtkoZdQkcW783wWaDE5WqCfUP3nMX
         NpNQCSM7nnbSmDNqgC0D1OCOCiuEK4DDaoad4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=elg2LrMSkgVUA9tN3XBm2kWsJmNBBARd7E8KkzF1L3I=;
        b=T29Xqa96hht6IKhp5oRhL4f4gA+5N3gNZkLZ3xk2EUMAX7bVywUUq8B0itwIqFHp+V
         9VyU/Ki7SZiZJSMLkj3tS2uXv5t9mwbpdngQH4BGxXSMCP0XXyRJloEerLsmDEDBTsco
         C+MWSqxYG82WO4cqJrk+rPiQd+uPBRkDdt2UQQQ4vBy9VGypfpp4xO396c28HRK61yYz
         ZyiHUvtDLwzxM/W+KawCnBObSfnrWsspbU81GBJQ9/qMOOgZMNurh2xR6zOjKPLZ3Dzg
         ywTitWJwifYEqicEEyar+ri8M/iPdrbgXj+toxtk27QEmxbGiZoRMBkYMyIYEgepTQEZ
         cUkw==
X-Gm-Message-State: AOAM530n1f8gaQg7KTeAevfYsy/hI7EuQCa2/9Y7Mm7gohk1PVqMxokA
	thVZtEB//PhCAt2B5yk0ZwWOYJyQ3DCn3Q==
X-Google-Smtp-Source: ABdhPJzr1TD9L/f2w+cAS73Cjq6oF/6xDHO1NPYvqEldseuMYtvAWZ5nv3Kl3uchZBFKMgSeGspUOw==
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr8568741wmc.40.1608392725901;
        Sat, 19 Dec 2020 07:45:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id z15sm19853015wrv.67.2020.12.19.07.45.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 07:45:25 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] systemd: Ensure uid/gid ranges are set deterministically
Date: Sat, 19 Dec 2020 15:45:23 +0000
Message-Id: <20201219154525.3995389-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

meson.build will fall back to greping /etc/login.defs for values of these
if they're not set. Different distros set them (Centos 7/8 does, Ubuntu
does not) so output was not deterministic. Avoid this by setting to the
default values. We now match the vaules from login.defs from shadow.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_247.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-core/systemd/systemd_247.2.bb
index 15f8cb3d718..5eea78eff35 100644
--- a/meta/recipes-core/systemd/systemd_247.2.bb
+++ b/meta/recipes-core/systemd/systemd_247.2.bb
@@ -213,6 +213,10 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Drootprefix=${rootprefix} \
                   -Ddefault-locale=C \
                   -Dmode=release \
+                  -Dsystem-alloc-uid-min=101 \
+                  -Dsystem-uid-max=999 \
+                  -Dsystem-alloc-gid-min=101 \
+                  -Dsystem-gid-max=999 \
                   "
 
 # Hardcode target binary paths to avoid using paths from sysroot
-- 
2.25.1

