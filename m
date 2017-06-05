Return-Path: <net147@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 289AE780F3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 23:59:13 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id w69so22417194pfk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 16:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qmg6Z2C+k/nHcU5ZVMNZSvALiCRZZHXg6vI2PV5hsMA=;
	b=inLhpKukw94y+Hn0ZxVK4jXKrcJGhrvexpvW9YukI++7mii2C8T5Y6deVm/wRyP5Ka
	3ITMwUh2G8ah97izOa0vveI1RGKzhSWDadXm2m0sTRb7Oxc1dcoiAdfiBk8hxXA4QQtx
	wtbPfPXwzu725Ue1vWNqhkBH4g9ho2mWINznouKjUTPacS79KiqwZHz8Y06V65jWV3Bq
	FGE5X0K5s0nXGtTEOX3p3Zb0hLQjOv7xFsVsGxaofVIe8YGUggFCBuBXOgxGK0pUspcL
	k7ANhcxgwuGfpTjDxnHdgDYlcx0VgtBblPAZPhI8g4MGjeOhnZQDn4qegtXkRNgHaNvL
	VE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qmg6Z2C+k/nHcU5ZVMNZSvALiCRZZHXg6vI2PV5hsMA=;
	b=B9vpz3XDxjo/piS8YEx+FZU3EupFu5VVoOMnfVquNJ0g+7wVr/+BvJQDgr0p9KgKIw
	ewByLvfG7YN/K0ncxzcpMb5BHgXQNog8SLLAAhHohYs90EyQPVYjJGSIehWLoh8U7VXz
	Q/2aQceBuVPYds+H+Zk4mqUyebhQfRSo9fJOo3toMrMQMw/7ZpHAYdhM/AqFqxpSxavO
	D/dYSgK/yyn26e0yWUV82sXO41sDdFmMv0XsyrCDKJd2dNXvJZaWYgsrbUsVL5gZw0RN
	xcM0olxKNr71FsccDivN4CBGc8zER8RUXifVaISrtosfrWhtYkbmDwkmV6N8Fm4wGRLl
	EFRw==
X-Gm-Message-State: AODbwcBZtZVBoc+0tg7nZqUw0Lcz4aDxn4pb9vaZkjftwf0kOq6GDosy
	KXuCi6jIKFMIvw==
X-Received: by 10.98.91.5 with SMTP id p5mr22396494pfb.94.1496707155245;
	Mon, 05 Jun 2017 16:59:15 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	71sm36035109pgd.57.2017.06.05.16.59.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Jun 2017 16:59:14 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jun 2017 09:59:52 +1000
Message-Id: <20170605235952.16856-1-net147@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [pyro][PATCH] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Mon, 05 Jun 2017 23:59:14 -0000

If ASSUME_PROVIDES contains libsdl-native, we need to add sdl-config
to HOSTTOOLS to allow access to the host sdl-config.

(From OE-Core rev: eeb248c1a017e07e36b6fbaafe45006e3869f41a)

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e4f4bbb56..3ad905c917 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -471,6 +471,9 @@ HOSTTOOLS += " \
 # Tools needed to run testimage runtime image testing
 HOSTTOOLS += "ip ping ps scp ssh stty"
 
+# Link to sdl-config if using host SDL
+HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDES', 'libsdl-native', 'sdl-config', '', d)}"
+
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
 
-- 
2.12.2


