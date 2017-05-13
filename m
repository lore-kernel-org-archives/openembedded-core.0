Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A87077CE1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 02:59:46 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id s62so9633435pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 19:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R+9355Gj4BvIPOuuVb5m+1Ydi/+7UXAsWjbj2Muqn9M=;
	b=Ll4K9enBOdKlv3GMrsYvrtm60S3yliw7IurzYlp81UrmFJFX7/X40dj8R8nsNEfBSY
	Lof3YxJnNIMSNCAJUcgcJXgbIZV+wWuncmDaPkOFVcpWwzpGsZJDT1nZVWvZxnFlinH5
	zQvtlIl0PAYPOSzeq083lTWiv8bsZqE6anle/VYtsxCA9J97Ku64LgJ8pAUdW19l/5ws
	iJPJIORXxTK3KshBhsoj8NDeefoXPEoZaeYy3IVFCEPVYeB8Ld1BUzz7/hNjDpQxdag+
	eAjB03sKtea8LQDoGHTBf0dafPqqpyEY7k9RY4zibai6gF3TnnGzOWhu8ilxbYDK/i3t
	MCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R+9355Gj4BvIPOuuVb5m+1Ydi/+7UXAsWjbj2Muqn9M=;
	b=deohTyv6hyv27GhRxLOFgHj+kvPxK9hbHhWjDprIHw157xRDbc6969Y6UpUETHBdhB
	D26qV8ShGT5qgmG1L2qYfgQ9X8Dlc2TQxs2p8vhUrhDMjKXjIT26MjxF8peY0oVfgxLS
	E2DpLiWU+04kB+Il0+SRhX83kNnWhEfYAmgNl/tQfrFLAyeQ7hDhLcjzKuIwjJBegZk2
	HhnysV0FOLyOUudARso5jNtIq8Mj/Gd8euMrxmXSDOQWIWhKxIYbWUOKlnU1x4aiIpQ3
	JcRFir9/gj9g1Kd4J/nHnMw9SseiNHZkqru2/4UVDKfGWV56wbyFRX1BZIMdDHyq3Qsj
	1DCQ==
X-Gm-Message-State: AODbwcBVyMKWdam8UFl/W8Xv0127J8NnWHuXZePNoyvyaJiMUwNk//a0
	+7Nim5x6EM4c8Q==
X-Received: by 10.84.175.67 with SMTP id s61mr9813090plb.43.1494644388096;
	Fri, 12 May 2017 19:59:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id q4sm4541134pgf.9.2017.05.12.19.59.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 19:59:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 19:59:29 -0700
Message-Id: <20170513025932.26254-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170513025932.26254-1-raj.khem@gmail.com>
References: <20170513025932.26254-1-raj.khem@gmail.com>
Subject: [PATCH 4/7] glew: Compile with -D_GNU_SOURCE
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
X-List-Received-Date: Sat, 13 May 2017 02:59:47 -0000

Required with glibc 2.26
when x11 is not in distro features it errors
out due to mising CLOCK_REALTIME

 error: 'CLOCK_REALTIME' undeclared (first use in this function);
did you mean '_XOPEN_REALTIME'?
    if (clock_gettime(CLOCK_REALTIME, &ts) == -1)
                      ^~~~~~~~~~~~~~
                      _XOPEN_REALTIME

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/glew/glew_2.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/glew/glew_2.0.0.bb b/meta/recipes-graphics/glew/glew_2.0.0.bb
index 1c93ca07b6..f2ab75629c 100644
--- a/meta/recipes-graphics/glew/glew_2.0.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.0.0.bb
@@ -24,6 +24,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', 'egl-
 PACKAGECONFIG[opengl] = "SYSTEM='linux',,virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
 PACKAGECONFIG[egl-gles2] = "SYSTEM='linux-egl' GLEW_NO_GLU='-DGLEW_NO_GLU' LDFLAGS.GL='-lEGL -lGLESv2',,virtual/egl virtual/libgles2"
 
+CFLAGS += "-D_GNU_SOURCE"
 # Override SYSTEM (via PACKAGECONFIG_CONFARGS) to avoid calling config.guess,
 # we're cross-compiling. Pass our CFLAGS via POPT as that's the optimisation
 # variable and safely overwritten.
-- 
2.13.0


