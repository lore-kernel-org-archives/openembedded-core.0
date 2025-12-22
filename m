Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD17BE6ADD3
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:57 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87715.1766434134089471900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q8P6eE4S;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7a72874af1so751882866b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434132; x=1767038932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avzB4ll7Mn3+UVcZ8vnBvI1gPR41FAeA4k0nkhe9/PE=;
        b=Q8P6eE4SYVU/Kcym35cW4eRE54IxZOMT1FKMQaSyPHH5eCEVy9y6ERH5E7kRBI/Scp
         1gc8opTXQHzpMXIOP1ARNjyOtrAUMOJ9iXChTUlFAkCM+87djAkeupvxEdfPIkAzHvjt
         eiqj4vcmdFgI7SqX20++/KNwn559g4k1urn364eR2B3/3z7NmS7Qu+JEyvdy5zDHBfFV
         CoHQ+tTccjtBZhOtMwBMVtLSRvn6C8xxus5gMUZY9PHd7N2Cj5c/fnXXUCYM8ic+Bjvj
         7e7jUaMSIBSOVJpuH+vxUvweMT8rHdel1/YVmPbPqwtLwhK4T2l/9wRuLgrenNv5sDDq
         3uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434132; x=1767038932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=avzB4ll7Mn3+UVcZ8vnBvI1gPR41FAeA4k0nkhe9/PE=;
        b=wbJIL/n2xPgVZH7aUuCGHj7J5XdItNU1rppqalTH8NaXSuGg0XuIOwwpj4UDa3UruF
         5hldLOlIzy+4TaFGepl0P8wAnwYERaRinH7X6gqqGhcUaF77Okykr/QOYCgGsZ1HqFC+
         JmEf1QK7fQMbbxvjB7iAX9s8RTi6wGBgSyMK/JMkwOgrVPKXHXq4pvk07BeC8R860ZCN
         4+bz8fB44LwP9AwIij9NUqlO6oyJIZ9RtWomqrUl58c0IjeinGc+QijwxTlQP/d1qwJV
         MXGpE1J1nx260v905xhLoobSXm1QgtH37t9BZcVBu2aj34n0cTNs4Obt6Mpt4fLhBJ+W
         Iiug==
X-Gm-Message-State: AOJu0Yz7mgaxdsA6sAKiDqfCWQAOauoKr6vpxldVetwzcoNkTKI9Hc5a
	twdMXf3+1sK+1wdJifO0Jl4VDDEaG6znA8Qzg19WoAAXwNlSsBWLiNUjx/WhNA==
X-Gm-Gg: AY/fxX6OH6O6RNRFsaYF8R3j0b/hmOhKfVfso1srDoqiS810zcQpdA81eX65KpjMmtM
	AFUaMMr18KGYix6UCvhygCWt0kne7k1GIVfo+d6JYEMh5TADKQSXJS4htMfCOR8e2omGhb1S15Z
	BEIDzjVXh83pghRC21kYmdr3cg8bTIQShPHgMONylb5piNJubCRQwONxhkaUQw0tnPffxeWxu3b
	t4HWPoOi/R6ZkKH9h5gPRBrcCQO1tEqlWiWnjnA6fWwGGxCHNC/AY0NwPQ5GjLUfkJ67ssODuTi
	9UEbbkP3RpYzA/1cK2jWAFOOV/5FUespbLpQ9UImFooxo7uJ66wyNOdhQhSkQr8c5UcpAasD1Sr
	32uWgBu7armWVHNvIe9I/oMfXY/5F4BMO2IKnAkqTq/K0PW8KdCk2AqjnyTLbVmr+iCpN8a+4EJ
	ji3lp9YOeehzfr+otaEPE4q52a0ICps42utiLjH85wkDsrfy8=
X-Google-Smtp-Source: AGHT+IH8FLRXhpHO3HBCOj0pu8MpvAWcVEBCqv4HepsW5fKCGApVdguT0usEYvuyh58yuYqVzwK5Ug==
X-Received: by 2002:a17:906:c103:b0:b72:598:2f32 with SMTP id a640c23a62f3a-b803704ffbfmr1214171366b.42.1766434132375;
        Mon, 22 Dec 2025 12:08:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 098/114] stress-ng: upgrade 0.19.04 -> 0.19.06
Date: Mon, 22 Dec 2025 21:07:20 +0100
Message-ID: <20251222200739.2278706-98-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228423

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../stress-ng/{stress-ng_0.19.04.bb => stress-ng_0.19.06.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.19.04.bb => stress-ng_0.19.06.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.19.04.bb b/meta/recipes-extended/stress-ng/stress-ng_0.19.06.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.19.04.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.19.06.bb
index 88d3ee3f4a..a5418ad9c7 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.19.04.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.19.06.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
-SRCREV = "6e977ddae4b66bc0e5c3f993e3b5ff0bc06915fd"
+SRCREV = "310c900f697028dce78fea82c2b1d28a244c86c2"
 
 DEPENDS = "coreutils-native libbsd"
 
-- 
2.47.3


