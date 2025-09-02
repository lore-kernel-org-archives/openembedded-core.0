Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3ACCA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 11:38:02 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.86102.1756840277589617561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 12:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E3GISDVI;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: dani.barra25@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0431c12df3so366451866b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 12:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756840276; x=1757445076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zTvr3XUfa8yhakLa9GlePWlgdeWPQBWUdUDP3lv139M=;
        b=E3GISDVI/JbOMihDhec1Qz0RZAPuP05/kCSurAlH9Q/3vO8Y5PadJCNAUOO+CaZZhA
         7DucY1vOiKR8V9LWk8fyTxG9DIlLT6+xnv3vZMxkZBeJU4Qmx1X7EoshKzw6lb9iIRpo
         HBlTMNU78Tkc9B/GogiBAN8raWEamK+WIjfRlYUTPs3WuQ3BcHh2zH6YxLTpAv+nMGjH
         yeZuqkCnJC4qJhaNdGhWvqRndmqNuhErxg1msg4Av5g0497i3YPlf6evTGLZIzPyX9oX
         FbnNO0DLiYQ19qaMORDIQIWZjBMyBDpc5rQVYLdJx2msNxJnHUsjPvJWWNyxEPn1Gl0+
         Vv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756840276; x=1757445076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTvr3XUfa8yhakLa9GlePWlgdeWPQBWUdUDP3lv139M=;
        b=rrjXTrCyZB/IcM8dd5PWwSheogSUzFIdU0AWwhRrb0IGkCVmNTTI+mVYunVPqPR/mY
         VIfR+u/F6N4RKZzBeShXGpOGUo6hveSOAm51aUoO9xhbfuffwuj2+xW8NpfPdqlcTdYY
         yjcSndYyehcVpTsWucjMu18oENf0yfNTuw9kDbjj1VypLJ/caXSnUF5T+UaJRPXsoArr
         bD6O6pHx5B7mobgHBZEyEQRY/xBFFx7J98C5rmWFDtGQKpS3cDZmjxBwsudXkE3zn9nL
         uiFStr236evstnn+kldKVHbCmhVuvTTcZhP5MiEYpcU49NhOHopE78eY96fA+0D8SLQE
         VV1Q==
X-Gm-Message-State: AOJu0YwI2y7PkjJhtwFlCN+2ag05fx+huqFU1WcoH0gmSy5CyC0mHHwd
	fcA9d+/CUg4RM0aWLs9j663yTBi/MCcTVuBAHN7K0cz6xKTYmQX1w1BtCgraZ3jbBHs=
X-Gm-Gg: ASbGnctOeHspxutd4UDBiNG60jOILPUajHNA4tABlSpWDHtT1f14NDaFvKK9YAekTvM
	BsYA03Y11mNOrXAUI/F7VocqlEjuhp+9XAXCUTmi2ZuH8fINkVmSw2V0HWDB5B+CutYQDiTN2RJ
	69QBMx0KtcmCSIg5MmluKMJBfAWgBR8/1Id9r498+Uu3DMjUxnF/vT5SjCffXEcX7Tr/4FSWIk/
	gAS4ZS6TXDHUMvOvSLIwocdEDR2EWg+ZnPY5ZYayLlsLRwlBFTq7zU+abQT32hmQQLYzCFC4Hnp
	FpQZ/RjOqXKr/F3lhVzsuewQl3vXPJSMHGDld8ijdSTfQHWpoDg14fC/MiSA2sOxYEocdWWb40R
	3X3z0mRKijSIwkOgyu9nXTo1dQqr7qCgmOqqxarTaIukJLTVP61Q=
X-Google-Smtp-Source: AGHT+IGbWvVoLJp9s5gWod/9/Malw8tcK6zBtxBkyTIGadfbPVWHyeI4xrpNWQ1IPdr9jsC6HHfJpA==
X-Received: by 2002:a05:600c:1913:b0:45b:7e68:c6a3 with SMTP id 5b1f17b1804b1-45b877bdcbfmr128644315e9.16.1756839957489;
        Tue, 02 Sep 2025 12:05:57 -0700 (PDT)
Received: from dani.lan (a109-51-235-13.cpe.netcabo.pt. [109.51.235.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d85f80d8casm7371741f8f.54.2025.09.02.12.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:05:57 -0700 (PDT)
From: dani.barra25@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: hongxu.jia@windriver.com,
	trevor.woerner@linaro.org,
	Daniel Andrade <dani.barra25@gmail.com>
Subject: [PATCH 0/1] wic: updated fstab does not preserve metadata of the original file
Date: Tue,  2 Sep 2025 20:05:54 +0100
Message-ID: <20250902190555.7929-1-dani.barra25@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 11:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222854

From: Daniel Andrade <dani.barra25@gmail.com>

Using `install` in the rootfs plugin forces fstab to be replaced entirely, meaning that even its Inodes will change, leading xattrs and SELinux context stored by pseudo not to be applied.
The fix just uses `cp` without preserving attributes from the temporary fstab since none of them are needed, just the content.
Same thing happens with the predefined mechanisms for ext4 and msdos. Using debugfs there is no way to replace contents while maintaining metadata, so the approach taken on the path was to remove the different fstab logic for those fstypes and also use the same modified cp command. Reviewing the builds I did it seems to work for all of the fstypes.

Another problem is that the timestamp applied to fstab is not the same as every other file. It seems like the `SOURCE_DATE_EPOCH` variable goes to the fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
Since you are using that variable everywhere, it is not the same value as ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.conf` that is applied in every other file.

Daniel Andrade (1):
  wic: Content of the temporary updated fstab should be copied into the
    original not replacing it entirely.

 meta/conf/bitbake.conf                   |  4 +++-
 scripts/lib/wic/partition.py             | 15 +--------------
 scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
 3 files changed, 6 insertions(+), 17 deletions(-)


