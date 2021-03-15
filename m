Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.9885.1615820589447004587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 08:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastree3d-com.20150623.gappssmtp.com header.s=20150623 header.b=t2lj9oWe;
 spf=none, err=SPF record not found (domain: fastree3d.com, ip: 209.85.208.46, mailfrom: adrian.fiergolski@fastree3d.com)
Received: by mail-ed1-f46.google.com with SMTP id w18so17733378edc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YC4Y9PuvSNdmVbfA1/36WtKyerIlpxDccZG23T4X9go=;
        b=t2lj9oWeBidLvFRHz9wlelzjik0z1GooU4gi6ilvvyqebXcOlbas1Y0/kILuVHgsho
         EzD0xqfura0wnjGoojnAuSEubQGOY+J82EA9kV8XoATeoYJR3M8JjtbQgHGxvYKO38Gr
         x77USU+0Ud2ibe8cGRqxksA3PQdB9xZ2jLT3gRaYwPnodZCAkiYpXOCFuxtJ4sXIIGW7
         TqdTmTZcZbs3A6+kOf+DVZfb8mezQgyJHhPwXZbX5hzEwhjbUTzNtcTBCG+OCZOVb1Tn
         1tJ27TnpKAhNWpzvrrwZO06Av+cFMMXNjt9UyFND8xbygbc3wgFF5qEx+QU3ej5WCQg8
         N28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YC4Y9PuvSNdmVbfA1/36WtKyerIlpxDccZG23T4X9go=;
        b=Od6NJmbIEaVT9tlq8YjmtXA8emnPgCrqjLzXY+q/aXRYEsTchJwaMJ0kXpFkaIuyDf
         +dbdWmqe4HbOtvUTVpL4znqmbYC6DFwIKtkpQ+E+2jG4oi6lauuJybM00l+TuBuVEaJ9
         3zzET65XKGh5Y58fOsPoRq/Xhr9QjsMaIBZ+4CXjK7Xqy0N+9iVbXhk5bw8QSBrExlpX
         032HWjZt7bsaF1Jp7PnR67pR5jyloceG3mWFV1ElCxFI85s6ZoK6Ww/tZrMdRa9Okbef
         ARs5DN+RArpYz62SdN0neSQLymIVvbJMoaCkvDsUfbUvuLWJ7g2lM6RdbCjTi7skccS7
         LQVA==
X-Gm-Message-State: AOAM530kG6CVqBjHRulsuBJIYnlECBKDq/n9jltIXo9xOH8vlnCLkV5b
	0FdV/JJqFR3GwE6uL0soQP6Sp7Fno97l
X-Google-Smtp-Source: ABdhPJzEnr1tfW+tpd11Wa10sNgIx65GbFKHi40An0W52cSnKQbunHNcWRrptsJudgb6+41XTNpfdw==
X-Received: by 2002:a05:6402:5211:: with SMTP id s17mr31009520edd.327.1615820583991;
        Mon, 15 Mar 2021 08:03:03 -0700 (PDT)
Return-Path: <adrian.fiergolski@fastree3d.com>
Received: from adrian-laptop.lan (8.237.197.178.dynamic.wless.lssmb00p-cgnat.res.cust.swisscom.ch. [178.197.237.8])
        by smtp.gmail.com with ESMTPSA id p9sm8073498eds.66.2021.03.15.08.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 08:03:03 -0700 (PDT)
From: "Adrian" <adrian.fiergolski@fastree3d.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Fiergolski <adrian.fiergolski@fastree3d.com>
Subject: [OE-core][PATCH] weston-init: Set $HOME variable for SysVinit manager.
Date: Mon, 15 Mar 2021 16:01:10 +0100
Message-Id: <20210315150108.270858-1-adrian.fiergolski@fastree3d.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 SysVinit sets by default the $HOME directory to "/" for the init scripts.
 It's picked then by the weston-launcher and make weston-terminal to have
 wrongly set $HOME environment variable for the root user.

Signed-off-by: Adrian Fiergolski <adrian.fiergolski@fastree3d.com>
---
 Sorry, the previous patch far wrongly formatted.
 
 meta/recipes-graphics/wayland/weston-init.bb   | 1 +
 meta/recipes-graphics/wayland/weston-init/init | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 65d7b81dc5..6b78e6722f 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -30,6 +30,7 @@ DEFAULTBACKEND_x86-x32 = "fbdev"
 do_install() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
 		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
         fi
 	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
 	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index d3e87c6cef..a849f29bcb 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -30,6 +30,7 @@ done
 case "$1" in
   start)
         . /etc/profile
+	export HOME=ROOTHOME
 
         weston-start -- $OPTARGS
   ;;
-- 
2.30.2

