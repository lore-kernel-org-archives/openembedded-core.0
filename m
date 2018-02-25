Return-Path: <ptsneves@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4B8378748
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Feb 2018 16:50:10 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id y19so18875565lfd.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Feb 2018 08:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gTdjKj8n1tHKWPy9bqkN9IKR65g4k/QMK5DkIBdXSKc=;
	b=dPkHH9r8yIEMXxbR4LQdScaUz0YC2RWL04+gpdPzu0wlhMjQzuDKXmhnnUREYmIAZU
	pIZfRjsNFeAFuA6pH8lVRd9ZLxoV0Z6pidyvXJg5G6n3gNhnt/1uVH9tLJIYgfYeR9wC
	sFvTgVXQxr6XQ/76UKLTSV2vrZkWTfBmpCEXDZ3ZReNjz5+bByWzQZ1tW3btm4RvEf0V
	k+Bb8lvSD+uEzAKm14RZvNcEAIXHl0GnpwehgwR0Hx1OIHk31NajjHBf7oTdRNQ4vlV7
	6Bpj9XVPvL97Bu0o/G1r4GdlSZeMiLdGE2iBAfvwx0jV9o+VtHxFstfdhqt1v1xEAX9j
	KzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gTdjKj8n1tHKWPy9bqkN9IKR65g4k/QMK5DkIBdXSKc=;
	b=i5bMVaNm2DjfLf5e6DOy88gsgFZdCeggaBmWi8h89qhji0FZGv8rl3TQlUDDhO/3pA
	Os8z3LTRb7+iBM9o67syZ7XMxYKeOf33rCKK9AafQasQvnzBNYGSpxq8DA/JqqCG+xWa
	Vje1HeoxNuyWlq8e6ahdAHik7TatHvYNMj4uflPlXen+zw73YHakvRp+rmr87f1zdGMX
	Oeae7+xj6OXZ3tMehDUvli2eZlXrGp3AJuizqAFyQLNIq4bVcElZPwYjYlh6zNk7L9ov
	hhO1ClDQwkou5pj0cPLj4rSWiTWq89zrurXfrO40Sw8p66LE9lItYLQiLKEkK7jLoked
	xOdw==
X-Gm-Message-State: APf1xPAo8E+opsEU2x9J0bGXhe0I3GzE0O/ZVZCPeJ4TwTlZvoZnvqoL
	ZeF2YRV83B3kgOKJJiu2ktmwnOs=
X-Google-Smtp-Source: AG47ELtnVa0P1LItvUq39Nlyla805ZVoXx5ZAepNDNfo5qIv8lEft3IL76uCwRiUP7DOxJEeDcKAzw==
X-Received: by 10.25.212.19 with SMTP id l19mr5498181lfg.83.1519577411240;
	Sun, 25 Feb 2018 08:50:11 -0800 (PST)
Received: from localhost.localdomain (user-94-254-244-94.play-internet.pl.
	[94.254.244.94]) by smtp.gmail.com with ESMTPSA id
	m202sm1517669lfg.37.2018.02.25.08.50.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Feb 2018 08:50:10 -0800 (PST)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Feb 2018 17:49:26 +0100
Message-Id: <20180225164926.18993-2-ptsneves@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180225164926.18993-1-ptsneves@gmail.com>
References: <20180225164926.18993-1-ptsneves@gmail.com>
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 2/2] wic: Set a miniumum FAT16 volume size.
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
X-List-Received-Date: Sun, 25 Feb 2018 16:50:11 -0000

Set a miniumum FAT16 volume size because images are
not valid to parted if this minimum value is not respected.

The value set is determined experimentally forr a logical
sector size of 512. This fixed my local problem but, there
may be better solutions.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 695e0abd3b..7326b664ac 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -319,7 +319,7 @@ class Partition():
 
         dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
                     (label_str, self.fsuuid, size_str, extraopts, rootfs,
-                     rootfs_size)
+                     max(8250, rootfs_size))
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
-- 
2.14.1


