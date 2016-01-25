Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8D50C769F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 22:58:59 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id u188so85158560wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 14:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Hr8kc71thbtad+xqtZ4wu/m5CqjVhMat+Nm9ipLaODA=;
	b=zAQPb/K8UhsNW2hJuEwS/G2LP9NqimcYQR9rXHrfmku1Uz7shbn6KnYHO/02+yh/rr
	QK1TU5xB1cV/aW1m+IZQOzliW/KSzou1AZuKGTm2lWCUON8ripo2FJSK77gRHadYiIeY
	I/esRtjZQfGeREWJk9W28eHbNAomGYMayaBeVBQMeahp6TapdJWt+kYwcV7LhU0pRdAM
	eW7QlvAKpFhEUo3HMJ1fDcURmlI9ujnhXA2nHFKFkkMUnQjKxcZ4ajfe57c9TmIwNHm5
	fUw5oIlDqQ74BLd7WpWhMihQppwyGhbBEACKh82iYsdXlmxwz5jwasYeMaGMz1zCUOxG
	tAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Hr8kc71thbtad+xqtZ4wu/m5CqjVhMat+Nm9ipLaODA=;
	b=QTx/JQGlJ+lV5NtrB5+IKim9F9TqO8iQKaYX9iH86NEjO7qQMlR6v1np/21w1X4sMj
	LGUhVVvW39tVt87ppmSoPRQS3Ea2w4hV9NsvO7iXvDaJYyDAftmjoENzYDIpNXFXxvsi
	MR67MQ8LiFlnwXCsIrZpENm+g77u2H3oinSXav+trmLL+BEBUHZjXwrAufg92kIER1GV
	ctxSPZmhfCT2uXWdsRgB5wVMmVzY4UZgvEy0BfkaP2fvtVZllSlCbPj3IbsHI2tTW68L
	hCXHLcP00q3fhsc2lHdEDdPoUix/BCE1y7QwHmjBgfvt2cD6k0bDeGcIAailxhufS0jH
	tbBg==
X-Gm-Message-State: AG10YOTkfTz0NsMzYnRuX4Z24JjBLyi9Fa+rtvK3Mkt/I/c4gejZcKq1M3ig9aSaXdd69iXF
X-Received: by 10.194.86.136 with SMTP id p8mr9715572wjz.162.1453762740337;
	Mon, 25 Jan 2016 14:59:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z127sm809810wme.2.2016.01.25.14.58.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 14:58:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 22:58:54 +0000
Message-Id: <1453762734-25830-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] e2fsprogs: disable blkid
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
X-List-Received-Date: Mon, 25 Jan 2016 22:59:01 -0000

Both e2fsprogs and util-linux can build blkid, but we want to always use
util-linux's for consistency.

(blkid was enabled again in a1f235)

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index 912bbf7..48af43b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
                 --enable-elf-shlibs --disable-libuuid --disable-uuidd \
-                --enable-libblkid --enable-verbose-makecmds"
+                --disable-libblkid --enable-verbose-makecmds"
 
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
@@ -78,10 +78,7 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINK_NAME[chattr] = "${base_bindir}/chattr"
 ALTERNATIVE_TARGET[chattr] = "${base_bindir}/chattr.e2fsprogs"
 
-ALTERNATIVE_${PN}-doc = "libblkid.3 blkid.8 findfs.8 fsck.8"
-ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
-ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
-ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
+ALTERNATIVE_${PN}-doc = "fsck.8"
 ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
 
 RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps bash"
-- 
2.6.4


