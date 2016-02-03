Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 34FFF771C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 06:27:55 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id y9so4213941qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 22:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ufZtQP0lMmK30Ppi8IGlnGhj6CbLBJQa5940C4tX6Aw=;
	b=LjzWahZAY8dwBdslCfod4UrB5yiUCt83pX4wn8ojORrLZ5cbMSvNfGRh9l0IBPToud
	+0XHSYpEppG2KSTu77nsCQHQPs7D4zo0E5w+cvg6wu+h37w+5H1NCvsCtQgb6J/25uZY
	yYXchjtfEgq8oEzaI3YPQEvHgggfi1pA9NGCaroVaaiahbmVv/Qor2eKTeHFE97o0uep
	7hTI50FUKjh7WAppiuHoMHbqoVwMyzxo90e5LDTgP3tZR9kX0cbDh0DoB3ZSmTRCtHYX
	ZMw1muMsdfnqVhsfcYVrjfUl7mQtHkt3E1sVKBjaZLjiGj/6Lm35vCvuIqVGFQmVSa6f
	Wdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ufZtQP0lMmK30Ppi8IGlnGhj6CbLBJQa5940C4tX6Aw=;
	b=lx7DHbitkuqtBovHv9JPBYdVMUhoM57t8jdfG7AhSIDGFQjeZdlQKNcjbWTQKyfUeM
	48S/Ohppp/vUuNYOL35KzhFFq2VAyLYnpavfyhn1eT5F1DmWe9opYVts86/ZgrVJXOs/
	UFtvQFtIxqcXj4zApf1y7nPFO3/BET7/UrtSunixaXiKdSpbIb27LI88j7BNM+YXVutk
	96idshN2uP4IjaOackneBBMG1w2hR1RacFpFNS8M6cPzyZAjlWq2WPEv8JVGrJVTVLIx
	nYzGbzCbaAba2zZPjBCgKBydURBk8TkbhZ0GCTz67HdiQdSKCWnlMABvNBkhQVZ2qMqb
	DInw==
X-Gm-Message-State: AG10YOTamnPruoki2fi4bsgQY3iafN2Xd1Yi+krogri05Uo7elOiixA9bGiusGOIiKCxtw==
X-Received: by 10.140.20.145 with SMTP id 17mr40268792qgj.45.1454480875896;
	Tue, 02 Feb 2016 22:27:55 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	t23sm2273320qge.26.2016.02.02.22.27.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 22:27:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 06:27:51 +0000
Message-Id: <cover.1454480571.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 0/6] Fix issues when using security_flags on musl
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
X-List-Received-Date: Wed, 03 Feb 2016 06:27:56 -0000

security_flags enabled builds revealed several issues when building on musl
especially compiling gcc runtime libs we should not use fstack-protector
another change is to replace with -fstack-protector-all with -fstack-protector-strong
which is available since 4.9 and has best of both worlds (stack size usage and security)
gcc on musl/ppc was missing patches as a result images werent booting on qemuppc
that is fixed too. It also revealed some more issues in compiling gcc for musl systems
was not getting all configs right.
Addressed the review comments on nss-myhostname

The following changes since commit 2218490b075b077683f17b643ab211c7716d0dfc:

  documentation.conf: align the documentation for DEBUG_OPTIMIZATION and FULL_OPTIMIZATION with bitbake.conf (2016-02-02 17:48:00 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (6):
  nss-myhostname: Fix build on musl
  gcc: Fix build on musl with -fstack-protector
  security_flags: Disable fstack-protector for gcc runtime libs
  security_flags: Replace -fstack-protector-all with
    -fstack-protector-strong
  gcc: Assume libssp and dl_iterate_phdr on musl
  gcc: musl related fixes for unwinding,ppc/secure-plt and gthr

 meta/conf/distro/include/security_flags.inc        | 17 +++--
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  7 +-
 .../gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch    | 11 ---
 .../0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch    | 28 ++++++++
 .../gcc/gcc-5.3/0048-ssp_nonshared.patch           | 29 ++++++++
 ...-weak-reference-logic-in-gthr.h-for-os-ge.patch | 78 ++++++++++++++++++++++
 ...050-powerpc-pass-secure-plt-to-the-linker.patch | 66 ++++++++++++++++++
 .../gcc-5.3/0051-support-unwinding-on-musl.patch   | 34 ++++++++++
 ...tname-Check-for-nss.h-presense-before-use.patch | 53 +++++++++++++++
 .../nss-myhostname/nss-myhostname_0.3.bb           |  4 +-
 10 files changed, 307 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0048-ssp_nonshared.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0050-powerpc-pass-secure-plt-to-the-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0051-support-unwinding-on-musl.patch
 create mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch

-- 
2.7.0


