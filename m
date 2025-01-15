Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F51C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 08:03:37 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.16196.1736928215145703973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 00:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SVtgfkXO;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aab925654d9so489757666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 00:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736928213; x=1737533013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7U6BSAo6lhl0guY5tKWtq6ngd2Mi7fP9ys8CprfWGn4=;
        b=SVtgfkXO60P0ZwcLdc8qyIaG83fPSZkbxSLRS4ZlKaQiZiQ/FkEivF7tIyo6R9/5vW
         xJzzr0+70JLuf3zg/+bXHZOUwybBZGGNVoMojeDXEbG0VyDxSCyaXddogLKymkQ0Sl0j
         EgqYCezRXfO5r4aKxTPXBUdmfGSTH1ThKhuXahv3abTCDFQb72QGE7/1vVYHk2lU235W
         Ag6J4UiA6tFuj/DG0fICPXcD/PrWLgF0RPoeIbvQMuAaApdBXa/pRJpgjxPPSTeck+4C
         rWrrKPMOpvlg/SGZAngqSB9FJJNpJhjSL7KVK2aPlDLZd7CS6fJJC/eVb1uO/W/C7fWr
         o8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736928213; x=1737533013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7U6BSAo6lhl0guY5tKWtq6ngd2Mi7fP9ys8CprfWGn4=;
        b=tww+FzC21jgzrpUUi8HbA6zYO6Wjy6NpmHIIKTzauLgYf4APlSLfk50yz/BdmtRB5J
         dICK5ApiYmVkc+sl+0pFhQeQAEagQRWMf+8GIhLMK3iRhRV9pW5+XqlxLBOINYFxAS7E
         kMtfLItzL5IgEzeMGRfrgrwAbBnAbIKoSohKkBlBYTBEXwFSoCzzstwEalpeej6vGiwh
         /pR/gDlK92sK2KKbIaEtybmN/Rsizqsp+4qh2GiUHCpaQUQyKuyjOVkwmvsTy+5tnrN1
         utovFyChDDypjm/7Hj15ciBjX47D2N+5wJrYqlQMWikppnGu4/z1GYk2rf9KYW2m9Q1a
         ARGQ==
X-Gm-Message-State: AOJu0Yzygm8JsuAcxq92vN0JuoNXJXnmz12LdDLiEc4JbhCdgPJVnVNV
	doAs4OOdDooUS9az7cK81LrzGwMnBHtS4REAe804KeAxDZPg2JVaAGZ9lQgo
X-Gm-Gg: ASbGncuPj6jNXw3G2po1nZUiGUFpTI2yVhg38NbFi3XQvrE+EWNM/vDsKyfor0Z+dR9
	hSPoro1CeEpfWaua3dmQujigsNN4FHAW3Rwbtkfgfism/mCxIlhksjkkMXGczYZ2t3E6EwR9Mk4
	LjvrQn3dx4ffr6K7j4WRoUyPnZgyANKdWB9bfMIrcBMoqfaPnr8Z8a+NzhPDlId4bxQN/gETkYx
	avaf+dvyHwTWIhYL+CPcKkmmypqPbOuRxbZUnDkSPctLiz0UazHlXAz
X-Google-Smtp-Source: AGHT+IFGflAZOihrgB0kiwucRVOXHA8EHfyOsLvtmC0UdtkziZ50c+f2ed2iOCQqXqLng6a0qt0bVA==
X-Received: by 2002:a17:907:3f95:b0:aae:b259:ef6a with SMTP id a640c23a62f3a-ab2aad3a453mr2719683566b.0.1736928213185;
        Wed, 15 Jan 2025 00:03:33 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:600:25f4:3104:fc19:7058:edf4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b0ab6sm719595666b.155.2025.01.15.00.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:03:32 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [kirkstone][PATCH] scripts/install-buildtools: Update to 4.0.23
Date: Wed, 15 Jan 2025 09:03:28 +0100
Message-ID: <20250115080330.28137-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 08:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209818

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.23 release of the 4.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 616330dfdc..01253e5f95 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.22'
-DEFAULT_INSTALLER_VERSION = '4.0.22'
+DEFAULT_RELEASE = 'yocto-4.0.23'
+DEFAULT_INSTALLER_VERSION = '4.0.23'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


