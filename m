Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B735C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:14:54 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.11000.1645452893770606471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FTiM8io3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id b8so15362869pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RnnlLQbDqXg2wsGRtm2TXzaAKnFcirsu3Q5sTY4Umg8=;
        b=FTiM8io3MamM2UYdrslkc1V9lYM9jBoNYAuc9NBVcaactd7o9hg61H4szAlAF3lBEr
         RuOYtQi+kvUHbDMy1rKJZSlnCaDzZH8F68pzmvrHQcXDc5IPg5PASCPeIy1AcuzLuVLH
         bdQbhVSNu+VpD11kvcfVr3WKzjDrwdC6vYZPRXdBAV/ElqRqGGQZU45PZVJsIn8VzzwS
         MsSuzWGV1JI9JX7IRCbaKPzcw0MDQNXtGCHxAGw0gmgh2QD5oOrTctM5qUqueESUhrA4
         ugPZLi+GBHTjf47lKj/H8tbYjwd9uXer0R/fOMytJSDwCkbR+OWZb1wyCSNlZKWqE6nI
         m0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RnnlLQbDqXg2wsGRtm2TXzaAKnFcirsu3Q5sTY4Umg8=;
        b=Vw+mYQ5s4pJQ12ZzP++E0Kfyv3z6QvSi0LQrYSKvtjoYiRhKJ2eA09gfLQ0f0ctXSR
         lTGaVcCIe5TLT/qs0XDKAy8LY3kwdVbw0oXwDX2e/7hubg6yPv7W8BqTvFhWhytaKPEt
         t4uytJYopVTDLTHZ5UjOQ3MoL1objgklaaSOjGIDjwxM9ABTSe7o6PNY6EcqUl/GzNY1
         2JdIwvs2jGvg6vCZXkTQEOTi6lt4AZlsifxd28qZSQ3W1BDwndS+XWwDDhmAvcJSVdTf
         FS59DhuWwNgk6msLSBMQXIIbfHIw6BwEi3MS8EZEetQgPQ2/bQlb0iQxhsQHFVDMLKpP
         v3yQ==
X-Gm-Message-State: AOAM530mrbApncF+9l8ugczrvhv8qax3agI2kdIj00av2o4n9abrpF65
	3TitHGhz/B4EwDsnVqHUTqoYQ/HDnr6+7q9n
X-Google-Smtp-Source: 
 ABdhPJzNDsxKVeLBMrbe/a94fL1F+2ESQWTpyXE7u3EzdtAJ+Eevugvv9WCJQkeuM0Rc/GT13xDHoQ==
X-Received: by 2002:a17:902:bd92:b0:14f:3f88:1b14 with SMTP id
 q18-20020a170902bd9200b0014f3f881b14mr19035182pls.112.1645452892819;
        Mon, 21 Feb 2022 06:14:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/20] recipetool: Fix circular reference in
 SRC_URI
Date: Mon, 21 Feb 2022 04:14:08 -1000
Message-Id: 
 <64434ffd6d406e4c3d1e9ca2fb72fa97990346d8.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:14:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162038

From: Saul Wold <Saul.Wold@windriver.com>

When creating a new recipe.bb file for a binary, don't use BP which
includes the version information, instead use BPN which is just the
name base Package Name.

Since PB is not specified, it takes the default:
PV = "1.0+git${SRCPV}"

But SRCPV is defined in terms of the SRC_URI, which leads to infinite
recursion (traceback below). Here are the pertinent variables which
cause the recursion:

SRC_URI = "git://github.com/lvc/abi-dumper;protocol=https;subdir=${BP}"
BP = "${BPN}-${PV}"
PV = "1.0+git${SRCPV}"
SRCPV = "${@bb.fetch2.get_srcrev(d)}"

def get_srcrev(d, method_name='sortable_revision'):
    # ... trimmed
    scms = []
    fetcher = Fetch(d.getVar('SRC_URI').split(), d)
    # ... trimmed

[YOCTO #14040]

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3b8d43fc53ee13d39abc3b2a1f706a97fcf752aa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 5b6ac12a92..798cb0cefe 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -435,7 +435,7 @@ def create_recipe(args):
         if args.binary:
             # Assume the archive contains the directory structure verbatim
             # so we need to extract to a subdirectory
-            fetchuri += ';subdir=${BP}'
+            fetchuri += ';subdir=${BPN}'
         srcuri = fetchuri
         rev_re = re.compile(';rev=([^;]+)')
         res = rev_re.search(srcuri)
-- 
2.25.1


