Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D3EC433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:32 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.20254.1637901391738083034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V2kKjHk4;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso9104819pji.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LTmVgcuVJcec5LMO47b/vUCj1wt4pAV84nKGcPiA34s=;
        b=V2kKjHk4y0to/2vPiZiLJOR2+rJS0DvOfnhYjlwQGBb2OUxyzZrK1mZB4td2j05Nnv
         krvuLPnPQSNyUT/IBlnFS55NpHhheRQilTUJdBTF8kC3GMrpvjtF4HRKYA4DNf6TfP9X
         Gg3GEzz8LVwRLQNlsddXuV5wTnPHLy2cf56p9FsJoXPMCKslDKmst8S7FprdCjV1dz+H
         is22vhNZhsnaxXulfuNbod+p5oAu+juQv4V2Mp6t9VCgB7piW7obnuFDxcbYqT/mTPSz
         Q2qcpkgCQjw4SkdE8vPTIGjZrVMozovA0oYLrJC5zAtsmi5NDjUcmEBGTBI9mgynw4lo
         Q2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LTmVgcuVJcec5LMO47b/vUCj1wt4pAV84nKGcPiA34s=;
        b=HlxccvluAa1VcxobvKUmEZJvGkWfAB3fzfppjXu65X4ekh+HjT0dec3gbrLa7vrK/r
         bJkBsz6SeIfiCh5ztuiKbJblnM4fEdgeCsvZy4YJwdQxmddxZu4097lgd6SRg5neuWdz
         lnuMk1tGn/AiztvT7Y5k5Dfq4++skTH5fisadaZwGbtrdwBEjRCnE4UqI6kyuJKhZWcz
         oOj94qE+pIEJzr4EYG4vfusZFO7oPebRjrNqw4YXYVBp9S/yOQO0cKF3h+r8Qhm+q530
         UOIx4Q4kjZ+OEeC7Md6gZUtTLOcx6BWHtZNJpLyET1UESeWPaL+HvitEwq1EzVrPsflC
         xt6g==
X-Gm-Message-State: AOAM533TJOUI8hUcHRN1CVnAQqWbahCunpZx6RhebVCINw87V4t31hJl
	ISV1+ntKYIJC3UdU7eM27Urd+zlAPWM=
X-Google-Smtp-Source: 
 ABdhPJwuDhJhjfBK8T/D630N3TSFQFh9mlT4bDlySlb68RBM5oJYKrKzdoNyl1JrzFI1h0nFawmqkA==
X-Received: by 2002:a17:902:7d96:b0:142:87dc:7dd3 with SMTP id
 a22-20020a1709027d9600b0014287dc7dd3mr34574371plm.11.1637901391073;
        Thu, 25 Nov 2021 20:36:31 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:30 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 19/26] gstreamer1.0-python: inherit setuptools3-base
Date: Thu, 25 Nov 2021 20:35:58 -0800
Message-Id: 
 <2dffa5743a046fb17731e7b42215c876a3c5bee4.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158815

Drop distutils3-base usage as it is now deprecated.

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
index 045aea44099..1dd7d0d09a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
@@ -23,4 +23,4 @@ EXTRA_OEMESON += "-Dlibpython-dir=${libdir}"
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
-inherit meson pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
+inherit meson pkgconfig setuptools3-base upstream-version-is-even gobject-introspection features_check
-- 
2.30.2


