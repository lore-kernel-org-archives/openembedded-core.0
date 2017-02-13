Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2303B71DD9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:23:40 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id 89so151508349wrr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 06:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vxWx5U1Ysj+SBnXWAmUW22NHS21w3suWMdCHtpTsg0I=;
	b=cSMfclvAG/7Dszh+z0BGnEIwKOwySmiRh8GloGAVOOmloSsXmBVWjHKCqI6Axn9Hpq
	p8sJ66Z64wVTh7U68+UislIYZUngmkxOL9RE8F6JS7VL+50N7j9mNWcCJoyMCIHiI/na
	iuzYldo6wC7cFallYoPDMAsISP5LY8y9ayYR9vmxY4OcBms+wDcDOhc9oIiX60fWQtiH
	rhoIRLwXTNWvd63zER3C+2dnJIObMzB9i4UEAElTU6m/mSTfFJwTPypAaJjLMOG8jvAJ
	M7NB16c3uPwaI96cKVmsGAPRFs2K6MeMko/RoRrjI8cRJc2RWu4VGH2MiLOPLWZeF2qh
	E04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vxWx5U1Ysj+SBnXWAmUW22NHS21w3suWMdCHtpTsg0I=;
	b=kXR6u0IazFUtCmP7ywv6VDIEkGojTVmd3W830fmk+jjzNVM0zNGTJ70+CiTd5zBK2/
	7rsHNX5G81FAG0Of8hTROfXe3g90oYFz/7r2QNKoTGXNPWMfK1zyDy16O24sIpAP0/X3
	M/HMF/GnhOWXVuLneipa+1uM8jM37NFJxnaF19b92QeMseZTvs9i48RSWfuJHbC+hQg2
	bB27O6Ba6ploWJI5dOxQiSuSWco3NFFeLat+mNLKUxyF4Kp/9fPCyFGI8+A/liee0q4r
	KUrpWxU22AjK/FIe268r+JgrrmK2WUKXiaZ6S0RRifihpTTbHGo3oGgo0YZiATRnvEcS
	XdTg==
X-Gm-Message-State: AMke39mA2d5VDjWTw6hQD+2dYpa+msQnrGCig52xuEKkQxdRaHxMutWN/FyzAe/eJJc05VGc
X-Received: by 10.223.135.163 with SMTP id b32mr20260295wrb.184.1486995820589; 
	Mon, 13 Feb 2017 06:23:40 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	h3sm14147741wrb.31.2017.02.13.06.23.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 06:23:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 14:23:37 +0000
Message-Id: <1486995817-32591-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] security_flags: disable -pie for gpgme
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
X-List-Received-Date: Mon, 13 Feb 2017 14:23:42 -0000

Otherwise this fails to build the libraries:

relocation R_X86_64_PC32 against undefined hidden symbol `__init_array_start'
can not be used when making a shared object

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 28e11bd..77416bc 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -45,6 +45,7 @@ SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gmp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gnutls = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-gpgme = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-grub = ""
 SECURITY_CFLAGS_pn-grub-efi = ""
 SECURITY_CFLAGS_pn-grub-efi-native = ""
-- 
2.8.1


