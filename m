Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 888B0745A7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 13:51:56 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w10-v6so13480760wrk.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Qwt708PbwtEmKuC63khS1vbHDmxY2k/OZq+1nTXFg5Y=;
	b=re5e4focS8Qk4kcMDP6iWJZsUM/imDWz/h0piOyF19gkMFg8z2+piDBVhbsDY4a2Vb
	Oabv0Fs321KZ6vqUvpbDe9376ccEkRXqfBKK70iR9e7W5ucdbGjavuLbkRkahZ74WnDw
	55Y45+VW0lZqE3f1Q9qqfubf828aMAaM/dJaZ/7Wp9PIwTkehKXsGe1SVD1SP2jEZH4Z
	y/WbktkGtjrdeD1pSN8Yt6n5xOwsacu5cO5IcrN+wIvrU38HeOFg4lnWtOaTB0VdozD3
	zMXr/bclGMM8YEm1dX47Pkuxa+Pysd2y7PdgWyO/T5Cx9+tLkaSgxgRb3ev5IFRJDyVA
	QucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Qwt708PbwtEmKuC63khS1vbHDmxY2k/OZq+1nTXFg5Y=;
	b=D20BhG+HLczc+l+C/Ld0krAlSZUJAVwiNP/JzTMsi1ZnAn0MHJOx/pvP1SHwQsPJ56
	ms6B5yNX9A7u3ByZYQxwtEEQnZnZ6DOJ1X832NeMxU5lz6yDf+bFdMoTfbIR+ZA0tewT
	snuUW+u43AaIl15IIjk3lWOmChH4fGgsU1JEUhgwz9xF3QH10MVP69j6Xt6poyr+Hodt
	QOPkWYMYdDgDlHethpJZiyH0CT9sBNy6xC7ncZUKPG+7NlXChx4hwvDaoylyf4nGTdqu
	EQnGzgUc0Isa5q9cgt0DOEyKe+Q88BMXhRsOQ/jccXSNRH0Utdd2+mjxSFkatn9zI26A
	7fsQ==
X-Gm-Message-State: APt69E18aNdowJXA0x+rlhP8TW+8AanVVO8l3YcoalFbPEs6JkvrVaw+
	hK6PWjWIOdJ2Ah2zDvCnTyH+R5/q
X-Google-Smtp-Source: ADUXVKKPY36TKCugOKCQpF+bOlt+2oYihwpjZszPhGiwkxgFxIrV5++AevOWCLdv9nQWcL7PNf8BiQ==
X-Received: by 2002:a5d:4307:: with SMTP id h7-v6mr5347998wrq.58.1528465916696;
	Fri, 08 Jun 2018 06:51:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x5-v6sm27438826wrr.3.2018.06.08.06.51.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 06:51:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 14:51:53 +0100
Message-Id: <20180608135153.7352-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] wayland: fix upstream release checking
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
X-List-Received-Date: Fri, 08 Jun 2018 13:51:56 -0000

Wayland has moved to GitLab with the result that /releases/ no longer returns a
directory listing, so the upgrade detection doesn't work.

The upgrade detection can scan releases.html just as well, so tell it to look
there.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/wayland-protocols_1.14.bb | 2 ++
 meta/recipes-graphics/wayland/wayland_1.15.0.bb         | 2 ++
 meta/recipes-graphics/wayland/weston_4.0.0.bb           | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.14.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.14.bb
index 3393a2c797d..873fcf1c282 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.14.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.14.bb
@@ -14,6 +14,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "5d32eaf0f5d6b7da7f5ad0959e2551e6"
 SRC_URI[sha256sum] = "9648896b2462b49b15a69b60f44656593c170c0e73121c890eb16d0c1d9376f6"
 
+UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+
 inherit allarch autotools pkgconfig
 
 PACKAGES = "${PN}"
diff --git a/meta/recipes-graphics/wayland/wayland_1.15.0.bb b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
index 788105bff8e..d037dc46542 100644
--- a/meta/recipes-graphics/wayland/wayland_1.15.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
@@ -18,6 +18,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "b7393c17fdce9a8d383edab656c92fd2"
 SRC_URI[sha256sum] = "eb3fbebb8559d56a80ad3753ec3db800f587329067962dbf65e14488b4b7aeb0"
 
+UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-documentation --with-host-scanner"
diff --git a/meta/recipes-graphics/wayland/weston_4.0.0.bb b/meta/recipes-graphics/wayland/weston_4.0.0.bb
index 7dfca7fc633..e78b0d91949 100644
--- a/meta/recipes-graphics/wayland/weston_4.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_4.0.0.bb
@@ -15,6 +15,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "33709aa4d5916f89643fca0fc0064b39"
 SRC_URI[sha256sum] = "a0fc0ae7ef83dfbed12abfe9b8096a24a7dd00705e86fa0db1e619ded18b4b58"
 
+UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.11.0


