Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C31C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:14:42 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.11021.1645452882044816228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yyv0YEWB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id x11so12986145pll.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Utjz5zg4sNecMMf9lLoXDLTq/oc/dgw4gePN3/RP7tg=;
        b=yyv0YEWBFOu6ypzkaXWKEnIulV/y7qRxOMPeunq1cp0Md3qXyZcjlzeRfUQSvfatG0
         qLL4Tkwe7OxphJrlVcUDenV6ZLOeakJDazpNEhzH0Kvj5a/MEeMX47uHsF9unpxjeLHv
         ZfFqwcdMRa006liPA01zw63F9olrlkSxTeI1v3jR2Byhaqmabze3Cwt08OySxRlqBHzr
         tGUvQvKy1Tg02rl3r8nPdokS6Fs2nP6yDDyKL0gqkjDLrhiqyqiixvG0pPtZK+K+eCnV
         v1wtz6L1rODCKrFkKnIZIcYwT4m62n/383YGBufE6JziKIcdrTfnF5yypzGQFv193A1v
         nUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Utjz5zg4sNecMMf9lLoXDLTq/oc/dgw4gePN3/RP7tg=;
        b=Dh84Xs8q303NSEsH309mGLD5yJoKnV2Kbe/exWGBvpxLeXyRhGMqx7gVrUnaXwZJ7C
         5dJ+7Q/z/eiBX2Ak2z664Qyn3rIHjoDIaljIDMs7l6S1ih7tJfHoAo7ae/vtax6Ml8cB
         bZSRtIFRzQ+6tF8/VVGccv7FN5uS4zqECwwgMPHfhZ8S9AWPsdTEbPsSi6yvzuWOvBuw
         LIJNYUwrKQaOSqbGEwBeYJTjcjMRPemlRRTGopiYt+t+ndAwn19SZ06HGT4u4gGRr/Ui
         Qzh5CvyfOJEoz0cZLNNG8xu1AKq0oNlJTgwUeb9dvWWkwsv9GZ/EEgFvnGJBR7VVFuLt
         x9oA==
X-Gm-Message-State: AOAM533xsWhXzhp+bzrDvvtmJjs8gjNSx60i58X2AfALkVQYtbhVUKN1
	coxhdq2NKi2jCVOVmerZXI7WnsTSC6T9W+YB
X-Google-Smtp-Source: 
 ABdhPJyFyW7uyEQq36yP1zs7lggLh98bDAE4JzywzFRW8FaAkniE70OyKnFuBAJFDp2BxyOpeubfJg==
X-Received: by 2002:a17:903:248f:b0:14f:acf5:a5c2 with SMTP id
 p15-20020a170903248f00b0014facf5a5c2mr6661509plw.167.1645452880958;
        Mon, 21 Feb 2022 06:14:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/20] connman: fix CVE-2021-33833
Date: Mon, 21 Feb 2022 04:14:02 -1000
Message-Id: 
 <8eb4fdd19fe4b275c26c49120b364cd24ec151d5.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:14:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162032

ConnMan (aka Connection Manager) 1.30 through 1.39 has a stack-based
buffer overflow in uncompress in dnsproxy.c via NAME, RDATA, or
RDLENGTH (for A or AAAA).

Backport patch from:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=eceb2e8d2341c041df55a5e2f047d9a8c491463c

CVE: CVE-2021-33833

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/connman/CVE-2021-33833.patch      | 72 +++++++++++++++++++
 .../connman/connman_1.37.bb                   |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2021-33833.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2021-33833.patch b/meta/recipes-connectivity/connman/connman/CVE-2021-33833.patch
new file mode 100644
index 0000000000..770948fb69
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2021-33833.patch
@@ -0,0 +1,72 @@
+From eceb2e8d2341c041df55a5e2f047d9a8c491463c Mon Sep 17 00:00:00 2001
+From: Valery Kashcheev <v.kascheev@omp.ru>
+Date: Mon, 7 Jun 2021 18:58:24 +0200
+Subject: dnsproxy: Check the length of buffers before memcpy
+
+Fix using a stack-based buffer overflow attack by checking the length of
+the ptr and uptr buffers.
+
+Fix debug message output.
+
+Fixes: CVE-2021-33833
+
+Upstream-Status: Backport
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=eceb2e8d2341c041df55a5e2f047d9a8c491463c
+CVE: CVE-2021-33833
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ src/dnsproxy.c | 20 +++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index de52df5a..38dbdd71 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -1788,17 +1788,15 @@ static char *uncompress(int16_t field_count, char *start, char *end,
+ 		 * tmp buffer.
+ 		 */
+ 
+-		debug("pos %d ulen %d left %d name %s", pos, ulen,
+-			(int)(uncomp_len - (uptr - uncompressed)), uptr);
+-
+-		ulen = strlen(name);
+-		if ((uptr + ulen + 1) > uncomp_end) {
++		ulen = strlen(name) + 1;
++		if ((uptr + ulen) > uncomp_end)
+ 			goto out;
+-		}
+-		strncpy(uptr, name, uncomp_len - (uptr - uncompressed));
++		strncpy(uptr, name, ulen);
++
++		debug("pos %d ulen %d left %d name %s", pos, ulen,
++			(int)(uncomp_end - (uptr + ulen)), uptr);
+ 
+ 		uptr += ulen;
+-		*uptr++ = '\0';
+ 
+ 		ptr += pos;
+ 
+@@ -1841,7 +1839,7 @@ static char *uncompress(int16_t field_count, char *start, char *end,
+ 		} else if (dns_type == ns_t_a || dns_type == ns_t_aaaa) {
+ 			dlen = uptr[-2] << 8 | uptr[-1];
+ 
+-			if (ptr + dlen > end) {
++			if ((ptr + dlen) > end || (uptr + dlen) > uncomp_end) {
+ 				debug("data len %d too long", dlen);
+ 				goto out;
+ 			}
+@@ -1880,6 +1878,10 @@ static char *uncompress(int16_t field_count, char *start, char *end,
+ 			 * refresh interval, retry interval, expiration
+ 			 * limit and minimum ttl). They are 20 bytes long.
+ 			 */
++			if ((uptr + 20) > uncomp_end || (ptr + 20) > end) {
++				debug("soa record too long");
++				goto out;
++			}
+ 			memcpy(uptr, ptr, 20);
+ 			uptr += 20;
+ 			ptr += 20;
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
index 096981364f..bdd1e590ec 100644
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -9,6 +9,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://CVE-2021-26675.patch \
             file://CVE-2021-26676-0001.patch \
             file://CVE-2021-26676-0002.patch \
+            file://CVE-2021-33833.patch \
             file://CVE-2022-23096-7.patch \
             file://CVE-2022-23098.patch \
 "
-- 
2.25.1


