Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.1496.1588648811809127299
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=c0vOAVls;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id s18so392066pgl.12
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4fDfwZyobv2lHEqTcuZABnxydwy8LQ8IEZI1MzWlAOY=;
        b=c0vOAVlsURkVL9Zy4YxDpvs8dF7WxE7n5N8XdlHyCjwxIujrbhyhhmwuG09GmK+UGS
         kwwLbsOUKe9U2p/GpQfbVe4BI0Ha5Nw84wmegXY3LZ1tkGiKp8VyV088n47w0/SC6gob
         qLPxPYJYGbChk920ZWmFzmA8gCqV0WkcCvAZgqz9OSUb9Fpp5PGXuEJaVNaDjTY7+bND
         wOX7xW3jraXLlcWyM3nyVp7BeMp5qgK0rKKE6vK1fPf1BaooSuPjinzHXPEk2eCYoCwe
         WEjzzhDtpQ6pU8fNViqSVIRit0mPDq1ICd7aquETqwECWvje/EWg9fBP9y+bVqwSpI4G
         bSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4fDfwZyobv2lHEqTcuZABnxydwy8LQ8IEZI1MzWlAOY=;
        b=t1caT5il7ONDCtfLPtnNBN4nW0I/QyPCsbUHFEKaw0ATY5wV8TDSkl9kzHls3FmQhu
         iX4SGngE+EQLqhammr1DZEabQaC047M8GAv+mQnZRtDpCU7EqlnnPHo7Kt9GSLcTKjCR
         096z49+1fw6u5PdIaAQYImEXMm1RpRKrXifrIVrsWclN1vR/K4Z04/jYgPHydhTHwaW9
         W/0Wh+x53GMg0DcCs//lMlI3b8hKLyGzCW/1CBc6kNzwzRE3Iw49ao60Mq2vXb6t40Ji
         BHha+vpZ4KdTArNaqDB9RXM9gQ3Nd3p2xZ/be97VtHLYGKB8Mi5abzy1xjLwAI65D6fs
         7Rhw==
X-Gm-Message-State: AGi0PuYQ3xTrcTb7lATpaVN5ZoCh8F2xKuDAWuqhPGo4kQO9/CKIxnzt
	idcdQCA09G79F1YA96Zpn3JmxRpg7uSmBQ==
X-Google-Smtp-Source: APiQypKzRyGAdZqK645NPoCXRwAbd9ewvHZ5HPad+1VbOTr//xjRyaNOuzKaJsM7V5A0hGsBV3Y+Rw==
X-Received: by 2002:aa7:958f:: with SMTP id z15mr1104814pfj.10.1588648810739;
        Mon, 04 May 2020 20:20:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/28] go: Rely on go-runtime to provide needed modules
Date: Mon,  4 May 2020 17:19:00 -1000
Message-Id: <1ace1655f8ae08c07c8875be53b641e7c2564ded.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

go compiler is including go/src/cmd modules in -dev package which is in
conflict with go-runtime-dev which provides exact same copy of this
module along with other runtime modules, as a result when both go-dev and
go-runtime-dev are included in image then it results in rootfs failures,
here lets make go depend on go-runtime and dont install the cmd module
here explicitly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-target.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 316bf6f038..8e44247031 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -34,12 +34,12 @@ do_install() {
 		install -m 0755 $f ${D}${libdir}/go/bin/
 		ln -sf ../${baselib}/go/bin/$name ${D}${bindir}/
 	done
+	rm -rf ${D}${libdir}/go/src
 }
 
 PACKAGES = "${PN} ${PN}-dev"
 FILES_${PN} = "${libdir}/go/bin ${libdir}/go/pkg/tool/${TARGET_GOTUPLE} ${bindir}"
-FILES_${PN}-dev = "${libdir}/go"
-RDEPENDS_${PN}-dev = "perl bash"
+RDEPENDS_${PN} = "go-runtime"
 INSANE_SKIP_${PN} = "ldflags"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.17.1

