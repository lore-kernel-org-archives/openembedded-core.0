Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.67520.1629364936614602769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 02:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iJBhzVYS;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: o.kranz.88@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id x10so7987746wrt.8
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 02:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S9yWCyONGQ+2QKrc8E65j2yK4nODsdoJru/6hDbERu8=;
        b=iJBhzVYSpiS0vA6iXkHmhZhsphWswcceFQLhcjkFXTA34twrNkIH0+nGO4MECIbHHH
         oBPyPz/iya2/bcl+w18dQEDi9nZl8kh9DoxdzZPaDQBs9CYvK08g7zmKR2s23iCBVFfR
         nmEIPY1JOY4EmGe0Qc3DIH4Zch7QgYJasau1HB9faKo8A88Gr4etdJfCUKxLe7ktu9n8
         NwL7u8LBqMtacotZSrW/R4AoodC1VCXPXMa0ntXyn2X+Qt5lExeNOSbdE5TibFFJc8HH
         Pt4x6/jPKPloY/uATClx9YVUwMjKSOSmOVnk/7zL6sL9kmcu0psWMIfP5q7X9nRnW5/G
         XRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S9yWCyONGQ+2QKrc8E65j2yK4nODsdoJru/6hDbERu8=;
        b=lvo4ox361w9PJnuN627W5mN4/CsjoL/625GveAQPJNNUBmDDKCNiubHhhRYce8VbUc
         K4zp2wsXwODFuT67FwdPM7FwsWStW0OF8t2uBMTYck3CLQGEnYRZoaHGYGggBJcOGF0J
         cGgC0DLHRs+9gDaNwslf5aCOl/uiI8xGW9YGnY2OY0g2Fv/1vC9jWExEa++QEtYx7jZ8
         C4G47rJQwOhoGfK/n2wgL/J+f11YBBQgv/mXjDQCFEmzwlRzVxN4NFg4qqK4xxOcB6AQ
         dQWR80AVmmsKWRDk2DpESQ90jvvtEUR5yrJCd8SmLan2j9ztyqrCaicw/rFyTneEoQqb
         3YKw==
X-Gm-Message-State: AOAM530+EVEmr7eAQuj7SJsAGLjvgCm3dQLXBtq5e6H3W8zQFwqc9yRj
	maBhlvVvbPunw/uHUr1q0F2tvEsp2AM=
X-Google-Smtp-Source: ABdhPJxQqJQnjU/DJufrTXmWFOZHl+gKdAnn0OZI7gJO6nDWCBSoQcvhnbE3Oe0fG1cRu1ppCAlkOA==
X-Received: by 2002:adf:f047:: with SMTP id t7mr2581687wro.337.1629364934984;
        Thu, 19 Aug 2021 02:22:14 -0700 (PDT)
Return-Path: <o.kranz.88@gmail.com>
Received: from bigbox.goetting.de (p5de3f170.dip0.t-ipconnect.de. [93.227.241.112])
        by smtp.googlemail.com with ESMTPSA id o34sm7506672wms.10.2021.08.19.02.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 02:22:14 -0700 (PDT)
From: o.kranz.88@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Oliver Kranz <o.kranz.88@gmail.com>
Subject: [PATCH] Allow global override of golang GO_DYNLINK
Date: Thu, 19 Aug 2021 11:22:00 +0200
Message-Id: <20210819092200.486069-1-o.kranz.88@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small golang applications create massive memory overhead if go-runtime
is deployed. So it is helpfull to be able to disable the GO_DYNLINK
option on a per distro/local.conf basis by making it a ?= instead of =.

Signed-off-by: Oliver Kranz <o.kranz.88@gmail.com>
---
 meta/classes/goarch.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 48dc48dabf..92fec16b82 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -32,13 +32,13 @@ BASE_GOARM:armv5 = '5'
 # Go supports dynamic linking on a limited set of architectures.
 # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
 GO_DYNLINK = ""
-GO_DYNLINK:arm = "1"
-GO_DYNLINK:aarch64 = "1"
-GO_DYNLINK:x86 = "1"
-GO_DYNLINK:x86-64 = "1"
-GO_DYNLINK:powerpc64 = "1"
-GO_DYNLINK:powerpc64le = "1"
-GO_DYNLINK:class-native = ""
+GO_DYNLINK:arm ?= "1"
+GO_DYNLINK:aarch64 ?= "1"
+GO_DYNLINK:x86 ?= "1"
+GO_DYNLINK:x86-64 ?= "1"
+GO_DYNLINK:powerpc64 ?= "1"
+GO_DYNLINK:powerpc64le ?= "1"
+GO_DYNLINK:class-native ?= ""
 GO_DYNLINK:class-nativesdk = ""
 
 # define here because everybody inherits this class
-- 
2.32.0

