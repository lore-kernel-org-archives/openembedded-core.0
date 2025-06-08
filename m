Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDEBC5B552
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 21:02:11 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.45205.1749416530011273508
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 14:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VFAQr/Z8;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: petr.vorel@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad88eb71eb5so503927666b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 14:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749416528; x=1750021328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qQjJ1qIsD4zPJpfFwbVMYPiAgjvHOZoS/WiQu1uh/HA=;
        b=VFAQr/Z8TuxeYssfqw8ji1Sk4/khiAMkAzHXynJiU+MwVbf1O4DlW2eCs6hTqH8QfO
         /HfXaoJIHE/n5ah0U91ElPP5neC5VwUgCt1KPFsvRrDIbscx3dngMtdp2fjVfkL1AWgH
         yZumBoSFYtf9IFvKszI7PolVGksBJfNuwXdQqmqk6x6Dd6CHnCrbL+chof/a0kIS9522
         IYZtHRDztPAfhafNmiMp87999WGqeJ43cgvvrI5tYaD5hmx5zNISkmoGbQTOH9Wb9EEM
         Tcfi5uk5U4JOHsgFd6WD/uMAyXfq9GmEyQ9ApmnRV8lx2qwLuPBKALevagb9FS/L8lJG
         GabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749416528; x=1750021328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQjJ1qIsD4zPJpfFwbVMYPiAgjvHOZoS/WiQu1uh/HA=;
        b=MdIolpc0xt0hy5t+IFkhqSx09J3My/hus/hE50pE/Uj5o10IECg2J7HYKkeW14EWCz
         omy6+FwaA580ZmdN0thU1DdfZJfHsPveL5+CbTACXSbu56nj5KhKiTjjtXIYep+LFPUt
         Q3S4J5q40qpJEJ2uwSZaCBvAv7fWEW4viZIBNCVmTM0p6Ld7Eh1kwwjyUVH9UKsjtRp5
         KPNsBz00TmmPYivlHWOgIfaw5rKTNX588YAMcJbUKcV7AqzIl9hygXjMhDpu/kiXHOPO
         +N2jS1llnHta+Ld4kejkeMQ2UoitISp+Wemz6R9GtiQQT72XtUReAepFv/VKtwgXoi/W
         GlLw==
X-Gm-Message-State: AOJu0YzdBKbGHm9Of2XLdwdYhiD0BKaC8FRA6aYSVu2ODr+wOmB4lkzi
	4gxn8e729zIgk/6VDEa86b9y28y3wvCag/mluQ2dvKMraH7tCI+Xb3oSDOI5Dw==
X-Gm-Gg: ASbGncvVR+i1NtwSboduEc+IPCVhxgBHnepC0Mom0jH6iFIE5ZL2F5rcazyTJPTf5VS
	WZ5zJQOzqop42iXiClROG38J6vrIXnuEJBLMP37BLTLOPE9SZw4ptlj5DkYdc4KtM2MAHYm3uib
	l+xT6TO/BW+czU90V+CD3uRWII2O4E+xVf2i7u61b1IOkn75tPhPaplZceGEl8Rsh+l0YEyQxlQ
	/09gI+Dzfuz8MNfVsYfxTMRRkBKuSbTRyEWO91UiVpKFN2TrtEQ1N08vLJQ/OSL1eNeZc5+nrsB
	zInVa+TU6eWaMIGavYf6Ocg/yioLSZlw5z54EcKOMr+8HFkuC3p/99Rr1/YWzE7swgE8FWti+dJ
	gWw==
X-Google-Smtp-Source: AGHT+IGpVaCpwmDxrD5igGww97POFM0cXCNYAvtwPWq0XCRAzCPFmoxpO4xmsme0Ze6EMbg4rmKwqw==
X-Received: by 2002:a17:906:9f92:b0:ad2:15c4:e23f with SMTP id a640c23a62f3a-ade1a9edfbamr974179766b.13.1749416528032;
        Sun, 08 Jun 2025 14:02:08 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc77d0dsm461091066b.149.2025.06.08.14.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 14:02:07 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Yi Zhao <yi.zhao@eng.windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/1] iputils: upgrade 20240905 -> 20250605
Date: Sun,  8 Jun 2025 23:01:52 +0200
Message-ID: <20250608210152.1384768-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 21:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218223

Bugfix release:
https://github.com/iputils/iputils/releases/tag/20250605

This also includes security release update
https://github.com/iputils/iputils/releases/tag/20250602
Security release, fixes CVE-2025-47268 and CVE-2025-48964
(therefore remove backported fix CVE-2025-47268.patch

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi Richard,

I'm sorry to again completely skip testing this patch (iputils
maintainer, not using Yocto at all).

Thanks a lot in advance to do the testing.

Kind regards,
Petr

 .../iputils/iputils/CVE-2025-47268.patch      | 143 ------------------
 ...putils_20240905.bb => iputils_20250605.bb} |   3 +-
 2 files changed, 1 insertion(+), 145 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
 rename meta/recipes-extended/iputils/{iputils_20240905.bb => iputils_20250605.bb} (95%)

diff --git a/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch b/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
deleted file mode 100644
index dd31b79031..0000000000
--- a/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From 070cfacd7348386173231fb16fad4983d4e6ae40 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Mon, 5 May 2025 23:55:57 +0200
-Subject: [PATCH] ping: Fix signed 64-bit integer overflow in RTT calculation
-
-Crafted ICMP Echo Reply packet can cause signed integer overflow in
-
-1) triptime calculation:
-triptime = tv->tv_sec * 1000000 + tv->tv_usec;
-
-2) tsum2 increment which uses triptime
-rts->tsum2 += (double)((long long)triptime * (long long)triptime);
-
-3) final tmvar:
-tmvar = (rts->tsum2 / total) - (tmavg * tmavg)
-
-    $ export CFLAGS="-O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer"
-    $ export LDFLAGS="-fsanitize=address,undefined -fno-omit-frame-pointer"
-    $ meson setup .. -Db_sanitize=address,undefined
-    $ ninja
-    $ ./ping/ping -c2 127.0.0.1
-
-    PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
-    64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.061 ms
-    ../ping/ping_common.c:757:25: runtime error: signed integer overflow: -2513732689199106 * 1000000 cannot be represented in type 'long int'
-    ../ping/ping_common.c:757:12: runtime error: signed integer overflow: -4975495174606980224 + -6510615555425289427 cannot be represented in type 'long int'
-    ../ping/ping_common.c:769:47: runtime error: signed integer overflow: 6960633343677281965 * 6960633343677281965 cannot be represented in type 'long int'
-    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
-    ./ping/ping: Warning: time of day goes back (-7256972569576721377us), taking countermeasures
-    ./ping/ping: Warning: time of day goes back (-7256972569576721232us), taking countermeasures
-    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
-    ../ping/ping_common.c:265:16: runtime error: signed integer overflow: 6960633343677281965 * 2 cannot be represented in type 'long int'
-    64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.565 ms
-
-    --- 127.0.0.1 ping statistics ---
-    2 packets transmitted, 2 received, +2 duplicates, 0% packet loss, time 1002ms
-    ../ping/ping_common.c:940:42: runtime error: signed integer overflow: 1740158335919320832 * 1740158335919320832 cannot be represented in type 'long int'
-    rtt min/avg/max/mdev = 0.000/1740158335919320.832/6960633343677281.965/-1623514645242292.-224 ms
-
-To fix the overflow check allowed ranges of struct timeval members:
-* tv_sec <0, LONG_MAX/1000000>
-* tv_usec <0, 999999>
-
-Fix includes 2 new error messages (needs translation).
-Also existing message "time of day goes back ..." needed to be modified
-as it now prints tv->tv_sec which is a second (needs translation update).
-
-After fix:
-
-    $ ./ping/ping -c2 127.0.0.1
-    64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.057 ms
-    ./ping/ping: Warning: invalid tv_usec -6510615555424928611 us
-    ./ping/ping: Warning: time of day goes back (-3985394643238914 s), taking countermeasures
-    ./ping/ping: Warning: invalid tv_usec -6510615555424928461 us
-    ./ping/ping: Warning: time of day goes back (-3985394643238914 s), taking countermeasures
-    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
-    ./ping/ping: Warning: invalid tv_usec -6510615555425884541 us
-    ./ping/ping: Warning: time of day goes back (-4243165695442945 s), taking countermeasures
-    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
-    64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.111 ms
-
-    --- 127.0.0.1 ping statistics ---
-    2 packets transmitted, 2 received, +2 duplicates, 0% packet loss, time 101ms
-    rtt min/avg/max/mdev = 0.000/0.042/0.111/0.046 ms
-
-Fixes: https://github.com/iputils/iputils/issues/584
-Fixes: CVE-2025-472
-Link: https://github.com/Zephkek/ping-rtt-overflow/
-Co-developed-by: Cyril Hrubis <chrubis@suse.cz>
-Reported-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
-Reviewed-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-Reviewed-by: Noah Meyerhans <noahm@debian.org>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-
-CVE: CVE-2025-47268
-
-Upstream-Status: Backport
-[https://github.com/iputils/iputils/commit/070cfacd7348386173231fb16fad4983d4e6ae40]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- iputils_common.h   |  3 +++
- ping/ping_common.c | 22 +++++++++++++++++++---
- 2 files changed, 22 insertions(+), 3 deletions(-)
-
-diff --git a/iputils_common.h b/iputils_common.h
-index 49e790d..829a749 100644
---- a/iputils_common.h
-+++ b/iputils_common.h
-@@ -10,6 +10,9 @@
- 	  !!__builtin_types_compatible_p(__typeof__(arr), \
- 					 __typeof__(&arr[0]))])) * 0)
- 
-+/* 1000001 = 1000000 tv_sec + 1 tv_usec */
-+#define TV_SEC_MAX_VAL (LONG_MAX/1000001)
-+
- #ifdef __GNUC__
- # define iputils_attribute_format(t, n, m) __attribute__((__format__ (t, n, m)))
- #else
-diff --git a/ping/ping_common.c b/ping/ping_common.c
-index dadd2a4..4e99d89 100644
---- a/ping/ping_common.c
-+++ b/ping/ping_common.c
-@@ -754,16 +754,32 @@ int gather_statistics(struct ping_rts *rts, uint8_t *icmph, int icmplen,
- 
- restamp:
- 		tvsub(tv, &tmp_tv);
--		triptime = tv->tv_sec * 1000000 + tv->tv_usec;
--		if (triptime < 0) {
--			error(0, 0, _("Warning: time of day goes back (%ldus), taking countermeasures"), triptime);
-+
-+		if (tv->tv_usec >= 1000000) {
-+			error(0, 0, _("Warning: invalid tv_usec %ld us"), tv->tv_usec);
-+			tv->tv_usec = 999999;
-+		}
-+
-+		if (tv->tv_usec < 0) {
-+			error(0, 0, _("Warning: invalid tv_usec %ld us"), tv->tv_usec);
-+			tv->tv_usec = 0;
-+		}
-+
-+		if (tv->tv_sec > TV_SEC_MAX_VAL) {
-+			error(0, 0, _("Warning: invalid tv_sec %ld s"), tv->tv_sec);
-+			triptime = 0;
-+		} else if (tv->tv_sec < 0) {
-+			error(0, 0, _("Warning: time of day goes back (%ld s), taking countermeasures"), tv->tv_sec);
- 			triptime = 0;
- 			if (!rts->opt_latency) {
- 				gettimeofday(tv, NULL);
- 				rts->opt_latency = 1;
- 				goto restamp;
- 			}
-+		} else {
-+			triptime = tv->tv_sec * 1000000 + tv->tv_usec;
- 		}
-+
- 		if (!csfailed) {
- 			rts->tsum += triptime;
- 			rts->tsum2 += (double)((long long)triptime * (long long)triptime);
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/iputils/iputils_20240905.bb b/meta/recipes-extended/iputils/iputils_20250605.bb
similarity index 95%
rename from meta/recipes-extended/iputils/iputils_20240905.bb
rename to meta/recipes-extended/iputils/iputils_20250605.bb
index 64d58a91c2..a62ea65ba8 100644
--- a/meta/recipes-extended/iputils/iputils_20240905.bb
+++ b/meta/recipes-extended/iputils/iputils_20250605.bb
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=627cc07ec86a45951d43e30658bbd819"
 DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
-           file://CVE-2025-47268.patch \
           "
-SRCREV = "10b50784aae3fb75c96cdf9b1668916b49557dd5"
+SRCREV = "6e1cb146547eb6fbb127ffc8397a9241be0d33c2"
 
 S = "${WORKDIR}/git"
 
-- 
2.49.0


