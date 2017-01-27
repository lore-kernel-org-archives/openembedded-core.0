Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D28B0774DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 22:29:24 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y143so19331110pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 14:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1FkQntkoGXSmitwepMZKWLRE72eOht9IrvBAHOfLt/Q=;
	b=asFJoMZ6s5OE3vI6A3TFfNMjQvflfnxOtkR51lgCgKgk+MbJxbCnUA5d1dVa1Nwvct
	DQVUuFCr3A/jrSj0GPP5GuX3Xl78BQ14Dz3she1JuMKz1CL2mMRCfgAYeIFkjWDl6wwD
	W8kMVIVMX/YD41ININ2D9HqZOmsZa1Uk9V5GUG0Sq+QsWhpZF2wbjtiUw61M5bMC+hba
	kuvsye82bcFMGO/rAVsGbvr2zO+ZDSr30ob6d+JayLwAJhb0CzFkpCvlwRaaQA0YzNNN
	AGXF491NjLbxSfyOcSfS7Srl79/XVXx4yHeaAniOaiA0FCwybcvgeJ7gZxcI1ZY3WV9S
	y1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1FkQntkoGXSmitwepMZKWLRE72eOht9IrvBAHOfLt/Q=;
	b=nMEBVrJSB9cXIBWq6xK/nBW9q0TS5bRqrA46uuHwkwhbWDOR3UlicFSG81yDohSu1f
	8qgrUKQsG2tLM+i+HsHIkkP/EfdLW7rXl23HgdbA/8nDozgZymP3qYQxStH+0Vrsf73K
	tl9SNZdLcXpazP52biZ1L13i7z/MaDD/HwvQ5Z41WGS/lfPwHm0REehBtXGBUez5qyka
	S/vrF14fbF3/TvZEOPkVvYkn3Km7wZJBF52M8glA2+Ly4zoDBZt3O5w30rnaflCDL9pm
	9ttirT9tonh70k09TW5drr53jfXihFuqX08jYYl/ZT8CYk/ZkryNzlvU7QvrVAcvS537
	AMqA==
X-Gm-Message-State: AIkVDXIc0Wj91RVomIP7zoN997SYJ14SyzNWQ/POjb/6x4l1GByyp62w10kUY6eei/htag==
X-Received: by 10.98.82.216 with SMTP id g207mr11525418pfb.32.1485556164908;
	Fri, 27 Jan 2017 14:29:24 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	z70sm13688851pff.26.2017.01.27.14.29.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 14:29:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 14:29:11 -0800
Message-Id: <1485556151-9063-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
References: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] systemd: check "ldconfig" distro feature when setting PACKAGECONFIG
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
X-List-Received-Date: Fri, 27 Jan 2017 22:29:25 -0000

Avoid trying to call ldconfig at run-time in distros which don't
provide ldconfig on the target.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/systemd/systemd_232.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index cc8781e..2b52227 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -40,7 +40,7 @@ SRC_URI_append_libc-uclibc = "\
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
 PACKAGECONFIG ??= "xz \
-                   ldconfig \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', 'ldconfig', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-- 
1.9.1


