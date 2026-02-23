Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70958E98E0E
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:39:36 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37942.1771861173605306216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=OJgevyj0;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.44, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8fc023934dso62541966b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 07:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771861172; x=1772465972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88i2vswGLCwDgX7a0DwZxyHIiq+AG31CjA2c2S6sE0Y=;
        b=OJgevyj0MliB/H+vhhFijIpHCDSnCDHRycVCMVsOVJgEbQmVwUOCaRggfYYjNruw6z
         YNQq3N5hFxsgsKTLk/4nEzY6cP8mZ5pyWvNXFx7uHYHwBF19c8lS70HLSiR5bjXmkvdo
         eWTJu/MqtI7govtus9mg72Nj/Bmf/0Vv5tsXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861172; x=1772465972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88i2vswGLCwDgX7a0DwZxyHIiq+AG31CjA2c2S6sE0Y=;
        b=QVH/hSrVj2A/UMFqJqc6/I8RZRNx/cua5QkD7Rj4mwivXFwXr25LXnsUzTX6lDWRd0
         3ggq6q4woEKXHqQWpReouMZXQ7FpTQLFvDGcsv0o+vKhhxz4BVLqiqQUsGexNnB2Wwlc
         GEvbqQfq5IfdQnHCV8q8N1CmEujH1ifsEHbfFyPYI3BpIkgSjK+awF5FmyyEzwvvRfkW
         bN4zJEkS4cIJPicZL7vom1njVsiY/8mVLsbUgQpLUdZWIXIxrqaB3g+L9sW9h4ox16j6
         SvFZTU3PDZSqSv4esBhuzUW2gkdPWiDlLS9jcaCIQAoEengFjBc0BXc9o0QnLSaB8weN
         eYDA==
X-Gm-Message-State: AOJu0YwXxGY3roJIQCvZNwE4W7YFiUY9b4rWPR3+ErL3rL5LimnJpQEM
	QrKjxolDRLxcYuVaswKpKixiZT/GN6qS3+YtNQ2ZS6QYP/hTXLi9J0P/0VsPrUbaO3j73b4vzbQ
	pQAIiDbU=
X-Gm-Gg: AZuq6aIY7O9RLjoPajyuXsSeE/mDXOuPRoviRfpKq2j9m+ukOccnNV/oWbfZed4POle
	A272sAMoAB1JxsHyWV630Qyh1zipFcKrBAJeM8vCBCvOF1G2Zj1+u2gs423tx4SES4jjKQZ/Qlr
	zzWgTRATR6CuLZtTgNdlvM41bb3/X8unQD1XZ+DPr77maZgZnKAzey/7+eknfsn9+cGmF7qvUSj
	+xP9wxX83yORRKEX5Px4vUd0lwRd6FD2nuMgX/mEJEoUW7sZVA7I9sFi9OhABfyFWVjatt7aUwg
	PvRAFA+vWRbhI+Ui7T2OkShJDOox4fCb86kbLjhuMJSYDUcOo1tmH1pR3xOxegYm4IsjmrN3f+l
	/KNjsI3lVr50jZlZ2IhbeolR53DoHD97IGNs497SmMPvigU/YBzI0DIHAhZxrBgnh9L6MxcHTqb
	Pbu6nDiq7CULskdwCS7q6OAFGo8NMpQGR/AoMgvtnt1cYX3bNpJoLyM9p+FiWvKPFDH8kD4gbpc
	+CB6bTHYPZg4DskN8BbOW8VaI93Je2y+K9k3Mj9trBQLDRUf+rAv8mUUKTtaKWBacTc5lTu1PKE
	X/R5
X-Received: by 2002:a17:907:789:b0:b8d:e665:d653 with SMTP id a640c23a62f3a-b9081ba1e0amr268828966b.7.1771861171778;
        Mon, 23 Feb 2026 07:39:31 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b90ba281d69sm33643666b.28.2026.02.23.07.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:39:31 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 2/8] signing-keys.bb: Fix DISTRO_CODENAME truncation
Date: Mon, 23 Feb 2026 16:39:23 +0100
Message-ID: <20260223153929.2641007-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
References: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 15:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231674

If DISTRO_CODENAME is not set in the environment, bash quietly
drops the string resulting in a key such as PACKAGEFEED-GPG-KEY-defaultsetup-

However, when python calls self.d.getVar('DISTRO_CODENAME'), the resulting
string is 'None', leading to a configuration file pointing to a key such
as PACKAGEFEED-GPG-KEY-defaultsetup-None

Add a default value in signing-keys.bb to set DISTRO_CODENAME to None if
DISTRO_CODENAME is not set.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-core/meta/signing-keys.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index 94f4032911..c7713ed4a6 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -45,6 +45,10 @@ addtask get_public_keys before do_install
 do_get_public_keys[depends] += "gnupg-native:do_populate_sysroot"
 
 do_install () {
+    # Python evalutes an empty DISTRO_CODENAME to "None" which would cause mismatched files
+    # as the update config file would show GPG-KEY-${DISTRO}-None but the filename is
+    # installed as GPG-KEY-${DISTRO}-
+    DISTRO_CODENAME="${DISTRO_CODENAME:-None}"
     if [ -f "${B}/rpm-key" ]; then
         install -D -m 0644 "${B}/rpm-key" "${D}${sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
@@ -57,6 +61,7 @@ do_install () {
 }
 
 do_deploy () {
+    DISTRO_CODENAME="${DISTRO_CODENAME:-None}"
     if [ -f "${B}/rpm-key" ]; then
         install -D -m 0644 "${B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
-- 
2.53.0


