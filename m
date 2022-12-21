Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E40C41535
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:53:33 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.17933.1671627199281179632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H92fd+Ok;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id bg10so11107782wmb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 04:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HA/VgbRt4K5DtgWiWJz+bCKxX+eSYbjrNMB/rIykaA=;
        b=H92fd+OkvpAEszwa4otpSTINkF+7jnA25OWSbSSCSBlE6e3piryg/YCmnwCJwzRPOK
         l9W0tRKy769zpDEwTzP8Hfl925qv4xshmw5E0wsjjngWXlwDVoxd3aeMuAe4vgIEDg5n
         oJ7fHTtddiotLY+t7DcN11nsiz0HJT3iasIMWgpZ4hbsHfFvs+Cb1QN0daAx3fhHOAbe
         LB+CiezqR3iSi4KJUJEedz1ifKFz7njy/gw/GNAI22gZV9jYY0euHpiCb6QC0Oo+yIRJ
         2lNWbxOlZfF20kGP0ilCUtab8zpmjWv8T8bAAl+ghI0Qv98lycFuwz9pynKwBQYrYOiU
         +dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HA/VgbRt4K5DtgWiWJz+bCKxX+eSYbjrNMB/rIykaA=;
        b=fepMDiFC3oQ8UQmyvys/DcbUf/nYOJsrSx2zJwRwDKZeTlPIMe0sVoIDCDgL6WHbbg
         uLMSJ6u8PTI2+ErQU2D2dWqSYMG3XWQT1RgOrrlDcjDJEtFgPxJLqlXhUAxvP7xvh9nu
         3QpnTaHreyDT9zJIxlqLiPZDqso+hKVPPT1hSjly+jMYDRGN1DXkT7jEzBU71eRu7YvM
         dFVwjmMzW+x4V/tjUjPLW0MFz4vF4bDqVgpd1Za3VvoUV3zCAFC8laDLuJL8gapzeLX9
         pqSOPsx753SeYQXpZk6ew7j3guXZ3rfTqiYQQ7yAJ/KDBGUYj5myfFLLRhvZL+Eagc3O
         bZ3A==
X-Gm-Message-State: AFqh2kpz5WPqyBbSJWFPxUnATk8M9r4KAOod8XK/fv82KXkaAeTBA08P
	uR5IImfrgZyIlBdZz1XVL7sG++xaKrI=
X-Google-Smtp-Source: AMrXdXvhrkdFl9Dsk1KHILBf1mfMnJi0gaje9IlOrTPW6yVh0H1zwV/LLecZrL9ct+43x/AANEM3+w==
X-Received: by 2002:a05:600c:3b16:b0:3d5:365b:7749 with SMTP id m22-20020a05600c3b1600b003d5365b7749mr1674282wms.16.1671627202162;
        Wed, 21 Dec 2022 04:53:22 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b003b47ff307e1sm2124097wmi.31.2022.12.21.04.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 04:53:21 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 07/10] cargo: Extend DEBUG_PREFIX_MAP to cover vendor
Date: Wed, 21 Dec 2022 12:53:02 +0000
Message-Id: <20221221125306.13779-8-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221125306.13779-1-alex.kiernan@gmail.com>
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 12:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174913

The cargo build builds vendored libgit and curl, but these exist outside
${S} which DEBUG_PREFIX_MAP covers.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/cargo/cargo_1.66.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/cargo/cargo_1.66.0.bb b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
index 6c167c0c5f0b..fe8049b68c9b 100644
--- a/meta/recipes-devtools/cargo/cargo_1.66.0.bb
+++ b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
@@ -20,6 +20,8 @@ EXCLUDE_FROM_WORLD = "1"
 
 inherit cargo pkgconfig
 
+DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+
 do_cargo_setup_snapshot () {
 	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
 	# Need to use uninative's loader if enabled/present since the library paths
-- 
2.39.0


