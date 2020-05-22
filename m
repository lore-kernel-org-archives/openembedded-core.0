Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.6228.1590114183826484797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 19:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id f13so9433599qkh.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 19:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=th+00qu1gVBstHsz7Uj5/YgrPKsEyoLig6QGdP7HmGo=;
        b=jpPeVheXsX7QQDAIGkkdSNEBh6zRHYmZuj53j90T8lXRGLre6YdHsxjwm2ij69g16J
         jC+7qoHYvB/NUveXRd5KfmNE5KnxUtzAOgxVfbiewaKug55VeBBVGAcMMOxYez54HkXf
         nV25PjFMlxrp1EicZ5Z44kYkeGjJgDP5zlXB6M9XQ4FBq2vgEPWfOljrH/goXRmiJNPQ
         pRujxMQL7L48euDkBqSP2CM99unvVOuJsCL9uv+4+nJw/dSLUBk9wSgS0mt2+GC9hmOA
         7+W8eFT2uuTLPu9ZYflHYrpZlgPPbjpT3Y1U/c7k2vL8pEri1ixJAara5B00TC1Pqd5w
         J2ZA==
X-Gm-Message-State: AOAM533VVl7Ziaf/4ypjX/rA5TuF2kOj0Ibhy/4kbTJls4F/UI1dQQaB
	G5XOYkxrHGkvc5dT8Li+Doi7MhmTOvI=
X-Google-Smtp-Source: ABdhPJzdq1ZX53s4zbe9u6Ry94DWEbRIS8um9kGqcKdTAnxW+0mqt47YJxMfCCPhz0k1yQtO7FOZBg==
X-Received: by 2002:a37:a749:: with SMTP id q70mr12732334qke.68.1590114182769;
        Thu, 21 May 2020 19:23:02 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id z25sm6938375qtj.75.2020.05.21.19.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 19:23:02 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/4] go.bbclass: Add `-trimpath` to default build flags
Date: Thu, 21 May 2020 23:22:37 -0300
Message-Id: <20200522022237.3568393-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522022237.3568393-1-otavio@ossystems.com.br>
References: <20200522022237.3568393-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

The `-trimpath` option is important for reproducible builds so full
build paths and module paths are not embedded.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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
2.26.2

