Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C34C5321D
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:51 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.9395.1724319341850605432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=loFZCAJP;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5bef4d9e7f8so917096a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319340; x=1724924140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxEE+zA/9+fB1uMjySsxc8ud737OjMyFKMg1Im29gmw=;
        b=loFZCAJPwIbK3whglhJCslOUvHTttCLmtH6q9xauBfYp3uPMuuEoG1ifA627xZGYZe
         +Pjt4Dn8hz4V8TrMogSc/0eNsbxx6ZnQ3EKOFuQShDLVw2lp7R0iMac8CT7d9tvFJ6Zw
         UWoF7zPB4PCwnb0MD2mUXfrSnpnS+knhkMsB4REDV7mA7ctBSMsd4y+SUF0a9hLPLKM/
         DXcvjzTqSF/5ej4D6pZtD7gnWPSlOLcGKIrsmvmlVQ6dJh9DXYgB5WD2yeVh4VF7oI+G
         1F2p79CB1SDVG60DApQ+rm20ZgXGseD01gKz7ITS2YadcW1eexdAVLr/zZWqFFRv96rz
         DT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319340; x=1724924140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxEE+zA/9+fB1uMjySsxc8ud737OjMyFKMg1Im29gmw=;
        b=YlViXkofC2G9CV/wE03+OI9ozj5yZMkTBdwoENQ9Iug3EFL10EeB/tIgA5X4P7NrMx
         qcs6glrGoqSQijPH8s5v9tNSIA7ogCRTaZ5/zw3knwJe63DBg+5ELhJbacnEkFaNmatg
         wGE1gTNehSDS/KsUDMOZLi3z6gI6eyjcbN5Z+SzeGrT54TSsRgLOarDZ1MszIgAZFTmv
         ZjvxQTDbuvd/9VLDHfOUHGZd39aWXdoTvfzY0Cl+VItyZ0QUMnBGxrg6ErwHiM+Jk/pP
         YaK7XiRMXy1+arkJCpJa41rqRZ2xW1AhgKxZR/lTKNHZtSeEe31bAU16reoqgtnAOz0C
         UCyA==
X-Gm-Message-State: AOJu0YyS+89YZlUp4W6AS4JQq+IE+YcFUz3GeEDCibEPLKNNamq2eG0l
	6PlotqaeYXvxLh7hWKopChqvJL5SWsuXx1r0nuvWWl4JFLDigqx8X53ocg==
X-Google-Smtp-Source: AGHT+IEkw5OAlqmq4ZW0jffxNpfnzWbplWO71tnitMLYmBuqZK6O2exXrHhpSQwz5JcAlSLPHcdKGg==
X-Received: by 2002:a05:6402:278e:b0:5be:d2be:50b1 with SMTP id 4fb4d7f45d1cf-5bf1f0d9337mr2957546a12.11.1724319339735;
        Thu, 22 Aug 2024 02:35:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/32] puzzles: upgrade to latest revision
Date: Thu, 22 Aug 2024 11:35:12 +0200
Message-Id: <20240822093521.36790-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203638

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index e9403ee130c..b47d3d3f307 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "80aac3104096aee4057b675c53ece8e60793aa90"
+SRCREV = "1c1899ee1c4e0a83808998359addb1efb66322f8"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.39.2


