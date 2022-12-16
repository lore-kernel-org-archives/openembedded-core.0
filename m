Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BDEC4708D
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:15 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.15121.1671202686156831583
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=14rlbPod;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so2654823pjd.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyb/GeSl4CpOWkkZgwxDdI75bbhbO//A/Ln5xbgsBPs=;
        b=14rlbPodL1oo9IszhOZN89GU7ayrGDU+bsT8CCoe/EHQ59x5HReqKTzFcka1lnWJiU
         1GVMyYOwM3VyfnEHdCZ7PfBHsPqgfgq0JvfruLAQv3CzVZbXHXLP3VTM9XVZVbUcAKa+
         xl+zm4d0czCJT5Ls5CpcMHIlORhqGVDxIo7JRBctqsMkW1RhC3RgqhWIYFQovw28PzBy
         YADdPFZ6VK1ic+QStdFktjbgNYHXtp7MfmbURvpue+y1H9Hx0bXmUP3a5MwDCMAKCaQp
         gQYJfSC6Ud+gr46PLPLtYQIKXWzW7rqjqXbHvlrosQAD02VANyr5HYHvFz+ki8R/cANO
         OGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyb/GeSl4CpOWkkZgwxDdI75bbhbO//A/Ln5xbgsBPs=;
        b=2EntGeXVi79DlGUROaEIV/XCecDMdeFznuBqgJhE1/OvJZhpWCP5rMPVhQxmvATna0
         qVwsaqz9CvESgR/fAndfmriAr6wa4eQoNIM/9KbXho2Uqr+sjYjzBMKnsLQ1nsUnVxNg
         H7Qgm+3lTLbaywucrsb7njpY1pbu0b2XA9SIdGI3RByDqE4MOWHs4HGwZBx63Nb0klf5
         NdqPe5+c4JHYpMTWemgMioc92Jo5BQ4u/U4Q43qOJZ6UfBjXb6DMEXep1Qj/5SygUkSe
         1j8p4ZhIQo0/vALK+l0KlTCTWETwQlDa2Y9Z4ryLmgQr1umN5qZN6AfRr6EWBeO8yCTb
         B6kQ==
X-Gm-Message-State: ANoB5pmirQYrXDxydCvFVi4gqUAQToXCbWkj7ObsMMJMt2KGQPX7cKEa
	1XUY8KNaaKDRbojr2rtXDypAE47smreR6qeFfmI=
X-Google-Smtp-Source: AA0mqf5AwcmlCs493+rjc5kxcJNdQ7gIutbjkVSJSAem+0oWiGVgPoJOC+WQYBRu5fOWnXSNHIz+Sg==
X-Received: by 2002:a17:90a:c584:b0:219:9eaa:80ef with SMTP id l4-20020a17090ac58400b002199eaa80efmr40355640pjt.14.1671202685141;
        Fri, 16 Dec 2022 06:58:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/13] curl: Fix CVE CVE-2022-35260
Date: Fri, 16 Dec 2022 04:57:42 -1000
Message-Id: <fe81ee17a2dc9924178fdd98614ed9e264204492.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174747

From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2022-35260.patch            | 68 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35260.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-35260.patch b/meta/recipes-support/curl/curl/CVE-2022-35260.patch
new file mode 100644
index 0000000000..476c996b0a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-35260.patch
@@ -0,0 +1,68 @@
+From 3ff3989ec53d9ddcf4bdd99f5d5788dd87486768 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 4 Oct 2022 14:37:24 +0200
+Subject: [PATCH] netrc: replace fgets with Curl_get_line
+
+Upstream-Status: Backport
+CVE: CVE-2022-35260
+Reference to upstream patch: https://github.com/curl/curl/commit/c97ec984fb2bc919a3aa863e0476dffa377b184c
+
+Make the parser only accept complete lines and avoid problems with
+overly long lines.
+
+Reported-by: Hiroki Kurosawa
+
+Closes #9789
+---
+ lib/curl_get_line.c | 4 ++--
+ lib/netrc.c         | 5 +++--
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/lib/curl_get_line.c b/lib/curl_get_line.c
+index c4194851ae09..4b9eea9e631c 100644
+--- a/lib/curl_get_line.c
++++ b/lib/curl_get_line.c
+@@ -28,8 +28,8 @@
+ #include "memdebug.h"
+ 
+ /*
+- * get_line() makes sure to only return complete whole lines that fit in 'len'
+- * bytes and end with a newline.
++ * Curl_get_line() makes sure to only return complete whole lines that fit in
++ * 'len' bytes and end with a newline.
+  */
+ char *Curl_get_line(char *buf, int len, FILE *input)
+ {
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 1c9da31993c9..93239132c9d8 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -31,6 +31,7 @@
+ #include "netrc.h"
+ #include "strtok.h"
+ #include "strcase.h"
++#include "curl_get_line.h"
+ 
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+@@ -83,7 +84,7 @@ static int parsenetrc(const char *host,
+     char netrcbuffer[4096];
+     int  netrcbuffsize = (int)sizeof(netrcbuffer);
+ 
+-    while(!done && fgets(netrcbuffer, netrcbuffsize, file)) {
++    while(!done && Curl_get_line(netrcbuffer, netrcbuffsize, file)) {
+       tok = strtok_r(netrcbuffer, " \t\n", &tok_buf);
+       if(tok && *tok == '#')
+         /* treat an initial hash as a comment line */
+@@ -169,7 +170,7 @@ static int parsenetrc(const char *host,
+ 
+         tok = strtok_r(NULL, " \t\n", &tok_buf);
+       } /* while(tok) */
+-    } /* while fgets() */
++    } /* while Curl_get_line() */
+ 
+     out:
+     if(!retcode) {
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 31aa9d7185..63faae6296 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-32208.patch \
            file://CVE-2022-35252.patch \
            file://CVE-2022-32221.patch \
+           file://CVE-2022-35260.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1


