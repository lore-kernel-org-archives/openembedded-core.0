Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9ABC560807
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 19:25:56 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id u138so23286493wmu.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 12:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tAKOGZbvwjwLcy9TqqjE9nxZwkSSZbbYn7y2r97QECY=;
	b=yoXUv/iikE7Brh6aeiyd56F3zCLxybto+rmFt4Vw+xTglroiUvukDTeLRCSTqUdroO
	YrDHx8DbKIT6sgDEv01bzeJnGI8wb3FxFj4ls+xGoLGq7MVbACrmJc7upryQuWzCt7kc
	8Xp2wPRkou2WVZXjQSoqTDryvmrgFUkDKMjpLEtRzhojyOOe7YVb+q6wAKy78pwIVm8L
	me6MfYNKF4KKg2nuZjVvSoX5082H/FNNU7w7Gsu62lrGxk3QAbjjg8xKlZ4igx3rku87
	rJfR8ChhhcsTQDg2wG0epTmfS+NxtazG4hBJh1TbV4biaZkQPp2Nz6p+o1yiFmLJaMyr
	htaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tAKOGZbvwjwLcy9TqqjE9nxZwkSSZbbYn7y2r97QECY=;
	b=FkazlP8TbZStG7aEKMHK5D4SY0OsUcVwONUrST7Nw+n4ixfYuvKmMqiFhnVo3Cb30J
	Ryzdy73VvfIqf9lhjSOWQxDvhFoFcQjS33tYSjk1zLG2B0EuedmIydKyZ5Q5IeeZtVzu
	N1t0f92uY6Mk1VuD5uijMm4GcFXllcNJAqq/MmBwaWwIcZHXOYkeGIPxFEq2BHfYKMEX
	tG8ztd4Rn30FanBpoilD9P6UDcggXfsokCB/lCaPe23fdzsySmipRMAS1QFRgdoJcSiO
	6od09CfGt1tIpjqRIGW+9jjGgEg2LsmETzvfSJBS88LWjUtrii2CReE2mhBGrJdw47gU
	ExTg==
X-Gm-Message-State: AMCzsaU0bjfDMxwxUw8q6l3fAX6UOTtMW8LPUSxc3mndKDhQi3hUeFqE
	av8E8CVMqD1C3q31LO2mYM6R9cIL
X-Google-Smtp-Source: ABhQp+QHpDrbdl1E90mVFGyJusOAjUBF2/lku61vogq9TI7bS8+8oc2RceJsaSKBdFaITI35djXlgA==
X-Received: by 10.28.55.2 with SMTP id e2mr2392255wma.60.1507922757108;
	Fri, 13 Oct 2017 12:25:57 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q188sm1538362wmb.43.2017.10.13.12.25.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 12:25:56 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Oct 2017 19:25:27 +0000
Message-Id: <1507922729-17240-1-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] Define GO386 for go cross-compilation
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
X-List-Received-Date: Fri, 13 Oct 2017 19:25:57 -0000

These changes resolve the "illegal instruction" errors seen when running go
binaries on qemux86 by ensuring that the GO386 environment variable is exported
and set to an appropriate value. This variable in turn controls the floating
point instructions emitted by the go compiler for x86 platforms and must be set
to "387" for platforms which do not support sse2 instructions.

The go_map_386 function is initially implemented to recognise the two x86
tunings defined in oe-core which support sse2 instructions: "core2" and
"corei7". This can be extended later if additional tunings need to be recognised
to support x86 targets defined in other layers.

My hope is that these patches are suitable for inclusion in the rocko branch
(after the 2.4.0 release now). If not then please flag this and I'll look for
alternative solutions. I don't think that leaving all go binaries as broken on
qemux86 if they happen to use floating point operations is a valid option for
the rocko branch.

Paul Barker (2):
  goarch.bbclass: Define HOST_GO386 and TARGET_GO386
  go: Export correct GO386 value for target

 meta/classes/goarch.bbclass                    | 11 +++++++++++
 meta/recipes-devtools/go/go-cross-canadian.inc |  1 +
 meta/recipes-devtools/go/go-cross.inc          |  2 ++
 meta/recipes-devtools/go/go-runtime.inc        |  1 +
 meta/recipes-devtools/go/go-target.inc         |  1 +
 5 files changed, 16 insertions(+)

-- 
2.7.4


