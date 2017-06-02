Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2F9B76076F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 16:01:58 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id 9so51635486pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ItGxa99H5FEieNUmW1ZTSB6EQpQo3W/Y3iYLLEgNBNw=;
	b=gfTadt68ksesKUpkpFICpo2A4ZteVjBWSM4Yaq4dswz5oVhD+/iaKRSBd4Z0LRUp7Z
	ieRswGH2JGDP/taJNnUVrSzO0O6nJ12q73jerkHvcp3T1U51MSFPBS8QdvGjz/U+FvuN
	CvwHihdySlnfV4Ka5iqZnMEkbG15A0f/RbZx+rL+Uxv2nS81FYdbSgPHsO9GAW4XGyj6
	iidPvWBT9ZeNhmmgSKXvX2UW800gVximMcbrQEG/s1n4EnelVBP5hXzFx61jE4pfRLXo
	llJv1VtuD8+agIpG6qPwEkfKmzLiM3XJColWZ1qnxs0KdgARjXMaUuHGrYwtBAu0EOCB
	io/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ItGxa99H5FEieNUmW1ZTSB6EQpQo3W/Y3iYLLEgNBNw=;
	b=A1xgDwKmlfSuPAxWkFijKvvXnQtDvBytdpLJubePWKvq73fRSI/OaLnZL6yBqTVrke
	1LjtljZubB0vQD0xpqgjEfCq0efoBBDF/H/yk+QQ1iyxAaGu7naFbTP+6HpJEq/N8zz+
	cPu2KNO/JOAVds0Sl3wKgHqN9E3slBbkd7Hjad3Ff0lxocPTvB0WaHXmY9B7jFCTMxXj
	WYGzQU6YcpTi2QsVbs2Vq7FssALf7e8H9wLbh0ccudvwobm6q0l0yUksE6FbuZE17pKX
	EQhpMhTrOs6n4AanRW3YPoWcwXWPrJo8rpnDFUTTRb1Hb8JJCidQeLlUmdpLFp0mdIlt
	vNNA==
X-Gm-Message-State: AODbwcApnenbZ1q9CFdjvDd7MrN4XOqT94T8Rvf8YNwIdQGRemXpSQqr
	TBSfVoN+MdS/CzF2
X-Received: by 10.99.126.92 with SMTP id o28mr8053562pgn.63.1496419318952;
	Fri, 02 Jun 2017 09:01:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id a69sm7511420pfg.7.2017.06.02.09.01.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 09:01:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 09:01:50 -0700
Message-Id: <20170602160150.6813-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH V3] distutils-base.bbclass: Do not use -pie with hardening
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
X-List-Received-Date: Fri, 02 Jun 2017 16:02:01 -0000

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
v1 -> v2
- Move change to distutils-base
V2 -> v3
- Fix a missing end quote

 meta/classes/distutils-base.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils-base.bbclass
index 9f398d7051..d6137c4e42 100644
--- a/meta/classes/distutils-base.bbclass
+++ b/meta/classes/distutils-base.bbclass
@@ -2,3 +2,5 @@ DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') =
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
 inherit distutils-common-base pythonnative
+
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.13.0


