Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0ACC7115C
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 11:56:25 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.25098.1750059830314592417
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 00:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sifive.com header.s=google header.b=kAcvzInu;
 spf=pass (domain: sifive.com, ip: 209.85.214.182, mailfrom: jimmy.ho@sifive.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235f9e87f78so43149825ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750059829; x=1750664629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MyBFn0vIRrw/GeRl9hOj09hOl5GSn8Say1zd4WmsLkk=;
        b=kAcvzInuVghmO9njOU7G6B1BLNCfv/ilwlCm1hpM36IIeQOTcz+CjdNWc5GPwqIpYq
         /4GEGVOdpAs3s8neHyK/u3uYctm5s2VVbotCSDj6anzYEryWuDS2WnlkNe/9MrkYILJF
         RQ8cZjNNX2EShOpRezlzRfhEa47znMKDtjpaJwFv0PLnKrSpwytF8Z9E/fPQdUb85IoN
         wWpBp+IHh6zcL88s/+NiW2A5uRC38RiWDhou09X7SQQbFIv//foI8HIJAxMkq06w3DV4
         u+M6K/4fMiCU7bCDDXMdsqWq4Jk4fod2/ZZLrVcfpwUidEKrj0//XcEQgfuXSghaVLcE
         7O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059829; x=1750664629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyBFn0vIRrw/GeRl9hOj09hOl5GSn8Say1zd4WmsLkk=;
        b=HQyJGM+L3TJXsHKWs5KXZYY94i/AOjaaZc+kzwMjhswtM7yWVbmmhUJPQE0ouKXbYy
         9CMUOS3XvqkcsOvasfJlxxJZoAhEViRrb8JfO+rdQ/EO1CjNcLF3Uuva5NtpQeZn38e7
         yfFi9n04IdMo20ZyCStK+WTvwO3VsEjXAlha3AshBviPxCgIu/RYsnJf7jkrVhKEdFAR
         vCz5x5AJ+MtwFc/yBkTrFRStM6f4ANJY0NNk3GvpeyIdL30PEQ15MFGxyQbZItXjTSpr
         JlPZwR0ZJgW1ctFeVfeB5F6hmyX3UACMaCqsa17v1a9Rrne+f5xdVuZEwRxd5gp60t7g
         v+bQ==
X-Gm-Message-State: AOJu0YwetqAUPaL2NrKGnSXrpWGE3MA/MZrYLs0+XKfrHxZLCJV/Uq3C
	YPzUIdl1aK/fxBLyAJIU/GwbNl+d3Ysu3wUUZIDspFB/SgI0zZWBFWcJMZSGF+CZyn81BEG5MH+
	RJ9oL2xmfv9EDhy5cBkH3ay8rDa3/0AdSvtAx0zXhRPDpNphWoy9GNP9+dPdkT2MFJfspq+Tsu5
	n9QenLsTg4mMHqwUS+UNWMppYgDilAYhXgFKFBMpWWa8rsXNl4xqfCZgC4un78ZQSw
X-Gm-Gg: ASbGncuX4ZnXIGk3sc5TlgGwWaWZGLXiTRAQcw9s7kZlyxKw6fNdDAvlj8e6bC2p0RU
	aewbsA1bqXzhaCJhgyTtvR6PZARLEBFhqruW5/H25wRj3X9xAKac8IzCo5UgMJ5U9LUR4DrfTZF
	MuQhTxIvJ4p33zIekqIya9s1cPw45Jpop7Ddm+NUqnRidHWLJrQBkQgk8BVUvgB6KcECA3Ao+a1
	Edhw2/jl8u9rjGw0P7wP2S8brCKRQUCQ0mppVXk9Lepuy2Kz/6+zJVq9Z5bcqNN9UJ7MsLDlX7f
	f9Po7s1VKbb8fuA8RUVEPSIQi9w/6pUp0qo26qTJuebvgE56kSdy0V/5niVmrWbng6xYT4GSI8W
	hD49sMKlkQw==
X-Google-Smtp-Source: AGHT+IGVj0gmACQ/XQ3IugRxD84FJAVTYkPk/51kxqdJDnAYdu+1Dq0suH5eMLdHZDOrCh4BSpRJlw==
X-Received: by 2002:a17:902:ea03:b0:235:ef67:b595 with SMTP id d9443c01a7336-2366b14954fmr134709615ad.35.1750059829089;
        Mon, 16 Jun 2025 00:43:49 -0700 (PDT)
Received: from hsinchu01.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236704de5c0sm33452235ad.39.2025.06.16.00.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:43:48 -0700 (PDT)
From: Jimmy Ho <jimmy.ho@sifive.com>
To: openembedded-core@lists.openembedded.org
Cc: Jimmy Ho <jimmy.ho@sifive.com>
Subject: [PATCH] nfsrootfs: disable warning message if bootargs root parameter have not been defined
Date: Mon, 16 Jun 2025 15:43:41 +0800
Message-ID: <20250616074341.32477-1-jimmy.ho@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 11:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218819

Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
index e67ee4c25d..1e76258ce1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 nfsrootfs_enabled() {
-	if [ ${bootparam_root} != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
+	if [ -z ${bootparam_root} ] || [ ${bootparam_root} != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
 		return 1
 	fi
 	return 0
-- 
2.39.3


