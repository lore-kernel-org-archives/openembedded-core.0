Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEFDE9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 14:41:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13154.1771425672172720045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 06:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mgb6wBmh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4807068eacbso42130225e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771425670; x=1772030470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z93U0cR/mGJiA2lKpN/fpZOMWXuOjiUkkul63jnbMPg=;
        b=Mgb6wBmhhmyvnMjRSDGrNhpLNM9kjjnxiC+GzSTJV3XZUnAKkCS6n5bOKVN3DS+Mc5
         Tr2/5Bbgq0kzAEOaBeZoADnAvzmy9Fj+OwmPkSF1qYtiMOy3pvo7WTkQ8t8PpL69UO1+
         dOI0krVe3YqT+qPiIAKSA8/12JDJBnAnW04HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771425670; x=1772030470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z93U0cR/mGJiA2lKpN/fpZOMWXuOjiUkkul63jnbMPg=;
        b=Hg7dAyAOWq1BiyD3+MSvjebpdbXF9Cb/sANfs8Mpqkcxiu5YqVUAZnXG68GD0Eh9Q9
         7nop76PT0g4vjnceM5enUw7UNln2vvkm0LV1YWYDa8/9O9b/dxayj/t0AnM/x4ECBt4n
         bsp7S20ZTEy8ko0csRQdklpMlLnWvro+3UbxAh+b1B5MhR6bh++/QhJ83GMPT1V4fS7g
         KtpTDOWhP+EHnXxJaJ0O9jp853glEJQPGjNKjAKuIt9ov+NpOLDUfqDn+QKPZvn/+vp1
         eE/3rINEmEOJ6S3PJ8G3EcXkbWGmn+HvTyryCeHJlM3in/rhXMBqn2GMWB4id+f2bLPa
         /wWg==
X-Gm-Message-State: AOJu0YwqIAZkzJRpdQicAyzLpAgUr06/D6N5n7uLtCm9XSGJaPILIO/T
	BA+RAKN/UzS3EbfLumMntuiIgI/gdppEqLTmp1RguyySK8HxNfsyZM3hIdE6e+0u07FbHcG+TwY
	4iRAPq1o=
X-Gm-Gg: AZuq6aLIiFpwkteTv30Xd8RTdU7VVmCPaDxdK9zznMqKU0DwvbqDWD0/un9Bu1QCug9
	tOxYpsm0hxHILtdWDlbkaIgYTpKcNuWZ//9WLoMBL+TmrGORKCQ34PoYDw8oZJoBOaxV3hZhLs2
	ufag/IBQuo+OYZBlkGvf0aPkQ2NoZglkG85g+pahZYJMBmnVv9E25EkDp27znn0/8AyidpQSJ6e
	Wry1xu7ykx8MQSPV101JcVAM4SL4Q4VzME8aMl5U4w/oPj+UY0SDF3YUOrTucYTEBLAumwK4YFS
	EXT0GFQ1fzdLjsC8z6Onf35U0WVHX72WPkzG4ltohP3HGlERFp6Zr0xeMIZ7x2/XMg62m9OT1wD
	6v4+/yQYYS/b+7xrYWTk6lrhoLa2IIGGgnqG/jbGWY/mkgeON1ieFBVem7d9Wefrrs+ZRKjlcqV
	6QJ73wlHEzX5cvWTiGKkRTD4uiyFDmd+MKkn/1pXizjt9nGP+8u7A=
X-Received: by 2002:a05:600c:528d:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-48398ad2f39mr37095695e9.21.1771425669779;
        Wed, 18 Feb 2026 06:41:09 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9512:ec90:a2a2:6501])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dfb4bd4sm538037105e9.7.2026.02.18.06.41.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 06:41:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] native: Use dynamic filtering for PROVIDES
Date: Wed, 18 Feb 2026 14:41:07 +0000
Message-ID: <20260218144107.2679786-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260218144107.2679786-1-richard.purdie@linuxfoundation.org>
References: <20260218144107.2679786-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 14:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231308

Currently, PROVIDES is one of the few variables left which isn't handled by
filter code dynamically. This lead to bugs if for example you have a
PACKAGECONFIG value which references DISTRO_FEATURES, and DISTRO_FEATURES
is being set in the the native case late by backfill. The early expansion
of the value means it can use an incorrect DISTRO_FEATURES value leading to
confusing errors.

Convert the code to use a filter in common with the other code in the class.

This does lead to some behaviour differences outside OE-Core in meta-oe for
example where the PROVIDES of gd-native changed:

"gd-native gd-native-tools"
to
"gd-native gd-tools-native"

where the change is a clear improvement in correctness.

This fixes issues when DISTRO_FEATURES has backfill options in place in
the native case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/native.bbclass | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index d109907841c..98466b1902d 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -166,18 +166,7 @@ python native_virtclass_handler () {
     d.setVarFilter("PACKAGES", "native_filter(val, '" + pn + "', '" + bpn + "')")
     d.setVarFilter("PACKAGES_DYNAMIC", "native_filter(val, '" + pn + "', '" + bpn + "', regex=True)")
 
-    provides = e.data.getVar("PROVIDES")
-    nprovides = []
-    for prov in provides.split():
-        if prov.find(pn) != -1:
-            nprovides.append(prov)
-        elif not prov.endswith("-native"):
-            nprovides.append(prov + "-native")
-        else:
-            nprovides.append(prov)
-    e.data.setVar("PROVIDES", ' '.join(nprovides))
-
-
+    d.setVarFilter("PROVIDES", "native_filter(val, '" + pn + "', '" + bpn + "')")
 }
 
 addhandler native_virtclass_handler

