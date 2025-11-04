Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A52FCCFA00
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 04:34:20 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10895.1762230856970436566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 20:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WogOWoAh;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so64081885ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762230856; x=1762835656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rEQhoomvP3sgKCZuzrR/nMJ+TIu4NQikZFjF4bWngk=;
        b=WogOWoAhzraPRJ+AUMgQTJe5ZNscePCb6cLbzJD6ChR5RK5QUegO3LO4iyoSlbmtD7
         5RGWBfgrFbQe1WRQZOjJi63d0ZB8g6v/gbeoguV4496oV+OveP0ijjNrVqcykls3aMOv
         xPbEQsTusj5ac8OlfgHWtPwVeySt4IVLyvs9ltq3BZZKO3aKRYsmEsYZAPGc1y+w1Htz
         5iEUp73UBSWFlZGcs5SPrEdnjalb+7DSbCcunGTLWf4SItvanSQN0c289zVcpQvz/Qqq
         GbbSARHSvZKNq4n3//WEZkt0Y8D5e3uoCoONFbEL2vx9hMLqCtJ9KCQIf+Fn4M4Za2Bm
         9dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762230856; x=1762835656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rEQhoomvP3sgKCZuzrR/nMJ+TIu4NQikZFjF4bWngk=;
        b=nCtoD2u+I/4gHIgMwKHlaumPAe0UYxKooTDL+299jSnqA3vrIQdyLZXxEeM+IpfRRc
         Ap8C2cVdPZ3j5BjENXfowwQTi38+fMPDkfjcFsY3QcWUNPKXGqL6QsKDtD0SOlFXpLAE
         6qpDz3OnwsUN9+FLb5BQnykqJMwuvwqAqubRIjI5WfC8/zWgYu+tSeXR4/sIIOmH5c/g
         kNJ69lJcbup5gf0j5e+o6+h4f8GocSURcSnq1hn27MsuxGXkrfULhjx4oNwi5WmP5yiO
         p1u9lmp+Ny9WrEUbh4PAEQ4pZF2PTUAMHCCThUlq3A63vIQnpcOH8Zkj9q6iPhkQofI/
         E2RA==
X-Gm-Message-State: AOJu0YzQ1q+I4N1UGBD+6eHoIXl/2BhGjouLa14bFuknqSVe+VE+ywV3
	Ws5X+Xx9kv8Wf2sIy2xn4nTDxWURh4LhPx9SX2IRpABt79m7LQ9yNu2Nzb/rCppt
X-Gm-Gg: ASbGncun6+LKeUdP5h0V+KqHjs1yvi7hgvyHRnqK2AZlnF5i9kFFmzV9x68n6SG5XmX
	80eTYDb7now1zFNbJ9lDnhGvV6/GB5qRKi0LdMZDIeJFsZJrV53j5H3FhlJKlJIdIM59uR74ao+
	e0yQAbsR9O3Jnufxd8MnX/a/8tlTulmYgUHMhxtgSevRyWEzecR0KjbhPuxHtEeIAnqxVotNyfR
	ky/es5pdYIcQEOPYL6wJf5I03AOi0/cuV/e1ubYWbc+QBQcLBlVZJ4mAniKaHizwBSbKnjGihkH
	Zp0f6uFP1xhwlrJTchUTDYal7cFEz5KlPMzTZljIyRIL9kq3OK95bxNZrbPiwUEYwtOV6HGmA5d
	lDQagg/+E+1B1vKj2OlqtC++PnHEsAXKExfBWrMa23PBJbqhNcfgEbuAYGNjLY7sipKFAWxAyIS
	AAQjugL51QHTw6eg==
X-Google-Smtp-Source: AGHT+IGs23dTLpqVgeJGR/HfcrozX2HgkYFjP++EIwRCoiZGtIRquvY6FMAnV6p5KnEzvR/uGSI6Pg==
X-Received: by 2002:a17:902:c40a:b0:28e:7567:3c4b with SMTP id d9443c01a7336-2951a3bbd19mr241113915ad.16.1762230856034;
        Mon, 03 Nov 2025 20:34:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a74214sm9147025ad.97.2025.11.03.20.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 20:34:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v2 1/4] wireless-regdb: upgrade 2025.07.10 -> 2025.10.07
Date: Tue,  4 Nov 2025 17:34:03 +1300
Message-ID: <20251104043406.1086244-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104043406.1086244-1-ankur.tyagi85@gmail.com>
References: <20251104043406.1086244-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 04:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225707

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2025.07.10.bb => wireless-regdb_2025.10.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.07.10.bb => wireless-regdb_2025.10.07.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
index decccad05a..68ae3b0464 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "a8340bcdcd1b5db6c79149879d122b170f3bb075381718d4f429ad831a6fa28d"
+SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
 
 inherit bin_package allarch
 

