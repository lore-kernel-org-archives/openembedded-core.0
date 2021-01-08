Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.453.1610086979492327923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 22:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: vomegaz@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id y17so7830863wrr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 22:22:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sS2wIbmmEv88nPHsSZFZgqA/1phNi+625YNwGIfO9Cw=;
        b=aYhBwMiAajhqZlNxtgn5UExEPfnXL4jfA5BGnpPSG462S0CnYVieNMH3inKUTXeZU/
         EXvNaj+P+efVmavey60h7PNlz924cModXXUtb6sf99GOzqYEZP/PTpulI97b9NaTDXos
         pQp8hxkRsRVKttGCL3K9azna4TsoJSMWw75BHQuRe73ygHAg+JlJH6KX7QqxzePvpJNT
         /PkLUDrkClmQYlbPJbCJ980p2ZdH37MMCN4anaLScTa7WzPqf7QZVaRPjiUUU6qq+KeZ
         oGfq/GH5/Qg0rzinD+m24HQaPtfhiYRCnmnWM/1/BYq3eAUSoKcM4Jexsb1gARm+IcK3
         EtMA==
X-Gm-Message-State: AOAM533CO6gy44wpKTExUgtigM+P04F20GmoIagUaRJrjIhOJi8pxlFt
	bTNK7QEYct3/TiCTZJIq53HvG7TmOxIRn3up
X-Google-Smtp-Source: ABdhPJwjWg94DuqCwl4MAgQDOJ7Xn9ddV47nMK9PSpbvHBcW+zH6KkWMf2sXZUpJnb+DDZ4GXiPjEQ==
X-Received: by 2002:adf:a34d:: with SMTP id d13mr2029341wrb.194.1610086977524;
        Thu, 07 Jan 2021 22:22:57 -0800 (PST)
Return-Path: <vomegaz@gmail.com>
Received: from localhost.localdomain ([2a01:e0a:8a5:e0c0:c575:ed36:206c:6670])
        by smtp.gmail.com with ESMTPSA id m17sm13653517wrn.0.2021.01.07.22.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 22:22:56 -0800 (PST)
From: "tperrot" <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] go.bbclass: don't stage test data with sources of dependencies
Date: Fri,  8 Jan 2021 07:22:48 +0100
Message-Id: <20210108062248.2762511-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thomas Perrot <thomas.perrot@bootlin.com>

As for the sources the dependencies contain test data, ELF files and other
binaries which aren't necessary for building and which lead to unnecessary QA
warnings.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/classes/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 5b26378a4e..fa147892b0 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -116,7 +116,8 @@ go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
 	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
-	tar -C ${B} -cf - --exclude-vcs pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
+	tar -C ${B} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' pkg | \
+		tar -C ${D}${libdir}/go --no-same-owner -xf -
 
 	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
 		install -d ${D}${bindir}
-- 
2.29.2

