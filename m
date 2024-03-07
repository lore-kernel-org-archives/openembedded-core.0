Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E197C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 23:37:33 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.8644.1709854649691634873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 15:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=piXmJ3h3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dd0d46ecc3so11623775ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709854649; x=1710459449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RL8klKBi3vuGE0E2+ODknlIpEfgsu297bjdjBVqLa+I=;
        b=piXmJ3h3ROEFRFeHbhEIKatL4q9HeMtkV3Zi4IvElOHMX6bwkQFNAmJLbjNupocvrW
         tytGBPM2Z1YhrmG7Q5C27GZzTgJE8VU4qxuxwvnNCHIYcSEWbtkgalbCL3WqQ8Bz9twY
         zJaARAX+tV/z9k6mQVCPJYA11tCUARrTpWfs55MHZo0ZeuaoV1xSO44XcvBZtPsAjSd4
         nau5IQrjrXBminbMxxjIIy9oxvACYH9g8M5BkxhXsIDWXXWdaUb5rhAAR/vd4xPIJkj5
         PhyQGTdta+OUSw5cHs6nRrtnZ3baUghWRJtEkfshgE2lQg32smA/jLJ3ZHCwOJ9/VpBA
         g/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709854649; x=1710459449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RL8klKBi3vuGE0E2+ODknlIpEfgsu297bjdjBVqLa+I=;
        b=Pzn4QPj3QboTrPkj+KcWpm1KpmCMzufBS1qkP5dupA+3eNp5QJ39OcF8//K0fIo4rl
         t6tZhJTdtNjBUQ+zcrOz3VoPwMAMWDSv7Nl56JWEocBj+um2E4M7pQtEQCcDRwJuB518
         xxJd90ANWY5QCad1yZMFTLUDWWsW22B1YcFewyRLY3D/Ft6HaEopYwhKbcIqwlAGeB5S
         hj6HIWnvpop+SqFW24x+KO8AA3+nhQMI7aeahx2fzLZNaPnaTNvFaYvuex9ASuMS7Dww
         TCObNAU7S3NlQQ/vZdEHRo/ob9lP6+/JrFlyDeeDhgtKq6CqsEi3rQIjLBG80npG9ZTX
         MPrA==
X-Gm-Message-State: AOJu0YzUMqS4qxWvhJxQ5crkQkZpre348F1NeY0h+48J3G7PT7KNeVvJ
	HypxbACe1hUKn+85Rz2Z8GOPxVu4Gdbv3Dj66q3wbpR8z8tzn+xspSbbxMJoDvKB8GYTp2nmtB1
	u/Gk=
X-Google-Smtp-Source: AGHT+IGB/+9udkXtnZsz4Us+tTAGqj+eMsTtpGpb7yKbl7ImkUXdSzWsx3wnQ1h3GP5H9TawlL5BPw==
X-Received: by 2002:a17:903:24c:b0:1da:eed:f25b with SMTP id j12-20020a170903024c00b001da0eedf25bmr11508957plh.46.1709854648812;
        Thu, 07 Mar 2024 15:37:28 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001dd526ff7d2sm1933243plw.308.2024.03.07.15.37.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:37:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Thu,  7 Mar 2024 13:37:12 -1000
Message-Id: <cover.1709853987.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196827

Unfortunately this series of linux-yocto version bumps has caused a
number of issues with adding and resizing partitions.  The problem was
introduced in 5.15.132 and has not been fixed in any of the subsequent
version bumps.

Bruce and have decided to revert this series until we have an acceptable fix.

Please have any comments back by end of day Monday, March 11.

The following changes since commit e5aae8a371717215a7d78459788ad67dfaefe37e:

  golang: Fix CVE-2023-45289 & CVE-2023-45290 (2024-03-07 04:18:33 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Steve Sakoman (9):
  Revert "linux-yocto/5.15: update CVE exclusions"
  Revert "linux-yocto/5.15: update to v5.15.148"
  Revert "linux-yocto/5.15: update CVE exclusions"
  Revert "linux-yocto/5.15: update to v5.15.147"
  Revert "linux-yocto/5.15: update CVE exclusions"
  Revert "linux-yocto/5.15: update to v5.15.146"
  Revert "linux-yocto/5.15: update to v5.15.145"
  Revert "linux-yocto/5.15: update to v5.15.142"
  Revert "linux-yocto/5.15: update to v5.15.141"

 .../linux/cve-exclusion_5.15.inc              | 372 ++----------------
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 4 files changed, 57 insertions(+), 353 deletions(-)

-- 
2.34.1


