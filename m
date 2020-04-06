Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.7329.1586164266921402311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oEyrmJau;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id d77so13883466wmd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 02:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7G7rCI2yj0O1MWGDqc0W0/90HaEkF+wuviiPinljoA=;
        b=oEyrmJauOR3RsnMnbgH1tShOEqQr22rFOr9QNJEB4dKcOoRJUW48cdkSUyZu6YWbE1
         Z3xwG+i8vegieGePJ46Q0b4avsX3JGGdwjfAIM7Hr0BCC08BydnBtjVb+kicDHRRYulu
         GY0uN+wpJCNlh66Y2VR6ApYp0OC8QkZpSGlb00BM9/zEE2UHVWtLR9NiGJwyCSUo0TgB
         4f1oqrjmFywE2pUFx060MS/oEiLiMMpswGluBN7NIg5g0Prwj66QcaqNPoXTUYe6wHDe
         izZKynuZ0s0ETVxYc8iWxqmTydawrs59wHJsgWsrpI5XJ1G3lLaXlqQAjz40mKq8Sb7S
         sY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=d7G7rCI2yj0O1MWGDqc0W0/90HaEkF+wuviiPinljoA=;
        b=A2vUFAU21tPZyvDV6Iv8WJBpiVJRAnWx43jfA25A/rQDFL+iN+OEIBRpmjWYwHPqLA
         Khu4i0UalARrVNDvgZZrfomZDdcZDajC0NmYbE3nVnZWt/L4jd3rWAtSCeXP6aZMBJwm
         w1DEM3lMCOn8mUve+AchBmW3/1EmwQwA/pDzowiixV8N7R+J4cY3wKyGQHqN0EjVRds2
         azoVRADfdRy+4qRaeoEj5Pe6A39vrcgaTkoApjSanURFZYxEsV9jhGYBupA8IHZ+NXtv
         zML5cf43wBzgwNx+jlYlMCoMRHShpMHp9aJv3xy9I9H93PNa2DikSCXoJYjskfolbit2
         m7MA==
X-Gm-Message-State: AGi0PuZN1xQ3SKtAEI4tGkSLiS5BdVP2slljCKwNvtN3Bc9wao/VpwYu
	llMpc/rhX5SmaNtp/ENpyQH8dk2wTeQ=
X-Google-Smtp-Source: APiQypICxNhb2n2Vh2WDDGCR1UuovhKK5aWp4PSdhfNxCRoovLZVubppSUQLAEZEB1jb4IKKLZSD7Q==
X-Received: by 2002:a1c:147:: with SMTP id 68mr22164203wmb.28.1586164265150;
        Mon, 06 Apr 2020 02:11:05 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a80sm12300111wme.37.2020.04.06.02.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:11:04 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Ribalda <ricardo@ribalda.com>
Subject: [PATCH] pseudo: On a DB fixup remove files that do not exist anymore
Date: Mon,  6 Apr 2020 11:11:02 +0200
Message-Id: <20200406091102.3367349-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ricardo@ribalda.com>

If the user decides to fix a database, remove the files that do not
exist anymore.
If only DB test is selected do not change the behaviour (return error).

Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
---
 pseudo.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/pseudo.c b/pseudo.c
index 0f5850e..d430a40 100644
--- a/pseudo.c
+++ b/pseudo.c
@@ -1087,9 +1087,15 @@ pseudo_db_check(int fix) {
 			int fixup_needed = 0;
 			pseudo_debug(PDBGF_DB, "Checking <%s>\n", m->path);
 			if (lstat(m->path, &buf)) {
-				errors = EXIT_FAILURE;
-				pseudo_diag("can't stat <%s>\n", m->path);
-				continue;
+				if (!fix) {
+					pseudo_diag("can't stat <%s>\n", m->path);
+					errors = EXIT_FAILURE;
+					continue;
+				} else {
+					pseudo_debug(PDBGF_DB, "can't stat <%s>\n", m->path);
+					fixup_needed = 2;
+					goto do_fixup;
+				}
 			}
 			/* can't check for device type mismatches, uid/gid, or
 			 * permissions, because those are the very things we
@@ -1125,6 +1131,7 @@ pseudo_db_check(int fix) {
 					S_ISDIR(m->mode));
 				fixup_needed = 2;
 			}
+			do_fixup:
 			if (fixup_needed) {
 				/* in fixup mode, either delete (mismatches) or
 				 * correct (dev/ino).
-- 
2.25.1

