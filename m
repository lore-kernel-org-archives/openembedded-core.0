Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1B978C0C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:19:00 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id c13-v6so1901929wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 07:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EwY+ZDwrk4rzsNdU7D7CS98myjCOuA/AyeYbqCpFoSU=;
	b=N2ptUPVt5ANyivxl6DJQGwZzAX0efMUGCkyu/pG685SV+qrXF53N/i07hrdD38GQfE
	rE0EAT8H1wi9yk0ZW/kipjCJPVRIwgelYVsguRiFYk21nvI76/viWKcjonm4toj4NUby
	VmWSa+1MfjVlaI2g8Y+U3Ig2ihAXC7AeKftZojDW/XlY+LEXgSjV46Z6vjZdiAVEFap+
	xhzX6o2nJpG8A6VaMcy/NTvs5U5rlcm40aI/TSmyw5PJj8FxrkDFbD0atE5wEOVZ+/5u
	wJl+P3OZUxfZhygBtScfC37bs3nW60xtePCzxaP8mGWJj3SMrkIiHTNg0kGmPL7ivH5U
	ECig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EwY+ZDwrk4rzsNdU7D7CS98myjCOuA/AyeYbqCpFoSU=;
	b=IIkUNjF1TrLgRTJGXQALQbxbsshxVQBaVhvpGD2eP4DxX0B4KX6ZjunziPW5aFzt0J
	ezVGyrHvkD39HWSJ9nvhwJm46riUGD/OW7qYkx0e2pF8ZT+kXGK56qEV/NhM4p0N3pa1
	ahCnDdAptVYVYhrENkTvZLJepVQUt1zu4zhXIkIH9cXzeyYOQKSRQVtKuY4fPIvX3D++
	RB1zDzjWVcSAaTX9JMAx6RbVc+gDknIiaBQFY7Kkl9PgVQ4LUEkcoY3QCH/vpMwPl2S3
	G15HaAWOlV0vHfJTz7ft6mVv0C+Huq5iOI9O/6NpoaMiZbr3N6kbStTLJIhvpowoS+pf
	Uwwg==
X-Gm-Message-State: AOUpUlHgGEQCh2JicffUojAU+Zm6L1vVXna8BthGpnmF5KoW6twlg+er
	eP5nnvI8QJinCmR+QjjBjaEVj7u4
X-Google-Smtp-Source: AAOMgpffYLieLyLJOfO2j34FyPyQX7k5a2IW1vdDy6Nzto01T8fZnBNAyDhVLHteHKp5w3LM0Tkpeg==
X-Received: by 2002:adf:a963:: with SMTP id
	u90-v6mr1866671wrc.248.1532614740922; 
	Thu, 26 Jul 2018 07:19:00 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g204-v6sm2599965wmd.26.2018.07.26.07.19.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Jul 2018 07:19:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 14:19:00 +0000
Message-Id: <20180726141900.12171-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQfGatvA-7UQSvrBZXG58QNLf0M0UcNbSNp+9JJ==GuQ2g@mail.gmail.com>
References: <CA+chaQfGatvA-7UQSvrBZXG58QNLf0M0UcNbSNp+9JJ==GuQ2g@mail.gmail.com>
Subject: [PATCHv2] util-linux.inc: add fallocate only for class-target
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
X-List-Received-Date: Thu, 26 Jul 2018 14:19:00 -0000

From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>

Because the util-linux_2.32.bb recipe explicitely disables fallocate
for nativesdk triggering build warnings:

WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux:
alternative target (sdk/usr/bin/fallocate or sdk/usr/bin/fallocate.util-linux)
does not exist, skipping...
WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: NOT adding
alternative provide sdk/usr/bin/fallocate: sdk/usr/bin/fallocate.util-linux
does not exist
WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: alt_link ==
alt_target: sdk/usr/bin/fallocate == sdk/usr/bin/fallocate

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index ed5c618750..9ac8bd6f79 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -206,8 +206,9 @@ do_install_append_class-native () {
 ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
-ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall fallocate unshare"
+ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall unshare"
 ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset"
+ALTERNATIVE_${PN}_append_class-target = " fallocate"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
-- 
2.17.1


