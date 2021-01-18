Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.3320.1611009438464255338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Mjt8cOwj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id q131so676563pfq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tuRx9dTG7ohiN+Gz7JwxETcMHc/ELDXEoURe3MvSOQY=;
        b=Mjt8cOwjiNqoB9kDshmks05qKhDSXeNWKYs4cxsTP8mfOSoxhb3bNF3ZKfczCsJXaU
         DQkRdR3R0vPgUFaVrp/zV/KNlLaFBkPQ7g+XaAVVpai9kgeYb7QqjX34R1eON4gPHWs9
         j6UVZTtxa6CSPjTqWB4FqnoVbLtZKhgB7L2hpmXlO22s2LOm5+PgUgamKQP/J0N1Fvp2
         uNrIwosrhaBqtgid1QHB2BVZ4ODzTVyuyVwHnIwEXCzTp8TDpMt1R6nhCx0jVAHdzUjY
         4Walu6SHp15VNcb5TDwSBlNqjyGjAiideWu6VJ2CM7vwfAUtaoLsBukr6784KDCNdTZe
         LTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tuRx9dTG7ohiN+Gz7JwxETcMHc/ELDXEoURe3MvSOQY=;
        b=MluBLj5Kd1BVIG+eyL/6SJGr3wbAdQmDNfdc16IpBpjf/LBOELKetgh+3E7ued47WA
         FLbVpgFFvT8IIn7Q5jip5UzNJnbuAoARS0ZepvsJRDICAr/j0qHraDJWSPnVKGDj/IDX
         IlYiQlBPBG7aYETZZgbfD75q30OswIyCycMJmptFdmcC30SpAk3NSpiHg0vHoz7CiLAC
         ANBkaYW7fYwCgo6fVf9NdkGgFY3/qg6WTxUO2autfJA7jpYGKgXIePRbdIvoIBfvHcQb
         675XUu+z4Qqx0IzJ+dUTTmBCGHy2w3I/58XUW1ILoLx493R6+JsglzZ5MO7X77iriQ0y
         zLuw==
X-Gm-Message-State: AOAM533iRKkmBLgJTR9QWkWuS9bJpdwbHyVUTMcA3cyb1/l8FRG+nlaV
	dnFludoZTFpQ/CLg6AxbKTSrQby6p2eOMMTyyAo=
X-Google-Smtp-Source: ABdhPJxuBw5C+0koq3YR2eo5s9kZ8xkasGMEe3Syoez4hzaU8S5fIiWwlc+E/rIOyUR2nC2efAYpVQ==
X-Received: by 2002:a63:1865:: with SMTP id 37mr1711750pgy.206.1611009437366;
        Mon, 18 Jan 2021 14:37:17 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.37.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:37:16 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/19] systemd.bbclass: improve error message when a service unit specified in SYSTEMD_SERVICE is not found
Date: Mon, 18 Jan 2021 12:36:12 -1000
Message-Id: <7dfef3de5811002c7cab17c5eb2801e5a55a3a4d.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Chris Laplante <mostthingsweb@gmail.com>

The previous message was fairly useless without diving into the bbclass.

Signed-off-by: Chris Laplante <mostthingsweb@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ef6117b148be65536e89409a83cbfd22049c652e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/systemd.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 9e8a82c9f1..a4bff732b9 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -174,7 +174,8 @@ python systemd_populate_packages() {
                 if path_found != '':
                     systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
                 else:
-                    bb.fatal("SYSTEMD_SERVICE_%s value %s does not exist" % (pkg_systemd, service))
+                    bb.fatal("Didn't find service unit '{0}', specified in SYSTEMD_SERVICE_{1}. {2}".format(
+                        service, pkg_systemd, "Also looked for service unit '{0}'.".format(base) if base is not None else ""))
 
     def systemd_create_presets(pkg, action):
         presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg)
-- 
2.17.1

