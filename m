Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E513AE7716A
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 14:34:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.36460.1734273245991994150
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 06:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GzRbccAz;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so1663809f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 06:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734273244; x=1734878044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMn7dSuZGj0D1AqBgoegYcKxpeBPuyUw+VecPS40sac=;
        b=GzRbccAz7Q32dkbTcAnPocUQT4c3ijrWFiCVwjp2X+Hj/7NZTkAec5MvAGYiNAQRdB
         v67d2njnNn/A/V+250teCA8vcI+hHy3ZnnQ94A2awE/eCBwLKnTziUpaKyE17pOKx+Xz
         6jsp8D6UujOx/XmjAfORu6RqEM0jfx1daqxLVNmjKtxkfMe3OOJmvCGmsAhHMDJmprNs
         DMbL+0ArHkEwAHL0dpltj5kP2End9GxBGzqE93WmtQBvXORFBEVAnkq8iif9a0Wi2IKY
         ZlVT7ue7+86vQGJVntsidvk7pyQA/DQt4aigiJViDU45lyBVJHUjLJqqRZ0+UeazR0RT
         vjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734273244; x=1734878044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMn7dSuZGj0D1AqBgoegYcKxpeBPuyUw+VecPS40sac=;
        b=RxG4NnPwphMgXI5solo0IATCWh4G9OEaYt7kxoTC6qlDeiI5a5ur6lJXn8OHBvH0Tw
         s/sQ1j2rB2p8Mu1RA4CRYvRoXNP4QYa08z3NNxndqpJi4WUzl1uv7t3Hskl7qI/uuyWq
         qVKakdTt2QfjImmP29zpmlG1gOccuFa7sJ/6vaM3rSi+iDf6fqPrfrgGsPydmKYXYpS5
         Z41WeDzOQrBVirvK+Pk8MkU+V+t/dNfTCgg4JNaDpV4B0orYr5uK9wt3VO30rm7ClfWM
         TGkkneMWs0UDsulAGRM6ZFgKRUd42b70tyHe3mhr3bC2cggSmWZI9xDc75Y1fBawKUBH
         8WCw==
X-Gm-Message-State: AOJu0YxY40j9238Csd8QlUnGQPAN+moy0p3OmOpPbDwD3azTfKu8pVe7
	ig9NFc1fpy8SNrQ28a15VwvPYFhuzX0fMHtoEf7gf3m+xLwZQGcYy+JjDA==
X-Gm-Gg: ASbGncvSpdHD7S0tFvbBxP2j4tRN+XaAmzNSUP3M3yHxmxTW85WvwV5KWA7Ng30QzbX
	iqLU7wLwEBiMb75l4FERIAhMu+GoSr8H3dfrw+IGX7KBPPOquRjP/7ClTbfKOSOxakCLAHtFNSx
	mGHTzZyhL2c5EmZP78RBeO9RJE3rgGD+as880Ldz08PLOccEfLsZFa3YADMSEwtgRmPl9SFEGZd
	ipzLDMal/OuzR790RXa+AVZZCWDtgF1qCKZ3xAqgp51lVD6odLk+2EwbsFmgN6ZuKhJRz6gaND4
	Ilh8CQ==
X-Google-Smtp-Source: AGHT+IHted1/oY44geYXKJHUME9SkvuzQ4DDsSlZRh6AXFJBFZNRgXF/ZcArykYOpS1Wc4KdXgEheg==
X-Received: by 2002:a5d:5f88:0:b0:385:f821:e97e with SMTP id ffacd0b85a97d-38880af11e2mr8882349f8f.9.1734273243940;
        Sun, 15 Dec 2024 06:34:03 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016427sm5310569f8f.30.2024.12.15.06.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 06:34:02 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [scarthgap][PATCH 0/2] python3: backport patches from styhead
Date: Sun, 15 Dec 2024 14:32:45 +0000
Message-ID: <20241215143247.1224203-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 14:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208751

Both styhead and scarthgap use the same Python version. Backporting
these two commits should sync the history.

Khem Raj (1):
  python3: Drop empty patch

Ross Burton (1):
  python3: add dependency on -compression to -core

 ...lize-struct-termios-before-calling-t.patch | 26 -------------------
 .../python/python3/python3-manifest.json      |  2 +-
 .../recipes-devtools/python/python3_3.12.6.bb |  1 -
 3 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch

-- 
2.43.0


