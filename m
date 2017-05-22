Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9480977F77
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:00 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n23so17287015pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R+9355Gj4BvIPOuuVb5m+1Ydi/+7UXAsWjbj2Muqn9M=;
	b=n4sc0ikoGcR7oBFBBnZaZL5BnFiIlBKQ8dS5peQXm1N14sRJQPTAhp09USqf5A1zca
	l2QBqlIDo9KQqR9L8cvbIgIhkY4TxPUVWkf7Pf68W0dm7i5YGKBkWEmaJ4GuURRF2dm4
	w8CMmJqc0v0n3igeelTb27nFMJTYKyCgfGsiQDc81osPo8Ua9k0SfgvRmfi2/JsYD5q7
	5ZZp8zSnnfI+h146U3I2/x146BwZt5HWh6mWhy0Whw8rspY0DkdHPTvEseFnMj0vgF8L
	mCexKvGqMD1yICJ9NnJ2viimrAwJtwzC9ys/RuPuMjPPM98QBswXgexpB09HLWavdnWQ
	pfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R+9355Gj4BvIPOuuVb5m+1Ydi/+7UXAsWjbj2Muqn9M=;
	b=EZwmK0G2gfiSEBt2DlrQJNf9gV3D9f+8mhyucR57YmZGoJNz/exyImJdA76c6o5Bvd
	LNFlD2rCvAF2fdu2Y2JkF6LITGUTb1Uq4/+oMyVkIdfjdZpt5IyyToCWHqUaw0nxy/8w
	IWmQMWd2a33b5Kx0qyDR04VgAhpX+OuaTLy4YPCZmvJhBt8n898AQjbPxj6U030m/YSM
	8Z2/6nJRhWe2D3MaZCjHpX7pSVzs24Nk+6bW5YF6YtA+xScJTx52RNIDVmJyH2EaVhSy
	xQE4ldgjYYd+vjaXWOemKDSJXL5c31/Utax2Bgd9JtzjRjdeoMRoGKxnFRoVI0cTf2PG
	LCIA==
X-Gm-Message-State: AODbwcDarhgJIvt/s9drwqwKrJOpg8ch+APJlC6ToRStQeWLyv07/48R
	6fW70Kp/QGCYlA==
X-Received: by 10.99.66.5 with SMTP id p5mr23162860pga.107.1495429261560;
	Sun, 21 May 2017 22:01:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.00.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:00:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:31 -0700
Message-Id: <20170522050042.42403-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 04/15] glew: Compile with -D_GNU_SOURCE
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
X-List-Received-Date: Mon, 22 May 2017 05:01:00 -0000

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


