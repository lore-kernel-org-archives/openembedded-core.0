Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E465FF8855
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1088.1778000341879623977
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kqaP28aj;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so378285e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000340; x=1778605140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJ2w8SqjelMZrxU42juGoyKkkUObsl54txDndZ3jHYk=;
        b=kqaP28ajM6O8WaVIfTlQDLU1yOVXPd/aR03dCnmYX9ojDXMMz5KmyDccbq6+SxsWVN
         1ga2cPJs7M3Hi8gn1ZxSUgPd8PPgS0B3yUtqYHvY/JMHJfE8Z53srzvLPMGDymC9wdDe
         CKCLSx+BpoSxEe1nhaLYRWllmpY0BNGL14Lt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000340; x=1778605140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJ2w8SqjelMZrxU42juGoyKkkUObsl54txDndZ3jHYk=;
        b=OzJo7KGtvoff2TC+UZUOJDTtUEX0MiJgKgkkjr4RmlvhR+povAnu3geAApg+9v74o4
         CTinkc7+l4RJDZATcZPm9hU6qo3PxnTMEYQjhHffVF+ID6XvVZ9//ykwleHjHn3gN/xX
         U6yAO+fWPSeSs9NvRVRSTaQ9SOG5wYnk4ql+BbU/7J6enkgA34xcyzvIWAPfkK2YDXQM
         3ziaeAIPTzCbUNI5s9dzohFHnN/pDK7zSCdPdsJRIcBm8ffrFuvuswveBXkeRhVi5iGe
         t2Wf7CtFAbyM/qfaVuhKkOsLsz9uoswlWKq2N7IOFLwEO1Z8aRz+Qwkh3r2PD5qaotZ1
         D3Qw==
X-Gm-Message-State: AOJu0YyxTd5uB994uPaDHIS0oRhpNQWmpIEDBl3J4vtz3bsEHszmhakg
	jPz1g48iAXDJYu5LkvRRMjiaJBqjEUpSrUg6jLYUlX+u1jKYmm1XUhXvVk9oNerxBCKYvJH8HFx
	5HZZLTKA=
X-Gm-Gg: AeBDietvznXgNSrvjOVZ1NJURgdiKx08/spG0IfSNFVR5jawUbZY3wBYR5rnLs+KEWw
	z7cd6vABgISjQKWCRrJLgR1NIk+OXSlB7spGmIR1BlJoHF9gkQB6pNvzzWrIwXhfoyhGQHYBUjU
	qce3XP/Tcyn+leEa3AwNFnxstZOuRvzezIA3C008Oi6jhp8H6WIycgrZrfXe2MuexU6MrkZoqc8
	S6ecg7lU5H+3VnbOGGp35IIdNXerTR+0pr69Lp8MBS9khFsCiVH9sa88m3dhsxVeF5UPiXybQSU
	MECjhOtj+c810MvzV96UBijAFGPF5/YuDlI+PD04NiLv5l51DrZqRwcyTWDzNQ6JTttclGBxJuX
	QVcxciZ1jIJJZ/oL/p7tu6JzLzqVM0DdTOJvX7FrLO0HgT86NdH/o/niv6/H5a8C/QDRH5aIGqJ
	yp/F3iFY4xsNt80vyQGEqZnOdgscBj0p5ugjHLQRaFEz1GHPyW5s80PvttW5gdVbUMhWzBWjWks
	+a7KvpMteDiix9QLt5kdNlD7acrYGOE9Zxf
X-Received: by 2002:a05:600c:a10f:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48d1422bb48mr53237035e9.1.1778000339962;
        Tue, 05 May 2026 09:58:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:58 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/23] apt: Add CVE_PRODUCT to support product name
Date: Tue,  5 May 2026 18:57:32 +0200
Message-ID: <28d3ab81b9386bda16e196ed2934967843413186.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236506

From: Himanshu Jadon <hjadon@cisco.com>

- Keep both the older deprecated debian:apt alias and the active
  debian:advanced_package_tool identity in CVE_PRODUCT.
- This preserves completeness and avoids missing CVEs in case older
  aliases are still used in NVD records.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4c777220ee5740b800f4128da79c24f7e42c7b88)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
[FT: Rebase onto scarthgap-next]
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/apt/apt_2.6.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 436e2e8cad..12915660b0 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -141,3 +141,6 @@ do_install:append() {
 	# Avoid non-reproducible -src package
 	sed -i -e "s,${B}/include/,,g" ${B}/apt-pkg/tagfile-keys.cc
 }
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "debian:apt debian:advanced_package_tool"

