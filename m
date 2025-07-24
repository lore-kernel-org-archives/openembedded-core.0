Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE999C87FCE
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 19:54:09 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.3090.1753386842773353300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 12:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=etKhs3ma;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso2526635a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753386841; x=1753991641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fc9vr/wc7+trlNMF+2n4k7ONRnnGzunAE2m6jEbXgcM=;
        b=etKhs3maqBY4N8zMmUKzBSHqO2oytHgiggr+esKb1URY6mo+QpnkYZp5RCTteUN0g2
         qY0AcsAhMDcxDmjV1bvr+A5tN262jdAXeUIxxAk2+yi/zOaURrzSYsqa8lKWA1F5Sile
         3ClS5K260BaA17d7SezCZbRO43dquN9zXjJD9fMRseeoVsTlZgeQJivEHSdunT8wcjKn
         +tM3GF+zpyOXiL+hIV8VJjiRcyYMuVC5LbTmqZB077h/lPIlpbelHAhlPOneFgOvq8Lz
         ag95O3RZxsV48nczBOrjHBTzqU/TlOwMckENLsdsQdg2kMSgTa+E5LFBxAs1LfazceDg
         WL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753386841; x=1753991641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fc9vr/wc7+trlNMF+2n4k7ONRnnGzunAE2m6jEbXgcM=;
        b=Tv96XtBCtWZLtAkA8OubZDBxnb18HZMfoLY5/+RMDRBWQxecA2fSvS6/rF+/NIQxHP
         b7ojsZHkxZ+8lsxurZ0dm7JhGNUKaNWkNVjsaktlsUguUD8YNzyprGVRaUsmC+ohJ1pi
         ZijWnr/3gHjhMuBw4nKCFAA5/cRZZh4wXl4TN/0Yiv4aGVMXnIQ++GSf9EpfepjBEcK2
         aRS12ucJy3WfHArT5DQQodowWOO2gRGbiqf+sE0FKJKFCf2tfdqhLKNbeLbxWnASldKo
         fN4LbsSURIq+2CKpCI9//rXljyzIt+RzOSYQBaaOyQ193xjKyjwYkOaGnPU/gCSUuAY0
         hjVQ==
X-Gm-Message-State: AOJu0YxLCYcdGqgqhBhdWrwrcS/6IXQE0oT2Q7WhPAqwTSxgjnK7GVh5
	CXIIK7beD0XKvBJQ8ftfRrhw+USD9eSSB/Z564M3RfmoSDPRXqEsTIrElPTkTQ==
X-Gm-Gg: ASbGncvCx8Ql8IrdBY6XschghkkzfgptVu4ZD08VJeCLJZLh3A/Su6aPsY1am3uPN1H
	W10GsfIElQPA4roca0mq/OQiPwlE2+IQZa/ebEu4LXgwB0KgPteVLu/NVLR28ttmyABA0Wusile
	qN9sk3s9EdxhfQr0urdpohYTeObiBYrPqIygXU1me6qWOnXS/tU8SqdwsPNMYiDa+6VgcmABZLU
	HUtdkTqJjZVNsa3YEQvsSP07JFuI6YE5h5uattAOB0ui8WmhGiv6SoK2PRV3jio/HLUnmkv69Am
	R3spq7s8En6s44pVP3felQy2fJtTuSodTXexLp84a7NpHW+bznG1Ay12zlBhRxeZWMk2yDBQJZC
	OXmW8bBw46Jc9VHJd7Xjv
X-Google-Smtp-Source: AGHT+IGu1bCmofIGh23REqTa3uAG0cw4qmIvixDarLss48XjSP+umNzGR++H7IuTPkEROVZhikOLnQ==
X-Received: by 2002:a05:6402:1ecc:b0:602:b6fd:150a with SMTP id 4fb4d7f45d1cf-6149b5b1dfcmr7621822a12.33.1753386840989;
        Thu, 24 Jul 2025 12:54:00 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:61c:a000:a5c4:a4a:87da:e28d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd3432b6sm1197428a12.63.2025.07.24.12.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:54:00 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH] scripts/install-buildtools: Update to 5.2.2
Date: Thu, 24 Jul 2025 21:53:53 +0200
Message-ID: <20250724195354.33606-3-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724195354.33606-1-an010@live.com>
References: <20250724195354.33606-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 19:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220868

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2.2 release of the 5.2 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index aa23942858..50b5487eb8 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2.1'
-DEFAULT_INSTALLER_VERSION = '5.2.1'
+DEFAULT_RELEASE = 'yocto-5.2.2'
+DEFAULT_INSTALLER_VERSION = '5.2.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


