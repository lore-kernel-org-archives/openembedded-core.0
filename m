Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47A9C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 11:30:35 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.8313.1737804631583717007
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 03:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eLakzsDe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385eed29d17so1559173f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 03:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737804629; x=1738409429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u70u83nh90+O24v+bsJPskhe4VRJa7hdeJw+LWRv7E8=;
        b=eLakzsDe0U0LX0y7NwwxOLYeBkDDsgZpY7y+acO+Ts+PTrnzrwi6l4n4K5Hu1o9BwB
         xvd+CTu77SkTiinP+GywYFnkGyQzQEYFsNxp3yCjNeTdQJ9Vvr4nHwsOQe6txCRpGNd1
         X4RAq2RfEsBNNRr+qQTyweBAZMPuBBgQmoNpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737804629; x=1738409429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u70u83nh90+O24v+bsJPskhe4VRJa7hdeJw+LWRv7E8=;
        b=HVA/d3mFnqIWjznhtcv548WgsP9lDXCR622vMfOXX2w4PeWmPQEEVbFoSxxn64PbV4
         dhxCuU6sf8PLVtZGR+efNbeWBTeuOJAzDygn5yuqZp9AkjJDtgWlKTcgK8mypzmLLdfF
         WQACFX86sVR686/J1qaVvXgByfnhfrONCbpHbQpYWQvYB1kH1qcW5743bHXKMtWSYMQZ
         JOAHg45Yqgur0DIFnlPyXyOLyOWuW2iAYjwGGMld+r89W55O0H2xDVGmoEpAKUsiwHvE
         dFpdWUkgEpUdemMilKZnhU/p7z+cfJBH0N74zpjRoXG5SfxGb1LeTUSifG9Ws9Jk1Jtw
         hd6g==
X-Gm-Message-State: AOJu0YxO9B8KpKu267kkRakmifqqZxogNeGwlCN4f1RoQHy17F8tJhdB
	h/3xcjZGA1M9Jlg7Yh2XjoSkYFzXn1uWJ3Nj0DAhgrmEfmaHaov6dWBWSqzhYY1X0ib3EtONl45
	Yi1Q=
X-Gm-Gg: ASbGncu9vaT2n9PeLEcPZWS5DpG7eWdByDYdBK6vsr/IkTH14hmumBr0cxRY7nYbWzt
	T77eqVvsFNL8Q7IEZxhbERwLQ9XYBu7q6B6flbYhG5GjIowOwpn/WLMZmVu4jFngXKfvPDVvKj5
	lGcbCZR08pmL9NlTleWIPRClO9M6bJzoq+UKgLiBd+e0MPgTruwHjGbtOwTx4ybbhs85pmoGqjC
	Ob9m63V6cbVkgKd9UG8yZPRbhmkq4jHKT1lwMXlGNorYuPkmO7e1qKhqCOon4EZrR8irsvA3x0c
	zl3rauno1h6FEBXIm1mPX1/f46qjFxkr
X-Google-Smtp-Source: AGHT+IGCwMQSI4266XKoUSqO9tM/dALbW4pxKZnuZY9u2faGsWnMWhlpuV61rMmO5dDdl5qlxYgi1Q==
X-Received: by 2002:a05:6000:1a87:b0:385:fc32:1ec6 with SMTP id ffacd0b85a97d-38bf57bb947mr26927479f8f.50.1737804629087;
        Sat, 25 Jan 2025 03:30:29 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ac79:b32:597e:d068])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1766d8sm5485129f8f.14.2025.01.25.03.30.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 03:30:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] bitbake.conf: Handle empty BB_CURRENT_MC
Date: Sat, 25 Jan 2025 11:30:27 +0000
Message-ID: <20250125113027.2472925-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 11:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210259

Bitbake is about to change the default value of this from "default" to "". The
original reason for this was to make this kind of include file usage easier.
Instead we were going to complicate bitbake code having to map one value into
the other.

Instead, stop using "default" and put a slightly horrible bit of code in bitbake.conf
as an alternative.

This means a "default.conf" in the multiconfig directory will stop working but this
was never something anyone was expected to use.

The eSDK code also needs updating for this change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 meta/conf/bitbake.conf                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 3019dad0f3b..de4799f013b 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -768,7 +768,7 @@ fakeroot python do_populate_sdk_ext() {
 
     # FIXME hopefully we can remove this restriction at some point, but the eSDK
     # can only be built for the primary (default) multiconfig
-    if d.getVar('BB_CURRENT_MC') != 'default':
+    if d.getVar('BB_CURRENT_MC') != '':
         bb.fatal('The extensible SDK can currently only be built for the default multiconfig.  Currently trying to build for %s.' % d.getVar('BB_CURRENT_MC'))
 
     # eSDK dependencies don't use the traditional variables and things don't work properly if they are set
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ba7817b7e5e..8b607088c6e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -832,7 +832,7 @@ OE_FRAGMENTS_PREFIX ?= "conf/fragments"
 OE_FRAGMENTS_METADATA_VARS ?= "BB_CONF_FRAGMENT_SUMMARY BB_CONF_FRAGMENT_DESCRIPTION"
 addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METADATA_VARS
 
-require conf/multiconfig/${BB_CURRENT_MC}.conf
+require ${@"conf/multiconfig/${BB_CURRENT_MC}.conf" if "${BB_CURRENT_MC}" != "" else ""}
 include conf/machine/${MACHINE}.conf
 include conf/machine-sdk/${SDKMACHINE}.conf
 require conf/cve-check-map.conf

