Return-Path: <3gVCZWwgJAGoIJZMabQKeIgUW.KWU@flex--abrestic.bounces.google.com>
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com
	[209.85.166.73])
	by mail.openembedded.org (Postfix) with ESMTP id E7FAB7966B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 17:44:32 +0000 (UTC)
Received: by mail-io1-f73.google.com with SMTP id v20-v6so1215688iom.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 10:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:in-reply-to:message-id:mime-version
	:references:subject:from:to:cc;
	bh=zLy0viSU5Yt4VrqK/p63STsgwPdnU6L6VBlkzzLyr84=;
	b=a6w+MjQN3+Ndj0m013yU4QJTTjtkFm7Js5S+ymuDfCfJpdgg8spTd07JCDSaemKbod
	XNVtRcsdTKjbaZRB+IJ/W1FLNPmTatZDSyJu81X/fXTPiGdHrXiTo9IH7Wkcp5fQcflF
	WVj9DCiOGsEHSQkGdpEhiw74fdUSSV0Cnd9CwqlpIDP0BAO/WkC8IK3taX7QzFnPO0dc
	rP6KTA+R0dozpBht8n66Lz52/fEo2uRN+0UNeY7lfVZtZLP15yAqmdcehRFuFoflWyHu
	1JvSf7gaa9wZT31sUFl84I8uHTCc1+Ghvzw0RJkiPKJzn9MG3XwYMUa+z9BPcMgadLl+
	2GZA==
X-Gm-Message-State: APzg51Aeyg9uvGKXHTCfVRkd9kOLoiVVo/ZPAnFrcEWQOLQnStDpzH+J
	wophzavyRVglb/RlG7eTi1ChqlfEonaJy9K2m61x78+85esML0DWzsXPOGftQa5WU15BMMzne8m
	tnpw9zPaZSsyOiU6UGR24hRosbQgPU3RidlK9Hu2pBKXeNJ0M2wKUShvNuwLyeClattr3waN/2/
	Pgb1jzM+V3cbdb
X-Google-Smtp-Source: ANB0VdZ3jgMahiRd3Bi90JJ8yHWUxo42QuBNR1TP/Y+wqUuhlOWqNZyrrwLbwElF9Ic8a3fZpTEYFIHWBC+r8A==
X-Received: by 2002:a24:6ecd:: with SMTP id
	w196-v6mr2777009itc.24.1536774273908; 
	Wed, 12 Sep 2018 10:44:33 -0700 (PDT)
Date: Wed, 12 Sep 2018 10:44:15 -0700
In-Reply-To: <20180912174415.71497-1-abrestic@waymo.com>
Message-Id: <20180912174415.71497-2-abrestic@waymo.com>
Mime-Version: 1.0
References: <20180912174415.71497-1-abrestic@waymo.com>
X-Mailer: git-send-email 2.19.0.rc2.392.g5ba43deb5a-goog
From: Andrew Bresticker <abrestic@waymo.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kexec-tools: Depend on sysinit.target rather than basic.target
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
X-List-Received-Date: Wed, 12 Sep 2018 17:44:33 -0000
Content-Type: text/plain; charset="UTF-8"

kdump.service only needs filesystems to be up, for which sysinit.target
is sufficeint. basic.target pulls in networking and other services which
are unnecessary for kdump. This is also useful for when kdump.service is
used as the boot target (e.g. for the kdump kernel) and only a minimal
system needs to be brought up.

Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
---
 meta/recipes-kernel/kexec/kexec-tools/kdump.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/kdump.service b/meta/recipes-kernel/kexec/kexec-tools/kdump.service
index 013c5a62b3..b4a2c0611d 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/kdump.service
+++ b/meta/recipes-kernel/kexec/kexec-tools/kdump.service
@@ -1,7 +1,8 @@
 [Unit]
 Description=Reboot and dump vmcore via kexec
 DefaultDependencies=no
-After=basic.target
+Requires=sysinit.target
+After=sysinit.target
 
 [Service]
 Type=oneshot
-- 
2.19.0.rc2.392.g5ba43deb5a-goog


