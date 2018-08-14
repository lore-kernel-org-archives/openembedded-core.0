Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 94CB674616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 02:51:58 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id t17-v6so7698901ply.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 19:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KkRe8N4ggw2lqRh8MBvpcY6G0WL0uvIgf08V2cNOW5Q=;
	b=qDkMC7inaRLQwgmI8tnVyz6UoIyZB5XECcl0IdrpwBVkfbjYKifG+kzqoBzYpRxAvf
	GqICwOACSQjt8y93upEzOYuiL/Wy9SCJV+aUwravRnPuGSLLcxi9PevxgKmfAxaxsTAP
	+8iZDuPxL9RxVHoQ5NCDA/Du5d76Wvo0QzfIldlDMB03B00uQvFNlY9lKf86sApGBJYJ
	UK8aPZkW0g5iii/jKkvbc1EicoyzE4WWYhVAMMw/+3io7UjStnk00smqQgtemkbaxkdM
	b+pmq/zt61ePXwLwzHYbGob9TVOlR8ao0lMTK7OGaAMdy3b+XIMJJvgGrFttkT8RgTQg
	lOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KkRe8N4ggw2lqRh8MBvpcY6G0WL0uvIgf08V2cNOW5Q=;
	b=Af/HOpsU5f+PWlMujFMIX51Q1HbjmUTAhLGpeLoxW2ViHQOBWobrblnv18QPI20SDo
	v4hoWlUrLEK8Xg7XkLMFiAo3aaV/pERLip3xRey2MXno1Ets1I4S6iZrwHtxAXGfxEj9
	nGM37w+O7pve1mbDGGY9whfAwDBQs+Y9K4wdaStpdvsXl4/HQUDfT6NiSykGiPSeBhR8
	XEa5pCp2WJnQgFIs5LZzroLidFwVfDRTqn98gRmlw7oACT2ofZ6DZgavXvOdIro7ZzMU
	QvGJMs2GvEMni8McvC8yszfJTumEl7pt/Uoe6op06Nb8JnSxW58iDaSubXMlpHDdumdT
	EzkQ==
X-Gm-Message-State: AOUpUlFWu69kxz4SHY/V3mWVuephi45wkRa1m12HNEnZs9E52BSNhiIW
	+zlymUACU0HbIGFfGX9/LLNfnsi+kK4=
X-Google-Smtp-Source: AA+uWPxvnXz8DhUFVuWr6TNTxGuVQl5+W1b3LuphtTe0fB4E1TP/0aFTG1Ylf2RBcT/fzS1hNEklsg==
X-Received: by 2002:a17:902:5ac7:: with SMTP id
	g7-v6mr18442313plm.90.1534215119597; 
	Mon, 13 Aug 2018 19:51:59 -0700 (PDT)
Received: from localhost.localdomain ([157.49.11.90])
	by smtp.gmail.com with ESMTPSA id
	y128-v6sm17704023pfb.56.2018.08.13.19.51.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Aug 2018 19:51:58 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 08:21:51 +0530
Message-Id: <1534215111-3416-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] runqemu: exit gracefully with an error message if qemu system is not evaluated
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
X-List-Received-Date: Tue, 14 Aug 2018 02:51:59 -0000

It solves below error:
-- snip --
return 'qemu-system-%s' % qbsys
UnboundLocalError: local variable 'qbsys' referenced before assignment
-- snip --

[YOCTO #12846]

* v3 changes:
  Added yocto bugzilla ID in the required format

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


