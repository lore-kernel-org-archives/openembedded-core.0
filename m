Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id D2C6B7600A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 14:35:35 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id f1-v6so9171638pgq.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 07:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lASq+vorbF9g6TprEN5wdXtFrEM/UTAtPjcTTh1hnxc=;
	b=WC1Rr1SAm+Bp7uyDI2+zW7Qzbrh8P8svupDCOOkmEEh+LGSb5DREZQxcPm9Fp4oObE
	lGo+Pl0OEHpY9wVAr5vWDFK/aNZqlXN6w34X00SWNr/ucagohkrDFOcYBNLPNxzO8Fq9
	fBzmsYNZh+VJ9F6T2PEIrXUboEmPbFLsaNg6nCV4sBG2kM44LOZABQKajVJRCX2apzrS
	KpGNqfVJ7KTMfCm9qn0gsbA2mzTh+gkB3hAXd9CWplbpiRtwXm5qaMtqUlZr2dX4oE2f
	JW9TAirSH4rGte7tP5DaaPRoSLwQIKNv4Dv0gEfG8XovPGa16AtXK0j2Nyah/kpMF99s
	1bLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lASq+vorbF9g6TprEN5wdXtFrEM/UTAtPjcTTh1hnxc=;
	b=hUkab7xthhLrgxrSrgG/BG3sDKgMMUk8yC/lK8auPXM+98C7NZ4SoOzLi6d08u7QKH
	5Qa89rVDQfYQeXIAA1UVQ11Z3Wb1AICqoTqwamWM2DD/8mrYHaRUA0nyhmcIin+FvuZI
	DU9HwDEMRJA/OPeiUQlU3J89BgBdKIVpvaIGIxNBNmCO+Y4V2DA6dkCT6Foh+QtNJkHq
	6FyhNdkVgseqFMi0xpqWPyWDv3uIgKcQ74fKi+UQrt2xUuyWg+XQR88YInZR5WqDtcYk
	rf2lozW78+DF1BulPPsFuOV3dkK4I0I2uiiTf+FprN9NPKRcu1GQZjUx/Atlniji85ZY
	YBSg==
X-Gm-Message-State: AOUpUlET+bDpWXs6Zoj8R29DG/wjAOQ7KIYieqLIb9aTn79f945voOu8
	HinjLjaTxShimgtAlKS+huLGbNeHNac=
X-Google-Smtp-Source: AA+uWPwJw/Y4eGeWd6ZqL9ZnccbmqbVbsb18BFUIsqUFT88vqPxrNBPElgk/axTgqejP1xKHck6HjQ==
X-Received: by 2002:a65:5803:: with SMTP id
	g3-v6mr21743941pgr.117.1534257336797; 
	Tue, 14 Aug 2018 07:35:36 -0700 (PDT)
Received: from localhost.localdomain ([157.49.75.10])
	by smtp.gmail.com with ESMTPSA id
	e126-v6sm47148200pfg.31.2018.08.14.07.35.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 07:35:36 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 20:05:29 +0530
Message-Id: <1534257329-3129-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v4] runqemu: exit gracefully with an error message if qemu system is not evaluated
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
X-List-Received-Date: Tue, 14 Aug 2018 14:35:35 -0000

It solves below error:
-- snip --
return 'qemu-system-%s' % qbsys
UnboundLocalError: local variable 'qbsys' referenced before assignment
-- snip --

[YOCTO #12846]

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 scripts/runqemu | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index f52b9a8..409d17c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1118,6 +1118,11 @@ class BaseConfig(object):
             qbsys = 'riscv64'
         elif mach == 'qemuriscv32':
             qbsys = 'riscv32'
+        else:
+            logger.error("Unable to determine QEMU PC System emulator for %s machine." % mach)
+            logger.error("As %s is not among valid QEMU machines such as," % mach)
+            logger.error("qemux86-64, qemux86, qemuarm64, qemuarm, qemumips64, qemumips64el, qemumipsel, qemumips, qemuppc")
+            raise RunQemuError("Set qb_system_name with suitable QEMU PC System emulator in .*qemuboot.conf.")
 
         return 'qemu-system-%s' % qbsys
 
-- 
1.8.3.1


