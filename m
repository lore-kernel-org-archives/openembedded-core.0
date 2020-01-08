Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3746A7FEBE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y11so3378514wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m+p6I6joIdUpG/m+rBMVNvAasXdvFDIzhDgmywav+W8=;
	b=l2+cy4b27n6upU9CHU+uumK6CxfKkK3c5M2bhUGG0gWrQD9okNVilaMvqh01Tk1qsm
	Qx5REfM4J7Hd4qK/9BCk16XSg4wV/BdZzI1d2uNen2lAEEPod+FUyKu6dtbWP8QDM3aV
	0Nf0qX1oD8MuACzoim+qlF2e5FQ2iSA8B2CKQVM+RP4o1ofIA8yMZPXKe17RsZqjtAUi
	rLmX0Y6WxdncyMURQG7nEoYUuCUQzC7VF4982INVKqjDIhpU/Gayud9M+hpF4AC0h65S
	B9hRKOktmPVr2kYdjgcBxRFgISSZvjh610p5VuIKQ5UTWrKqAjGmx7h+FpoN+/ncX7ol
	Ijyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m+p6I6joIdUpG/m+rBMVNvAasXdvFDIzhDgmywav+W8=;
	b=MSHUfbgMzXYLvpeCcIqE9aeE9TkDdoPxGA5SmHlNdhOAX5LCFQSIw9g1Rh4gl+pz6H
	bm8spFzDrovT70XuCYB6R7rIUe7kVKoCOkbqZ8g4lOQLnKQnM/Ffszgwiog7p0zYaQAO
	1NcYn7v+eZIKyykQHd1jjSQcMrANcGFZlOUrYMjJCPm0aj38DrnCXByj7hk25HIjIKEp
	un4B4L/N56ARD54ivPCoDsBfGg3Kwi8OygAZqrkpv3r5gRqI1rdsJHB5DsmqQXcDZL/Z
	T1o4WHoFXOEqv37AfF3Nh1UMaYa01UioHuzkJynyMd52PuuPJg33cvk2ECdyK6NiUNTu
	3bFA==
X-Gm-Message-State: APjAAAVC56podSImK6m6AG3X9bMYk+CcLaDr54ERJUK6UEp4oSHmWqDf
	e1WkjlHjPrNBE3aJjxewbSrApG98dbM=
X-Google-Smtp-Source: APXvYqzEBdyU/JK8GQjxjun9JlHcTwF9aNutnvecb4KOZGsDRM4bBueKCB7uk+klT5uE5N0TBsTLfg==
X-Received: by 2002:adf:eb09:: with SMTP id s9mr4800545wrn.61.1578490103917;
	Wed, 08 Jan 2020 05:28:23 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:48 +0100
Message-Id: <20200108132759.95603-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 17/28] lib/oe/package_manager.py: put the sdk_provides_dummy_target upfront
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:23 -0000

Otherwise, the package utilizing this architecure does not get
properly prioritized by rpm/dnf. This isn't seen single-lib builds
(as the architecture ends up upfront anyway), but is triggered in
multulib where the architecture may end up in the middle of the list
due to multilib expansion/trimming duplicates.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oe/package_manager.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 4ff19cf09c4..e15e3c4a315 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -768,6 +768,8 @@ class RpmPM(PackageManager):
         # This prevents accidental matching against libsolv's built-in policies
         if len(archs) <= 1:
             archs = archs + ["bogusarch"]
+        # This architecture needs to be upfront so that packages using it are properly prioritized
+        archs = ["sdk_provides_dummy_target"] + archs
         confdir = "%s/%s" %(self.target_rootfs, "etc/dnf/vars/")
         bb.utils.mkdirhier(confdir)
         open(confdir + "arch", 'w').write(":".join(archs))
-- 
2.17.1


