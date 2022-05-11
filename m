Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4514DC4332F
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:02 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.421.1652293200709727145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sxOT640o;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so5664956pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fyJmf5AcDy/wH+zouhLv+A39jvvuKStVUkIPLoZfqXA=;
        b=sxOT640otc7758kcGuGB1Ox24RzKOohAjsBPfi3U2gTWI+WFH1J3cnSxgzHYGJQLBN
         FSug/deZgVm6oN0mG8FsKYnxhLssZW/wZDT7RHp2zRJJdv7qmRFU5QDpuATO8mS4+oNM
         abtNvXeehz/CxTIQNpBvMoTn460V/B9tsoW4QpanVmP3gjWKk2hH78JMompVwdm8YGLn
         3vdOrhUApYVFCo+Dg5xkO8VHYrsQudFUsjVNXJkGucCSsm1TVLqDZ7wxweDpQhaH+SPT
         t/4DXWW37tGqh+jqxzGnmXisvQKRloV6W2CjT1WNXVdUeZvUZhYzD64p4vvGEzYja1fg
         9oUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fyJmf5AcDy/wH+zouhLv+A39jvvuKStVUkIPLoZfqXA=;
        b=8PLyOCPK+WGB/jFO8hIELvxNIWCi3DVZ0kKWwmPP9bDkAsl6DXVVO0GMFtc1YX5Ji2
         FhCfaI3vbJUwzkNgOeBSEm9PyUMhvueZZcVC3/imouHBVL3y7P4Fszrhdb5Oj4r+lo8C
         cPM9uIOoKwqDP0tM3fdcHswwMvMec/ogvqF5bzqqNECZesdhBePOcVnpONvrMe5Zgl5G
         XSlDsiAKmu7Nf/mjHPSMk2zBczZtszRsm49/eMLuOzqzgOQmL0Bbee2sjMjTpG8lvOYk
         dNe8S4W49wyJKGJYlB3JhvbJRsBxk9Q6HnCPOmcqWs8ZlS6gwwP4CnExF7ykYLCr+iTG
         jHBA==
X-Gm-Message-State: AOAM532fhBjqm3MYn2Ua1H77ckx3y8Ieng8Ifl2+hxuQWX9ZCV/XhwUd
	HiEuD/bLODHlG+f5RHSASlok1F/xvsHYZvIY
X-Google-Smtp-Source: 
 ABdhPJwfdP6HKpwYXMCbTjahoKGhqvdMKTSrHyE1SQpBkhVSJrZzr8uy/KiwFAjQ1iMTCZpag1TnBg==
X-Received: by 2002:a17:902:7891:b0:15e:cae9:7620 with SMTP id
 q17-20020a170902789100b0015ecae97620mr26717303pll.136.1652293199500;
        Wed, 11 May 2022 11:19:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.19.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:19:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/14] busybox: fix CVE-2022-28391
Date: Wed, 11 May 2022 08:19:22 -1000
Message-Id: 
 <0b9cbcc4ceac3938afd1dd6010ce6d9a3da21598.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652292852.git.steve@sakoman.com>
References: <cover.1652292852.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:20:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165509

BusyBox through 1.35.0 allows remote attackers to execute arbitrary code
if netstat is used to print a DNS PTR record's value to a VT compatible
terminal. Alternatively, the attacker could choose to change the terminal's colors.

https://nvd.nist.gov/vuln/detail/CVE-2022-28391

Backported from kirkstone 3e17df4cd17c132dc7732ebd3d1c80c81c85bcc4.
2nd patch adjusted to apply on 1.31.1.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


