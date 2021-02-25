Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.365.1614289132189505656
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 13:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OE4KlY1H;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id n28so5675406qkk.4
        for <Openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 13:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zX/0PqbFnjk/gyMnNbHLzOg/brVcS0hiMUJ5qm/+FmY=;
        b=OE4KlY1H3KUsrfQwU+dUOBdTUAFEWYv/Ev5jcrBiRhRepkGnGYzZgvRm0AftTDj03s
         4rczcR53cd7ffSDKIhdiAtdtfM6psz0428KhQSuDRzhKrdGYFSOM+hul0Je108UfC4Cp
         aILqaYiSJ4VzCw9mhNCrpM3k1bfksUa0tx2O6vgPk+a59fd+9V0h2yQ7/BotbIsMnzDP
         S1llkou2i+U4swuY87QZVIdbOgMjAkP5gfUHipfj6u1sqVcRBSoS1tFuQI8/7knL9843
         vXz2Plo+gMGNJGHywkcPVMJmEU6XuiFFPs9eQN+bz0fke88SZfm1gbJ/Spp+YiGuyIBM
         tDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zX/0PqbFnjk/gyMnNbHLzOg/brVcS0hiMUJ5qm/+FmY=;
        b=hYA9SzdZBqWtZ+m+4+wpz9fmU3PO9RDAG9GT+KLsb8+ma5JImUaVJM8GFKnZ2bSpRV
         vhvYZHRNuvUeAfXlNdWWerxcy1DfNs5g32iGVzVhWQvaovgLRjcI6kghR4XWBbyg7E0N
         BxmhH2UA/+AJ8OyTQDAfWuKFM2z+9+emfS0K3xzoPY8Yc7E5rInYIWKVI7vqb5Vx26Fm
         p4W6+65+HB22nMmBX5V/2+jdlNM7SnD65XqQyIGZpsrepWNO/1teqP5hNfQ4WBNmg5l9
         EbRuE6Kobtt+2sLvUgvgYtsQz1Vil37FW8e09sPzUxSqW2cxZdL2QqSA+N7exhqeEc2y
         wuVA==
X-Gm-Message-State: AOAM531W6v4QSBldTqikvJxddjv3skRE947O1jdifD+kArNjX4lLw4ST
	gjmtgye/TVp3HPBh2S2ZK3XgYDVMZCY=
X-Google-Smtp-Source: ABdhPJzya8deMpnMPqeDi3AOcCPZDW9midbjW/BuQZptTEFTHFRZpdcq9xC6Thp5ctuWeguL7YA/Zg==
X-Received: by 2002:ae9:df03:: with SMTP id t3mr4620323qkf.343.1614289131144;
        Thu, 25 Feb 2021 13:38:51 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id t16sm4378661qto.58.2021.02.25.13.38.50
        for <Openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 13:38:50 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] systemd-container: recommends StartExecPre modules
Date: Thu, 25 Feb 2021 16:38:48 -0500
Message-Id: <20210225213848.2744615-3-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210225213848.2744615-1-vdidelot@pbsc.com>
References: <20210225213848.2744615-1-vdidelot@pbsc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The systemd-nspawn@.service file uses the following line to try
loading the tun, loop and dm-mod kernel modules, in a non fatal way:

    ExecStartPre=-/sbin/modprobe -abq tun loop dm-mod

A non-zero return code from modprobe will not stop the service from
starting, but it would be convenient to inform the user about this
optional support, so add these modules to RRECOMMENDS.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 meta/recipes-core/systemd/systemd_244.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index 8a30d7d795..3314930e9d 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -451,6 +451,9 @@ RRECOMMENDS_${PN}-container += "\
                          ${PN}-journal-gatewayd \
                          ${PN}-journal-remote \
                          ${PN}-journal-upload \
+                         kernel-module-dm-mod \
+                         kernel-module-loop \
+                         kernel-module-tun \
                          tar \
                         "
 
-- 
2.30.1

