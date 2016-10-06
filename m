Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id B792E60269
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 15:35:29 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id qn10so1270091pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 08:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=96dYzYWuSTZ8G4akYS4eODqMSzyOgeF49PIMfAYyMn0=;
	b=A/iC1/1H5L1SNW/mbpC8eumae6i3ReS39OHgIs9V/MHhVK64A70Y/wmPc0mLmalkV+
	SebA8iVCNFqNj6njKZ1PUU/lxPHIXBYy1pm2pi7ogzlU+y3LsvRr695fHFgZqX/ENczx
	3tuWgYIs2ygG2ohoLfynDyPg6gt+z0VDaZQlsHKAMAMTB2mR0LMaP5HXb2gK49h+uPE8
	sdrbvSTgJ9AGxo4w9XBVkByXOPJG3Vmdd3Q00+vmE3wsNt0QiORTxVeh8BaZMe38C6zY
	fy6P7j+Zjc07onUPY13t1uoAScattACqdGjLt+LrHymsP1zmlVbUN/8jn3+5zk/Gr/hh
	Gfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=96dYzYWuSTZ8G4akYS4eODqMSzyOgeF49PIMfAYyMn0=;
	b=NNgkgkusDhR7mZNQvGf8TkgCmWJnjFTByh8mgedMcsqan76XGLmMNy4dCQp188ULyH
	cmEhXo7bsc3t1eBzuXp8cM4ZmDNsz0JzBEolVkS55nYnXyvjP3K0fvyNpg50PdgPvnyM
	fbR766fvt6//se/qIes7HJeWjgCQpmgd/eozzlYQNXet+eztUvFlpTPaNw624U493uBf
	i6nvxOepdT+yXzUHKCdZMbdxtF121xeW4Hwki0RP7nAu1x3BRhse4pH4Ogb+G6DfDITK
	Q69wF9Aj1L/rhmEwuI3SObmDaQbKVgIu6y3tU5Ls482AIkgCalkpIY2OIz+/MZn+/rjY
	evPw==
X-Gm-Message-State: AA6/9RkB7RnOqNvzC8ok9gzNX1MVUDxMFvBnia5hROe7lnN91UvJf0seCRe3DZoePnC5MQ==
X-Received: by 10.66.27.165 with SMTP id u5mr22556345pag.200.1475768130995;
	Thu, 06 Oct 2016 08:35:30 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	aa6sm23696142pad.46.2016.10.06.08.35.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Oct 2016 08:35:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 08:35:24 -0700
Message-Id: <20161006153524.9996-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
Cc: ross.burton@linux.intel.com
Subject: [PATCH] security_flags: Diable PIE for mesa-gl
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
X-List-Received-Date: Thu, 06 Oct 2016 15:35:29 -0000

This creeped in along with rest of the changes in
c999b3d88dfcffbe0fb66406fb0bff1fb66f34bc
even after it was reported a build failure in mesa-gl
This is also showing up on arm architecture now

| /usr/src/debug/glibc/2.24-r0/git/csu/elf-init.c:87: undefined reference to `__init_array_end'
| /usr/src/debug/glibc/2.24-r0/git/csu/elf-init.c:87: undefined reference to `__init_array_start'
| /a/builder/mnt/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/6.2.0/ld: .libs/mesa_dri_drivers.so: hidden symbol `__init_array_end' isn't defined

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 1c1e50b..eca835e 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -66,6 +66,7 @@ SECURITY_CFLAGS_pn-libpcap = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libpcre = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libproxy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-mesa = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-mesa-gl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-openssl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-opensp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-ppp = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.10.0


