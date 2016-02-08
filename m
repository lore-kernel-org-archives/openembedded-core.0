Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A60A56FFC8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 15:16:06 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c200so20323609wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 07:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PQmTOFRsqEleYr3yRyb42b/kCXOQxxa/XbkOyhuHsPk=;
	b=ZxsOzlvYXJCVJ61gsll3smKsmeYlbkJ67pgwumu3CGkL6wp9yvg/lxNpdiAAeS9a/4
	a5EqA1DYP5NAo9voh160CNZWYkEId7t+W0FSKWBTU7K8xr8QzqKMjemSwURym6NtNzIo
	N7DssJXKb12b0dWmfaYzHVHaDjYWlrj7XDC3l1c3+CX4SsEkpfguz034vAyJv3tjwEPH
	fm2zxOq4jPccgwQdpqouok00sh8QQdv/MSteHM6MCHoYRRzThSqCZdo4qFE5MM/RNAiM
	/XElN3D0KY1Is5NE4+AzqSeRlFteE3i4cpObZIvQOtNIbwluAHigMhp5p9CKCbxiQqgg
	QiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PQmTOFRsqEleYr3yRyb42b/kCXOQxxa/XbkOyhuHsPk=;
	b=N42hflq/6sPGF+871rhnX0YeeG0ZrdlPFV+CF0v5TosKsBg+KZ4exmgDoCYohsVT8F
	DlZIPb+6d0MbGiAw9bHnp2uhDAF0F43Rr7ZK+ult/LC1zdsRytWf5vpDRG5OsUan4kD/
	R8EvJlS6gANbmHbXts2dREmiT/fbWOWkXi34vjXpSjkCkh23cbmM+Ql1DvbiJgteIenS
	Stk7wcATZF9yYcakTjWm9mWcDKQ10feLnHEX5y9XYnHX+acmECYLSxHZY2q2e8W5NeUB
	JzEawtZji1sgfT/EYRDz1XLY9185yLS6Xb2LK0UidC9mzLMdC/5vP1uryb7JkJFVVX94
	95bQ==
X-Gm-Message-State: AG10YOTKm0TgdGOtafVb72+UPdcvRLJgjlyidk0PA3AdFDrm5KoaRZChct2KLX9+EFq8V0OA
X-Received: by 10.28.132.212 with SMTP id g203mr8161249wmd.30.1454944566673;
	Mon, 08 Feb 2016 07:16:06 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lc3sm30223187wjb.7.2016.02.08.07.16.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 07:16:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 15:16:03 +0000
Message-Id: <1454944563-30448-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] tune-corei7.inc: tell qemu to emulate a matching processor
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
X-List-Received-Date: Mon, 08 Feb 2016 15:16:06 -0000

If tune-corei7 is in use then the target binaries may contain instructions that
qemu-x86-64 can't execute by default, resulting in errors on rootfs construction:

NOTE: Running intercept scripts:
NOTE: > Executing update_font_cache intercept ...
qemu: uncaught target signal 4 (Illegal instruction) - core dumped

In this case the instruction is popcnt, part of SSE4.2, so tell Qemu to emulate
the CPU that the tune targets (in this case, Nehalem).

[ YOCTO #8888 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/tune-corei7.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
index d245d9f..197558f 100644
--- a/meta/conf/machine/include/tune-corei7.inc
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -11,6 +11,8 @@ DEFAULTTUNE ?= "corei7-64"
 # Pull in the previous tune in to pull in PACKAGE_EXTRA_ARCHS
 require conf/machine/include/tune-core2.inc
 
+QEMU_EXTRAOPTIONS_corei7-64 = " -cpu Nehalem,check=false"
+
 # Extra tune features
 TUNEVALID[corei7] = "Enable corei7 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'corei7', ' -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2', '', d)}"
-- 
2.7.0


