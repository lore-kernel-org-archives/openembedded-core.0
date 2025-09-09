Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E42CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:29 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.891.1757438244901935351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 10:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g7+xYusx;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b043da5a55fso788510666b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438243; x=1758043043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE6ZNht+nhEUFT1hNMKNrVto/DVVjizxrz6cQ3Qwie8=;
        b=g7+xYusxtqoJccBFAxd6NZ7CP2tT2dzRHOQth3FWDdn/a/tf0g8iMGUcVvGO9ZP5J7
         SsX74loZoLoBYJnRP7bHvpLY21wbcYRDvwQQPIqwDfN2XacENKQmxlOxPlqWXUvZTe3R
         9G1PS1Pbwa3IDCNP4bf8dlsUp+KjlkSlcFb+Hc2pyBuUkHSHDeZys3bQlHR29uBBWpsm
         dQxoJ7yYIsErKIqYCqgi5FDW1Z5aRbV4CD02r7HGBHO7Elifu3XNehwSJGS2WxG5Kpds
         ZRR3zx7RYTZZ6FVhTjh6puGo48KcKgjzuduTL91QTrvfrmSM2Kq3VMaSDQzpkc67T7Aq
         16fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438243; x=1758043043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YE6ZNht+nhEUFT1hNMKNrVto/DVVjizxrz6cQ3Qwie8=;
        b=Zy2Brde4aNhkP3LKVyyYPK9rRsBphdeJEBYb9qtJe93jmlmyESZM15n31Hk3TSDEMF
         lN2yjrL7Tk0e+SZQDlP3KRQwjD/JGwxn8r9wfxscFACj1z25QwlANqDP2fyDVbWV0Tiz
         ZtX1NToxjbTZo5OKIk/I5EG5J/9N4E4P39oGZ+q5nvnU2ERDje38gSEQvvgyS+Fzp1tv
         WQsXhiikxpoylDGaWIAZ7mRY8EX2pzOuEcCF+dPdIDD6EWzfMuq3tTE+aJyyiQw47oEX
         Eem8KdvP69FjipqMYzAmIcp1T3TRrepuBFHPnRdpWI4CDW4dEjgoWj5SC6siU86fAFiD
         Lapw==
X-Gm-Message-State: AOJu0YxhZK8BtL+sBLoDPzSDegaQPkLJxAddAemWCcs/M1z6pU4e/E24
	4E3gBelDiLSl+da92Vf/FXmDkBtMttboKJFWMJ26I9OSLaJzmEuaKemLXHcw0A==
X-Gm-Gg: ASbGncv9l50FuWoML/Qe0w0vfu+TtxoJUYkC9Kaiw0g10TeUHvZZr8FrEc7LPeO25fy
	m3VJmNkegyPCUjEAArOiSThWPHMtPOAGjZ8w/DzQo3+tJM+FeTU0lAiO9zu6D17gRITtHMK1gF+
	srVEJ/Nmyuv1rKNeO7kG+nzpFQhflJUGwbhPGWixj4SFoyaOSYswWJG7iA4EUZq8UFg2/gtQGWv
	XEv9QZbkRhSKfgs6DSOz2ZqQl1/Jb6dZl8BypjQAhXkmtywhlL1cFOzDUG3yliTOAfqFnjvC7jA
	NhHezDT8YTXEfOUXbklM7lrYsIu5PyFB6rxKoyPe++8xoCJznla1tkyX6PSYb/G79qJhE76JTcd
	AqtDRpX2KGICXXA6dSzylNxoBn/i/tDCF6e076rxTiNW0XRk=
X-Google-Smtp-Source: AGHT+IHfvNQsER59l13KGvmMeC7C3U43EuQV/n7d+kv5aMv6I48flAWi94Q8BVjWNfIkjDZ6+9/XWA==
X-Received: by 2002:a17:906:9fc7:b0:b04:2edd:280b with SMTP id a640c23a62f3a-b04b1687e50mr1291743966b.39.1757438243047;
        Tue, 09 Sep 2025 10:17:23 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b0783047d98sm22542866b.22.2025.09.09.10.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 10:17:22 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH 3/3] lib/oe/utils: use multiprocessing from bb
Date: Tue,  9 Sep 2025 19:17:16 +0200
Message-ID: <20250909171716.1588271-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909171716.1588271-1-martin.jansa@gmail.com>
References: <20250909171716.1588271-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 17:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223126

From: Martin Jansa <martin.jansa@gmail.com>

Fixes build with python-3.14

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
and oe-core now requires latest bitbake already, so we can use this.

[YOCTO #15858]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oe/utils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index d272dd2b8d..2137b05df0 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -5,10 +5,11 @@
 #
 
 import subprocess
-import multiprocessing
 import traceback
 import errno
 
+from bb import multiprocessing
+
 def read_file(filename):
     try:
         f = open( filename, "r" )

