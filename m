Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E10BC77B62
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 08:12:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.29626.1679904762359498898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 01:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jNrDT20r;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id q7-20020a05600c46c700b003ef6e809574so1286749wmo.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 01:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679904760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol8FfIAHbEw0jNdubbhfpGHjv/EAyiWShTkIPW2gNVQ=;
        b=jNrDT20r4RsjIVSkPeILd50giwyfyrXYRSYNqVGIDd0Z17W0UPHLFGIAfvFX71OUrG
         Tc1RQ9qd4zBuFr6qMvKls8eyGw4w3sEykMifJlaLgAQh4ahr1xtU1n0g0tCA6cC2Eulp
         kOQ+hfhG1qs/HG89n6BdxYNrtgvdAyUE8yuE9jDsmSw5w5yAGbtzACgvQdpCL6PiG6VK
         b7xMz2FuAFeE21iH+2OdVLwhBGnN0cZWxw6IebOZ9U3HeOu1osicIwUEfej24BbgA8tg
         dJlfgKrw0sd6XjAK+33WZ7HDOqEJk0ztYSFwJxSYIr3poQamca5tYq72zaekZGstkVk9
         d18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ol8FfIAHbEw0jNdubbhfpGHjv/EAyiWShTkIPW2gNVQ=;
        b=U7BdXa4rNI1a31Nl/bmPkTWGF2yKYDLcdN/H2epUfLcAmBhrAdz8cG8PHxyyDl/FE6
         1/jzZOCAZHIWr0Al4zhsXXpD/9gip6SzCtG6Pxpjp78jMw1iYtQkK/+CFS2mFLegIyYD
         ooPJGeuqgzrw4at7wnM1l9kXQxyMNxfQ9qSz4Yx62tLZOkAd1IIIHEfgIVlvJ9v5KKDm
         D7iK27mkXz79eUXoEzMdRg9gOBWLlEfV6PfKn9KS8QcaJNAifj1ILbnbkXNo7wID0WRH
         uHfG6JYapw52Wi8EHInY1LZb1ne99KrSAsrhfy9EYHz2jVwmEHyJnTAf4I09H42g7Fwu
         JegA==
X-Gm-Message-State: AO0yUKWX5/RwUfn2sy0fVqcTwiCEcFZDbyfFuLIDSBTwmi5VeYIc0Czd
	QGcFt1YtykjdsOX6dXKyknkdfHMEWsM=
X-Google-Smtp-Source: AK7set/m0Vg3AwpYDCAE11N0qYoUXHtAYE2APt/KEPOSVRi2RA29pe88myy0Us8Tk2q73PhRbOcQKw==
X-Received: by 2002:a05:600c:2182:b0:3ef:128d:7151 with SMTP id e2-20020a05600c218200b003ef128d7151mr8628210wme.9.1679904760594;
        Mon, 27 Mar 2023 01:12:40 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:e313:787e:85a7:511b])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003ef6708bc1esm6186380wmq.43.2023.03.27.01.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:12:40 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCHV3 3/4] devtool: add support for multiple git url inside a cargo based recipe
Date: Mon, 27 Mar 2023 10:12:34 +0200
Message-Id: <e56845577fef0720e5ed4933d8f0c2b63229bbcf.1679904677.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679904677.git.frederic.martinsons@gmail.com>
References: <cover.1679904677.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 08:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179143

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Without that, the possible git urls that are in SRC_URI of a recipe
are removed from SRC_URI during devtool process and so the
cargo_common_do_patch_paths in cargo_common.bbclass cannot
patch these packages to fetch them locally.

I use a generic type name because I foresee this change will
be useful for recipe that used a package manager (cargo but also
npm) see https://bugzilla.yoctoproject.org/show_bug.cgi?id=11015

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes/externalsrc.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 26c5803ee6..b00fdba8e9 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -68,9 +68,7 @@ python () {
         for url in fetch.urls:
             url_data = fetch.ud[url]
             parm = url_data.parm
-            if (url_data.type == 'file' or
-                    url_data.type == 'npmsw' or url_data.type == 'crate' or
-                    'type' in parm and parm['type'] == 'kmeta'):
+            if url_data.type in ['file', 'npmsw', 'crate'] or parm.get('type') in ['kmeta', 'git-dependency']:
                 local_srcuri.append(url)
 
         d.setVar('SRC_URI', ' '.join(local_srcuri))
-- 
2.34.1


