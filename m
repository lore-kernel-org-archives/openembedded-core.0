Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 14D2F76F58
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 13:10:23 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so20963009ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 06:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Y9wzwimNFzCqH5hc7J0kSB9iU2ElVlxPSg490j3Eudo=;
	b=h5jx8ahu/P6j+H57Std/DRAHAwtkrhbEe+Wd/UG5gkkLWaIYLXV2brduvv19wbLCuy
	CIPOiaU5n0AVAuY/U96B7EqzG6Me9uT6UPIBgzKFmD5YcUgHdeCMzGLuUBlKyaEUVqbj
	P9I7Rar5Cg6gYmE8HK5GnhAIYHqFiEeJco9CuqL2R9Fd68i9gutA65uyOwPxZRwMD5hc
	AYEl69BDcWUktk/Fb2StU4UV/lQLRfBtAP1qh2m9vdWx3DGjuEfA8BmK8u27mn6BKm8E
	4HMLfpL5dhb4aLlJZFfJTHEKZBygqTPkXx78ytse7UVKrBQkB/UoD/bvQn1n2dWm0nCi
	mPtA==
X-Gm-Message-State: ALoCoQngeAWfc7hcMZGZilPE1j+4QlgamJPaGFcFC0bCFSMJY7x8pNKF9n4FerFyR7SZsaj6h6aa
X-Received: by 10.107.167.199 with SMTP id q190mr56168124ioe.119.1441804223046;
	Wed, 09 Sep 2015 06:10:23 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56733.dip0.t-ipconnect.de.
	[87.165.103.51]) by smtp.gmail.com with ESMTPSA id
	k21sm4513409ioi.10.2015.09.09.06.10.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Sep 2015 06:10:22 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 15:10:44 +0200
Message-Id: <4a5139926b1242f1d409bba1bf4e5f7d3a84ba09.1441803055.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
References: <e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441803055.git.patrick.ohly@intel.com>
References: <cover.1441803055.git.patrick.ohly@intel.com>
Subject: [PATCH 2/4] initramfs-framework: support ro boot parameter
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
X-List-Received-Date: Wed, 09 Sep 2015 13:10:24 -0000

Default is to mount the rootfs read/write. "ro" can be used to turn
that into read-only, which is useful on systems where userspace does
an fsck before remounting read-write.

Giving both "ro" and "rw" will still mount read-only regardless of the
order, because the ordering information is not preserved by the
initramfs-framework's boot param support.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/finish | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index 006aef2..a8806aa 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -23,6 +23,12 @@ finish_run() {
 
 			if [ -e "$bootparam_root" ]; then
 				flags=""
+				if [ -n "$bootparam_ro" ]; then
+					if [  -n "$bootparam_rootflags" ]; then
+						bootparam_rootflags="$bootparam_rootflags,"
+					fi
+					bootparam_rootflags="${bootparam_rootflags}ro"
+				fi
 				if [ -n "$bootparam_rootflags" ]; then
 					flags="$flags -o$bootparam_rootflags"
 				fi
-- 
2.1.4


