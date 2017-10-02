Return-Path: <drew.moseley@northern.tech>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0153871A15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 21:48:39 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id f3so11365530oia.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 14:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google; h=from:to:subject:date:message-id;
	bh=j01MYECfZIkpqjB7QMcx4mse2/O5z7V72wuhaGuQsPI=;
	b=HL7cdhSjguYDt9ehWRmFuC4/SzFmygWCoM2NOcxisJOTHX7zPicUS/Xvbg0I8kc/Ot
	6YzpOG6h+HSEdDH9VWm/FUUh7HHWp7GkviM5C1k295Wg1JBsKgFdw43s58STGo4s+KIL
	cWu6xS2eRiU6oyqA/AuPWQdwKfWatc8h/X6uK3tdYgjxDEkDF4LYk1FmoV4YrCNiJBrP
	xmRdCRWf5Kts1Wi02QhbcX60ry+7UsrZ+3NIu386MJpfiTNUO0RPlKfr0ennRTvZ6ffx
	KoztiUFKAYBdguyjg6+biiCuzHyqmYylm0sSO2OpD+/G4d78Xyx9evCc6ugvlUPlHrfB
	Q59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=j01MYECfZIkpqjB7QMcx4mse2/O5z7V72wuhaGuQsPI=;
	b=mW+HP4RcN+am6C//CuVcGq7twbXQWITq3ifkP9VpZQhwA6bfqYm97OC5By21go/3ha
	aVVCQ1DZoWjxtKvmSQjMEamx7ix2OoUd1DmclKG9uhya1rO/L7Zb3qdT/USojBusl9Rv
	JYIHx6OAVnUBL6QcmfhpN2PV7/UMKTf+zxGhy7+q72W73TRFcUAirbfVMDaGAnyM43PM
	qgu8pPj7842Qs5xWATily4zf63Z5ZiYlRCEBLqTn66espCAHKNi3fTKS9wMaLPrLYM2E
	EPdgTwB9YkGJeBvVKzhMiV8wQjkYDa3A6wUUIhaLtNJwuvXxbNTJvdEIV1gNrFiArfa6
	vtbQ==
X-Gm-Message-State: AMCzsaXvVgczShRm5APVvKWOImhoi63mXcxlVX3/NYdKAXQIxVtKODbc
	Xokmy7Wr5X7+R7+5ncGjnWfdtaoeaBU=
X-Google-Smtp-Source: AOwi7QDd31B6cDNA9FxCtgdgR4XPjqr/pBn7AeoeK0UHLAsiTI0tLpY0tGbBHZ1XHSJyrxa+d6dX8w==
X-Received: by 10.157.4.233 with SMTP id 96mr9210698otm.484.1506980920506;
	Mon, 02 Oct 2017 14:48:40 -0700 (PDT)
Received: from tobago.home.moseleynet.net (173-168-237-167.res.bhn.net.
	[173.168.237.167]) by smtp.googlemail.com with ESMTPSA id
	t188sm5830516oie.42.2017.10.02.14.48.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Oct 2017 14:48:39 -0700 (PDT)
From: drew.moseley@northern.tech
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Oct 2017 17:48:36 -0400
Message-Id: <1506980916-22348-1-git-send-email-drew.moseley@northern.tech>
X-Mailer: git-send-email 2.7.4
Subject: [pyro][PATCH] archiver.bbclass: adapt do_unpack_and_patch to RSS
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
X-List-Received-Date: Mon, 02 Oct 2017 21:48:40 -0000

From: Mikko Ylinen <mikko.ylinen@linux.intel.com>

do_unpack_and_patch was not correctly run until recently
("archiver.bbclass: various fixes for original+diff mode") but
with the fix applied, the errors we get indicate the function
is not adapted to work with recipe specific sysroots.

do_unpack_and_patch sets WORKDIR to ARCHIVER_WORKDIR which
affects all path settings relative to WORKDIR, inluding the paths
to recipes' sysroots. IOW, when do_unpack and do_patch are run, they
cannot find the necessary native tools and files located in the
sysroot (e.g., quiltrc) because the paths point to ARCHIVER_WORKDIR.

Adapt do_unpack_and_patch to RSS by restoring the original
STAGING_DIR_NATIVE after WORKDIR is changed to ARCHIVER_WORKDIR.

(From OE-Core rev: db7d2cc5a4df3c2077ba874c7ae395c73fd9ed13)

Tested-by: Drew Moseley <drew.moseley@northern.tech>
Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/archiver.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 2c04557..bab3461 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -299,12 +299,15 @@ python do_unpack_and_patch() {
         return
     ar_outdir = d.getVar('ARCHIVER_OUTDIR')
     ar_workdir = d.getVar('ARCHIVER_WORKDIR')
+    ar_sysroot_native = d.getVar('STAGING_DIR_NATIVE')
     pn = d.getVar('PN')
 
     # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
     if not (bb.data.inherits_class('kernel-yocto', d) or pn.startswith('gcc-source')):
         # Change the WORKDIR to make do_unpack do_patch run in another dir.
         d.setVar('WORKDIR', ar_workdir)
+        # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
+        d.setVar('STAGING_DIR_NATIVE', ar_sysroot_native)
 
         # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
         # possibly requiring of the following tasks (such as some recipes's
-- 
2.7.4


