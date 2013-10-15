Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id CD3D060B60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 13:10:10 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id cb5so5465663wib.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 06:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GwLEYvHO/2GWS4ifFlbp/ybEPvroYEHkQUx8C8n4eWI=;
	b=SZVzwCsvI5Adk+9hvQXP9ccRDb+puE6eggNjwfwzdYtXmIghqNwH0eIWQm7o6Nt/OM
	C4WHyE95VRlEMJ9/HiIhGRGzD7U2mvBXw+sFg3PY6TzvhB5MQZEFoLiAdvmjj0CR4iEa
	GNyQetrcpbpfNgws2EKrc+vrHex3TgXd9ZNPEKTss/lnqT6UW11ufPqeEhxSNBmFRYrX
	HYNDHbi9E6EzE8BZiryyMo96PIh5busq02Mo+L4HvysRStY1ErDjHmiQe38Xk3kXpHaa
	OAqTCbpY4orEvUbF/jED39AYesXC3exjHXbRXlptVXaLKMhz06IcXGikmicY4Uh8Ocxv
	Rodw==
X-Gm-Message-State: ALoCoQnjSd5cTSAcZJ3K16SsHRG3TnEnzin4dGBMWCE6Tb66NRaGivEc0RJPwoVfT6XmanLN0N1I
X-Received: by 10.194.94.167 with SMTP id dd7mr2245188wjb.43.1381842612284;
	Tue, 15 Oct 2013 06:10:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dl10sm9165wib.1.2013.10.15.06.10.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Oct 2013 06:10:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 14:09:59 +0100
Message-Id: <1381842600-11342-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381842600-11342-1-git-send-email-ross.burton@intel.com>
References: <1381842600-11342-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] weston-init: start weston on a new VT
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
X-List-Received-Date: Tue, 15 Oct 2013 13:10:11 -0000

Weston 1.3 needs to run on a VT, which is typically handled by weston-launch.
Currently weston-init doesn't use weston-launch as that depends on the
(non-default) pam DISTRO_FEATURE, so depend on kbd and use openvt directly.

This also fixes problems caused by the init script blocking until Weston exits,
which meant that later init scripts were not actually running.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston-init.bb   |    2 ++
 meta/recipes-graphics/wayland/weston-init/init |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index a3fe811..4ebda8b 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -13,5 +13,7 @@ do_install() {
 
 inherit allarch update-rc.d
 
+RDEPENDS_${PN} = "weston kbd"
+
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index daa7f23..284fd0a 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -34,7 +34,7 @@ case "$1" in
                 chmod 0700 $XDG_RUNTIME_DIR
         fi
 
-        weston
+        openvt -s weston
   ;;
 
   stop)
-- 
1.7.10.4


