Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A1EC54FC6
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:36:44 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.7013.1748093801037479202
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QJIOb7q5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-310ce23a660so543116a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093800; x=1748698600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hExlkYm7dXFoka5g37FYf5LWVYZWpcMhSExiM9sd94g=;
        b=QJIOb7q5NhjrGy+pWzYt5yoxlVFnZCzZUcnl10BGl2ucaQ4Tcy075EsqNxIasfPmj+
         W0SgkzCLihhjTUV3skbsJTN8JAT58CY+KrLruXSq/yPl9dOxIvyNVqQAlf2VAdtILREa
         K0lHlBo9G/D5k9vSOmuQq+GZ7mKgxpezgPP8EsDdWoyymUr6IbGu3tW9XyZ+lf38mmUO
         Djg6YaCfsNyGl8e5QE/PiiY4xief8g8qVFUsJvCVHIOaQlMiH3ynKG5FbTQDzCXwmwr6
         1qIRjQhxYsLR68M/aisB7NznjFSWhglUpmY+nGhvHf3UHALTWMIDkm9M7/S1YAwGMDTX
         l/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093800; x=1748698600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hExlkYm7dXFoka5g37FYf5LWVYZWpcMhSExiM9sd94g=;
        b=RZvhkLlQc8X7KWNUkeDCC+sRT0KK2G61Cyd99iZ6xoaVnYDpLZPzCWIQll9bos4QTD
         ryaj0aq7jNNfOMfp1i6e1DvLpboLRVEzG4PPq85juKJryRfsqrTZUA2LSbVLDebXPi5D
         np5XG8OEtUmykDz3Nz+BCMbAEQ2kZb13f8Hi+viE2mK+LWn2uO4NxrTroOVtbVcCfSQ/
         xAQbyUVUKUKtjK7Am/9CnrbMAdvYhPmuwaN9pZCSpTduXBIA+HAzGAwyTu1kCmdjD43f
         XTiduleCxnUEsvESpm/Zli+xUA8LRm8nvZ3/nV2u4j+3Ua2/Rs8NHKXwGlOExNEhWU+X
         I/sA==
X-Gm-Message-State: AOJu0YzWmYEfr2c4bZxrfS3di8NAnkb6x+9VhLh+ptkBg1yenrPeCyLS
	jqkxQIogXhEuhfkn9X+TyF5xoXo6HapdS7osK0HwblCAt9vwqCJZfxbOgYAS7RUTpVBMHd2uJIp
	QiakN
X-Gm-Gg: ASbGncvvs5AfciaZ+EOC3fruY2DtGkxorKJPJN9Wd+oJHHPGNOcvjyA1XoQm9tWVjOp
	ZJvU767uAu2MCC7Zbt1S9Yh/+Jckls4EP+5rYwcQXiiTaElCEUx1FNLnkZNDm+WZuMjiEuNgsL/
	34BQ2OtNeSXXKjCuMesMTOF3Aq5t6SgPLR4xu8Tor2E4E6Ki4OPjvrgIB6AHO11snmzAg5YezT8
	XmywNjpOTJ86mz9LgWae6ue4OxSIm6SlTfH791QdG6bFNFHvffaGK01Vv36GwUPXcZ+MQv4jKOL
	zZ2DyC/blVisBYiTG5d6LeqnLtwXlUAIyG1YHwvsqaBJlB8tiFnlgg==
X-Google-Smtp-Source: AGHT+IH/g38nT6BtN3daVHjoeLpP+8Hmgeok+Jz9Ldofu97xnr67Ok9loEQv3NQFgzkSp/d4ECBLoA==
X-Received: by 2002:a17:90b:17d0:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-311104b93e9mr4058829a91.30.1748093800112;
        Sat, 24 May 2025 06:36:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/12] iputils: Security fix for CVE-2025-47268
Date: Sat, 24 May 2025 06:36:18 -0700
Message-ID: <a463c8e3950ccf58316d48241c2cd82484f25fda.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217227

From: Yi Zhao <yi.zhao@windriver.com>

CVE-2025-47268
ping in iputils through 20240905 allows a denial of service (application
error or incorrect data collection) via a crafted ICMP Echo Reply
packet, because of a signed 64-bit integer overflow in timestamp
multiplication.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-47268

Patch from:
https://github.com/iputils/iputils/commit/070cfacd7348386173231fb16fad4983d4e6ae40

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../iputils/iputils/CVE-2025-47268.patch      | 143 ++++++++++++++++++
 .../iputils/iputils_20211215.bb               |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch

diff --git a/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch b/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
new file mode 100644
index 0000000000..dd31b79031
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
@@ -0,0 +1,143 @@
+From 070cfacd7348386173231fb16fad4983d4e6ae40 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Mon, 5 May 2025 23:55:57 +0200
+Subject: [PATCH] ping: Fix signed 64-bit integer overflow in RTT calculation
+
+Crafted ICMP Echo Reply packet can cause signed integer overflow in
+
+1) triptime calculation:
+triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+
+2) tsum2 increment which uses triptime
+rts->tsum2 += (double)((long long)triptime * (long long)triptime);
+
+3) final tmvar:
+tmvar = (rts->tsum2 / total) - (tmavg * tmavg)
+
+    $ export CFLAGS="-O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer"
+    $ export LDFLAGS="-fsanitize=address,undefined -fno-omit-frame-pointer"
+    $ meson setup .. -Db_sanitize=address,undefined
+    $ ninja
+    $ ./ping/ping -c2 127.0.0.1
+
+    PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
+    64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.061 ms
+    ../ping/ping_common.c:757:25: runtime error: signed integer overflow: -2513732689199106 * 1000000 cannot be represented in type 'long int'
+    ../ping/ping_common.c:757:12: runtime error: signed integer overflow: -4975495174606980224 + -6510615555425289427 cannot be represented in type 'long int'
+    ../ping/ping_common.c:769:47: runtime error: signed integer overflow: 6960633343677281965 * 6960633343677281965 cannot be represented in type 'long int'
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ./ping/ping: Warning: time of day goes back (-7256972569576721377us), taking countermeasures
+    ./ping/ping: Warning: time of day goes back (-7256972569576721232us), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ../ping/ping_common.c:265:16: runtime error: signed integer overflow: 6960633343677281965 * 2 cannot be represented in type 'long int'
+    64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.565 ms
+
+    --- 127.0.0.1 ping statistics ---
+    2 packets transmitted, 2 received, +2 duplicates, 0% packet loss, time 1002ms
+    ../ping/ping_common.c:940:42: runtime error: signed integer overflow: 1740158335919320832 * 1740158335919320832 cannot be represented in type 'long int'
+    rtt min/avg/max/mdev = 0.000/1740158335919320.832/6960633343677281.965/-1623514645242292.-224 ms
+
+To fix the overflow check allowed ranges of struct timeval members:
+* tv_sec <0, LONG_MAX/1000000>
+* tv_usec <0, 999999>
+
+Fix includes 2 new error messages (needs translation).
+Also existing message "time of day goes back ..." needed to be modified
+as it now prints tv->tv_sec which is a second (needs translation update).
+
+After fix:
+
+    $ ./ping/ping -c2 127.0.0.1
+    64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.057 ms
+    ./ping/ping: Warning: invalid tv_usec -6510615555424928611 us
+    ./ping/ping: Warning: time of day goes back (-3985394643238914 s), taking countermeasures
+    ./ping/ping: Warning: invalid tv_usec -6510615555424928461 us
+    ./ping/ping: Warning: time of day goes back (-3985394643238914 s), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ./ping/ping: Warning: invalid tv_usec -6510615555425884541 us
+    ./ping/ping: Warning: time of day goes back (-4243165695442945 s), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.111 ms
+
+    --- 127.0.0.1 ping statistics ---
+    2 packets transmitted, 2 received, +2 duplicates, 0% packet loss, time 101ms
+    rtt min/avg/max/mdev = 0.000/0.042/0.111/0.046 ms
+
+Fixes: https://github.com/iputils/iputils/issues/584
+Fixes: CVE-2025-472
+Link: https://github.com/Zephkek/ping-rtt-overflow/
+Co-developed-by: Cyril Hrubis <chrubis@suse.cz>
+Reported-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Reviewed-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Reviewed-by: Noah Meyerhans <noahm@debian.org>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+
+CVE: CVE-2025-47268
+
+Upstream-Status: Backport
+[https://github.com/iputils/iputils/commit/070cfacd7348386173231fb16fad4983d4e6ae40]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ iputils_common.h   |  3 +++
+ ping/ping_common.c | 22 +++++++++++++++++++---
+ 2 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/iputils_common.h b/iputils_common.h
+index 49e790d..829a749 100644
+--- a/iputils_common.h
++++ b/iputils_common.h
+@@ -10,6 +10,9 @@
+ 	  !!__builtin_types_compatible_p(__typeof__(arr), \
+ 					 __typeof__(&arr[0]))])) * 0)
+ 
++/* 1000001 = 1000000 tv_sec + 1 tv_usec */
++#define TV_SEC_MAX_VAL (LONG_MAX/1000001)
++
+ #ifdef __GNUC__
+ # define iputils_attribute_format(t, n, m) __attribute__((__format__ (t, n, m)))
+ #else
+diff --git a/ping/ping_common.c b/ping/ping_common.c
+index dadd2a4..4e99d89 100644
+--- a/ping/ping_common.c
++++ b/ping/ping_common.c
+@@ -754,16 +754,32 @@ int gather_statistics(struct ping_rts *rts, uint8_t *icmph, int icmplen,
+ 
+ restamp:
+ 		tvsub(tv, &tmp_tv);
+-		triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+-		if (triptime < 0) {
+-			error(0, 0, _("Warning: time of day goes back (%ldus), taking countermeasures"), triptime);
++
++		if (tv->tv_usec >= 1000000) {
++			error(0, 0, _("Warning: invalid tv_usec %ld us"), tv->tv_usec);
++			tv->tv_usec = 999999;
++		}
++
++		if (tv->tv_usec < 0) {
++			error(0, 0, _("Warning: invalid tv_usec %ld us"), tv->tv_usec);
++			tv->tv_usec = 0;
++		}
++
++		if (tv->tv_sec > TV_SEC_MAX_VAL) {
++			error(0, 0, _("Warning: invalid tv_sec %ld s"), tv->tv_sec);
++			triptime = 0;
++		} else if (tv->tv_sec < 0) {
++			error(0, 0, _("Warning: time of day goes back (%ld s), taking countermeasures"), tv->tv_sec);
+ 			triptime = 0;
+ 			if (!rts->opt_latency) {
+ 				gettimeofday(tv, NULL);
+ 				rts->opt_latency = 1;
+ 				goto restamp;
+ 			}
++		} else {
++			triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+ 		}
++
+ 		if (!csfailed) {
+ 			rts->tsum += triptime;
+ 			rts->tsum2 += (double)((long long)triptime * (long long)triptime);
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/iputils/iputils_20211215.bb b/meta/recipes-extended/iputils/iputils_20211215.bb
index 3ddce0be54..03dc97dcc8 100644
--- a/meta/recipes-extended/iputils/iputils_20211215.bb
+++ b/meta/recipes-extended/iputils/iputils_20211215.bb
@@ -12,6 +12,7 @@ DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
+           file://CVE-2025-47268.patch \
            "
 SRCREV = "1d1e7c43210d8af316a41cb2c53d612a4c16f34d"
 
-- 
2.43.0


