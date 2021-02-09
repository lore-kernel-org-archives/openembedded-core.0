Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.12501.1612886080768721666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=0oC4Bl8O;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id i5so3686088wmq.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 07:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+sfamiGpPcXKi4PgpEXJ8dCdyYMReqwz1zZ+EG1mlCg=;
        b=0oC4Bl8OXs+Mi7B3qsuRFxqMwRgTTF//lm7yHFlZs74YU2yTXtjaZo2RP9dE2j3WML
         GAUmsOS7qRGgchJF9SC1cAIW4LQnCUkIAlJ6E3y1ZTezs/MV4GWuCNmJKiplwI1mTZWi
         96++imJb1iBebGiO4+QJ9fuokVAH4jO3nLbVNZUvvRSkpXzlKZozF8ASsJQF5zfi+3v9
         InvLMAPngsh6al83tWgKsUrPhDJfebHjHai5BGjCHDkS6AGVJiTTpFLvN81QknBncTp/
         qjC19lMBY4Iv/lAVZoAZJnSa/vpdkWuKChv30qeiFlV17wtU0zEc8PEZgEnrTITWNNBn
         6zFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+sfamiGpPcXKi4PgpEXJ8dCdyYMReqwz1zZ+EG1mlCg=;
        b=VW3GvTLuhP/VMc7oKSihQkzQRByoVa1mtIIdKhDnS5joqWXs+8GqudNlaGPbMQK7Y+
         i2A0YmQ5BRqMtN+lpKelltb37zm716hX3JoiEUTjoQ+MGdTEmMJLGXqhKCyteQkgfSeB
         W9oX24pQRyuHtqGYHhhgNo8RUeK6M3sHZhYywD876Q9JctopHgrXp6NR3ZU8vni4z2LX
         SwntsFlhchhsORxD/ndDBAWLUmvHopqo4YJauQj8lCo7NUyui3mkGzo/Re1e+9VH5Un7
         s0EIWkMa/9kpaV0WReLwXVaWy5TcblUURKheoFDzZFIGFXfsePITShGfjBjENM3keuGV
         6ObA==
X-Gm-Message-State: AOAM5326f31wkiKXCwa7/6yqJBSAdSuMj2fuGqCUz28ddFQKHbi31/iE
	Qrjbzq/aGzuvR4yMT645A1B2bVKxZM8+hg==
X-Google-Smtp-Source: ABdhPJxDK8TmnQm/l0efSlTR0/19oGzMTvkpJn82jaGHmVSmJw+KtgMoa34J3zeZYU7Jy4gLUiX0wg==
X-Received: by 2002:a7b:c3ce:: with SMTP id t14mr4063446wmj.175.1612886079109;
        Tue, 09 Feb 2021 07:54:39 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from P-ASN-KEVALD.idf.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id j125sm5351223wmb.44.2021.02.09.07.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 07:54:38 -0800 (PST)
From: "Yoann Congal" <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta][PATCHv3] npm.bbclass: avoid building target nodejs for native npm recipes
Date: Tue,  9 Feb 2021 16:53:46 +0100
Message-Id: <20210209155346.25873-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current recipe unconditionally RDEPENDS on nodejs (the target one).
When building on the "-native recipe" of "BBCLASSEXTEND native" recipe,
the target nodejs is unnecessarily built.

This patch fixes this by only RDEPENDS on nodejs when building for the target.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 79f55febcc..55a6985fb0 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -20,7 +20,7 @@
 inherit python3native
 
 DEPENDS_prepend = "nodejs-native "
-RDEPENDS_${PN}_prepend = "nodejs "
+RDEPENDS_${PN}_append_class-target = " nodejs"
 
 NPM_INSTALL_DEV ?= "0"
 
-- 
2.20.1

