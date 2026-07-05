Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B078C44500
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139237.1783291397240494325
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m1TEPW3Z;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493d28b1930so15930445e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291395; x=1783896195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2hY06V6RFSx/5rHyvStYAbfCb4rsDu4rdTtC9F5ep3A=;
        b=m1TEPW3ZmnU+zGNe5kx1Op2oEqOjgPxUH0OtvNkYLcxSYc7/b6fdBm/472cZTb4yx5
         pGa07DJ9uEImPG0KMpmCFPBSJ25FBcCMzptJjcDYSqrY4fDjASvaCFe9O4J2aRP0a9ST
         ZN6nMnD1N8ArGjrmNx+91by0r8iq+NdtV+Nqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291395; x=1783896195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2hY06V6RFSx/5rHyvStYAbfCb4rsDu4rdTtC9F5ep3A=;
        b=D7Kwq5d08kT7KEI7YYYNcVkzFSLvZEQ6KD9FxVuG54T8Xzr4GC27/KTvKMRGMiqVN4
         TwJk3uslxzbtfznbxKeZZ0jb9qbw0GFWRsTFsnp9oJ4LGwNyWoFx4F4lSp2Ki+CDwVNg
         hqFkyDybaEWzEUH0L4GrXLcc6CaDU13UQNEM+WGzN2Sml+ZSXyH+17Ft1funr9e8Y3Yn
         9a+Zz0tG3Js6MPmZ+Ed5DzEU52FYCi3rMZN3OBhA5gSkgrrt06PJJylqw5NA9s/elxsh
         x/43fHkoKJT0xpI6PRroEH/y3x/HAv+P9SxvPq1wnO814dWiqPcAhhGqySH9XfVKZCxF
         f6CQ==
X-Gm-Message-State: AOJu0YyD59PGw/ySbFKgHp0sixmkljDCVeX8VB+t/i7A2HKaLCjl+s9e
	XRkl+AbR/IqtEDlkC6Sal4OyQQJ6pDKDYWVfGWusLpM1WiLbiunfzjJEUxkssGoO1dqnWm6uG07
	k3br4fbg=
X-Gm-Gg: AfdE7clTY+I71/5q2yiYEOPj7TA8t1v/NQuX+VZelNXOoHFllfXh1931Kq4c+Kpm+ME
	toGPfCvjuvj43BVNK0xyxrAXOd09e7Xm6C9jdeTB1CBXxTa+G5xxI295U7zT0Kl44iGbSziQ+sC
	WuWg0LjxW0rBBy1WnOXeQpM1AG1UzhwHEFbNKPTjkxGo+HgKgu3OWbzey8lrTNT4wv1lUjDX3nG
	LL465o/CrzlyaL5gToFppT8QHLhBK9HHcgPCAyG0S8SLxdlpCFt4435gM1TolJU8cgfQe6Y4iJk
	+/AxPxUar6CNQviestMIXW9BGoM/RAqqHI7TK4wMFHH1JPtD486CvD0nX6N5ilr0LTGed8FkL+q
	hN8A0VQZruGdz6aBPZaetYzaSW/1aWfC5QK3RpueY6vxOMtJXP0FdetV7uY4ehJdbvoJ3tE0pUL
	98NsyjFo7znyGTR1sISK6+MW9xWA==
X-Received: by 2002:a05:6000:18a5:b0:474:64bf:8fb6 with SMTP id ffacd0b85a97d-47aad54eaa7mr9105847f8f.39.1783291395545;
        Sun, 05 Jul 2026 15:43:15 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 54/55] dropbear: Add missing WTFPL & Unlicense in LICENSE and LIC_FILES_CHKSUM
Date: Mon,  6 Jul 2026 00:41:44 +0200
Message-ID: <9aaa586df17593d9924bc6573f64d2340807f3a4.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240208

From: Yoann Congal <yoann.congal@smile.fr>

Vendored libtomcrypt and libtommath are respectively WTFPL and
Unlicense: update LICENSE to reflect that and include vendored LICENSE
files in LIC_FILES_CHKSUM to detect changes.

Note: libtomcrypt/LICENSE also specify "Public domain" but that is not a
real licence, so choose the alternative: WTFPL.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 06d3dbfcb12dc030a068fb658153d9e4679dd05f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/dropbear/dropbear_2025.89.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipes-core/dropbear/dropbear_2025.89.bb
index ece065265ff..685ecf9a1b3 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
@@ -6,8 +6,12 @@ SECTION = "console/network"
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
 # The 'public-domain' file is headered as MIT
-LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f"
+LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & WTFPL & Unlicense"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f \
+    file://libtomcrypt/LICENSE;md5=71baacc459522324ef3e2b9e052e8180 \
+    file://libtommath/LICENSE;md5=23e7e0a32e53a2b1d35f5fd9ef053402 \
+"
 
 DEPENDS = "zlib virtual/crypt"
 RPROVIDES:${PN} = "ssh sshd"

