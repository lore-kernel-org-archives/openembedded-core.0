Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39084C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:14 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.12507.1641927723196138975
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JKqudLpC;
 spf=permerror,
 err=parse error for token &{10 18 _netblocks.google.com}: temporary DNS error
 (domain: gmail.com, ip: 209.85.214.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id w7so148817plp.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=U0rfOhqFW+E/b9+dR6aN8pMzREORbZN2k01hoJzyyJU=;
        b=JKqudLpCBWZJyfrsdPyT/Tr5cUR2mBBBka+UiTp+10O8s3JOhj3JYTR3/Z599sHVB3
         o7P7uzitHgkTazFE5uIy/eDtZJ9T0jnf+XAt/XiymnBbj4KxO7GVToiF/rKbEu272p8s
         Vgv1/u2LkwutcZotzrv7tM/waeHfUAJXnmiP/CKRGb3nDsO7HMPHRvv9oLAsyT7aNqus
         /cJet8IO3m5o06eavPI9puQOiqrUTzMxHDd4XQ2okpff2tSL1Hh6kHBKon9Ib6JU7MvS
         pkl/DPODHiD7slYsnFeARcQE6d1nsV6RiTFMLvzsfjzso3cwLDVyrLJkRVyL8/J0GvBN
         yvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U0rfOhqFW+E/b9+dR6aN8pMzREORbZN2k01hoJzyyJU=;
        b=HorSSlMXJ3f3U1vA7I2ILWreR+g+xxOVrhleTZCiqY0HTL9J9CY9b1Ukk7cKPZ9cna
         Lyg7TWEPt9+TqL79TaW/ljHU+/PDa2Y0LLIjrgEsPLjNAa+tkSSvvfvA7ad7XWNhV8jn
         9+wmVQkMV5hiGWgywn8fP2cwYNCXk82onrn48MjMe1U0pywPCMbLwMMakPTyvv7ghK+2
         KG/riJcFxZhGu7gdGgCcrk3DXODBG8AlgD2srNSsIGYor5S0i8P3vGlLAwTYEHgnILY8
         a9uTp8tn3Yn8ngfHal8cOdEUWJxG5BTt4rJkSruqv57ZUJ/688EVH4YlrdxfRutymDkn
         NjFQ==
X-Gm-Message-State: AOAM533tBbr7dl4ShqfDoE7DuBs/iLk3dY9mD1sd9pn/tZdvuLC58ivx
	ZYjIfcUZT9dPcHO30VwWsTJFQqk8JTc=
X-Google-Smtp-Source: 
 ABdhPJy/TlzGXMNe/QYcq42ie25thkiKlE1hfVsW1l//jhR0c7hyaPaNiWViqwjjxaptbffTe0ZGJQ==
X-Received: by 2002:a17:902:bb87:b0:148:a2e7:fb52 with SMTP id
 m7-20020a170902bb8700b00148a2e7fb52mr6025765pls.147.1641927722464;
        Tue, 11 Jan 2022 11:02:02 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:02 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 03/22] python3-cython: DISTUTILS_* -> SETUPTOOLS_*
Date: Tue, 11 Jan 2022 11:01:12 -0800
Message-Id: 
 <a195b49e790a4b27bcedfc60ac47600d8c9db346.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160441

Refactor to new SETUPTOOLS_* variables

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-cython_0.29.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cython_0.29.26.bb b/meta/recipes-devtools/python/python3-cython_0.29.26.bb
index b1d21bd15c0..26333cb2718 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.26.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.26.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN} += "\
 # running build_ext a second time during install fails, because Python
 # would then attempt to import cythonized modules built for the target
 # architecture.
-DISTUTILS_INSTALL_ARGS += "--skip-build"
+SETUPTOOLS_INSTALL_ARGS += "--skip-build"
 
 do_install:append() {
     # rename scripts that would conflict with the Python 2 build of Cython
-- 
2.30.2


