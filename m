Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37AFC433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 13:22:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.9849.1652188942940184159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 06:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WzR6UtB1;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id v12so23761852wrv.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fnln3vDDNhxjL3daQ79azPmkDNwxW0duBUNkvNsrKU8=;
        b=WzR6UtB1IzfLD3VDY5sDy3TItza4uwim5lEX1ydi6uLrvMKTnYvHKvw9eKb1mJjhOP
         xWQo8gyNh+idzfhdvygzEpK6IXUE8M/yj2TaUjnnNpepLMA1YX3g3ieFO3wuEhzmHkiE
         ewGBEAj/ZYcKlAswa9k/cYt4/pox5SJVJODUeZzTcTMO5W9lqEL9jBKbeSRpT2D49A9q
         ErrCSdm0/EXnE8JcWihDo5+Q9ZmsXua7mjc2RcFde05DdXEqyjLAvdOqgt+RCRCOgaIi
         FqsDoV38AycILn3+3lzBel0i94iAPQUeiXFLpe78gVfX/NRXWovMkAEPX3xTb7SakGFM
         ViXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fnln3vDDNhxjL3daQ79azPmkDNwxW0duBUNkvNsrKU8=;
        b=hSPG2+eWBcOKghi30SKY4Cq1hviAFr/K3ZUNzB0syOpJwBOgIZSOcKxUH/qumsyA3v
         vYraXIIXnt0hwnZkMAm9aqVJaG8Ovpr7tynXnGlMaMSWyLGfgiC2Yorjnmt8MuM9f6sK
         fnKg+NW4TuAcEFcYMEZ3PC8d5+ua2cgTqbNKJADsq+xzqybU8Ppd3BMuVk5PNLIhacwB
         9n3h3N4vIGiZChvRSVLW7C/zoXJ/rOKv9q3RbMR7IvfzOQgySYT8T5svqYAJINwbVXCj
         SAyXwWZR/jpR0Sl/hR0SqI6WHIiIUrxgIZOZXlRliyaPNraQJauUfRI63aXEtNSZwQPY
         ZXXQ==
X-Gm-Message-State: AOAM5312O1zcP/gABO0tbKRKS/BoSVAXQua0D02THKm8W1FzbVZpLBAD
	1JwuyirzXIJNUCOHqHg1naTliymaA5k=
X-Google-Smtp-Source: 
 ABdhPJyeW3+UURBGLETAmlHC4H2JS04AUXZCKy6oxB8mZbXZmyrzGHfboAOdU0L7Kbirz/wVpKuz3w==
X-Received: by 2002:adf:9dcc:0:b0:20a:ed44:fd48 with SMTP id
 q12-20020adf9dcc000000b0020aed44fd48mr18580190wre.120.1652188941274;
        Tue, 10 May 2022 06:22:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 s25-20020a1cf219000000b003942a244f42sm2974602wmc.27.2022.05.10.06.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 06:22:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	dp.min@lge.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [dunfell][PATCH] busybox: fix CVE-2022-28391
Date: Tue, 10 May 2022 15:21:48 +0200
Message-Id: <20220510132148.437121-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 13:22:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165416

From: Steve Sakoman <steve@sakoman.com>

BusyBox through 1.35.0 allows remote attackers to execute arbitrary code
if netstat is used to print a DNS PTR record's value to a VT compatible
terminal. Alternatively, the attacker could choose to change the terminal's colors.

https://nvd.nist.gov/vuln/detail/CVE-2022-28391

Backported from kirkstone 3e17df4cd17c132dc7732ebd3d1c80c81c85bcc4.
2nd patch adjusted to apply on 1.31.1.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...tr-ensure-only-printable-characters-.patch | 38 +++++++++++
 ...e-all-printed-strings-with-printable.patch | 64 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  2 +
 3 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch b/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
new file mode 100644
index 0000000000..18bf5f19e4
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
@@ -0,0 +1,38 @@
+From c7e181fdf58c392e06ab805e2c044c3e57d5445a Mon Sep 17 00:00:00 2001
+From: Ariadne Conill <ariadne@dereferenced.org>
+Date: Sun, 3 Apr 2022 12:14:33 +0000
+Subject: [PATCH] libbb: sockaddr2str: ensure only printable characters are
+ returned for the hostname part
+
+CVE: CVE-2022-28391
+Upstream-Status: Pending
+Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+ libbb/xconnect.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libbb/xconnect.c b/libbb/xconnect.c
+index eb2871cb1..b5520bb21 100644
+--- a/libbb/xconnect.c
++++ b/libbb/xconnect.c
+@@ -501,8 +501,9 @@ static char* FAST_FUNC sockaddr2str(const struct sockaddr *sa, int flags)
+ 	);
+ 	if (rc)
+ 		return NULL;
++	/* ensure host contains only printable characters */
+ 	if (flags & IGNORE_PORT)
+-		return xstrdup(host);
++		return xstrdup(printable_string(host));
+ #if ENABLE_FEATURE_IPV6
+ 	if (sa->sa_family == AF_INET6) {
+ 		if (strchr(host, ':')) /* heh, it's not a resolved hostname */
+@@ -513,7 +514,7 @@ static char* FAST_FUNC sockaddr2str(const struct sockaddr *sa, int flags)
+ #endif
+ 	/* For now we don't support anything else, so it has to be INET */
+ 	/*if (sa->sa_family == AF_INET)*/
+-		return xasprintf("%s:%s", host, serv);
++		return xasprintf("%s:%s", printable_string(host), serv);
+ 	/*return xstrdup(host);*/
+ }
+ 
diff --git a/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch b/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
new file mode 100644
index 0000000000..2c9da33a51
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
@@ -0,0 +1,64 @@
+From f8ad7c331b25ba90fd296b37c443b4114cb196e2 Mon Sep 17 00:00:00 2001
+From: Ariadne Conill <ariadne@dereferenced.org>
+Date: Sun, 3 Apr 2022 12:16:45 +0000
+Subject: [PATCH] nslookup: sanitize all printed strings with printable_string
+
+Otherwise, terminal sequences can be injected, which enables various terminal injection
+attacks from DNS results.
+
+MJ: One chunk wasn't applicable on 1.31.1 version, because parsing of
+SRV records was added only in newer 1.32.0 with:
+  commit 6b4960155e94076bf25518e4e268a7a5f849308e
+  Author: Jo-Philipp Wich <jo@mein.io>
+  Date:   Thu Jun 27 17:27:29 2019 +0200
+
+    nslookup: implement support for SRV records
+
+CVE: CVE-2022-28391
+Upstream-Status: Pending
+Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+ networking/nslookup.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/networking/nslookup.c b/networking/nslookup.c
+index 24e09d4f0..89b9c8a13 100644
+--- a/networking/nslookup.c
++++ b/networking/nslookup.c
+@@ -404,7 +404,7 @@ static int parse_reply(const unsigned char *msg, size_t len)
+ 				//printf("Unable to uncompress domain: %s\n", strerror(errno));
+ 				return -1;
+ 			}
+-			printf(format, ns_rr_name(rr), dname);
++			printf(format, ns_rr_name(rr), printable_string(dname));
+ 			break;
+ 
+ 		case ns_t_mx:
+@@ -419,7 +419,7 @@ static int parse_reply(const unsigned char *msg, size_t len)
+ 				//printf("Cannot uncompress MX domain: %s\n", strerror(errno));
+ 				return -1;
+ 			}
+-			printf("%s\tmail exchanger = %d %s\n", ns_rr_name(rr), n, dname);
++			printf("%s\tmail exchanger = %d %s\n", ns_rr_name(rr), n, printable_string(dname));
+ 			break;
+ 
+ 		case ns_t_txt:
+@@ -431,7 +431,7 @@ static int parse_reply(const unsigned char *msg, size_t len)
+ 			if (n > 0) {
+ 				memset(dname, 0, sizeof(dname));
+ 				memcpy(dname, ns_rr_rdata(rr) + 1, n);
+-				printf("%s\ttext = \"%s\"\n", ns_rr_name(rr), dname);
++				printf("%s\ttext = \"%s\"\n", ns_rr_name(rr), printable_string(dname));
+ 			}
+ 			break;
+ 
+@@ -461,7 +461,7 @@ static int parse_reply(const unsigned char *msg, size_t len)
+ 				return -1;
+ 			}
+ 
+-			printf("\tmail addr = %s\n", dname);
++			printf("\tmail addr = %s\n", printable_string(dname));
+ 			cp += n;
+ 
+ 			printf("\tserial = %lu\n", ns_get32(cp));
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 38b448b3e1..d062f0f7dd 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -55,6 +55,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2021-42374.patch \
            file://CVE-2021-42376.patch \
            file://CVE-2021-423xx-awk.patch \
+           file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
+           file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.35.1


