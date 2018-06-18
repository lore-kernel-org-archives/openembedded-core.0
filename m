Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBD774854
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:10:50 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p11-v6so14410002wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 03:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZoJD2HYf41w4vUCURe2Dv7Hc8a6uzDFMhYPz3j1QfGE=;
	b=iZkdQFcIh2uFzTSiNGkX8PgedK4Pa7RIFGmKj624BduaK4jEL86fDAjaOEid0J/xok
	d7J8qP0Gf6f5fdIWHEIMEryyKgWOPdJyEdapFHg5yu1c1pnl8b5kTAEZwHlA6seaqfQF
	xGyPWyf+nW07cYTi2836DsixadAFPzV7vIHHPANCsGgAxa+6AmDWi7MQLosaHwRAqJrj
	s8kU+KTf6Qqr8l4hmVUbiod4g9OtSY+KvWS5MIgL9yD2xl3soUl676B6zEZAzFEUJ/Ce
	bOWI/7EpT4kUk+t2Q9its4Q6tkBIZk9JDHbaerkttFm1//qH9FTLqCAh3PknDKWW77VH
	d0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZoJD2HYf41w4vUCURe2Dv7Hc8a6uzDFMhYPz3j1QfGE=;
	b=P0+hsh3mtAC/GY+CvT+3VB+gYdr8fJldq72W9Gvpot0U9ezeg2Su6CGnO6y7XVtebD
	ykAygJgpQy9888zEG9tdiGhMSqbRpo7lIxzudifc/i5oyQC+lUWGSy5d/F/eUL8eIoLz
	QQ7WzpaJClfwK1byMu+Na/4sre/CPBJ9FiIkzd+hShATzXjkYa8qmgvs4mcGlE5h7LkZ
	IPFbKZKhXx7TPiYHv4JWSAbhxDUm8PMlImggSLMmZ5bGT91bRnltXi/pRxNiX5agfLE/
	v8eVkI6Hwnjem9bTsoq75ujS+c4D3W9yjJzBBeNlXarDvIXqhD47vpmJy+VpTfqvhX6u
	GYyA==
X-Gm-Message-State: APt69E2DWpkaDPSLRDwYjvpmGoNzRSo61RNsT9Jy5TzAL6E/sqtdCKHr
	ehI+AeHxk0TBI95lGOgcluG/oTXl
X-Google-Smtp-Source: ADUXVKKrtKLCKu7BvvBTZ7TnwmA7uMW/VngTeROPppQLT0cGRhXsW2JgJNzztJ5PsbRdHc1tKiE4fg==
X-Received: by 2002:a1c:f308:: with SMTP id q8-v6mr7872793wmq.6.1529316650800; 
	Mon, 18 Jun 2018 03:10:50 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e2-v6sm17583475wro.97.2018.06.18.03.10.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 03:10:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 11:10:43 +0100
Message-Id: <20180618101044.10636-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180618101044.10636-1-ross.burton@intel.com>
References: <20180618101044.10636-1-ross.burton@intel.com>
Subject: [PATCH 2/3] xf86-video-intel: disable DRI 1, enable DRI 3
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
X-List-Received-Date: Mon, 18 Jun 2018 10:10:50 -0000

DRI 1 is only needed for UMS on i810[1], and modern X servers (1.20 onwards)
don't support DRI 1, so disable DRI 1.

However, DRI 3 isn't new and unreliable anymore, so enable support for it.

Also, now that the *proto packages are all part of xorgproto which is a required
DEPENDS, we don't need to mention it over and over.

[1] https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=359477215092ac1b602ad1e2f17a28963d9224c2

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index a60da70840d..cda1de1eb1a 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -21,12 +21,12 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
-PACKAGECONFIG ??= "xvmc uxa udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri1 dri2', '', d)}"
+PACKAGECONFIG ??= "xvmc uxa udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 dri3', '', d)}"
 
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri"
-PACKAGECONFIG[dri1] = "--enable-dri1,--disable-dri1,xorgproto"
-PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,xorgproto"
-PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,xorgproto"
+PACKAGECONFIG[dri1] = "--enable-dri1,--disable-dri1"
+PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2"
+PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3"
 PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
 PACKAGECONFIG[uxa] = "--enable-uxa,--disable-uxa"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
-- 
2.11.0


