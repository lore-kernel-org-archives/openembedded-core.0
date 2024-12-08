Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D75E77181
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.78123.1733663205271220364
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cc1yXxRg;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so1239157f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663203; x=1734268003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Brd60U4xkIX8kVcK6GQZx4de7qMAodEnLyX+pEj7gk=;
        b=cc1yXxRg91TmqsHiUcrqeiYnZcNV+wKDAV48tJEW1v3vv/DTRXgeEvmo7tEob3ohSJ
         6HBeDZG5cAyqgjHp8ejostsiGrrvDH04HgfLkv6dnh4xqH/JiIlqlZ35cu1xZ4hctslo
         i1ltgk5IzrMZ+24kNyotC9eMqYT8b63y54VGvSHfYCogAjkK+/YMlbjcZKngnGsEJ96o
         s9kduOVMht7J7kLuTV+UGcdKEdcpL8MA09OH8+eENkbMsnq2yDyhBrTryaRbgCf9HUuI
         qegqqrjf73vuvLilG1fTeawiaan4D0vyHM1fQSVpec3RXNYqBolo8aWiq/EkuQW9TOe8
         QMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663203; x=1734268003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Brd60U4xkIX8kVcK6GQZx4de7qMAodEnLyX+pEj7gk=;
        b=NhrQGVN0f3yz6byMo8l+CwdqRevvLvPu+r7KSO+JOVqgS3leBuWgFYemKLA28S9BW4
         4FJD16txHHYNMyou7Oh2u40nvdFOH9cOekM1FjXxhr7AitzOu4K3fZ19GvzzeFYlRGHJ
         NBruYrat0Phlsjn764no8C3jjF3TxJHReQXbXYcmngoocgmr9C0TCyCvV62mvJkFXJ6a
         +ptE28mjvTPNZR/WKfTZE7+ZhShIcS7ibWMBIZsFr0kyGqKyq5ECEFXMHgL+0xFrmBaa
         AbbvpBKcaxsssIWQbjYu+JpyBQjVSJVW+kz5/iFD6sfUdVkEneGXp+tL3/rL4UOFx6gc
         Wiuw==
X-Gm-Message-State: AOJu0YwiYTZ4aLXwhS5AZ/4I9niQq967O/xyBcZ0pvtHIk8YZlyMSHPL
	hkiDqfd7lWjxuVeGdIuNUKO9fB6F57CN7/9qjC7idJvfeLWmr/eHLRyzFrEf
X-Gm-Gg: ASbGncscRKcxXFTLsvXN+ICrKVpFOS0otIidkhh+FbxFH56XvkII4O6/lKDT/Ln/WQR
	npcxjLB6iGxL01XemdXyypMxU/8gbVDQLYJ3zYnt3q7sd9lLLPVJfxoiS+xbk/T8Wp3YgoHtR58
	onShlTkU5fRk/BQ6xXCy+1L9kRHDHz6iPdvTpajSeP6iTeDvCiBqnEigYRpoLL75Xvl495kIcah
	vgS1+9gexvWkxsaGIVsZPU7I1GlJa58nK+un2mXfADPpa7antAlAzn2Kce7wK/2ARAb9eX7v3k=
X-Google-Smtp-Source: AGHT+IGIXOQs4XSh1Nky9eviqYi59CDW2QzmSB/oytomC2Cf/fZLwF+AWZs6FkYEUg5KRHUc62C/jQ==
X-Received: by 2002:a5d:6d0e:0:b0:385:e36a:e19f with SMTP id ffacd0b85a97d-3862b3e5defmr7158807f8f.41.1733663202746;
        Sun, 08 Dec 2024 05:06:42 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386257de681sm9745476f8f.30.2024.12.08.05.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:06:42 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/4] systemd: drop intltool-native from DEPENDS
Date: Sun,  8 Dec 2024 13:06:14 +0000
Message-ID: <20241208130617.4032-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208130617.4032-1-gudni.m.g@gmail.com>
References: <20241208130617.4032-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208450

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_255.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.13.bb b/meta/recipes-core/systemd/systemd_255.13.bb
index 0ccca8a567..fa3ad1d2cd 100644
--- a/meta/recipes-core/systemd/systemd_255.13.bb
+++ b/meta/recipes-core/systemd/systemd_255.13.bb
@@ -4,7 +4,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
+DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-- 
2.43.0


