Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FB0C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 19:51:05 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.48738.1742845861024530891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 12:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QGRQ3wfq;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2260c91576aso81652525ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 12:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742845860; x=1743450660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AaS0K1cwbQkCJAUM3XSUHo6qofUNQEwIRPtF3NaMen4=;
        b=QGRQ3wfqN+Bv3DWeb2CE/FJGbjuqT8lNMIOeNrAXGOUktivg492XLIC2GHTN1HjNVI
         0ymPTOSJwkWz1hkVOACxWLq/9uV4/zYANuCRJt0Gk8cLQI40kf5hHLN08VcH/sU1uyhb
         GyZXYWjge0VhoF8W/NUGN0W6jZX5MtULcOgUQo+NvufKeru5Lopmq9CXiSnvU8S8rG8h
         7cq9nzuOngk2crKR5mf9woi5sAQ24vt/jnbYzgidPl3/M7bsOpHBqE40a0pRXj441vtr
         upnQqmo5THJ7PYOp/JbrCudlr3GmKqXQwFL5lTjm2/LS0TojtIUm1GSBb/AwPkPthBWZ
         tc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742845860; x=1743450660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaS0K1cwbQkCJAUM3XSUHo6qofUNQEwIRPtF3NaMen4=;
        b=p/67xY+wC3RMDLdrC8sTJeqO1z+rLVfCiwq6C0zjazNzBHaaq3muQjg7Nc+mWwjNZ+
         JOJJWaX9T6SNqOCsyVRcEwDv3QGpHSHHlaMAKGMIAFXCLWaCK5HKLQQDXNRQV9FLac5n
         IorckqP60xR9uUr6ObLE5VCauuokF7nzNp91Gw2rfFBkhB4btvdrSvUpsi7VIHRTRRqv
         aIejFbt+Mf50JOGwOHe+iCOJ+5V3K12qh3LuOIx1qdzzUsSJ38Ky4BkYRJ4/KM0+t+j9
         FC3UPINOGL6dXrpJzvfbyIIsCDSJ+M1C6UtU7pEkh4jEfMx8nFRxE8ZtovmELSaXKxOf
         v+qA==
X-Gm-Message-State: AOJu0YyrGcyqfyfYyqrVyw3Fx2dPwVH3AX3XrDuEydqPWSrbiPEOFa1s
	LQryEKk5W5DSrndIANO2ute1U/sDwQFjOAOzbiSPNZlyEE3WlBHdZXvpoavg
X-Gm-Gg: ASbGncsqnSvHxiAecA9okx9wdEGqmJP5R7aU1Tc2RkMzYg83/Culf7KE51XsAuv7oUP
	irUO+1uY6LGdcc6ta605KaUXUe2sWvBO54yEodgSLcEPtXm5eYSjT30Qok+PrtCDnqaSc1qXMiH
	4s1rlh/Ng4LWLOaWrcpIT82Bq6XDJl12LwMGFx0acv+mst5KbweGSLzehzeGClOD6J8XYz6XAC/
	CBR88eIEmIfzpspSzvqUOhiO8rqgrq3bavCeL3FjKAu4nSUVF8U15t88kbRMxnaOqay15600p3v
	FGlGwI7OHx6wdWx6YkCil0erE5PWlqGT1Tergoan5F9IH9Y=
X-Google-Smtp-Source: AGHT+IHmEQFlBfjO8frvzXdpox7Z50RMZE9h9tv7eL3Pd7CNLhRpnoaEPJdrBbAyYkVTdgdMMTUrsg==
X-Received: by 2002:a05:6a20:3d89:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-1fe4330dcf3mr23999818637.42.1742845859926;
        Mon, 24 Mar 2025 12:50:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4da80sm7561549a12.74.2025.03.24.12.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 12:50:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v6] man-db: Add missing rdep for col utility
Date: Mon, 24 Mar 2025 12:50:57 -0700
Message-ID: <20250324195057.1418731-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 19:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213580

man utility calls col utility internally when formatting is asked for
therefore it expects col to be in rootfs otherwise silently errors with
retcode 3 meaning 'file not found' in this case its due to col not being
found, other distros eg. gets this via bsdextrautils dependency

Add it via packageconfig and keep is disabled by default since its
deprecated and col does not exist on musl

libssh2 ptest mansyntax.sh fails due to this error, which now works

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v5: Turn col into a packageconfig and drop zlib from deps
v6: Turn col packageconfig off by default

 meta/recipes-extended/man-db/man-db_2.13.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index 6e7af950fc2..750263f99ed 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -23,7 +23,11 @@ inherit gettext pkgconfig autotools systemd
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_system_unitdir}"
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
+PACKAGECONFIG ??= ""
+
 PACKAGECONFIG[bzip2] = "--with-bzip2=bzip2,ac_cv_prog_have_bzip2='',bzip2"
+# util-linux col is deprecated and only builds for glibc
+PACKAGECONFIG[col] = "--with-col=col,--with-col=,,util-linux-col"
 PACKAGECONFIG[gzip] = "--with-gzip=gzip,ac_cv_prog_have_gzip='',gzip"
 PACKAGECONFIG[lzip] = "--with-lzip=lzip,ac_cv_prog_have_lzip='',lzip"
 PACKAGECONFIG[lzma] = "--with-lzma=lzma,ac_cv_prog_have_lzma='',xz"

