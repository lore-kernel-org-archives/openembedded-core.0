Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7269B61429
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 15:51:04 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m16so16641274wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 07:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jmLvVCJuOVK4FeKP3wM29KkbMqpntpQPgjdnJVcP7y4=;
	b=tcZIp1Q1vQCTzzh6HIu3d5hl5yTDzFmu8E1Qo2eqq0Mepf2ZIi7n22//Jkhkkm9QWi
	LfEQ8oFYLyV9wkDXj8RddZDwxWckHNOYtnEnNmVE8r/VF3V83vKFVXj+8aznAcrnEE8C
	dgsqxajoVFj/JXeYSbyJ1DlqV6YO6vEaUChklLFqlK1OzwB1kFvRCRo0hswEP7uAOpgX
	BcnYOmkJ1Cgh3vq6lZqvoSZhleIatL3NAVfUHc7wgjSYOoMFuECe5daqVjsrSw+yAhxQ
	ULN2avk1xuj7HrcPStiqtc78rDLERI+m6stds1TpUTq39/4ILCtMWmjrFMzCb9jrwEY+
	M0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jmLvVCJuOVK4FeKP3wM29KkbMqpntpQPgjdnJVcP7y4=;
	b=J59y6GjmlZB8ln/x2WR4y+sUvGmMRtCd/Xii+1TGepnhX7sexNL3ekXg7RtRmTBzHx
	nDRBhWgI/kkNbxvv9ZPA1D04gFDANnRj1CmdkG53rtO02sKLHlDCwap0TRvX9lPeYnRE
	G8OTpoO8acLDTgXYKERU0FFSu1fS8p1PkBOefoPVaC6sln7htELbyfWPTMb8ROfONOPO
	tqrx/OlWMT8rgupSPIK9oOp8VpqIYAgSVxqTCuhYFiRZM0WQ5Dq3zWxENtuLEHeSoXNZ
	awykpH1QUgoiiU9SKrNXt9cYNN5R+JHKmgUDjSjcOwYwr1yP+g2kRQPGCTlJAQjI49u8
	Ponw==
X-Gm-Message-State: APjAAAVng6XRR8y7ebE6M//oA/cSiarTwRlR6tWkSj73tAwJwuhRskVN
	PIlSbtgF8xavDloq0b+zzG3IWVkI
X-Google-Smtp-Source: APXvYqw48R5tvl2r0QREHVCneCmJEZh/GRSN6SBw4+6Vfs5EBGPRVbvPhmhasG6hyJch+UEoCC89hQ==
X-Received: by 2002:adf:f606:: with SMTP id t6mr16381310wrp.304.1581868264764; 
	Sun, 16 Feb 2020 07:51:04 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	t81sm16513271wmg.6.2020.02.16.07.51.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 07:51:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 16:50:07 +0100
Message-Id: <20200216155015.21738-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216155015.21738-1-alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] qemux86: do not add vga=0 to kernel parameters
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
X-List-Received-Date: Sun, 16 Feb 2020 15:51:04 -0000
Content-Transfer-Encoding: 8bit

This was added ages ago to enable GL passthrough with
vmware driver, and is no longer relevant, as std or virgl is used
instead nowadays.

Original commit:

commit 072545b1111c5efb66289a4866897429f5fcd969
Author: Richard Purdie <rpurdie@linux.intel.com>
Date:   Wed Jan 21 17:40:51 2009 +0000

    scripts/poky-qemu-internal: Add support for GL passthrough in qemux86 images

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-x86.inc        | 2 +-
 scripts/lib/wic/canned-wks/qemux86-directdisk.wks | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 495418fa04..049681b27d 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -8,7 +8,7 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
 
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
-QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
+QB_KERNEL_CMDLINE_APPEND = "uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
 QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
diff --git a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
index c8d9f121b5..22b45217f1 100644
--- a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
+++ b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
@@ -4,5 +4,5 @@
 
 include common.wks.inc
 
-bootloader  --timeout=0  --append="vga=0 rw oprofile.timer=1 rootfstype=ext4 "
+bootloader  --timeout=0  --append="rw oprofile.timer=1 rootfstype=ext4 "
 
-- 
2.25.0


