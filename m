Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id B8A077404E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 11:48:54 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so33721694igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 04:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=duOBjLvUkURnBXe+nPsKIrZ1M023YMIke7OW3LWJT14=;
	b=Xsnz5+RTtctbJZz4/+JJqbPpHRheYk3+8A1cgS2rwnj+U7m67d5UBA5zSfqTyVgDud
	5MknBHVEZiyuvbiVZYLftudaZ4SDalCixP2qX1Yyzgi8iC+YWxRISWsJ61ObvSi28zcU
	mgOf1z3+1Faamah2jm08iixAhQLeBocTeuJBImAeLGKXjjmAPnyNh7OW54NJUtqzB2Nq
	Y+jMkb/ysGsPJ+QQrUfwSwXOHanUJEVPpQ2LIdlDvfXR8HRyLZVLIDqPoGa7VV84sYYr
	jwFrVRumScNTdt5e8q+5TOuSmudZwOfOckyn8N48nrh2Ii7X+WJ4eE+MuoQcC2vzZDGg
	wsAA==
X-Gm-Message-State: ALoCoQlY7EIaIUVpC+Gk7qvYefXeHm/+Ns42ZNYnr51HedIbGz4BGWd5vPBwSCch+wprjk3P0sBY
X-Received: by 10.50.66.197 with SMTP id h5mr31239550igt.82.1442576934593;
	Fri, 18 Sep 2015 04:48:54 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB4E.dip0.t-ipconnect.de.
	[93.232.251.78]) by smtp.gmail.com with ESMTPSA id
	kb10sm6358553igb.4.2015.09.18.04.48.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Sep 2015 04:48:54 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 13:49:22 +0200
Message-Id: <23c032400177dc29dceb7d374806abc1edf284f6.1442576806.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3f8882bbacb0c9567aabd7d65d2cb859411c85a3.1442576806.git.patrick.ohly@intel.com>
References: <3f8882bbacb0c9567aabd7d65d2cb859411c85a3.1442576806.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1442576806.git.patrick.ohly@intel.com>
References: <cover.1442576806.git.patrick.ohly@intel.com>
Subject: [PATCH 2/2] initramfs-framework: better error reporting for invalid root boot parameter
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
X-List-Received-Date: Fri, 18 Sep 2015 11:48:54 -0000

When the "boot" parameter refers to a non-existent device, the only
visible output at normal log levels was a rather confusing:
   ERROR: There's no '/dev' on rootfs.

That's because the actual error, not being able to find the root
device, was only a debug message, which gets ignored in the default
mode.

Promoting the "root '$bootparam_root' doesn't exist." message from
"debug" to "msg" gives sufficient context to understand the error. A
more intrusive change would be to change also the control flow.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/finish | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index e712ff0..d09bbb8 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -37,7 +37,7 @@ finish_run() {
 				fi
 				mount $flags $bootparam_root $ROOTFS_DIR
 			else
-				debug "root '$bootparam_root' doesn't exist."
+				msg "root '$bootparam_root' doesn't exist."
 			fi
 		fi
 
-- 
2.1.4


