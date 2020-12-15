Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web09.8474.1608022202486330908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 00:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uCvX7nrZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id c12so14289257pgm.4
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 00:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R3gTcfHvOlENQuFapn1pabC1LpF/0yJnNqlYfPU6Sn8=;
        b=uCvX7nrZbnOewzvVEiU2TSrz9oKd2N8l8r0sjFIS4WUWCyLTdCcBh0MScBoucB+jUi
         xHqp61xJn05BDXdNWy4s0qRIjKjsnBnyvux6Vg8BfSMEsrNro0nioCKbn12XUdEvlsoS
         oCKkxIebB7c8PmEDT/QAj0WfOkyBE//VwmdqEQOEqNjRCx4XxRpMDEWPpTbJqoH7jK4K
         uOFKHYelxM+n2PT0PVkhaIcSVy/K5bTuXQs0k1OTe2W6I33STKptKZfckbWsxwPEUKEL
         KHpCF3jHOEitqLBF4kkvOKFc2YRxotEQjDnr9ZurJ/iKkpA8ezYLBRepv/mYp7JQeRIs
         ZxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R3gTcfHvOlENQuFapn1pabC1LpF/0yJnNqlYfPU6Sn8=;
        b=KzUUql7DEnGKx7p3vTQ5xwBid835GjoVElMthYqntXyLg6v/Yi69DpO/tx49t2wnu3
         acQxmIxL1X+QisM9PHtyXoAH0SlM/6AtjDlh9FNlOZ1SG/LyhF1ZCLmRJA53AS8lVwJ1
         GPfFkZGKXqjeXBu6YRSFXsTA+i6qwOPuBQRDjbG4O+HEk6+RzkUZXZzMuCYaFISwLgdz
         Al6S70gtD0N6RJAjCk+AfV8E0iwg4xOwTl59WsrqbPLHl4mKar2no61bU168H2mrqvjY
         NaVcLljirjUOwiXPk+ZmBboSUFpqmZEY7v235N50lmpMF/jSajjFqm+Vmhpbb9wPYtca
         +w7w==
X-Gm-Message-State: AOAM531fpPK/Th3y/azyPe4CeZr1np2aL7h2bGfY1IzwKt5ukBkHux1F
	051UB8ThrvtMX8Dgg7EdDwwZuVqccqWOhg==
X-Google-Smtp-Source: ABdhPJyMpG8Wb8nUnF0c/OqKRb1xZrkew8ETtF9jlMtokF8OSU0Yedvu3eZWr7YrHwuPUsG2Bf2yVA==
X-Received: by 2002:a62:7857:0:b029:19d:fe6a:3069 with SMTP id t84-20020a6278570000b029019dfe6a3069mr27497268pfc.3.1608022201543;
        Tue, 15 Dec 2020 00:50:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id y4sm15669712pgr.41.2020.12.15.00.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 00:50:01 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] go.bbclass: Use external linker for native packages
Date: Tue, 15 Dec 2020 00:49:56 -0800
Message-Id: <20201215084956.2490265-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

go 1.15 has reworked internal linker, which has resulted in regressions
in OE where native binaries generated using internal linker in some
cases result in corruption during populate_sysroot e.g. glide-native
crashing when used after relocation.

This improved reliability of native binaries working especially when
they use cgo or pie build modes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/go.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index a9e31b50ea..5b26378a4e 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -40,6 +40,7 @@ GO_RPATH_LINK_class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pk
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
 GO_LINKMODE ?= ""
 GO_LINKMODE_class-nativesdk = "--linkmode=external"
+GO_LINKMODE_class-native = "--linkmode=external"
 GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
-- 
2.29.2

