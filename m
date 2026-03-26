Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E2610A3D92
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:25 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46587.1774529480557420915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PDmuWY2s;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b41b545d9so941272f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529479; x=1775134279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjp4NjiSAkuwpRGyecde1/mi0jhSg3WY2+9qb9X7FNE=;
        b=PDmuWY2sZadSdXJi2l35zWNkkaVjDPpOrSGPJMsmH7s9gTvt3BsFOuQHG0kWV2sFG3
         wfsyO6yFYWwvjPzeQQ4MHxwpDAlYfzKwd0Y0nw5bsALN9kzJndyD79z2R4M+XZjpR0ES
         7Ffn4L90M0C6k2D+U8Oz9f6MYPnlifKuZ+ylR0WoJi4WnnmGqIxaOiIPIsvukoQyh3lt
         HIIolbZoax8YqWIvIKkQR3N/ATY3mc4RiqD+RvGmOjPb4n1zZ26PZ9stl5takMQOyyjm
         CKCQoleiDwD9Csep3PRixHHRFbv8/BhSLRqQXb/GrnwnRRfNiqHhNprX4O9a2P3rgE8r
         VuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529479; x=1775134279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjp4NjiSAkuwpRGyecde1/mi0jhSg3WY2+9qb9X7FNE=;
        b=JCt9kE67JlNxswXPcI7ZFOD3fN1A+578tKjetCxArzqoxI2g0vzC1wJ2Wj/mR73H1T
         V9fhHKoj2JLxOI9RnhdjLy7Bsdkn/WQyn8Y33v4z6Ck/jzWBcRY+4Z9K19Kid70ms8pL
         ssT8cbt2xvboeXZATknDPQUZybdgYI4+iDhUIOy9aNCeHuN+unc0oxXCSwEGnfiSCk2C
         cKzvGBSE/zTpuHziFOo8OdizVw2hxZgBvxZ7aPsd48QTL8cb64vxnxrYsVnC3WTfx1Gu
         su4Z1MGs8pR+QUq9EVutnP9JNqO7C0EOspX+Yhgj6CgOAsiKozeOGoyVwE660/qFU1uq
         vHgQ==
X-Gm-Message-State: AOJu0YzKjwXdO+t/KyOSsSALuB0/9NXVYE+Y20qghb9rMCPrmxtKLxrD
	n/UCTHBy8HJ5hQQF3GEgiDoMCFZF+SOIRQd46yIHJQpesudy6rAMAi6OfNyECQ==
X-Gm-Gg: ATEYQzzi/w31iH/KTJ/HY+7jTGiDMJcKBh5fHghEBf/METjun50xPbOJzpm8qRoCsg7
	sIY4QT7Z9FtfxYrMGF9sFEGxzTv8v5ZnkaYNS5V1WX85SveebCreaBwOp3302QVYbhOFRnDoY/y
	EZvYcKO+JLw++U6QGU0AYqfeuRAUgQckJiAfEPIIYkP6o1BffwlTGsDTF30G+qSmVM7G1wlTc5g
	NTMq1s3nEvGdRONh0AlVW+ZSPVkV9+ed3LNgqQEfWnhAErqeeJg3z90RYliV81/XLh49wemJvtg
	qbbv3r9sLdY+gFcFcSD8Pq7cUpZCgOm+FrTcUMo0eh8rvSGJeXSne90Iky1oqHSNgdOZYIr7Km+
	DfV6qw9HyIlJdJgSJij2TKPZn5jZY4jqPg5W2g7jl7J6aGl0Xg/dfE1QHM5os5pKBo5A2h7E3Nv
	rvFyYDVCWNhDJoMEcHx9hyW19t
X-Received: by 2002:a05:6000:200f:b0:439:fd13:5c4a with SMTP id ffacd0b85a97d-43b88994f7bmr11506926f8f.6.1774529478622;
        Thu, 26 Mar 2026 05:51:18 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:18 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 01/13] python3: Add warning comment before PACKAGECONFIG[freethreading]
Date: Thu, 26 Mar 2026 13:42:22 +0100
Message-ID: <20260326125113.1853869-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326125113.1853869-1-zboszor@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233985

The warning comment is really needed. While Python 3.14 supports
free-threading officially, the ecosystem around it does not yet.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/python/python3_3.14.3.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index 7a1ad1e386..c23605f59c 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -112,7 +112,14 @@ CACHED_CONFIGUREVARS:append:libc-musl = "\
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
 PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
+
+# Some LLVM/CLANG subprojects (e.g. lldb) and many Python modules
+# do not build when free-threading is enabled. Also, the support
+# for free-threading in many Python modules is not yet production level,
+# although they may build fine.
+# This is highly experimental. Do not enable it!
 PACKAGECONFIG[freethreading] = "--disable-gil,--enable-gil"
+
 PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
 PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
-- 
2.53.0


