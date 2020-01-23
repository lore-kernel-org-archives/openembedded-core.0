Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id B87027FCB1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 20:00:28 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q127so1912282pga.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/Sju+9qB1vhD/Abqe9xkEy06+g6lkR+PvjjBRSM3Wm0=;
	b=Bas37OgYTG4zCs4W0MrluDruqdBbPVzQqGDPTGuCUwrOdYL/Usjgd90FV3EqSSomZb
	YgqUz/L3BLGl18TlBl7MAJ2or5j+hs5qkmS2IE7I290phOH5qA56Z8jrf6ppUoo4TTwF
	IUuZEM1Jj1jmX5s3V2HYiRDcNLsWPCDM9iAxc2gMZSbMZbWtsJwUexqz1vHYx97No43H
	4uBP2TnRyXeG4OppB4f2DiT+0FHy5nFwgUzT8MTKBUhWduvaP3hFU2ROvCBUfOrDBRcg
	EiirQwNPLMt5p6kCFXe+g7GsRNzF/uE7q2OMf3xPbaHHDw1uXp0caIur+CRoXVrLnz3V
	N6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/Sju+9qB1vhD/Abqe9xkEy06+g6lkR+PvjjBRSM3Wm0=;
	b=JejNo6oMDNhbpwItQIEyzHVxJoUQ5ovibnasjkAGa5isj4k7ef6wBPqBUtgO1k45ov
	qykJLkG3Wa0VkScyZwvx31rPNZ1+yqOSJoijS80jkwya+3WFDk14mEkBV+077o0UOA++
	jF8skqOhg0yBnJ82BZipMDAdYdMPklxO1ffCpL4SS7Nt/UVVRRvGizfDGrUDFn7V38WB
	K3MI7NEJVYn2P5SIHIygbvg4+dfGpVOlsklhgnOXlBNhhgRqVwsr7X9fN0wSLp9zkt22
	r43vLgXiRpIonoS/S3w7ouehFgIxTnHWwlIKaVRyAIkxX5D3MJcy4I8mxO7NVe8yDSKc
	vFYQ==
X-Gm-Message-State: APjAAAUbs+QftedEWpbgUIidiQZV+X4Dlsno0BMYn+d+IQZhRYkn2RT+
	jctQVSCFiZnTTTly3rfjXc5dJfpQ0YE=
X-Google-Smtp-Source: APXvYqx2lmUePsHJ/MB45aCCo/NnGGJRaU1Hd0nyoWUh/a46LikVnRpSugGTMsuw3sunSBJbatU+pw==
X-Received: by 2002:a62:d407:: with SMTP id a7mr8616241pfh.242.1579809629271; 
	Thu, 23 Jan 2020 12:00:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id s15sm3819473pgq.4.2020.01.23.12.00.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 12:00:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 12:00:29 -0800
Message-Id: <cover.1579809439.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 0/4] Fixes found with master versions of clang/gcc
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
X-List-Received-Date: Thu, 23 Jan 2020 20:00:28 -0000
Content-Transfer-Encoding: 8bit

libucontext is library implementation for ucontext APIs which in case of
glibc are bundled into C library but not for musl, this helps compiling
apps needing these APIs on musl, e.g. chromium

The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:

  bitbake: tests/fetch: Allow wget upgrade tests to run against a local server (2020-01-22 15:56:39 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib kraj/pu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kraj/pu

Khem Raj (4):
  perf: Pass LDSHARED and CCLD via EXTRA_OEMAKE
  ruby: Remove __has_include and __has_include_next from preprocessed
    header file
  nss: Pass NSS_USE_ARM_HW_CRYPTO as define in CFLAGS
  libucontext: Add recipe

 .../0001-pass-LDFLAGS-to-link-step.patch      | 31 ++++++++++
 meta/recipes-core/musl/libucontext_git.bb     | 62 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby.inc           |  7 +++
 meta/recipes-kernel/perf/perf.bb              |  2 +
 ...figure-option-to-disable-ARM-HW-cryp.patch | 25 ++++++--
 5 files changed, 123 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
 create mode 100644 meta/recipes-core/musl/libucontext_git.bb

-- 
2.25.0


