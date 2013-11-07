Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id EF4316D598
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 11:56:03 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id ex4so394372wid.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2013 03:56:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GwLEYvHO/2GWS4ifFlbp/ybEPvroYEHkQUx8C8n4eWI=;
	b=mkaFX09zjCgTniZKRI3VXEieJnQccdUsdPnlW0iLko+rdY3IXMTco6JttV25ewzJoJ
	cZK4W2zYOpPZU3v7dpUmfLwTbghCxVRr9o58YcrqyGgkY8XvWdLBaK6o0kxvfgBBLZW+
	Jj1w77dWcIANaO+53uOm8RG6LGjwFJYbXD95vIG2RDfmd7idMTY4DsuiWrP5PAykpPHR
	CiHXzP2exmmyBBo1bNOefUD4vMrtsZ/PZCctw1K01mJexpHhHvNymnDIErIi8GpPFI5+
	fygNhp7Rvg+HsBrCQn4wd2jFHiNY25XUadTqZPDfmu8AileECmT9A/D0UZBvqhF8siAx
	30eg==
X-Gm-Message-State: ALoCoQl7HuJR1ZoZa6PUT0ana2LGz2eiuSAM1VCOgXCxO2omSSfYhUxFNFNKhR4bf5U8sA/NLK6O
X-Received: by 10.180.149.179 with SMTP id ub19mr2312703wib.43.1383825365536; 
	Thu, 07 Nov 2013 03:56:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id q3sm34492026wib.5.2013.11.07.03.56.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 03:56:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2013 11:55:35 +0000
Message-Id: <1383825335-2306-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1383825335-2306-1-git-send-email-ross.burton@intel.com>
References: <1383825335-2306-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/5] weston-init: start weston on a new VT
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
X-List-Received-Date: Thu, 07 Nov 2013 11:56:05 -0000

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


