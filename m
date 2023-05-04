Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E4FC77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 01:47:43 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.39663.1683164861083476261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 18:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=S4+Mtzn4;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b51fd2972so4209074b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 18:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1683164860; x=1685756860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bfhN3XnRzpYWFOY+ML3LCzLONL2B9ERTa/LW88DzbM=;
        b=S4+Mtzn4Ee5YzBg3yLD4NApVU3BW0t8X3YpFuR5+fcYde2dhwP/y8R9v9KPz48xOBR
         rBp9gi7BjtVygs0QEoIg4LfRw6q0AFnoxXuaDxtPboT3xSdopZqzv+vqyONnYA/En3wE
         AjXTTrBAwoZm6OH2vhl7Yfkb+XUKayB1/6pG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683164860; x=1685756860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bfhN3XnRzpYWFOY+ML3LCzLONL2B9ERTa/LW88DzbM=;
        b=KjSMdHZQzLf9cwy6gwD3oaqbcMbzsSo8pHFLofMTCPBMnUtfqlmeVilvdykbBJych3
         Hc+CTjtq4E8zGdZe4+L2/S78pbFctqwa/c0207rREIkGqV/5ZhA95neplJe6zpSDsXye
         +xzULuWq1lRUnrocDh4jSYDAgv4Lr9PKQ5tBGcIvUNJTMdPKvf1H8GWVQ/SNk9gVMu/z
         bRiUPhmobwI44RWTefF9YnHY3duLej7DnqhQ5z4I6JWRA2/oaJongwLppHo0mUU7U8h9
         wiNMktxNVhQeJn6r1uT8oqm5U0Zni5XSmt2mWaArWaN0Yg4jhuqkOgEc5Y/eIiZp1Ipy
         0hfA==
X-Gm-Message-State: AC+VfDxjGqD0AFnajocD7zSm0cDlG+aVut1f3uZkH/orwZLmdThBH3i2
	ov3ZzV0OEjFKcZXg/U+xY6dJJXDHgDysWNLsukc=
X-Google-Smtp-Source: ACHHUZ45UFdTDvl/jzXnBdxMR9XDItAHwyJhSLN4y7BrOXqveT/MiwcV4+eRRvt+dRXzSO6N1pr7BA==
X-Received: by 2002:a05:6a00:a90:b0:634:db05:d477 with SMTP id b16-20020a056a000a9000b00634db05d477mr772657pfl.10.1683164860192;
        Wed, 03 May 2023 18:47:40 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.85.139])
        by smtp.gmail.com with ESMTPSA id ei55-20020a056a0080f700b0063efe2f3ecdsm15106142pfb.204.2023.05.03.18.47.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 18:47:39 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Thu, 04 May 2023 07:17:33 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] shadow:Fix CVE-2023-29383 improper input validation
Date: Thu,  4 May 2023 07:17:30 +0530
Message-Id: <20230504014730.31190-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 01:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180843

ChangeID: 2bfa88cb752792ddc37f700f87a896331bb12c95

CVE: CVE-2023-29383
shadow: Improper input validation in shadow-utils package utility
chfn

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../shadow/files/CVE-2023-29383.patch         | 46 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.patch

diff --git a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
new file mode 100644
index 00000000000..49e62d4e429
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
@@ -0,0 +1,46 @@
+From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00 2001
+From: tomspiderlabs <128755403+tomspiderlabs@users.noreply.github.com>
+Date: Thu, 23 Mar 2023 23:39:38 +0000
+Subject: [PATCH] Added control character check
+
+Added control character check, returning -1 (to "err") if control characters are present.
+---
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd96ee618411ebfac663d]
+CVE: CVE-2023-29383
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ lib/fields.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/lib/fields.c b/lib/fields.c
+index 640be931f..fb51b5829 100644
+--- a/lib/fields.c
++++ b/lib/fields.c
+@@ -21,9 +21,9 @@
+  *
+  * The supplied field is scanned for non-printable and other illegal
+  * characters.
+- *  + -1 is returned if an illegal character is present.
+- *  +  1 is returned if no illegal characters are present, but the field
+- *       contains a non-printable character.
++ *  + -1 is returned if an illegal or control character is present.
++ *  +  1 is returned if no illegal or control characters are present,
++ *       but the field contains a non-printable character.
+  *  +  0 is returned otherwise.
+  */
+ int valid_field (const char *field, const char *illegal)
+@@ -45,10 +45,13 @@ int valid_field (const char *field, const char *illegal)
+ 	}
+ 
+ 	if (0 == err) {
+-		/* Search if there are some non-printable characters */
++		/* Search if there are non-printable or control characters */
+ 		for (cp = field; '\0' != *cp; cp++) {
+ 			if (!isprint (*cp)) {
+ 				err = 1;
++			}
++			if (!iscntrl (*cp)) {
++				err = -1;
+ 				break;
+ 			}
+ 		}
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5106b955719..72891d022fe 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://shadow-relaxed-usernames.patch \
            file://useradd \
+	   file://CVE-2023-29383.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.35.7


