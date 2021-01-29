Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.7463.1611915866188451783
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PUtmRPHo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f54.google.com with SMTP id c2so9925044edr.11
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=G8IBUdjUhDRrJnZR8bWXWT39kpsC1CuIkxYHPK6Woag=;
        b=PUtmRPHoMJkd7wIcFiBjdB2DSvqpuHazDAxNCNSDb1TbtJlX6ZW8BdhKek0ruXF5VS
         BeiipT7kUbWInp36VPGZebgMfaOhC9d5zdcSdpK0x167M6HUzK1PuRMGmIBcY/xZ255m
         1WHokgy9K9tk9pJh0nfjTze0FJr32HCDuSssU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G8IBUdjUhDRrJnZR8bWXWT39kpsC1CuIkxYHPK6Woag=;
        b=k7OtoflovAiJnXUq+rvtgswfdGPe8wGFqK+zK9aCFUs/N88RoTegz2MHLHpA1rqYtU
         8JtlJzuBQSZM/EmtTthiyLyedvNvOIaoFpdhGIPcqGGY2hPbJHhSApwfSrc3P4zNp/tK
         xy1DXLR2ydA/a0H26qAJ/na/czyc60gk68jptRtCr0/GbWjETcBZ4IJZktDdmNk+OGRJ
         9ZteN+dZ2ap9XZXF/ITRMUnirvGIUTVfiBEHJjkQ34OCJI8yuJycg+WLTx0oQgck2Vky
         GDO65b3bKWQC1oaE1DPXT9iG0K+gQzu3uLQrUthhxl6jjS8qStEg3WlE84yALlOrN1Gm
         Q/tg==
X-Gm-Message-State: AOAM5313PMMq3mc9z39Jgn/X/9+/B8NICh3FH7siwiOfo6ZAMH8uhU4F
	mD3ieeROQOivHO12sTPIKiuJcN5btsMNeQ==
X-Google-Smtp-Source: ABdhPJzc7YgpPwNu6YCZG253+sOcmLE8GguOm3a+t+78A5tEVfsrbyvpEReWewWcS+1VhuTI/tecxQ==
X-Received: by 2002:aa7:df86:: with SMTP id b6mr4388136edy.4.1611915864730;
        Fri, 29 Jan 2021 02:24:24 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:24 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/13] pseudo: Update to include passwd and file renaming fixes
Date: Fri, 29 Jan 2021 10:24:14 +0000
Message-Id: <20210129102419.1360572-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pulls in:
  pseudo_client: Ensure renames update open fd file paths
  pseudo_client.c: Rebuild passwd paths after chroot

which should fix issues seen in apt package index creation, new
binutils and other autobuilder race issues in pseudo amongst other
issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 29fa9152e2d..0ba7b503551 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "f9754ac14672c4af19b77bc698a1a808b0828265"
+SRCREV = "8317c0ab172db47dabcef909bae02cd77b1f1010"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.27.0

