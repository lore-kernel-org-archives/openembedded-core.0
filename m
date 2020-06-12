Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.25380.1591983233622364823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 10:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id g62so7730066qtd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 10:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=Tg4GHcfKQg+HwxKGL+WOaoxgwGy4hWt2jWExDTKIVRg=;
        b=fu97PKbNpwgwwREnoj78esdoCsYOUOejqJWjUemyJruq3umNrSDcBL9YHdZK9OpHdP
         9c2FsQTwzh7jdUh1uNIbWLueqOWSqY86uwCSDIQFydOsRntazpSq5mqH9rDe4GRXrx9o
         I+DzRfax/AszmivC+YLs84sniK2y96GSzmeQfdBo79v+FYTsJ/oaz6D8BRp4S/ARHgZ2
         IvtUHOI1bbsF38gCaeycfqYcbTly600qQYO0ExI5HrozlT+GdfMMMIz3HALwymrqtkcp
         65gprhVpwc05uh6u3RupMwPH5E+ja/notmuNo585Ql+gV2LsedP+ryoPgItOOffv1V5G
         VURg==
X-Gm-Message-State: AOAM533wrUO+AYVsBr+C278A2SECxWhNjz02ReA05UaAmV7UEXaisTBX
	8NSyjBGFScZ+DFbViznNnx5bgEAwL1k=
X-Google-Smtp-Source: ABdhPJws+2N1MZkywRF1BTjpmJyhDip8UH2Lt9QSxf5abRFRV6MsD8bbqBqcKyQHst0pYz+JRH+ozw==
X-Received: by 2002:ac8:1827:: with SMTP id q36mr4214735qtj.78.1591983232585;
        Fri, 12 Jun 2020 10:33:52 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id 78sm4755085qkg.65.2020.06.12.10.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:33:51 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio.salvador@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell-backport PATCH 8/9] go.bbclass: Add `-trimpath` to default build flags
Date: Fri, 12 Jun 2020 14:33:17 -0300
Message-Id: <20200612173318.103232-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612173318.103232-1-otavio@ossystems.com.br>
References: <20200612173318.103232-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio.salvador@gmail.com>

The `-trimpath` option is important for reproducible builds so full
build paths and module paths are not embedded.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e3df027b3697b6a92b417bba8d442a5bd15525fd)
---

 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index c99689ac59..a9e31b50ea 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -41,7 +41,7 @@ GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS
 GO_LINKMODE ?= ""
 GO_LINKMODE_class-nativesdk = "--linkmode=external"
 GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
-export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS}"
+export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
 export GOPTESTFLAGS ?= ""
-- 
2.27.0

