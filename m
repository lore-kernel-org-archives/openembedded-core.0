Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web09.10495.1628177723132176849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BVO39raO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so5577002oti.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8hDxic32jbJ1YHAbS/PpK/ElVXAylNhzcIVYnihEM9Q=;
        b=BVO39raO9chqaOQ1kWTxBha1OTfVw0E6cpNVySN/Ps/cl7MoEVqV0oCfLxeM8tkETe
         CIkSwP4i8Rnw3EaFbTkAdBo9P6B2LiADMQNJ9WAaR1lkpD2AIJkQ2PB3FkIw6IDLqJWR
         0fB0zGF816qzi9YGDZfH/TsUmlyJtdoYpFAcrm+6U7QC01XnPTbcM7jGoIIxBx8qk+0F
         favgdSCFeyzVqiOMpfeKqp5/GZssnXip9xT+ykPgBPHFtKG3AUnup1Q2J1L5jv1Rd1RG
         pnhv2crxYzxoxgAGoX5OxsLoskcCWWPRnoUSkrwmkMeogOgNU/7rUH+lGf4axRy1lEDl
         ex/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8hDxic32jbJ1YHAbS/PpK/ElVXAylNhzcIVYnihEM9Q=;
        b=eIXa4Mcrh99en/x7RHhy0Pq8PWJW0ro8O22xx5mcLzrl3CvSzvJZMJYq6cQvKTnlhF
         kYqzbmPArryOSeNIN4lmYEnZ2d9aBxM22CTW/LvuscBl8eLvnLUZp+fbnE9tMRdlNqVy
         5R3/+quemdQ5bdzwWREXZuUg9yImJ9eNwC3H5cE+FtDLmy6sekd/RBaj0ecPNQenqCYu
         lfDiXkZ01sJKk+c1oziyxPzwlJx/452xO8kSd3GeZ5iMhjpxCrwcaHmMGHzjD4xzqo4K
         xe6PU/bZQhcLwW8k3jLiyVdrQu880rvxMzwifQF/OyU3jdH45b7J3TVa8azpULjLYj1P
         /PSg==
X-Gm-Message-State: AOAM5302v/uRD4YlN2OqEc7vabIAHRVKsyExRmdR+f9iRPs9Dj50aVkA
	LTa2CGTCSOTsbLy97BrWz0Fc9iOEg0Cd0qMk
X-Google-Smtp-Source: ABdhPJzHoDcNPuDIyfZ2ixzPSkvjtJAlrr1jOhZ32N/vdXl2e+fVd6SLL1JCig99VWLvFCzihRiBgw==
X-Received: by 2002:a05:6830:19:: with SMTP id c25mr4333298otp.176.1628177722065;
        Thu, 05 Aug 2021 08:35:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.35.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:35:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/33] avahi: fix CVE-2021-3468
Date: Thu,  5 Aug 2021 05:33:42 -1000
Message-Id: <7ca7aeb7c703bfa22c9f128849e11b62f93d81b5.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A flaw was found in avahi in versions 0.6 up to 0.8. The event used
to signal the termination of the client connection on the avahi Unix
socket is not correctly handled in the client_work function,
allowing a local attacker to trigger an infinite loop. The highest
threat from this vulnerability is to the availability of the avahi
service, which becomes unresponsive after this flaw is triggered.

https://nvd.nist.gov/vuln/detail/CVE-2021-3468
CVE: CVE-2021-3468

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi.inc     |  1 +
 .../avahi/files/CVE-2021-3468.patch           | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2021-3468.patch

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 6acedb5412..25bb41b738 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -21,6 +21,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz \
            file://fix-CVE-2017-6519.patch \
+           file://CVE-2021-3468.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2021-3468.patch b/meta/recipes-connectivity/avahi/files/CVE-2021-3468.patch
new file mode 100644
index 0000000000..638a1f6071
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2021-3468.patch
@@ -0,0 +1,42 @@
+From 447affe29991ee99c6b9732fc5f2c1048a611d3b Mon Sep 17 00:00:00 2001
+From: Riccardo Schirone <sirmy15@gmail.com>
+Date: Fri, 26 Mar 2021 11:50:24 +0100
+Subject: [PATCH] Avoid infinite-loop in avahi-daemon by handling HUP event in
+ client_work
+
+If a client fills the input buffer, client_work() disables the
+AVAHI_WATCH_IN event, thus preventing the function from executing the
+`read` syscall the next times it is called. However, if the client then
+terminates the connection, the socket file descriptor receives a HUP
+event, which is not handled, thus the kernel keeps marking the HUP event
+as occurring. While iterating over the file descriptors that triggered
+an event, the client file descriptor will keep having the HUP event and
+the client_work() function is always called with AVAHI_WATCH_HUP but
+without nothing being done, thus entering an infinite loop.
+
+See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=984938
+
+Upstream-Status: Backport
+CVE: CVE-2021-3468
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ avahi-daemon/simple-protocol.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/avahi-daemon/simple-protocol.c b/avahi-daemon/simple-protocol.c
+index 3e0ebb11..6c0274d6 100644
+--- a/avahi-daemon/simple-protocol.c
++++ b/avahi-daemon/simple-protocol.c
+@@ -424,6 +424,11 @@ static void client_work(AvahiWatch *watch, AVAHI_GCC_UNUSED int fd, AvahiWatchEv
+         }
+     }
+ 
++    if (events & AVAHI_WATCH_HUP) {
++        client_free(c);
++        return;
++    }
++
+     c->server->poll_api->watch_update(
+         watch,
+         (c->outbuf_length > 0 ? AVAHI_WATCH_OUT : 0) |
-- 
2.25.1

