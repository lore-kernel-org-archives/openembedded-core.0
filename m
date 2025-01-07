Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76501E7719A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 18:08:53 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.86.1736273324314888912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 10:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XVECAY2/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21680814d42so198576655ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 10:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736273323; x=1736878123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzZ2rZk0dzvJKMaHF829wlF919qnY+iPwRIBB8ORN/M=;
        b=XVECAY2/YFqcBrW5cLLhCCxLMvHvT+8gm7zpLMIMeeArKBEn1aAM9mIP9guQKwbPv2
         zJCRMsuZTdVVseloiLLGeJGs0qx9anesc4vJDSbR9+rYbjrd3rENMvkt47DSih1sYHa7
         H28UjZhZDd0/SW4ci7txkxzR9XKnqEfKyCurYa1V5d3MVWpycyTQ12S75Vt41pH/J6ew
         v3m/cK1FcIQDh8n//9wEK2YSQ9A2iLRRa1xYz4XvVlJYZ87A3q2qiW0zQBg6bm2eV6RF
         hcZQottrMDccQZLAo93MADJGD41R56dgozZBL6VI+5tE8jYtquAcb1IeWwGv20j3+UZO
         Bl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273323; x=1736878123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lzZ2rZk0dzvJKMaHF829wlF919qnY+iPwRIBB8ORN/M=;
        b=wrtQjuPxu/39KSGzE9uaxkwWQ4j7pYVhiyIAgnQ4iWAIOrDSbO5IlbOFon0pp6ItXo
         PwH/DzPAWmbWkK7ifiuGinE5+JNWj8vqtzAwiID95IWmplan9r+npf3/B9Cozls23td9
         NZohIKUwGIHzshDl+Pz165JT1yXJHDfT+DrpeYsU03hoXVwIQFz8D3uY4Jc6WDkjM9UV
         HNl6RKPtr3rT/269Lvh+1a8gjV/ZEOTIuAg8zn0XdvUiIhS5f0GuUNIRo9N6PpxydFHH
         xTOIUzRWsHuJUlP/+t+XQsK3alsd6XBDr0d74j3tVt1kC51SQqjqy9117Sd4ePjZMjWx
         QeNw==
X-Gm-Message-State: AOJu0YxjG4Hbz10StVh+1Gvs9BVBaQB6W2w1eC1PwpnIxlz3O1CYg80b
	ppOI/aARM2bj7bfZO1h3uEyvDZkrJBopfwLc63aK6QvBwlnPLfsw9yZw8VHXMI8SFT8Z1k+YkN9
	gxdg=
X-Gm-Gg: ASbGncs42z8jpgiJu4sabYwDV7BRpO1HV/cAV5lZcB0kVydCp/urzz4ig8JPh7cEZwt
	ukE9GQys7tC4Zm9/JZpRCTDDqJimzFYgwzx8gQvu//AXaw/u6eAjC59nOCsRQ5I1TGlBSRSp413
	UMYXPzh3F5uBA4+uZwKgplznuHyz8DCpgvRoOBB8GUrYExroOT6LeBLziZma8VJdxVw/u9sMMWj
	KWJn7+mlc5GJ5HWb/FVo2Qwmig3EOR9d5MRp94uvdoong==
X-Google-Smtp-Source: AGHT+IGMBy35WpdT9QWuGQ9KsYYv+GbYm8qo/ljhrB17bG0uOWHyKlP8Y9b02pvMzzTFVGa6fSYYCA==
X-Received: by 2002:a17:902:f98e:b0:216:5af7:eb2a with SMTP id d9443c01a7336-21a83f6960dmr19645ad.33.1736273323270;
        Tue, 07 Jan 2025 10:08:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm314166335ad.172.2025.01.07.10.08.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 10:08:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/19] Patch review
Date: Tue,  7 Jan 2025 10:08:18 -0800
Message-ID: <cover.1736273200.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 18:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209481

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, January 9

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/758

The following changes since commit fb9ebc811800eb8880e3687243d75bafab77a700:

  ovmf-native: remove .pyc files from install (2025-01-06 05:56:49 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (10):
  linux-yocto/5.15: update to v5.15.167
  linux-yocto/5.10: update to v5.10.226
  linux-yocto/5.10: update to v5.10.227
  linux-yocto/5.15: update to v5.15.168
  linux-yocto/5.15: update to v5.15.169
  linux-yocto/5.15: update to v5.15.170
  linux-yocto/5.15: update to v5.15.171
  linux-yocto/5.15: update to v5.15.173
  linux-yocto/5.15: update to v5.15.174
  linux-yocto/5.15: update to v5.15.175

Vijay Anusuri (9):
  gstreamer1.0-plugins-base: Fix for multiple CVE's
  gstreamer1.0: Backport fix for CVE-2024-47606
  gstreamer1.0-plugins-good: fix several CVE's
  gstreamer1.0-plugins-good: Fix for CVE-2024-47599
  gstreamer1.0-plugins-good: Fix multiple CVEs
  gstreamer1.0-plugins-good: Fix CVE-2024-47606
  gstreamer1.0-plugins-good: Fix CVE-2024-47613
  gstreamer1.0-plugins-good: Fix CVE-2024-47774
  gstreamer1.0-plugins-good: Fix multiple CVE's

 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../CVE-2024-47538.patch                      |  35 ++
 .../CVE-2024-47541-1.patch                    |  38 ++
 .../CVE-2024-47541-2.patch                    |  99 ++++
 .../CVE-2024-47542.patch                      |  64 +++
 .../CVE-2024-47600.patch                      |  38 ++
 .../CVE-2024-47607.patch                      |  41 ++
 .../CVE-2024-47615-1.patch                    |  79 +++
 .../CVE-2024-47615-2.patch                    | 168 +++++++
 .../CVE-2024-47835.patch                      |  39 ++
 .../gstreamer1.0-plugins-base_1.20.7.bb       |   9 +
 ...7544_47545_47546_47596_47597_47598-1.patch |  64 +++
 ...544_47545_47546_47596_47597_47598-10.patch |  97 ++++
 ...544_47545_47546_47596_47597_47598-11.patch |  36 ++
 ...544_47545_47546_47596_47597_47598-12.patch |  37 ++
 ...7544_47545_47546_47596_47597_47598-2.patch |  73 +++
 ...7544_47545_47546_47596_47597_47598-3.patch |  36 ++
 ...7544_47545_47546_47596_47597_47598-4.patch |  63 +++
 ...7544_47545_47546_47596_47597_47598-5.patch |  44 ++
 ...7544_47545_47546_47596_47597_47598-6.patch | 120 +++++
 ...7544_47545_47546_47596_47597_47598-7.patch | 449 ++++++++++++++++++
 ...7544_47545_47546_47596_47597_47598-8.patch |  56 +++
 ...7544_47545_47546_47596_47597_47598-9.patch |  49 ++
 ...4_47545_47546_47596_47597_47598-pre1.patch | 127 +++++
 ...2024-47540_47601_47602_47603_47834-1.patch |  56 +++
 ...2024-47540_47601_47602_47603_47834-2.patch |  31 ++
 ...2024-47540_47601_47602_47603_47834-3.patch |  39 ++
 ...2024-47540_47601_47602_47603_47834-4.patch |  47 ++
 ...2024-47540_47601_47602_47603_47834-5.patch |  48 ++
 ...2024-47540_47601_47602_47603_47834-6.patch |  39 ++
 ...2024-47540_47601_47602_47603_47834-7.patch |  40 ++
 .../CVE-2024-47599.patch                      |  99 ++++
 .../CVE-2024-47606.patch                      |  44 ++
 .../CVE-2024-47613.patch                      |  53 +++
 .../CVE-2024-47774.patch                      |  46 ++
 .../CVE-2024-47775_47776_47777_47778-1.patch  | 171 +++++++
 .../CVE-2024-47775_47776_47777_47778-2.patch  |  38 ++
 .../CVE-2024-47775_47776_47777_47778-3.patch  |  62 +++
 .../CVE-2024-47775_47776_47777_47778-4.patch  |  34 ++
 .../CVE-2024-47775_47776_47777_47778-5.patch  |  37 ++
 .../CVE-2024-47775_47776_47777_47778-6.patch  |  44 ++
 .../CVE-2024-47775_47776_47777_47778-7.patch  |  38 ++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  31 ++
 .../gstreamer1.0/CVE-2024-47606.patch         |  56 +++
 .../gstreamer/gstreamer1.0_1.20.7.bb          |   1 +
 50 files changed, 2953 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47538.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47541-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47541-2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47542.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47600.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47607.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47615-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47615-2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47835.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-10.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-11.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-12.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-3.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-4.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-5.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-6.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-7.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-8.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-9.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-pre1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-3.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-4.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-5.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-6.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-7.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47599.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47606.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47613.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47774.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-3.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-4.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-5.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-6.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-7.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/CVE-2024-47606.patch

-- 
2.43.0


