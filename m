Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.845.1594064563300032394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 12:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bjarne.michelsen@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id w16so43939756ejj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 12:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6fAbFMsqutLXCwMW/8bC1kAej6R7PYDvyx2xP+QZKRE=;
        b=SU2NliGgEzMadeARdYSZ2CG+99C5JpS8oKqSZxLZDEdAJ8YI+y/FF7Z4rt1YGmvsZW
         M+r/t4Qde+OWeZuH6zedBFzlyI6R1GgF2cO+xdgMUrZKDq6MtcbjdohReiYbkY8+yr3T
         MgB4NslEvVjdwVPcLu5lWfrqHlkB5mPsyZfi7QmXvoePhkObOYh/kgK8KvONCmcC68kP
         YKkGaAehNe6VSNuWiPeaM7OxXyPRoRjLwv0F5ozpQT/kN6IrdpQRhKJovAXCPftT86g4
         KrgRjLnOjMTrJ+W1l7pS4Iqv6cdJudt0EQ1TtAuXoaaYabrMwAW6DMhrENQZJdn8ddbV
         NerQ==
X-Gm-Message-State: AOAM532CY743YQi1YAgBfFdZV38AhOP4X2uF6eUlYS0AwcQKxSkobe2V
	uFKEl9RyE8J2CI21JPiKgXhoy7UEpaQ=
X-Google-Smtp-Source: ABdhPJywp1I2SWQalUxO5fHxfgfCFShsqg1Rl3ohR2Tn2UfFt2OwTEV6qsJz9ksPbRq5MqFcnkS68Q==
X-Received: by 2002:a17:906:4f09:: with SMTP id t9mr43921655eju.110.1594064561516;
        Mon, 06 Jul 2020 12:42:41 -0700 (PDT)
Return-Path: <bjarne.michelsen@gmail.com>
Received: from bjarne-ThinkPad-X1-Extreme-2nd.fritz.box (ip5b402d63.dynamic.kabel-deutschland.de. [91.64.45.99])
        by smtp.gmail.com with ESMTPSA id e1sm23938236edn.16.2020.07.06.12.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 12:42:40 -0700 (PDT)
From: "Bjarne Michelsen" <bjarne_michelsen@hotmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Subject: [PATCH] devtool: default to empty string, if LIC_FILES_CHKSUM is not available
Date: Mon,  6 Jul 2020 21:42:26 +0200
Message-Id: <20200706194226.4892-1-bjarne_michelsen@hotmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Bug 13971] https://bugzilla.yoctoproject.org/show_bug.cgi?id=13971

A recipe using LICENSE=CLOSED would normally not have LIC_FILES_CHKSUM
set.
If LIC_FILES_CHKSUM was not set, it would cause `devtool upgrade` to fail.

This fixes the issue by defaulting to an empty string if
LIC_FILES_CHKSUM is not found.

Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
---
 scripts/lib/devtool/upgrade.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index ebe72282bb..0c1de8cdc7 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -550,12 +550,12 @@ def upgrade(args, config, basepath, workspace):
         try:
             logger.info('Extracting current version source...')
             rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
-            old_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
+            old_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
             logger.info('Extracting upgraded version source...')
             rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                                     tinfoil, rd)
-            new_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
+            new_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
             license_diff = _generate_license_diff(old_licenses, new_licenses)
             rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
         except bb.process.CmdError as e:
-- 
2.20.1

