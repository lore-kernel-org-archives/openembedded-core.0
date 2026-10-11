Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F782CA9ED4
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23565.1791708070070341519
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PNJf/dNx;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c14a06c95so777274f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708068; x=1792312868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SvnzbS+CuDQK2a71WTwmgoAGN3e8lxxcfO5vy+9mf7o=;
        b=PNJf/dNxS5rUIriGt5hPBj0fP6sXhpiH7ODHVPxSfRcOvw0FdJbR/jrth6YoKHFzGX
         H40L+3+Q8QLrfBCze1g5cZv4tBeLRADzZ/MeNSi6y47ZfEuXL1NEDU4cnH3DLMpkxDsE
         ecAK76PRBYJsx6OtSbROE6ElOlad5f1P9Xtl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708068; x=1792312868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SvnzbS+CuDQK2a71WTwmgoAGN3e8lxxcfO5vy+9mf7o=;
        b=lzINCcEltOecBIyuiF+4T2Q9MIKbG0to1Is1s6W8fA5PLarouf8AWE3t7pSIRboSB0
         2uMkoXsFqUBtnlm1fcUUXHZ543U6h+62IHf9F3HaiFSmNI9riwbltvJJoUOIb19cCqin
         3NXW2pc/hG3Lma4i3iYQlHuZAHr2NVVcLELb2AOiZx3kc9b8iB391USggVOgehqc3awo
         aPT+5CUMv/Wu0IO52YF0/+yo/FJSkN8wYLIcdQhij3fNuqXdJuiD61O1JoJ+cYgbPEVa
         7AJ6lRZyFyZqSfX/fM3wnbIFWNXAUk1xVrwYoPqiSHKgQJHyhQ/NoFXg1B8DsBiZb4kq
         rD7Q==
X-Gm-Message-State: AFq9FYJWb8jJHP77E5jmEkzXR8wQqvGGUQGUCFL/Rr9xtvc2DJlUFtaN
	enFH9Iki4kVkT+rKLmp3kUJtCs2r0aqNgwzBM1hQksfnSnvSOQBTBoW7D/hEJX3d1tVfHdFAT+G
	6D5MaC80=
X-Gm-Gg: AYBFou2Xc631ACTjFGZGd8bDHLD1Uq7AJbf4MBB/fmO5rRPjj2V8J390+Y0QTgT2N05
	P/Zc0oaMusWfm3s7mOJ6gTNd9KzNqKM7hoskQnUPwqQydNmWOkV+yLiAvsxUCKdMHw8vuoMiF1q
	jfFkQVQYXdL372yM3W3U9UpSYg+/hYQO5cRppRWW8iSk8N4Lu9yzHixSdDJR/N5s+A989umXJ+T
	RCT4LZuukFJdz+5BYH/LluiJT9P+UeQI3M+KDk6QgZiOkuZPa/ZbKYMriiUj65Sqw9D9Easz8p3
	nJhMXCClZj1Djm87yYOjwdpF5yTIHk2gwFVqZxjkPx5/ogkxksoMJkQlKKy7lQ3szc/xlwOCqwB
	/CtP8qGE+w847pDIlQaX9Ott9Ut9MmpFO01vbupk6t3A6PSLGyNTdb2YSBX4tXNGsfPieRTLGxS
	vlM5RVdyGYHD5aswXnJSEWlKY1soh8GRIGasRzenATx1Pg1J3dP/Jing+xxPjca5xXbgACfWFbP
	D/LgLcPJjEel9TfYxz3wVkLI9LoXitssvkQo6AeodRjRu85GBuBMrgqiyMnqjCzWp5yT0wtwkoy
	AUpNRef9
X-Received: by 2002:a05:6000:4a03:b0:48c:6aed:6b32 with SMTP id ffacd0b85a97d-48dbacef5e5mr11168772f8f.54.1791708068090;
        Sun, 11 Oct 2026 01:41:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/60] openssh: set status for CVE-2026-55655
Date: Sun, 11 Oct 2026 10:39:47 +0200
Message-ID: <5465433e4f6cc9f50c504f4493a51eedc47d8095.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247523

From: Peter Marko <peter.marko@siemens.com>

Per [1] and [2] this this is only problem in RedHet patches.

[1] https://security-tracker.debian.org/tracker/CVE-2026-55655
[2] https://ubuntu.com/security/CVE-2026-55655

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9ea8649149e711668b85c7e35cb7c259437e8c0e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index e6bc9e9a5b6..9793e3fa6dc 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -46,6 +46,7 @@ CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
+CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
 
 PAM_SRC_URI = "file://sshd"
 

