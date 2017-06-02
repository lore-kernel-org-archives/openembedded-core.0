Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC4770100
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 14:50:30 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id n23so50075030pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 07:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2MhuUtV693x13WUT5bAqVHVWZ+X9uSsz0F/LDIONDdg=;
	b=HaG79mVdZJi02O2ZPQlcg5CD56NJpo3TmY7wEwtKelK+ildDm2QyjOxS/rRY2/PBj9
	V0b0EYuEWxzwZqrZ4wtH8UGnB83wRr74wn6AyK/5c+/f2Se/mH+B9I87CfqTQ5D565D7
	275jquti7fRYm4CqqyI8T5n2Dwy+fsi7+mlXKs8KxmMj41AuhZNSp7MxygmuFRLc2BBn
	bZN0OVoulCn/D9u3PLphfGeH+C+FvEUaPh2XrEOJdBMgNxwkauVSIiIP3suuJTL3uw1o
	86Lp2rwS4AVClQNTuuSCqVcQuykc3DB9vGUy78ud8KwZxu5G9lfTQCvxoNY4mC2lSlyU
	exwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2MhuUtV693x13WUT5bAqVHVWZ+X9uSsz0F/LDIONDdg=;
	b=OPbmkBBMQEyBE0r/VObWKvrYda7PNWJpO3KCEvKDWCp/lqCnUudvBtnYWD60SXaEda
	zBTfU8ezqedI2i5kh/IPv3Base2fkMKaGJTN37qSStP72CIkWuf27qNkc7a4f/VOJkEA
	d1KZ/ZrA+Ft6V4UJ4ArRPUYcgK9I7rLw0SP7erijqN3POLIUKgwO5hOvDTN4B8mGEoZw
	AYnit/Td2xRV78WPYXLBYBzAuRQp0u/PvB3NfLR2GeAuG4MjHUjJM8Eh+6stZgELAoyw
	LvLSdNjifGI9b7Gq0fkhBiDrzSAmaLKHldrZWtrOpoXiGJbUqWu69BDXb7R+o+YC2cNj
	tI7w==
X-Gm-Message-State: AODbwcBHJ+DW10sFfwdpIMUfixsK1xE2ne3SxBt18/Q0YooxP4JLoYMw
	bTkIO+meCPnawgie
X-Received: by 10.84.167.168 with SMTP id d37mr291352plb.125.1496415031243;
	Fri, 02 Jun 2017 07:50:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	r64sm36879229pfr.38.2017.06.02.07.50.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 07:50:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 07:50:19 -0700
Message-Id: <20170602145019.33575-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH V2] distutils-base.bbclass: Do not use -pie with hardening
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
X-List-Received-Date: Fri, 02 Jun 2017 14:50:30 -0000

Fix build when PIE is turned on. It tries to build
.so file using -pie and -shared flags together because
its doing compile and link in same step CFLAGS and LDFLAGS
are combined and does not work, ending in errors e.g.

| /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-musleabi/python-pygpgme/0.3-r0/recipe-sysroot/usr/l
ib/Scrt1.o: In function `_start_c':
| /usr/src/debug/musl/1.1.16+gitAUTOINC+179766aa2e-r0/git/crt/crt1.c:17: undefined reference to `main'
| collect2: error: ld returned 1 exit status

This error while cryptic is due to the fact that we are
building a shared library but also pass -pie flag to the link
step after specify LDHSARED ( which is -shared linker flags )

we can not use -pie when doing shared libs. This is true for all the python
modules inheriting setup tools

Disable the pie flags thusly for all modules using setuptools since
this setting is done in setuptools makefiles which are then used
during module compiles

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1 -> v2:
- Move the change to distutils-base to include both python2 and 3

 meta/classes/distutils-base.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils-base.bbclass
index 9f398d7051..3adbd5c643 100644
--- a/meta/classes/distutils-base.bbclass
+++ b/meta/classes/distutils-base.bbclass
@@ -2,3 +2,5 @@ DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') =
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
 inherit distutils-common-base pythonnative
+
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}
-- 
2.13.0


