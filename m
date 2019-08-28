Return-Path: <wesley.lindauer@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7AE7F277
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 21:38:28 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j5so2572705ioj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 14:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bigSN5HY3Wurb/pG0r6pdDOo5/QMf/0b4oQpKtq6RkM=;
	b=Te6ZDtsLfS/KXyEVKRaigFW/cIvha3lXyibiKNowPvmZiSMcUvwEki64/D/KOkdAva
	xzhbNupurjPYL1s4Am7BKaXqlKXLzj1QAdSVXZCsip6nyJRpNHaKlovFz7QJvQa0oX75
	H+uuCI8v9wM3hPeZGE/bG1ssQjImJTgkzVAqQKl92Xt/606HKSyQ5PTuR2xzY7zfRZjU
	6lTaY1J4K5mWoH0a0NAMre22+ArV9OHviCtqFbUw9mw3tj0tCsBa5zlQk67CA9ia/Db6
	PYfczdH0FlU08h/G16GxhfLDcqRWpj8kQY8r6x3u4xeQUCB8j8b4nNuEc4qrWImLw8cp
	Nzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bigSN5HY3Wurb/pG0r6pdDOo5/QMf/0b4oQpKtq6RkM=;
	b=fTxJ0COLE7y36tlMOR8emJN79onOYILsQcxjsmHtRI9IFzADuhvVHSOhwm4S0gMemY
	Sl9Ojef8iCRS/lCxBCeyaSgko9IRq6dT4hkUWSXlzgthJrvUoo2Jr6r4dhafj2aKorSm
	3mAV3XN2qFJ1F8QBOTvgv4K51baE5EWQvHsrKFB1XMNVnfEP4/ApM12pBdJCY7VZNosP
	Ikwp2Fl/l0bzGusNlfOK3g3/yqjNV08tTHSeYewH1FDpU1Zjy1DFb/PxAStsnl4EtSHc
	ivK7pmwPG5XDxvkq4PhDAnmOLxxCHobbZX4SaPtD5h4Px6maYy+98csIvf2Vr3DbTKST
	hvjQ==
X-Gm-Message-State: APjAAAVZ9ck5I8wYsmbb+8I4uH6ijEwtp4V4zxtdm9HHzG7N4HOu3v2X
	ad3SlCxbLqBXizg/V/XjBVG4hJOz
X-Google-Smtp-Source: APXvYqzVJvGg6hJQ1Tr2XMmdLjs4inHHaYbnEe2VH5TVja0sXmXj5rT4pGmox880jtFCR3feSeMe7w==
X-Received: by 2002:a02:ad15:: with SMTP id s21mr7008986jan.47.1567028309153; 
	Wed, 28 Aug 2019 14:38:29 -0700 (PDT)
Received: from camaro.lpdev.prtdev.lexmark.com
	([2600:380:a567:6b29:2544:4610:ce6f:e297])
	by smtp.gmail.com with ESMTPSA id q74sm287422iod.72.2019.08.28.14.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Aug 2019 14:38:28 -0700 (PDT)
From: Wes Lindauer <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 17:38:14 -0400
Message-Id: <20190828213814.5204-1-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.14.5
Subject: [PATCH] bitbake: cooker: Ensure bbappends are found in stable order
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
X-List-Received-Date: Wed, 28 Aug 2019 21:38:28 -0000

Thanks to wildcards in bbappend filenames, it's possible to have
multiple bbappends that apply to the same recipe in the same directory.
In order to get sstate hits between different workspaces, we want to
apply those bbappend files in a consistent order.  Since readdir()
returns files in a non-deterministic order between workspaces (based on
inode number and/or time of creation), we'll need to sort its result in
order to have any consistency.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
---
 bitbake/lib/bb/cooker.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index 0607fcc708..a9ee142aa5 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -1869,6 +1869,7 @@ class CookerCollectFiles(object):
             (bbappend, filename) = b
             if (bbappend == f) or ('%' in bbappend and bbappend.startswith(f[:bbappend.index('%')])):
                 filelist.append(filename)
+        filelist.sort()
         return filelist
 
     def collection_priorities(self, pkgfns, d):
-- 
2.14.5


