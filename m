Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.6251.1586155981927525245
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 23:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pzU4rVe0;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id z3so6043925pjr.4
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2020 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8mdhvG7OveDh+m5SaR1n6s3iIk6/80Mkmr3NK5ajnLc=;
        b=pzU4rVe0kD2GlgqUwHx48rm0KUAnFQnxjpdZ7jCYXuqisd/it4kjM/3lKEBQ44Ygj3
         M6SHPlQh3D9FQFeP78U/6IZHsAJ2fpDKgyX4cvHBRNWKF7JLGhOiL8+JUL6E2yqSVPqv
         IGMkPLKO6tn8ouB4uWVl+KbZgujJu8mlC6INSVNtK/h5ozKbOHFJdvELparTNoNNGEiH
         FCsP5cJLioAT7944btOMXgDonCZ3TXOCEpQZYD7C4UQSBKeFTNH4Jngujm9QJDWIJ/VB
         TUj/MjkM8F+YArPrAZKTIw+DVzudYAMIIUAf1sYDk8O7zAD9ztoxZXva9tVXoCURcfCI
         FgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8mdhvG7OveDh+m5SaR1n6s3iIk6/80Mkmr3NK5ajnLc=;
        b=ZhSDWYwxWGQ9PvqJBoiJhjonUjcGAlhcdOm01jqZwoxnvqpbbtg8NAZu2RC3lhQnjE
         SIiOEdiPkEwfNcwuLfNVcdgPmnacJaAp4zW++5r9SpLuuVHAomOHqHY78S8yvOo03Rjy
         +ObtWagisdjKMazpLdiBqU+g1+m42ucZqs2OLldW4MZ2kA1pdsFtxTckbm0xdDBmaTOx
         5POPKDCTZjB+KGM/5+dVpAaQhHb8gwAz5UXr+AUfzfMaIsWPkYpx5jsaHXmAw2EFT1yX
         lqHOOGnYHPUINjIvTnt1NMkH7ZDdrnsxR1ie5aAsOvTp40s6PyMco7+/JjgVVkgVcSqA
         5myw==
X-Gm-Message-State: AGi0PuZVg9b5i5mXlOpUBXAUZWUYlwUC4DFITaTXaQj1IkcLqOqeEVbT
	cL7qVT02IIo28BUoTUQA4Ba+qHB3a8E=
X-Google-Smtp-Source: APiQypJ0/jnRxUKN2UommBRWU5eru9WYygASJpvBc8rz17XHXC5EkYb5DAuT/ujAKaFbnTZwcle2bw==
X-Received: by 2002:a17:902:b94c:: with SMTP id h12mr13967420pls.55.1586155980752;
        Sun, 05 Apr 2020 23:53:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id c128sm10733585pfa.11.2020.04.05.23.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 23:53:00 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] systemd: Package systemd-hwdb-update.service into udev
Date: Sun,  5 Apr 2020 23:53:14 -0700
Message-Id: <20200406065314.1641984-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, this unit is packaged into udev-hwdb which then adds it as rdep
instead of rrecommends to systemd itself, this meant that even if we
added udev-hwdb to BAD_RECOMMENDATIONS, it would not be respected since
its a rdep, therefore move the service unit file into udev package
instead, this decouples the hard runtime dependency and restores the bad
recommendations expectations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/systemd/systemd_244.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index a68597284e..341ac6bbc5 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -628,14 +628,15 @@ FILES_udev += "${base_sbindir}/udevd \
                ${sysconfdir}/init.d/systemd-udevd \
                ${systemd_unitdir}/system/*udev* \
                ${systemd_unitdir}/system/*.wants/*udev* \
+               ${base_bindir}/systemd-hwdb \
                ${base_bindir}/udevadm \
                ${base_sbindir}/udevadm \
                ${libexecdir}/${MLPREFIX}udevadm \
                ${datadir}/bash-completion/completions/udevadm \
+               ${systemd_unitdir}/system/systemd-hwdb-update.service \
               "
 
 FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d \
-                   ${systemd_unitdir}/system/systemd-hwdb-update.service \
                    "
 
 RCONFLICTS_${PN} = "tiny-init ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolvconf', '', d)}"
-- 
2.26.0

