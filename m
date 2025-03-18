Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CE0C36001
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.4279.1742272744638945904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nz/kd2be;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22349bb8605so110704545ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272744; x=1742877544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ05rwQLgpD4nQtUXB+ZH8/aCYggtjCAeomRqpq1MPI=;
        b=Nz/kd2beIOdUWM/UPbolUONiw8BDSm6TNMXUeNJ423XpF1thq3DqR2Ux+MvuYb1T7e
         2+OEoyDIvKmMSOR3S/IZIE8U0yFNtFzc63l/WrrpsHYsHUZ5Jpx7z21rScXRryydo5jp
         uFHXF2c1gszG0MDuC6laGSZSakPGP+TYjHtArYqZgDZe73Pr4PI+cjDRvebbNLcOVpPQ
         SQeXjysChzN1Rp11XXoYVtAEUupdBtvVPR08VJf+cVJX4MQe6VCMn6QHC3jJpH4GHAOe
         XeiJ5vHHAVUrZDp8LTTA+/PwiuAYw40fDiRDrs8Gpuvh3I84nsS/IwN7I2k5ucqsR7YP
         lMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272744; x=1742877544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ05rwQLgpD4nQtUXB+ZH8/aCYggtjCAeomRqpq1MPI=;
        b=hvcVMwG3HJnUlspDp0b4ecHdhJTSTzmsgJA7nrcvlAfYWO8LuWEnbBQW4Wo8Sn6lyx
         5R8zRVVkBhlWPyndW+WK+NgoqYs9T3vuxJwKWwlX2d3bXTnXL5W2sUnrkPrUenqHcGiV
         pckCAUZIYIOy8ecKklQkVdfWQAALXqk5qp0zRt4m9z4xj9pHTxVXZC6qjfPGgXcZJOS/
         1oDV5XwQ92YiLcImOWskjlNWtYPbYp2Hf9yrUWUjYz+WoMjnBaCED/Dt5bTDd5uckxkK
         V3hGCVSk+vczGsU1/ikcwC0ySNNSuEOtvwJbnahvrQ88qa9wjUabCo9fWmTUq61uL4i5
         PfKw==
X-Gm-Message-State: AOJu0Yybwc2vfk6PBKBdWtMhsgoqNUGXxwmKjFB7CFgG1JpFfFf6IKub
	wTIZW0255cY1DBw/olxNAGqpVHWR43OSetzTidqPVuiomD/3Vv70ACggi+sY
X-Gm-Gg: ASbGnct/LGvQVga0BKXca5pHnNM9WPPbryZocfXyJb53533zTF0Cw8mK7A/cn2wVEne
	jwCJ0kzVtpEXtDUnKnHKJMHeM45q6tkOda92u/UH7VaR7pRXJ/CJHGZQfybvocI26eXQSG0OsXU
	KePsd9q/zFYXn6JIfwpI+pGhQXht4Vc/27Vt8SgCdgf2TsPoVCyf4ygdaZn03f2m+5rsLdaB4vQ
	+1USBDScsVosFR9RQHnf5L9gOq8c6J0mDG6910QSh5Enmn6IQTCeVW3DIxQpBw5ot7nXdDu1JEt
	rPBtvkFKWv8IFgKManvK0fGhvoeGxjf7won9MCl3iCi59n0=
X-Google-Smtp-Source: AGHT+IFY4LtKeluA914UxwrxhXiUNnsk8Ku+WQzVPqSC5OgMwDelGP2RgxOfid8pfyKEp69LZ3MxKQ==
X-Received: by 2002:a17:902:b18f:b0:224:3db:a296 with SMTP id d9443c01a7336-225e0a28830mr133656545ad.2.1742272743845;
        Mon, 17 Mar 2025 21:39:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 16/24] ppp: Fix build when shadow is enabled
Date: Mon, 17 Mar 2025 21:38:36 -0700
Message-ID: <20250318043846.2422141-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213150

GCC-15 patch is not sufficient when shadow is enabled, therefore fix
the remaining issues.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-session-Fixed-building-with-GCC-15.patch | 33 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
new file mode 100644
index 00000000000..d95c72e96ba
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
@@ -0,0 +1,33 @@
+From 5edcb01f1d8d521c819d45df1f1bb87697252130 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 14:38:26 -0700
+Subject: [PATCH] pppd/session: Fixed building with GCC 15
+
+Fixed building with GCC 15 which defaults to C23
+and find conflicting declration of getspnam() here
+with the one provided by shadow.h (extern struct spwd *getspnam (const char *__name);)
+
+Fixes
+../../ppp-2.5.2/pppd/session.c: In function 'session_start':
+../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for 'getspnam'; have 'struct spwd *(void)'
+  185 |     struct spwd *getspnam();
+      |                  ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/ppp-project/ppp/pull/553]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pppd/session.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/pppd/session.c b/pppd/session.c
+index f08d8e1..9cc7538 100644
+--- a/pppd/session.c
++++ b/pppd/session.c
+@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, const char *passwd, const char
+     char *cbuf;
+ #ifdef HAVE_SHADOW_H
+     struct spwd *spwd;
+-    struct spwd *getspnam();
+     long now = 0;
+ #endif /* #ifdef HAVE_SHADOW_H */
+ #endif /* #ifdef PPP_WITH_PAM */
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 5565ce51cff..602f98991dc 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://provider \
            file://ppp@.service \
            file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
+           file://0001-pppd-session-Fixed-building-with-GCC-15.patch \
            "
 
 SRC_URI[sha256sum] = "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e8f701b8e55733cb2"

