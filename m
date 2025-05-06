Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F3EC3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:14:25 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.78317.1746544456029402846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=k9Y7j9Y5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224191d92e4so67769935ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746544455; x=1747149255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVSE30vVhFoJgm5vLa4s4bhtV5AvixDZqDMDQ7c1Chw=;
        b=k9Y7j9Y5lPfHtPijxDY11qTqMU/FLWm8Tcc2tIYJvUdTFG4qrint0bFywaut/8y5OH
         /vvjV9O8x9Q66ZMSBokQ7XtJg+9vvBLI/MYPa8O5L+LOF484u9p1Z6dDFLzjHv3TLVh9
         +C1B4L5ilrkgZKZ2rd5rMwBAIkVP1zo+9mNIrL262nFzxz1TcJA7a/8vnbkjKCgReNvD
         PsxHhOAj8UyhlQKmP35F7h+LznjyFLp86gcW7UmWAAcGw/LMn3XRtSg91977WS46uq0z
         iICVHjBARTUVIHPhL1GpiR45tNI1DAWbfw6zFqyfahcSWfFQW+3kok4UtKZOKW9MluTM
         zajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544455; x=1747149255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVSE30vVhFoJgm5vLa4s4bhtV5AvixDZqDMDQ7c1Chw=;
        b=Xp07egTyBuw7f/8YugvwL3vZ4RoXc7bQuTy2ejy9e73foQXy4KfRE/1R5VvikHk4pa
         aE2lR8SyKQKXmz1xpAID1FJJ3zxwFjNFBCvlMeOzWNR9n3DTZNSgpeIGcxlmQKA6f7CF
         I7SGXGeO1cjplTYxYCTvZwLjIDP4nDCg0QMsnd3XG58GUn5D8V+NnLE5vLVEzCx8tK1Q
         oPQtQLZ7cJlzb1F8xzDTOsRniQsMA6T5fuROrEIRe7MR1ySqEiJagOVb4MyL0d1oB9dN
         H2a6ZPf9fowqEmHcOloH/jaYNAF+Z42p9rXRBPB1vIea4EPEG9TxuTVtjycm+gjOFBW3
         W8KA==
X-Gm-Message-State: AOJu0Yx9Kc1xSh5ujhL4x18UqUFAdRQs6qme/v06c1WzE0Z3hiNYJMNp
	0w/jZrEcqexJz9Nb7QGAgJQFDwfPhk83K1J6J45qx7p6CXGBlXizGmnJuK+Tn/yJENlTctNZnNG
	8
X-Gm-Gg: ASbGncs8PN981CC03k75eu/29009M666ERhAo/TFeTVe0sGCRMayLWlzTpzMf1r6Z4J
	tLNBOu9giIpieHdxp/8/y1erV+Sr+vyAjW7e6BKFKGd9n9jzFJkpswmnyL+0UXPt2/DhB8196gb
	tt03114D7FMGo5Odnp3SL5gZ4ebufBffRveLgsuGsU4A1VznMAVK8JzvTDS9NFytUnP5uPIB4s4
	esGIgRBhMTdV16x0B/N5U3DNCMlU5ZZgcjlFgRA9bzMecarJSuXjS6Ua69VcoLOxxFdx0zvLQ0l
	YxSJArdHEQu6OEaFofJM3pI8gV2bTUQU
X-Google-Smtp-Source: AGHT+IEIRd8MfHFWSoHIxTbJvAQcFKT7c6GWIMmE4hRbHFE6r5is+HJRK0rZYJJO6Qp9bXm/hDed2Q==
X-Received: by 2002:a17:902:ce8f:b0:22e:50e1:746 with SMTP id d9443c01a7336-22e50e108d4mr18025905ad.36.1746544455336;
        Tue, 06 May 2025 08:14:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:8d37:c5d1:328a:ee43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fa58sm75222545ad.150.2025.05.06.08.14.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:14:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/7] sqlite3: mark CVE-2025-29087 as patched
Date: Tue,  6 May 2025 08:13:55 -0700
Message-ID: <3f951941c758b6982a3cd30d085460756b7fefd9.1746544207.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746544207.git.steve@sakoman.com>
References: <cover.1746544207.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216060

From: Peter Marko <peter.marko@siemens.com>

Description of CVE-2025-29087 and CVE-2025-3277 are very similar.
There is no lonk from NVD, but [1] and [2] from Debian mark these two
CVEs as duplicates with the same link for patch.

[1] https://security-tracker.debian.org/tracker/CVE-2025-29087
[2] https://security-tracker.debian.org/tracker/CVE-2025-3277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
index 4e2ed5f1e0..b8225b5069 100644
--- a/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
@@ -7,6 +7,7 @@ Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
 FossilOrigin-Name: 498e3f1cf57f164fbd8380e92bf91b9f26d6aa05d092fcd135d754abf1e5b1b5
 
 CVE: CVE-2025-3277
+CVE: CVE-2025-29087
 Upstream-Status: Backport [https://sqlite.org/src/info/498e3f1cf57f164f]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
-- 
2.43.0


