Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7F6C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 02:09:46 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.42667.1703124577755729535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 18:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Zc0e25+X;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cd84c5442cso1059770a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703124576; x=1703729376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gv6hfLq5RoOmESx5GqrdynedTd/tqSYbtItmiRiImE=;
        b=Zc0e25+X0pzm9JVPEhUBdlrplOZW8+9OLM2XnDnxDYrmGbV0uUImawrQyxzjcoELC6
         AskuZYGgkf5K4v1bzotyZBaXtOthcwizYgqFf0IEp8rBswOuWly4T6zOOLgQDLbYomyW
         4C6E/SVAR8vzJMTH/pj+axnPUCqTADo/91CO/mXHZvkeJxvegjGJF4zEQW262dCQto+K
         Iss+RG4bSPYvb+RMo/EsF45r2h1A43NCI8VXCVpq07fhELvqGTo/UfTz74diVw5Ibfiw
         zJF2jU94l5eB8vTCIFIWDakRbULGnhinsLpSg7GC0ge8mqVzFPIYXCfVOxgHmR6dR6D4
         VBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703124576; x=1703729376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/gv6hfLq5RoOmESx5GqrdynedTd/tqSYbtItmiRiImE=;
        b=SOKxDTJdwc1ew1Hqoii/PNIhT9HebiFLNgVmhEl+pYH1atfWijnjB6Rchd2KWNQynw
         4feulBRhJfe5wX+MuJbpg46Q+Y7dqiOcRfq4XXTleQgyDNNKMvQ5+eIgcMyAFA3Jq4yA
         0qXPmeSojWv7WJaMTsgo7lToJBeUn4Lcu8kRo0HRgIkdSzUWci0QKGZgs6XksgmvFvqA
         H2wK9FKej6o0ktwXK0MJpZf1B84Oviwx59EpLX3pV0w/vSqDr5cSbfgR5RP3h17UOCvQ
         RO/bKSf5km7UuOukB+0S0T/G5y6v3V37L2TaY7asLrWZXWEAk96t3QoaPeObVyY2Gz4U
         lCmw==
X-Gm-Message-State: AOJu0YzfAvqULpTm8bRy2362FI3D4tL/hiyIREMY73nFacUYF9AYuf8+
	JS7IObXkY7HqEC4auA/wzvKi0P1TkfdC+r2HjWHU9T2DR5ZOqQ==
X-Google-Smtp-Source: AGHT+IFib23yIWwlyJ9yth+7J/JyOH3az/CUs6GAkqbFH3UC0TGl8y78/eonz0+tSwo48FvzR9Logg==
X-Received: by 2002:a17:90a:12c9:b0:28b:d5bb:ebd3 with SMTP id b9-20020a17090a12c900b0028bd5bbebd3mr2245721pjg.30.1703124576453;
        Wed, 20 Dec 2023 18:09:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm4447297pjb.3.2023.12.20.18.09.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:09:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/11] testimage: Exclude wtmp from target-dumper commands
Date: Wed, 20 Dec 2023 16:09:11 -1000
Message-Id: <2afd9a6002cba2a23dd62a1805b4be04083c041b.1703124430.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703124430.git.steve@sakoman.com>
References: <cover.1703124430.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 02:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192823

From: Richard Purdie <richard.purdie@linuxfoundation.org>

wtmp is filled with binary data which the run_serial command can't cope with.
Catting this results in confusion of the serial interface and potentially large
backlogs of data in the buffers which can hang qemu.

Exclude the problematic files from the command.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 599ac08a6f6fb3f6a89a897c8e06367c63c2f979)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 34173ce68d..6864eeed2f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -112,7 +112,7 @@ testimage_dump_target () {
     netstat -an
     ip address
     # Next command will dump logs from /var/log/
-    find /var/log/ -type f 2>/dev/null -exec echo "====================" \; -exec echo {} \; -exec echo "====================" \; -exec cat {} \; -exec echo "" \;
+    find /var/log/ -type f -name !wtmp* 2>/dev/null -exec echo "====================" \; -exec echo {} \; -exec echo "====================" \; -exec cat {} \; -exec echo "" \;
 }
 
 testimage_dump_host () {
-- 
2.34.1


