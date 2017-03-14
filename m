Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF2577722
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 23:35:52 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id v190so143225pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t7pa/YveIS1/5ff/9e3C/06OiVHlm3d3k+ztJf00Pxc=;
	b=f7jIYmEqWbFd4e93Vf8gNWqpKIki6zXoY1iiavUahoYZqeUeYmYJkc9mnQyRffV+LP
	9SaQcg2eR+WgJheg+zNpPb96Wm7GsSGFPHXg1qew5uSEHigM5DJJtEjTQoapkc84dLtD
	VX0tD7z8jPU+iicWFKu9xIAMa83ZCXSvtgxcHTVxHyoaeU2pZcptg367BuT/gQ+8NIvb
	/DTxw0xtAFQC1/OGrQwsGoqpp5Wz1v4AvVROoHSv6kmQeZHhLQO5fjbubTqYubO2tIlK
	KJtYqbZi4EFimGYTw0qTyQ6sHiGgmxzPdW8ZKGrMHMThlKIGvJ4LnSzVbQCB9yCjjNTG
	94lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t7pa/YveIS1/5ff/9e3C/06OiVHlm3d3k+ztJf00Pxc=;
	b=hTaYpFGu4ccOjirsZi1mLb54I71d1cUK1feZXUzrxeGCJVNo6brkMLpg6KO/miZ55c
	+9ZjX08qMwolrcQwoqq37pwlxzyxbsH09wil2GLvErlUVDsUYP+jRpZcg3fxru1ysXyP
	ZiltrVBU2GLxYnV/YzeM8DpqTcyY0+dC6VqjPgNsQKUXMGqsUPuN55yt2KAOFHWtYSfm
	lk5ylxTgirL1+GG6Y5NNrUKDty7qqCkulnyipM633C+8xEeBn/O/Q5Brfi+JA6UrjHqK
	weahXdI/3rpCgaWaUCC4oDm4yYQXlFdvNlAJmGUBzNdMaelFl3HUwqgay/s4ngsu9FPg
	Q0kg==
X-Gm-Message-State: AFeK/H2RfffsFSslHatL/9KXfDKJTC8M8LPFdyG3zAz7TCUpRSrYjkiK7xj5C7fgC3A39Q==
X-Received: by 10.98.70.198 with SMTP id o67mr310099pfi.39.1489534554550;
	Tue, 14 Mar 2017 16:35:54 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 73sm124094pfh.56.2017.03.14.16.35.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 16:35:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 16:35:31 -0700
Message-Id: <e9c3eaccf98c6cb41cf985c52a59c9562c9e9b25.1489534345.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1489534345.git.raj.khem@gmail.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] binutils: Enable threading when gold is enabled and is not default linker
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Mar 2017 23:35:53 -0000

Currently we enable threaded linking feature of gold linker only
when its used as default ld. There is no need to restrict it when
its not default linker either. As long as gold is enabled, which
is the case here, we should be able to do threaded linking.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 9b1192b6e7..37813dd864 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -78,7 +78,7 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
 
 LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
-LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default', d)}"
+LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
 
 # This is necessary due to a bug in the binutils Makefiles
 # EXTRA_OEMAKE = "configure-build-libiberty all"
-- 
2.12.0


