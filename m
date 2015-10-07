Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 51D3360232
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 23:06:48 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so1481767wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Oct 2015 16:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tV6AKhy4dCVPyqVMFoGUJLTx5cr9PZpqWZ6s0bk2VLw=;
	b=EtrraSXb0jqhayuTCZbrw7L+mMHj0gHvP4zBEQ2FEBNuD5vS89I7+q+CN/q0lKMJ/E
	5QvLswzsPT0yeRz5SAIxZKnL84ffKomSNk1Fk8H4MLr6ul0sNMZ+ZyuYBZXrg/vZQvBO
	qUuwNaAyM1HB4a4weIW86qRIjTWOJVqp31955mhGn+M29iT3Y7Ap4GSF6oIuuA8MjOrW
	jNa+fTUSnFLggHoYlfrHSue9mC74HQDjsW1CuKl3azxmuHpHKvrBASYrLJ/i3nof20f1
	XHEfVpYGGKK6JIg0EvxxS8WqnyWHIU1d1YmcCrBxxi8dMFFy5sxwmJdvwHtIAdOPqlea
	l0qw==
X-Gm-Message-State: ALoCoQmcfQdbAACigIJPI39E1HN7NdxsOWJwkETVkdVdIz346JM//b8AbiCR43wCI+Day092zkXr
X-Received: by 10.180.211.177 with SMTP id nd17mr215826wic.69.1444259208027;
	Wed, 07 Oct 2015 16:06:48 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	gl4sm42170705wjb.29.2015.10.07.16.06.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Oct 2015 16:06:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Oct 2015 23:59:25 +0100
Message-Id: <1444258765-13696-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] cups: fix non-deterministic xinetd behaviour
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
X-List-Received-Date: Wed, 07 Oct 2015 23:06:50 -0000

cups configure looks at the *host* file system to decide if and how to install
xinetd files, resulting in non-deterministic builds.

Solve this by adding a PACKAGECONFIG for xinetd and pass it the correct path to
use if enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/cups/cups.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c0765dc..2c34da9 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -28,6 +28,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi',
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
+PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
 
 EXTRA_OECONF = " \
                --enable-gnutls \
-- 
2.1.4


