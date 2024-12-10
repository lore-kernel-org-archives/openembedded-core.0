Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96B9E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 11:49:08 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.8570.1733831342841357124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 03:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RBLBWcXG;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so2325401f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 03:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733831341; x=1734436141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMlZZlRWkg2COuavXkf8MPMvsYlL5GM10jfvJ5tjNZ0=;
        b=RBLBWcXGq2r03CTSJIL33BxN477j7VkUECnNWZNO2zBxKGs3v/dEpjCSxSzD2EF42r
         HCDxZf7muYkyot76HQhdxp7F82nhpg+8aZwYLSWjdVbG1rVKvodXFoghzjg5vns5/GQa
         N3lnOMdETY/uQSxYbI3yRS57MSBxcE36I5BJ3+EtAP5pyKkNcj3sDaheDUQfieONgqv8
         gN/KIPajPn9ZFGyu7Q/EqvhoBNqUWrNVrgh1PhOGoPoFN/Dccvs9o2a26vrJ+gXHDWa+
         BWTzp7Vu6Go9kl9rwGfzMyJlo0Ge7waVUvHFXv9+CydjBOn6slhrGS6aiIpH4zob9sAd
         GO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733831341; x=1734436141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMlZZlRWkg2COuavXkf8MPMvsYlL5GM10jfvJ5tjNZ0=;
        b=L/hdpEAORs43/Q+qysWgjd12S6qie+NfPKNZy7ZF9/GpSf1vmJ1afmiV7pXn8WvQUS
         GBk/veTm4IOrEDCacgXZBeUH0VTQPK4q8yWzXMkcvbyZitU6K+fc1fLUwnZP0KtpRODc
         KLLSwnJPuEwhokDB1DBNqRigBc26L2Tpd6W5hdZVlK70x/QgyaF2osn4rXE61XknGJFE
         NkyU2fH9YZgIm4Uy9E+A8Uuoy9mnfx9t5yBB0h6SjBWdh5vYQy2YQa7LUeEYcirSJlUi
         vHVJpmNWC+1b5APfWNBruOzLxGV0J2UvVP382FOu8aO6kGtWpLro9rAvbTQC7LlqSZ6r
         eswA==
X-Gm-Message-State: AOJu0YypJQV3djVIluzWMHybsjeHZczLoSMiGqXA/0gYBbzWd+b8fYrc
	53fZ/QiokDaAtYtYbnBG4GNK86yAyXdrvlIEqVplgSx9SMjm9wbKYg2Exw==
X-Gm-Gg: ASbGncvMHP4xv0wgoURcoonjd8JpBs7jwG5suq2t99d/r5bFGrat115nac2GZWRztJh
	FhlymEIEkE7pmlTMpQ/DSelDqIv+d4ykzTtSmewIAGlPE4H5Za4i2VfREpdAb3qk8EL7lmJxL2i
	8xyfLTCDbgGmR+t8M4Jda40F8ga54ks+D7XFiaq31iJjqdHYbljPcAmxfzQBkw8xxbpXldCQfKO
	r1/r9B8sWkSTf8JPuWNb4Jzd4ad5H8hDpcRhVmhSRFFJOK3cFRtFmSq8xTs0O3Lg2I=
X-Google-Smtp-Source: AGHT+IF2OzHJWH9+6IIc/7O3vfKLjmP2cP/n9reMdv9PYFm2/GJ5s2q/MRHbhy6EkXg1DuHp9oJB8A==
X-Received: by 2002:a05:6000:4604:b0:385:ef39:6ce9 with SMTP id ffacd0b85a97d-386453e2a6emr2828419f8f.21.1733831340372;
        Tue, 10 Dec 2024 03:49:00 -0800 (PST)
Received: from voyage.lan ([2a0d:3344:23bc:5a10:70e8:c835:72ed:f8f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf3efasm15569553f8f.17.2024.12.10.03.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 03:48:59 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [RFC 0/3] cve-check: use the more stable old feed
Date: Tue, 10 Dec 2024 12:48:04 +0100
Message-ID: <20241210114839.1579228-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 11:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208523

This patchset re-enables the old (deprecated) NVD feed for cve-check.
It also opens the way to use another data source using the same format.

Marta Rybczynska (3):
  Restore cve-update-db from kirkstone
  cve-update-db-native2: update structure
  cve-check: revert to old NVD feed

 meta/classes/cve-check.bbclass                |   4 +-
 .../meta/cve-update-db-native2.bb             | 305 ++++++++++++++++++
 2 files changed, 307 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/meta/cve-update-db-native2.bb

-- 
2.45.2


