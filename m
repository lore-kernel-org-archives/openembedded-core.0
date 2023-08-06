Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95996C41513
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 21:14:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.19682.1691356445023978036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 14:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=aRXELDld;
 spf=pass (domain: essensium.com, ip: 209.85.128.54, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fe5c0e58c0so3310495e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1691356443; x=1691961243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGkLhKjL3aU3rNFb1YmJ1b1W58upYs8XA4oGpDwpga4=;
        b=aRXELDldtzkZ/d44quvEwFW6CVtkP7EBZKcDKl4lK2rFEzClPtdF+QBaEQdvN5SL4g
         RVjCIlUQlc7oSaqSEoyr1j9IGVGX9wwp444//I56aaI8piwlyzasJw28FB5aUhVPCfRm
         iJm1AVl1ECXUHD8NVzD1RtUfQtWAIdcJkUxAsH5PEnMPGUCyR3+ogGTJwQOfJxr0qMm4
         zwoZuufNgPHczokcsxzfQ68i3H7sqjqMyma6CtHtkws/lACKE1kaPpNnfvqSIT/LnGd2
         +ezBKJfAQ6Wx/pu3H6k74HBj4/OpozastL1EBkBCjceaRuUi8dskKd2a3ezWb6p7Qt6c
         JyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691356443; x=1691961243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGkLhKjL3aU3rNFb1YmJ1b1W58upYs8XA4oGpDwpga4=;
        b=HUMqTO9ns6r4TilansEOTnEJTwT4hyBuaZYkymFL7nl14J/8awRooxyhr6OYIsduQV
         CYJSadD+OPJ20hs+EG4UDPmLrccnkZo9sk5jb+Npsr7dMwqzKJHqqyNK1z7r75Oavyc0
         RpV017GodU9ACs3OsIOfKWvVRaxLUr0OfSYHkzME0j4Q1qLgWkC/F8wB8AHhW5IhYMDH
         J0MiMW9KH+Z7wNhxNtJGcfY/brRW65t95QjTUq0xtYG9G784mn6JvoFhLPS8o3TWGn3g
         a5f+F5a+p7FyXFCHtrVV8tPX9cgfzP3qaeqZBbZEaWBELkcLYSE0a0vABM1EpX2Ys/9X
         FFpw==
X-Gm-Message-State: AOJu0Yz0cr66W3QFM3hqpUmnDlOe8CWX2jRhZeyVs0F39lDWYbyiRNYL
	SKqlVXS6oKma69APIN2EKEXq25qiKXjc0fOa/Zg=
X-Google-Smtp-Source: AGHT+IHD+i8WIc0eRZLok8FnQAys3Nzpu52L2fnmcl7bn13sXCMtxGoXArVJ3qewAU3H6OOTaHF2rA==
X-Received: by 2002:a1c:7706:0:b0:3f8:fc96:6bfd with SMTP id t6-20020a1c7706000000b003f8fc966bfdmr6287960wmi.17.1691356443599;
        Sun, 06 Aug 2023 14:14:03 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c021500b003fe1a092925sm8612055wmi.19.2023.08.06.14.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 14:14:03 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 4/5 v2] image_types: use IMAGE_FILE_MAXSIZE variable for f2fs image types
Date: Sun,  6 Aug 2023 23:13:45 +0200
Message-ID: <20230806211348.1191553-5-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
References: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 21:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185578

If defined, this variable value overrides the size of f2fs partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 6e54f2f13a..51b2b6ea1d 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -263,6 +263,12 @@ IMAGE_CMD:f2fs () {
         # 500M the standard IMAGE_OVERHEAD_FACTOR does not work, so add additional
         # space here when under 500M
 	size=${ROOTFS_SIZE}
+	image_file_maxsize=${@get_max_image_size(d, "f2fs")}
+
+	if [[ "${image_file_maxsize}" -ne 0 ]]; then
+		size=${image_file_maxsize}
+	fi
+
 	if [ ${size} -lt ${MIN_F2FS_SIZE} ] ; then
 		size=${MIN_F2FS_SIZE}
 		bbwarn "Rootfs size is too small for F2FS. Filesystem will be extended to ${size}K"
-- 
2.41.0


