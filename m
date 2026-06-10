Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B23CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 20:59:55 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31321.1781125188946938041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 13:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OhFayWsd;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: danismostlikely@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e6d37b7098so5755369a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 13:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781125188; x=1781729988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1poMvvM9Xw70SW1xAK9cq/3v4Eo0RuP0U1W/T7t5cQ4=;
        b=OhFayWsdUY0lLdqtzIjbl96u2xHl2hMiGXpXs1AvyAxgDk/HuF2/D6Mf5SrJ9vbgpl
         FNlq6pypaVo47hKF/Oe6iRkSiP9Mpbyag8z2IlkY61NxVrs9FqfdKNcogWIpLZG1Khv3
         ihuZekAOwlfRXH1ULz6S82bqHBjOB6xnqCrG/yWtbiVgj2asidcVbb4CZCsaJ95aNQ+s
         N6P/dRIuNzmv+ClRUABi0RXlJ2KpGNc7/H8bCpfbr1CLiaN7pFO8EP7Tm0iiNA+KWvVt
         vreTSSSsGzNm700PUCgdKhk+E2WI/NGHo52+ylB1F7Lol4qR8I58i8kwZ/JJj2IZzCKa
         HhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781125188; x=1781729988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1poMvvM9Xw70SW1xAK9cq/3v4Eo0RuP0U1W/T7t5cQ4=;
        b=a6YatIhDWxSA5fMblUzse+ljWGCqf1DNkY1dHNksIDcuG0L5Ys91kA2xQyv+JVd4CC
         QIAsZoRMJVYBUYjlXQ2nQl+EgKw44frXCQP8h1o5lEHjyTOL1DJxJu6Yyng1IkybKhkV
         6kqEyImCbINtUCzT6T7Xn+vRKKYETTtzzHdxH0fFNDacm8mk0uOfEaCO/nEaDce9pL/I
         MotYxJpvpJu2YKbGCBdBbs782GaFa0a8dz9/adPaYc2gYGcLFEOFS/Na2WS4XmoZt5Yg
         +zitlDHM0vltSSr1Dhj+Ul+ne5cJC7xLkLDg9jg3sNES8fxL99YEbqDIWSBN6eqGpcWE
         ywxg==
X-Gm-Message-State: AOJu0Yyr0iS/r35zL2l++BnjarVRYS8JiaVQt8py14ksdAMnpO9IaT0u
	TsULQmQfzyijYsZjdV+4cdxW2roRsgU0wIrhn6bInuIjUnYGDYrr75SyWwlR/o0D
X-Gm-Gg: Acq92OGypBZhva9ZaO+vgW/g/Sre6Aq5wvpXu2GbVEfe15VhtZB65FGG/jMiR5y1dFj
	kjXgB/GgX0VNuJjY+fB3rY2IQ0MlJPxb+9ADyAxoIQ3I1xwPWZXZV2dhhyvaTqmikNyT5XTsKs5
	jhb9AZL9G3WU7YKZ2bN9DXyXrSqT9G9f1p9DTN72jcjWKyNPdWjnV/fGC88WjE6AXSNEGhn80tb
	h2z5gnHyve5UOKV2+5P/y1V6UeK0tAhLMfBYiXEDJdPIIb10yaDndywUuLY3Af6KHC+WbAjEJ71
	FrpZ5z5Gtq/4Z5dFRcQuSKAncuLETWyK/sgMOJccBoLy1vwoWAxnLlrPnUdRq8t9o7YE+7QIxy1
	pe+1cP+2jQmlQeLlNHqz+3HYv4aNotZ83Ir8YLMmu69HRvYVBg7K7u77JN9aqgTRT/zEqx/PGGk
	DVlgTDEKG1GrGEouk8pImvZ4PkWKfPjJtExEApzpN9k3jOlgFIZ49NnRHfI4JbhO2RiQ==
X-Received: by 2002:a05:6830:83b6:b0:7dc:4a43:fb5c with SMTP id 46e09a7af769-7e70c6d907fmr18056947a34.11.1781125188097;
        Wed, 10 Jun 2026 13:59:48 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e7468f8fsm17620034a34.6.2026.06.10.13.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:59:47 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <danmcgr@protonmail.com>
Subject: [PATCH] dejagnu: Remove references to some home directories
Date: Wed, 10 Jun 2026 14:59:12 -0600
Message-ID: <20260610205912.1798968-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 20:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238393

From: Dan McGregor <danmcgr@protonmail.com>

The recent buildpaths qa check that adds checking for home directories
introduced an interesting corner case. If a user's home directory is
/home/dan or /home/nickc, dejagnu failed the qa check, since it hard
coded those strings in its sample board configuration. Fix this
by replacing the sample strings with other non-home paths.

Signed-off-by: Dan McGregor <danmcgr@protonmail.com>
---
 ...directory-references-in-board-config.patch | 56 +++++++++++++++++++
 .../recipes-devtools/dejagnu/dejagnu_1.6.3.bb |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dejagnu/dejagnu/0001-Remove-home-directory-references-in-board-config.patch

diff --git a/meta/recipes-devtools/dejagnu/dejagnu/0001-Remove-home-directory-references-in-board-config.patch b/meta/recipes-devtools/dejagnu/dejagnu/0001-Remove-home-directory-references-in-board-config.patch
new file mode 100644
index 00000000000..ded9f173b31
--- /dev/null
+++ b/meta/recipes-devtools/dejagnu/dejagnu/0001-Remove-home-directory-references-in-board-config.patch
@@ -0,0 +1,56 @@
+From 5c809dfceb13faeaacaa096de816d74428f72efb Mon Sep 17 00:00:00 2001
+From: Dan McGregor <danmcgr@protonmail.com>
+Date: Tue, 9 Jun 2026 13:21:49 -0600
+Subject: [PATCH] Remove home directory references in board config
+
+The OpenEmbedded sanity checker finds a build user's home directory
+in the configuration files. If the user happens to have a home directory
+named "dan" or "nickc", then this check fails. Instead change the
+defaults to point outside of the home space.
+
+Since these are samples, it shouldn't harm anything.
+
+Upstream-Status: Inappropriate [OE configuration specific]
+Signed-off-by: Dan McGregor <danmcgr@protonmail.com>
+---
+ baseboards/gdbserver-sample.exp | 2 +-
+ baseboards/mcore-moto-sim.exp   | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/baseboards/gdbserver-sample.exp b/baseboards/gdbserver-sample.exp
+index 16f9483..a3e89b2 100644
+--- a/baseboards/gdbserver-sample.exp
++++ b/baseboards/gdbserver-sample.exp
+@@ -31,7 +31,7 @@ set_board_info rcp_prog /usr/bin/scp
+ set_board_info protocol standard
+ set_board_info hostname voltaire.debian.org
+ set_board_info username dan
+-set_board_info gdb_server_prog /home/dan/gdb/mv/obj/gdb/gdbserver/gdbserver
++set_board_info gdb_server_prog /usr/bin/gdbserver
+ 
+ # We will be using the standard GDB remote protocol
+ set_board_info gdb_protocol "remote"
+diff --git a/baseboards/mcore-moto-sim.exp b/baseboards/mcore-moto-sim.exp
+index c5a4b97..06c0cdd 100644
+--- a/baseboards/mcore-moto-sim.exp
++++ b/baseboards/mcore-moto-sim.exp
+@@ -59,8 +59,8 @@ proc sim_spawn { dest cmdline args } {
+     ## XXX - fixme - this should be automatic based on the
+     ## multilib option.
+     ## XXX - fixme - this should not be hardcoded.
+-    set sim "/home/nickc/bin/linux/sim-be"
+-    #   set sim "/home/nickc/bin/linux/sim-le"
++    set sim "/opt/nickc/bin/linux/sim-be"
++    #   set sim "/opt/nickc/bin/linux/sim-le"
+ 
+     set simflags "-m abi"
+ 
+@@ -133,7 +133,7 @@ proc find_sim { target_alias sim_dir sim_name } {
+     ## XXX - fixme - this should not be hardcoded.
+     ## XXX - fixme - this should vary depending upon endianism selected.
+ 
+-    return "/home/nickc/bin/linux/sim-be"
++    return "/opt/nickc/bin/linux/sim-be"
+ }
+ 
+ set_board_info is_simulator 1
diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
index c6002d5e45a..ea5c21e709b 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
@@ -11,7 +11,9 @@ RDEPENDS:${PN} = "expect"
 
 inherit autotools
 
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://0001-Remove-home-directory-references-in-board-config.patch \
+           "
 
 SRC_URI[sha256sum] = "87daefacd7958b4a69f88c6856dbd1634261963c414079d0c371f589cd66a2e3"
 

