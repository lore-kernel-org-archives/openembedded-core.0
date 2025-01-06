Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F050E77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 16:10:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.63413.1736179795019599277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 08:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IMzanGEI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43622267b2eso152633355e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 08:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736179793; x=1736784593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgmTIzYvc0My6zqa+W0uL6qgcwSnxOCwiIAWOHIZoLU=;
        b=IMzanGEIfyMXaWPlJVn8vxJRBeaX+CpKEn4siY5FMMOmAqZSm2jiSxbA82C3/gnoXV
         sBB9Nr/CoRJj6EtBKH0X8ptjRihGVpls0+ObuJqojczJUPZEVhy85kW4O3nIoluFCC8Q
         kxksX2G+vnbB1DhhUKADrmZGb1kU8JIkcjAH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736179793; x=1736784593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgmTIzYvc0My6zqa+W0uL6qgcwSnxOCwiIAWOHIZoLU=;
        b=Jpl3Yc9rBqLQTs8Vxco78IsJf6Nz4g6p+Q013f2d56E5VAzpf0qzGGoKUcCllFyH1w
         UQd5ruOTG1dTnMkXsPFkcAv8PS0RONj74prVdxfPplbOVq03SqSp+sf4H3S+wVfjmI2A
         ckub+mx9wBcinlBjGSapVKDL+pdvGyUnF1XwQfwyoVejk4zVLe8DsvPNZy9qtjbCQj8d
         lHEeqBaq5uJh/ciMriPdo6lkO/bR2cobUSznrmGMojpRGGp1ATJ5ajgEYXqwyLjo45JF
         TNZNzALAnM+hH5+mBjayoDYy12jXimhyIxRyNBVAi5AbAE/d6bjHtlF9ssBTIc0NJu++
         2d5w==
X-Gm-Message-State: AOJu0YzvuhELEte0wdPZEvYiA5gTK+x1GqigMFnnmLxrNWLQ7xVD9QCz
	PCNqwZJ9yj1a5FpAvp/DcUNkgSquRTLc8d6QJAp1HVRgjirSciecObZZF7I8mOceusHwDYREdoi
	ct/I=
X-Gm-Gg: ASbGncu+7VbJzHXyVSaik/DdaxBN7REqqWI6ezzn5hFdyK2/WVA7yi9mVavw0QWAxY5
	w/mfk3eS4LaE167rqEAu+9BJ0QxneowWoycHDShJhBat1b2aVPLLqfOESOGuXbVe6vXpTNJYtVe
	+Q8nWQWTwY9J+fcSVqLi5/z6J6lFq/Boz+h9tW2acwsynBZu+wD1+ouAmakUG4M1euGcz2gHT9K
	gzEshjmZ5IogsfK35GsgGrTV8cNQkKZ4fCKLLKxQnstK3osZa6j6yna5mD3iQGCuxgNEhl8nU2Y
	C/zlPm1l1w==
X-Google-Smtp-Source: AGHT+IGUdH5XTt06LYACiEyvFL/vx1aXpIRDroaFRora5eokPkbSEE5mXiA7RWOKgWkXrz/9SHNi8A==
X-Received: by 2002:a05:600c:1547:b0:434:fd15:3ac9 with SMTP id 5b1f17b1804b1-4366b2fa09amr469193415e9.22.1736179793042;
        Mon, 06 Jan 2025 08:09:53 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3607:7267:e27a:36e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm600024525e9.12.2025.01.06.08.09.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:09:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] native: Improve ${PN}-XXX package name handling
Date: Mon,  6 Jan 2025 16:09:48 +0000
Message-ID: <20250106160948.803305-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106160948.803305-1-richard.purdie@linuxfoundation.org>
References: <20250106160948.803305-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 16:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209431

If a recipe has something like:

RPROVIDES:${PN}-xxx = "yyy"

then the current code will turn this into:

RPROVIDES:${BPN}-native-xxx = "yyy-native"

which can lead to errors. Add in some handling for this special case in the class
extension code.

The corresponding entry in PACAGES is correctly remapped, the variables aren't
remapped to match though.

Note that merging this does trigger new dependencies to be exposed, some of which
can't be met or are incorrect. These need to be fixed on a case by case basis.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/native.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index d9651a7f22d..0fad42a5a45 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -158,7 +158,12 @@ python native_virtclass_handler () {
                 newdeps.append(dep.replace(pn, bpn) + "-native")
             else:
                 newdeps.append(dep)
-        d.setVar(varname, " ".join(newdeps))
+        output_varname = varname
+        # Handle ${PN}-xxx -> ${BPN}-xxx-native
+        if suffix != "${PN}" and "${PN}" in suffix:
+            output_varname = varname.replace("${PN}", "${BPN}") + "-native"
+            d.renameVar(varname, output_varname)
+        d.setVar(output_varname, " ".join(newdeps))
 
     map_dependencies("DEPENDS", e.data, selfref=False)
     for pkg in e.data.getVar("PACKAGES", False).split():

