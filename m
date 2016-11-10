Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 661BD71A6A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:18:50 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id o141so115937599lff.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 04:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HfEecQaKUmHuz7XHCcD59lOZeVqKe395lmQqEuKdCpU=;
	b=ov+BuBJqfXXIrv4rtl5JYu8Sazx9tTT9f0+R0NrkH2HHJHUKcPECseNQxFows43lp1
	ZplaA5O16H2HHddX1Zklld6og6TyDHuLtaU1FvWq+tnSxyZhZ1j0JgJ3SBcvOh9FE/uG
	1ty3n3Qzj/MDKpWK0O2zsSe+F/LzxIoywqasABzPjLJ0cnuyzxDFN9LmV6z+qDCiK8qB
	wbFH1QZbydEJlA7XHZ7oyYKHBoTwWQES6eHCdq2iF36Mha+tJIPN0YxHk9enfOspnCHm
	XEGpY5nwz/zz4KUUqdCHLEVUv/L27BdRtHodA5ZK2ePwyLMV84LyrHOlBJjAMa1YndDx
	d/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HfEecQaKUmHuz7XHCcD59lOZeVqKe395lmQqEuKdCpU=;
	b=P/4mvk83YSUrwponiO4ZOlFnBa3Y1k9kJ/5LzydVWZh0PBnxKCQDy327VT5QeVuURc
	nC+njo1jJ/+6jJIjTB9cJBp6V6CNw5GFKlU6VDcwKG1f/Vdk1jZck5a9XdGBeK0gotej
	CeszdTFmV1/3S4Pb7lgXde/1hXiuPdWDvNsN8D1Ki5hyQ5dx7+o4Hr3nCEYdOtAJZWne
	h/zRRXp2NM+e14HlSo0soUD0wV2qJdxxLvTaRNDALusK85cgJy2zZEeCTayJ1Jev5mD6
	vINIyBnOIy6o5hUHSKieh4W5MmHT3VJMsDBWGI2RSvc0A81JD0nWXF4je2gp2VXOMt1+
	ePCA==
X-Gm-Message-State: ABUngveyBdO378JuQpiXyTZ8VnX6TM5UA3n0Mv6M9lAf0eXG/ZjguNfeQK/6iz7+O7Uh4Q==
X-Received: by 10.25.20.199 with SMTP id 68mr2714279lfu.111.1478780331780;
	Thu, 10 Nov 2016 04:18:51 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id g5sm934563lfe.47.2016.11.10.04.18.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 04:18:50 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 13:18:34 +0100
Message-Id: <a04f7146c09c02688f7024ed956af07f00a7be20.1478779674.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 03/10] wic: check that filesystem is specified for a rootfs partition
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
X-List-Received-Date: Thu, 10 Nov 2016 12:18:51 -0000

We explicitly check for --fstype if no source was provided for a
partition. However, this was not the case for rootfs partitions. Make
sure to raise an error if filesystem was left unspecified when preparing
a rootfs partition image.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/lib/wic/partition.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index f3835339afc5091604ffd7f0d0acf1d1ad4351cc..ac4c836bdb53300d3a4e4c09926b7b1514b8faf2 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -190,6 +190,10 @@ class Partition():
         if os.path.isfile(rootfs):
             os.remove(rootfs)
 
+        if not self.fstype:
+            msger.error("File system for partition %s not specified in kickstart, " \
+                        "use --fstype option" % (self.mountpoint))
+
         for prefix in ("ext", "btrfs", "vfat", "squashfs"):
             if self.fstype.startswith(prefix):
                 method = getattr(self, "prepare_rootfs_" + prefix)
-- 
2.5.0


