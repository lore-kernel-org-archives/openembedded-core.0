Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.3135.1592856154880357891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 13:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l15snGFE;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id a45so267269pje.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VX6q1/W+xxJ3RMG6WUXzgn9MdtA8adP7NSAWZLgjD/0=;
        b=l15snGFEW4+RQoq8m7zsUvd5NPYrDodjiLG+MBqX3drE4o2bq0GmgWyAlxRO+5l0Q5
         9ebnJD0uG9rj43xigvMjr/y7Ct5OnPQXI09AClydjq7SIKZVYhqHnyATKQOXvFdIW8pz
         WXQQiVwfc30VVc/sNATSsT40DlCFvkbwD9FrpVTZBHSHtyaiRIWk5WB+yZ15i+Vs9Ihj
         cq/exMM/JSAF7q9nSZo00IzTwxCMZzewb90KV/VxRgYVgQvZthq4BRDt/gPcz1mubRfQ
         YH9ih8e0KardI5stMcHwZx3puwAGFtmtOy+bPkhxA6ofh+R5UayJfb7OcbNszjdyK9b0
         aguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VX6q1/W+xxJ3RMG6WUXzgn9MdtA8adP7NSAWZLgjD/0=;
        b=NHjk1XKShuCHyxu8BGSPwZCHknYQgWsDfrQorlanlA6SzmBdEiyq8ET25Jsk+SY57a
         Qmvspi3q6CYJuJUt0+Tji5yHl3DV5YXrNxbLZrhCgXyNMbsR7ax7EQvjJqWRxFewg9rh
         W2nc9pqqSarc6I+ZCa+Ip/tc360rw5wbq57aFlGszg5DdlX7pIiJawCjN7cULbLL7D4j
         uZT7Ib/nf0Bu8mP35N0HCSXXYj5KhK5UHY1QPnBt1hOAsWM1zch/2wKlNoMRrGPVImJJ
         RFWPtTT8vjxT7q8eAyzpPb6RNHMagt3Wf+GZfckhX8HUcnnJlkJikhFClq+EBFqhsD8g
         uQ9w==
X-Gm-Message-State: AOAM533xCLPtqG+uR7NimW8lTFNtGplZFeLPIoXrnX+EWsQrmiNK6WDD
	I3bi/oC8BcRPWfnCjhI9J5tyC2z6JSw=
X-Google-Smtp-Source: ABdhPJxBWj7qqejTHDF/RMLWNCHEnU+j/JvyAmkdkZ7DBhgPIU0rgUhaRiURm4XkNdlQY4i6Ki9waQ==
X-Received: by 2002:a17:90a:d3c2:: with SMTP id d2mr18923901pjw.202.1592856154163;
        Mon, 22 Jun 2020 13:02:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id 71sm15007937pfb.20.2020.06.22.13.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 13:02:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/4] go.bbclass: Add `-trimpath` to default build flags
Date: Mon, 22 Jun 2020 13:02:28 -0700
Message-Id: <20200622200230.54899-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622200230.54899-1-raj.khem@gmail.com>
References: <20200622200230.54899-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio.salvador@gmail.com>

The `-trimpath` option is important for reproducible builds so full
build paths and module paths are not embedded.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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

