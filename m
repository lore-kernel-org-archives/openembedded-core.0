Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6E8C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 17:54:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.14129.1664301256837217290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=U5BdLa60;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id w10so9742749pll.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=2IFwqiyDrHRmn4mbb2Bx6VgXKO6C3657WYe/r2yrvzQ=;
        b=U5BdLa60k1KIR23BuHALfC2rkijQ33rpg+IMYWBvBjZ1HKghzV7mAEHiLG+qFdeQLn
         Ar6PStEVoNcE3EOM8sCqm+JGWEUWisMyjCJUI/BO95nqyRSd1ciTraXNlFI6EMKVPcp+
         T3aD8wEbMJOD44vEC336b8iAmcyrOJdQFr1wWT2ayztgyWf2yujXdDQCDIV2SQcP7k78
         T3yrnowh7b5AOdJcwK/w//6HXNWAZprshtlbzvXbKa8XWJ7qvMq4vu1U/w4CA8MsJzmo
         6qLJWkkz5ZTTjTGiGsePefh6ldo8CUOHhZfU3fYRuFcltjtCEmZn6X1CoW8GDA9Ydrjb
         RF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2IFwqiyDrHRmn4mbb2Bx6VgXKO6C3657WYe/r2yrvzQ=;
        b=eXTVxj13yJqPli6AKdk8WbNFNBL31igkUT0bCljgYMuAm5huTU87g82x4CuEjQzXQI
         FDozzj3qp0S5vKw/WbYKFbXvGIkplllSzrZwYfQMpcs15Zd3FiiLiAPWm1/Xqgxfrrp8
         seyq0HMtcF+zLpW8v31jcTuxqegdCci2SQhOk6HTpHLCTE2xxLKIIDhV3lXiv/1Zf1Na
         /qONyzPzKQDGaZIRno/gK7YdrFNiEBuMprKvYOn6i/yC8IF1I0kvHDz/sioPpcv01rsd
         vK2uXsRtrJdxjaRDWPDxw5/yjz3ZHCPRg/k/wB5H6hqmzZnZsA6OZts+xWnck8pSE4o2
         iOTA==
X-Gm-Message-State: ACrzQf37YQ9BtAyTUaQC2RMH/N7lU78EnRHA8nkIbA8viVbiqz2Q6cJ+
	vS53X7dApdPRuTReftBfR28VD7ksXg3Z9fvS
X-Google-Smtp-Source: 
 AMsMyM6L8v9A2qheW7g/Shakyii3uVHZV7LFx83GQNR30DUIxuIOBeDgDvUEVCt37QtJ6dd4QIV9kA==
X-Received: by 2002:a17:902:ed4d:b0:178:9702:71fd with SMTP id
 y13-20020a170902ed4d00b00178970271fdmr28285278plb.162.1664301255751;
        Tue, 27 Sep 2022 10:54:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w189-20020a6262c6000000b0054094544ae7sm2051468pfb.60.2022.09.27.10.54.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:54:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/6] inetutils: CVE-2022-39028 - fix remote DoS
 vulnerability in inetutils-telnetd
Date: Tue, 27 Sep 2022 07:53:54 -1000
Message-Id: 
 <1c385e70d4bfab2334361ba82f29988bb11d6902.1664301116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664301116.git.steve@sakoman.com>
References: <cover.1664301116.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 17:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171117

From: Minjae Kim <flowergom@gmail.com>

Fix telnetd crash if the first two bytes of a new connection
are 0xff 0xf7 (IAC EC) or 0xff 0xf8 (IAC EL).

CVE: CVE-2022-39028

Signed-off-by:Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../inetutils/inetutils/CVE-2022-39028.patch  | 54 +++++++++++++++++++
 .../inetutils/inetutils_1.9.4.bb              |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
new file mode 100644
index 0000000000..da2da8da8a
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
@@ -0,0 +1,54 @@
+From eaae65aac967f9628787dca4a2501ca860bb6598 Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Mon, 26 Sep 2022 22:05:07 +0200
+Subject: [PATCH] telnetd: Handle early IAC EC or IAC EL receipt
+
+Fix telnetd crash if the first two bytes of a new connection
+are 0xff 0xf7 (IAC EC) or 0xff 0xf8 (IAC EL).
+
+The problem was reported in:
+<https://pierrekim.github.io/blog/2022-08-24-2-byte-dos-freebsd-netbsd-telnetd-netkit-telnetd-inetutils-telnetd-kerberos-telnetd.html>.
+
+* NEWS: Mention fix.
+* telnetd/state.c (telrcv): Handle zero slctab[SLC_EC].sptr and
+zero slctab[SLC_EL].sptr.
+
+CVE: CVE-2022-39028
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=fae8263e467380483c28513c0e5fac143e46f94f]
+Signed-off-by: Minjae Kim<flowergom@gmail.com>
+---
+ telnetd/state.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/telnetd/state.c b/telnetd/state.c
+index 2184bca..7948503 100644
+--- a/telnetd/state.c
++++ b/telnetd/state.c
+@@ -314,15 +314,21 @@ telrcv (void)
+ 	    case EC:
+ 	    case EL:
+ 	      {
+-		cc_t ch;
++		cc_t ch = (cc_t) (_POSIX_VDISABLE);
+ 
+ 		DEBUG (debug_options, 1, printoption ("td: recv IAC", c));
+ 		ptyflush ();	/* half-hearted */
+ 		init_termbuf ();
+ 		if (c == EC)
+-		  ch = *slctab[SLC_EC].sptr;
++		{
++		  if (slctab[SLC_EC].sptr)
++		    ch = *slctab[SLC_EC].sptr;
++		}
+ 		else
+-		  ch = *slctab[SLC_EL].sptr;
++		{
++		  if (slctab[SLC_EL].sptr)
++		    ch = *slctab[SLC_EL].sptr;
++		}
+ 		if (ch != (cc_t) (_POSIX_VDISABLE))
+ 		  pty_output_byte ((unsigned char) ch);
+ 		break;
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index f4450e19f4..fe391b8bce 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://0001-rcp-fix-to-work-with-large-files.patch \
            file://fix-buffer-fortify-tfpt.patch \
            file://CVE-2021-40491.patch \
+           file://CVE-2022-39028.patch \
 "
 
 SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
-- 
2.25.1


