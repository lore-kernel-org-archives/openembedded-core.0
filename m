Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19095C44523
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2530.1784364813554127828
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=djxqceIV;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493ec555a26so57105815e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364812; x=1784969612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JF50TyRm+hKW3IGMnx4yj0zBZYghUijJ6bgZ7iECHgA=;
        b=djxqceIVW0hTE5J+VmWLSu8/IuFc9/2tj+KhRGzAFSotK1wvzHel+YU1rWvzW41YLy
         oQo7wNlIqctLoMFDDdZZa1qFYxFCAdQ31P3TBrYJbVfPfPaIvdE+BrNMOx9uaCfLDbwr
         6sbbem8ls1jC4+Dky7rUg59d2oF+o3qn90eKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364812; x=1784969612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JF50TyRm+hKW3IGMnx4yj0zBZYghUijJ6bgZ7iECHgA=;
        b=N7PqzV+jjyqJZx8fL3XrRdiXJzYkRuFv7q8aNDrirWazhe7csDZMEhiL2A0wtmrC0p
         pVqfeauFuaoyk+p3vvUEa02gYq1NNz6JBQqc7l8G4kb3GwEZadD5yXoVQ0+bBXf69eUY
         DkCwHN2TcRO4HeU79+Qym0focsWuTKzA4mhLgjQK0S9Vp4B5sjuNbQ4NgEqOapEF0coU
         1h6A5hDKP2Lhll9vcmYs+x5cH2bMHPE7GdpQerOeOG/aSRd83WPMTnwUm7NcRw/s1mEY
         Haj0O3i45dLfss6cv+w+MsP3OddoYl5XFhKdGof9+s4l4pD8pQCmOma5N027aHSGfTPa
         EWzQ==
X-Gm-Message-State: AOJu0YwgSQVMc61wdKQBQA8bqC9kZdnXBADVQ5aHFKEzfXxBdGo+FtB3
	G3GMFPh55260o1M9NpNyZpsvfsRXJilKPM0AltiRX74yO9H25tdMr+FdLrY/CNy1QFcXO8i8eAi
	M0FpOvWo=
X-Gm-Gg: AfdE7cmy1KcQtEjjlfDioTWhDeaxypk+KgBq4JJ29wr7fcxdSBKc6kivb55MFyzMY+v
	+C6mNpLiSVpPDtOSfMpzCRpd1IzZ2MU+Z9DBAyUwT+YcM/7XgvMvPY13KmP8TgTWDKxUw5qwQZj
	V5NTj7JRXgdN43Gkku5p373+/Heb7tEJ6Tz8NZk+v/wHMvTRAg/l9e0J9GbpnI0+U0c6vstukwU
	29TeQltDK9tQKR0GSEj2DhOzpzyiztOgkwd2MIvcEzBRNWkaolhs/2hM0C80Tz9LY36zhXpdjpq
	rF9UpzhcDA5h2lh+BTeH5G9iYMK3XWHIPbPJs9nzcEHds5xcEmUApZq+jXVWTNmhp0MRYfKQkmZ
	eY9sPPKiIZr9dCT55G1yIWYc0eFMVjyzNfTnL+XrTjiQStFvwi2uCt5HKebs2CW+U8H70cuZFMl
	cvP9ZxttnpIltjVHlGdlJu3romQFv7PSAHL/MHpNBxyw9uGhHrs4xY9qXaGTdOGx3VrN8uDLCQH
	897a5ADe3uEG70NXg==
X-Received: by 2002:a05:600c:3b9c:b0:493:e57e:7aa5 with SMTP id 5b1f17b1804b1-4954dff444bmr45991965e9.22.1784364811657;
        Sat, 18 Jul 2026 01:53:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/17] openssh: set status for CVE-2026-3497
Date: Sat, 18 Jul 2026 10:52:56 +0200
Message-ID: <551eade6c83483616ea6172336a4cf6c994ce90d.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241254

From: Sudhir Dumbhare <sudumbha@cisco.com>

Analysis:
 - CVE-2026-3497 affects downstream OpenSSH GSSAPI Key Exchange patches.
 - The vulnerable code uses sshpkt_disconnect() in the GSSAPI KEX server path.
 - Upstream OpenSSH/OE-Core does not carry the vulnerable GSSAPI key-exchange delta.
 - Hence ignoring the CVE for this version.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3497
https://github.com/advisories/ghsa-wcpp-3x59-h8vp
https://ubuntu.com/security/CVE-2026-3497
https://security-tracker.debian.org/tracker/CVE-2026-3497
https://www.openwall.com/lists/oss-security/2026/03/12/3

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2bd43b373d65d717e606cab3793b8a64facd946)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index a050475532b..8669d080b6e 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -36,6 +36,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
+CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 
 PAM_SRC_URI = "file://sshd"
 

