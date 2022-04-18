Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6A8C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 02:46:34 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.388.1650308663429619430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 12:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=x0hqHYE2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id n8so13106556plh.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 12:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Dje4kYmnG+6iDzRCTTy2ep81wQ4P+UUxW25NRtI0w3o=;
        b=x0hqHYE2unk1y7A/DIz6ZUd5s3E/cbC+RLDjsKaxpLUFaORrRBSeIe1vrdQa84kYQC
         hNJPXjhMHh/8D4aaNnlVRiU+9NNZIMEA8PFNkm6NHJzucwC3HZOhx9fu75vJXN1BuPnY
         YqrcTVK1tIuoZesQ0asIs9VdOEdbaa90fpTi2ytI5f/9nrsrHSqSmOG+4lIeojbf0Ioo
         hlJQkZHmLqacehV2GOpf+Gbw2e4InhOVlgSjKoLMZ54MWyH3wfP2CZp1UynbsgeRD6zN
         X3ozU7Nitm3orowdorCoelJ9aiR8BHCTsCJ38btTFCiQMbXr0Hrt3XhK7CS3G1mS1pOJ
         Pl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dje4kYmnG+6iDzRCTTy2ep81wQ4P+UUxW25NRtI0w3o=;
        b=FeUUoiwRCpQwyUv4fGsLN9FXmGOBqYRVVjB2hEzPNjW29S7XtlWKuZOMtBpNNwWw4u
         ZRaKUcXrdoTkyAqNuTrEOk4SaXP5ZJxkcDPmamORHEQYYpyMUmOhIR95IEZG8nwCzX/4
         VDIyCqMp2v4XBN1CKpNUlBBJ2BJ1p/B1jcCvDKET3w2GiW0jNcNenuBDQYFmaPxa2xve
         ISkod8G2AbAfT3jRGqFbumWMCFQ0hZm8r4vpV54Fpf39WlKUXFDR909q9erPs6fZIntR
         RR47PHVMkiKhGcP2F2JFDZ+2IZLnUoHH/f8i2SNeLbWPKIq8LQfYu5UqnnPmo2SabkPz
         ls2w==
X-Gm-Message-State: AOAM531/wA35GszMiZ6oATaFG08LQiTOt88fBHozqeG2yS04zWUYcozf
	bNV8EPP4dSgSnWV4wXk5KukY7ZJxtjTBsNJ49RE=
X-Google-Smtp-Source: 
 ABdhPJyriXyBldjYn3WbjZFcU8u4Ven8LlSiI/JkmN0ZlDRay3o8Os3hjtkznhWK1gNTJim7OygjVQ==
X-Received: by 2002:a17:90b:1b44:b0:1cd:49b8:42b8 with SMTP id
 nv4-20020a17090b1b4400b001cd49b842b8mr14604022pjb.102.1650308661932;
        Mon, 18 Apr 2022 12:04:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm13274670pfh.174.2022.04.18.12.04.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 12:04:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone] busybox: fix CVE-2022-28391
Date: Mon, 18 Apr 2022 09:04:07 -1000
Message-Id: 
 <57d692feb09bf54e1a0dec28554e39f549b39643.1650303227.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650303227.git.steve@sakoman.com>
References: <cover.1650303227.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 02:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164605

BusyBox through 1.35.0 allows remote attackers to execute arbitrary code
if netstat is used to print a DNS PTR record's value to a VT compatible
terminal. Alternatively, the attacker could choose to change the terminal's colors.

https://nvd.nist.gov/vuln/detail/CVE-2022-28391

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...tr-ensure-only-printable-characters-.patch | 41 +++++++++++
 ...e-all-printed-strings-with-printable.patch | 69 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  2 +
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch b/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
new file mode 100644
index 0000000000..4635250170
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
@@ -0,0 +1,41 @@
+From 0c8da1bead8ffaf270b4b723ead2c517371405d7 Mon Sep 17 00:00:00 2001
+From: Ariadne Conill <ariadne@dereferenced.org>
+Date: Sun, 3 Apr 2022 12:14:33 +0000
+Subject: [PATCH 1/2] libbb: sockaddr2str: ensure only printable characters are
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
+index 0e0b247b8..02c061e67 100644
+--- a/libbb/xconnect.c
++++ b/libbb/xconnect.c
+@@ -497,8 +497,9 @@ static char* FAST_FUNC sockaddr2str(const struct sockaddr *sa, int flags)
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
+@@ -509,7 +510,7 @@ static char* FAST_FUNC sockaddr2str(const struct sockaddr *sa, int flags)
+ #endif
+ 	/* For now we don't support anything else, so it has to be INET */
+ 	/*if (sa->sa_family == AF_INET)*/
+-		return xasprintf("%s:%s", host, serv);
++		return xasprintf("%s:%s", printable_string(host), serv);
+ 	/*return xstrdup(host);*/
+ }
+ 
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch b/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
new file mode 100644
index 0000000000..0d7409ddc3
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
@@ -0,0 +1,69 @@
+From 812b407e545b70b16cf32aade135b5c32eaf674f Mon Sep 17 00:00:00 2001
+From: Ariadne Conill <ariadne@dereferenced.org>
+Date: Sun, 3 Apr 2022 12:16:45 +0000
+Subject: [PATCH 2/2] nslookup: sanitize all printed strings with
+ printable_string
+
+Otherwise, terminal sequences can be injected, which enables various terminal injection
+attacks from DNS results.
+
+CVE: CVE-2022-28391
+Upstream-Status: Pending
+Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+ networking/nslookup.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/networking/nslookup.c b/networking/nslookup.c
+index 6da97baf4..4bdcde1b8 100644
+--- a/networking/nslookup.c
++++ b/networking/nslookup.c
+@@ -407,7 +407,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
+ 				//printf("Unable to uncompress domain: %s\n", strerror(errno));
+ 				return -1;
+ 			}
+-			printf(format, ns_rr_name(rr), dname);
++			printf(format, ns_rr_name(rr), printable_string(dname));
+ 			break;
+ 
+ 		case ns_t_mx:
+@@ -422,7 +422,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
+ 				//printf("Cannot uncompress MX domain: %s\n", strerror(errno));
+ 				return -1;
+ 			}
+-			printf("%s\tmail exchanger = %d %s\n", ns_rr_name(rr), n, dname);
++			printf("%s\tmail exchanger = %d %s\n", ns_rr_name(rr), n, printable_string(dname));
+ 			break;
+ 
+ 		case ns_t_txt:
+@@ -434,7 +434,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
+ 			if (n > 0) {
+ 				memset(dname, 0, sizeof(dname));
+ 				memcpy(dname, ns_rr_rdata(rr) + 1, n);
+-				printf("%s\ttext = \"%s\"\n", ns_rr_name(rr), dname);
++				printf("%s\ttext = \"%s\"\n", ns_rr_name(rr), printable_string(dname));
+ 			}
+ 			break;
+ 
+@@ -454,7 +454,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
+ 			}
+ 
+ 			printf("%s\tservice = %u %u %u %s\n", ns_rr_name(rr),
+-				ns_get16(cp), ns_get16(cp + 2), ns_get16(cp + 4), dname);
++				ns_get16(cp), ns_get16(cp + 2), ns_get16(cp + 4), printable_string(dname));
+ 			break;
+ 
+ 		case ns_t_soa:
+@@ -483,7 +483,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
+ 				return -1;
+ 			}
+ 
+-			printf("\tmail addr = %s\n", dname);
++			printf("\tmail addr = %s\n", printable_string(dname));
+ 			cp += n;
+ 
+ 			printf("\tserial = %lu\n", ns_get32(cp));
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index ab11f3d89a..f2f1b35902 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -47,6 +47,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
+           file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
+           file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.25.1


