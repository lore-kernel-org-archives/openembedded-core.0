Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id D90646B519
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 14:00:01 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id m141so15867189ita.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 07:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mrbQYfAGXCDFpPkn0z3xmR5W8qWq1YpT+cQx0K/wQkc=;
	b=s1BV5xnZSivV195YP7alsEreWnVlAfuRKYxR5glaxe461oQHMEKSUPu+/rohEM/Kds
	xWqNHAbr4Ws/K0DQtSXgKvQB5N7d/X93BpAEgJj6sX5fCsoPQrI+bMtEGk6J3mtOafxN
	gImAQGoErU4w3oamefEmY1FjUCXAYsImOcegYkWZNHJAucXP6ChVrN6kDNDJkd78BxKj
	jmdwwv8/KiMMTcu/gyDxPfA9ZiWBtoMIugmXIHYpTiGpZdqxy3dlFZxFyMcqM1TRP1L3
	p9Lpges5BC9cJrj5aozBLmkrpXAw5ky3uZnz+UJBFdbjU9TXzDIqLZgSE+FWikwdKvHq
	Ow1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mrbQYfAGXCDFpPkn0z3xmR5W8qWq1YpT+cQx0K/wQkc=;
	b=lFfpS2ELqVxDMzb4Fo0PqL3Yg91X3xdKJnJhS8jVlYpPfAgZTZQ8GWeIpjLNNGgs4d
	EplVcXum6E0IDJklql49FawyA1J48gEaWSV7FZh4RhblQJ9r7jmgPHWbgEtIj1683uBI
	VgpnIYY6DTuOqOEz+H3vd3kWeEMGuxNSSNhuz7norzcvYmDphkpbNrXN27P+CAO7QNhE
	6CAaIGqOxYRDn9u/TsA3xUdFvxxIzgi0FBmAzF2h/+EE5J5Q6S87p8YVabxCXnBe133J
	x2fUpXf9oJKtENncSz4xwAoP6n5nz9f8NrpQzHw+YCpKFIyNLelNawsYW752si+wPDTm
	IUig==
X-Gm-Message-State: APjAAAWeQ3FLUGj8Pzwa1yGvZ7RU2Xb8H9DM6mqroDEqC8lnpK+hVwEp
	ogsfmT/36wAmG0QvasKMXbPsZ56s
X-Google-Smtp-Source: APXvYqy6nZkEDt09ZsqdccQ7+dSEFhyeMAx4kmX86UqMgiND8snd2oygKfqdVBeWgb9Yw4eLDACFZg==
X-Received: by 2002:a24:7592:: with SMTP id y140mr7918772itc.47.1559311202474; 
	Fri, 31 May 2019 07:00:02 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	b64sm2543843itd.35.2019.05.31.07.00.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 31 May 2019 07:00:01 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 08:59:53 -0500
Message-Id: <20190531135953.18064-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530184954.2188-1-JPEWhacker@gmail.com>
References: <20190530184954.2188-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] perl: Set build date to SOURCE_DATE_EPOCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 May 2019 14:00:02 -0000
Content-Transfer-Encoding: 8bit

Perl uses an internal #define called PERL_BUILD_DATE as the string for
the date when perl was built. If undefined, it defaults to using
__DATE__ and __TIME__, which is not reproducible. If SOURCE_DATE_EPOCH
is set at do_configure time, use it to generate a reproducible string
for PERL_BUILD_DATE.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/perl-sanity/perl_5.28.2.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
index f175e87a12e..540b9f2df3b 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
@@ -90,6 +90,16 @@ do_configure_class-native() {
     -Ui_xlocale
 }
 
+do_configure_append() {
+    if [ -n "$SOURCE_DATE_EPOCH" ]; then
+        PERL_BUILD_DATE="$(${PYTHON} -c "\
+from datetime import datetime, timezone; \
+print(datetime.fromtimestamp($SOURCE_DATE_EPOCH, timezone.utc).strftime('%a %b %d %H:%M:%S %Y')) \
+            ")"
+        echo "#define PERL_BUILD_DATE \"$PERL_BUILD_DATE\"" >> config.h
+    fi
+}
+
 do_compile() {
     oe_runmake
 }
-- 
2.21.0


