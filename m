Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A30C433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 15:42:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.13530.1636040550987204749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 08:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cDwpXTJa;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 71so4857861wma.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yuE6RlzD6n/iruEF0Umc6BQK/dhZvs9/Ic222mh/jX8=;
        b=cDwpXTJan/SuMR29Fn4Jc1jPwVXqKGR+GYrvxk9vvRLesSpDRkufo0vEWciFzpfSFI
         A5CdbvJIQEmSqDMSd0HsczM0BBHX8EMvLFSHZI77UjMxWHFnWeB+6xN8bsyN/FEBSXcI
         19wzQp20K6UulmAGLU3uTIGNUbNwTINURShFu8Ro5mLFC2/DAwDv3B/BvHVjuMGiaQkQ
         1xQFABAej+peu5o2SFMjTlES5iFYtSfwh98ia/V48rdpxJpQjZDzrh2T96hS5S0k+I9a
         qZvg61G31iwIqJ+FjQ/vRBMmksOFWJIa+LKrh+567ndjDHYTpx3Ij9UMs3EPtfs8KJsY
         Otkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yuE6RlzD6n/iruEF0Umc6BQK/dhZvs9/Ic222mh/jX8=;
        b=KlY5fR4dknrFpkN1CIzI5vO/UCCYbOUpcwXnLdZH9uMpw9kOLqAUGg67930vWN4A/j
         g3Y2wL5/gKKon6zzPWVXXjW6ysgqF79SnUmkpZzram++a1JfjfxtKbQZVGJM7S5qgVge
         D/O+dn0sgnGm+uZe0cmFc4ZCv0DBM5yaxLFG+MUJ1y1fuA0ZisbQDAcJ6QC04nINrePJ
         QYqW1lb57rtOnOXgNm0NzpzpSuSb05giNBTlY4K5JsESmYxgNz2coXXMHEtYKdAGOjSJ
         u8dOIMI24vohLfLsZ9OMlS/2fnagazkRdHvSTkQx9IrKoIsLHLe6RDQWv7NhnzDxVNik
         jbNA==
X-Gm-Message-State: AOAM530YCoRfh8OwRnytK2GQ8H5xElAGfYcIEth3L4qdp1U+jCXZd53B
	WB9hspmG3YaB1ZxYiNjMObfxJ4z8Hvs=
X-Google-Smtp-Source: 
 ABdhPJykT/Q+osOaGpzlCy7FLBnGBmM7zQl/luQ25FyvmXrGFnNyKI3yZ8Z2nQVvy6ZjUeDGGYOKYw==
X-Received: by 2002:a7b:cc8f:: with SMTP id
 p15mr21161749wma.158.1636040549099;
        Thu, 04 Nov 2021 08:42:29 -0700 (PDT)
Received: from CTW-01195.. ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id
 c16sm5249628wrx.96.2021.11.04.08.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 08:42:28 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] sstate: another fix for touching files inside pseudo
Date: Thu,  4 Nov 2021 15:42:21 +0000
Message-Id: <20211104154221.57948-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 15:42:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157851

This patch is a fixup for 676757f "sstate: fix touching files inside pseudo"

running the 'id' command inside the sstate_unpack_package
function shows that this funcion run inside the pseudo:

 uid=0(root) gid=0(root) groups=0(root)

The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]
will always return true and the touch can fail when the real user
don't have permission or in readonly filesystem.

As the documentation refers:
- the file test operator "-w" check if the file has write permission
(for the user running the test).
- the file test operator "-O" check if you are owner of file

We can avoid this test running the touch and mask any return errors
that we have.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8182010047..e4d58639f3 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -900,12 +900,12 @@ sstate_unpack_package () {
 	fi
 
 	tar -I "$ZSTD" -xvf ${SSTATE_PKG}
-	# update .siginfo atime on local/NFS mirror
-	[ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
-	# Use "! -w ||" to return true for read only files
-	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
-	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
-	[ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo
+	# update .siginfo atime on local/NFS mirror if it is a symbolic link
+	[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
+	# update each symbolic link instead of any referenced file
+	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
+	touch --no-dereference ${SSTATE_PKG}.siginfo 2>/dev/null || true
+	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
-- 
2.33.1


