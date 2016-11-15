Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id B2804719A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:52:34 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n204so128808241qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 01:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HfEecQaKUmHuz7XHCcD59lOZeVqKe395lmQqEuKdCpU=;
	b=DP5c8llEjOgTmJSxBr4xcskor4YLIwhRzdBxBgChCk9ru+lk9gTVAag6Wpvv+VGOCF
	toDqyEY6rXKOunJQqmViS8c5YZ5jPReP5glsBjjlEnkC3QyiIYrzgnDTs04EiEzL39xR
	JL9lmkfnR9mThl38H2sO5lBrLxebTVYhiTePsjt5bIu0flNO9UX0k+BylHCwbijqy39d
	CtGAUdFCoD+c8C3DEzf+M3es/yj5Rs6vwhYDQz1Tb/pAfw5+SrrxVHXhZp3xqchNuTUK
	Zy5GDeHdnllENiYlWoKVAooNNeXXOHWG7AMhRrfgX8sVH40XjzxvL0R1G9sd+9jcfmcw
	jHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HfEecQaKUmHuz7XHCcD59lOZeVqKe395lmQqEuKdCpU=;
	b=WW7Znzr+XrTLSyqWAseC+Dju/4AMvctXVWgwkbfDks0jXgsD6F7i6AQnYDJVz95qXP
	/2NXGZFqJ/wj6xhKw60toB15UxuxLzRbj2RF8NgfUoVbWIR1bVscFP+Aiev4JOXd2zP2
	qUX2vcTpqLckEFxDyAr+Y5OOtyHw7oOCoRDlfMZxdyHCb3DIP7PtQYK2qumedY24FZpI
	KfnWVpSIRN6kxPJPm7hOV8sT2sgvzAl0lrIX5fiKY5B2XbQKV66sydSW3FSuP/6uO8SM
	/RSVX4gtcd3Rx09jRK62hANpU+e6ZBcAJ0sU3Z/LCYTS1BIrLdsWKu0/wLnss4HqOIiK
	t9nA==
X-Gm-Message-State: ABUngveDXoPPkzl/kqVsEDZfWSzifeMbQObkVD5stsmk5QDCZFqTP1GrpeV1X2JVlTz00g==
X-Received: by 10.25.150.148 with SMTP id y142mr4272108lfd.37.1479203555768;
	Tue, 15 Nov 2016 01:52:35 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	u204sm6093118lja.5.2016.11.15.01.52.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Nov 2016 01:52:34 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 10:52:03 +0100
Message-Id: <a04f7146c09c02688f7024ed956af07f00a7be20.1479203195.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479201985.git.maciej.borzecki@rndity.com>
References: <cover.1479201985.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479203195.git.maciej.borzecki@rndity.com>
References: <cover.1479203195.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 03/11] wic: check that filesystem is specified for a rootfs partition
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
X-List-Received-Date: Tue, 15 Nov 2016 09:52:35 -0000

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


