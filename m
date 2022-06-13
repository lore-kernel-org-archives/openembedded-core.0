Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584D9CCA47F
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:57 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.6489.1655130169466529240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=N5D+93g1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id y196so5886392pfb.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cDtSlYAMjxmdVR2wgXEWKrtdVnaq1APnyjBpptB1E1g=;
        b=N5D+93g1rByeJdVw9nvOTC69S3H+0f1sXC6QAcXfXRfNNjDZ2cpALgIhNuAb4KurBg
         IT9zs5VuYRFuBWufERHZXWPVVsxfRLIMm7a/NDtlETymumluZBipHXVgTKn62TpLPtMk
         U6qhznFfz6JBrmfPXRVaHAWSMC1BPgHUXRDQmydtbD73v8brojOE660ARVc+qCJje2N6
         WTqhdnbSQWFL+3erPi4QW9h7LW6LBh2+HqqDn86gYQ6OnBD/9rqgtfLBRuKi4EqEfkLY
         b0ibW8SI8YGRvnDy8UFqoJADc45Vkq4JGE/V++uB+O0ldTSi+Fjbdd3AsQM9+YkjH+8A
         Pifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cDtSlYAMjxmdVR2wgXEWKrtdVnaq1APnyjBpptB1E1g=;
        b=IsEOUsV2uU4TruLHdTj42UlKbtGOeM4Tq8GYIn+tgcH+24id0wdNHjx502pNWgWgWE
         fuSPNR5EbsAsuTyxRF+LW9eaJ5eUAY/5lL8uA2WXsPM+G5wLUzroEp1vQZ+bx+mTCe8s
         RottO4PqtZ1mqkggpguO77Y64Vb6y+4/VpJZT66JKvOFZ9iDhyqC3er4I7jp0KZuALmI
         pZBtJ2jjrKMCLnnaqzPEKUyDaBcAjJjWlA4+TZyo0d7aPtjOJCTq6T3/Sx73s5LYNJOP
         JXPTqjJHtMU96i+B6buwFNmm3x+Vqk8bKlqXTA7ycIBAwytKEpr1xHofNsu6JRQJNXNF
         Lz3w==
X-Gm-Message-State: AOAM532nUAlRupGjPVOi7Y4/f1b0hZ/SxyvRvAuwie+kPVGYDNY2x/6S
	JGuqaOwZ/udZmuuMCSjlj+z/JAMVwmg06fRB
X-Google-Smtp-Source: 
 ABdhPJwV2cVFhx2/3d6CPkJWvvG45CJuH6rbHOHqhqorcKptw69e9mrZFFb1En4WCga7SxrlhqPXLw==
X-Received: by 2002:a63:6b08:0:b0:3fd:1b8e:3932 with SMTP id
 g8-20020a636b08000000b003fd1b8e3932mr46206874pgc.552.1655130168437;
        Mon, 13 Jun 2022 07:22:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/20] lttng-modules: fix shell syntax
Date: Mon, 13 Jun 2022 04:21:49 -1000
Message-Id: 
 <92a5fb9138ee0a2a1b9926217647a23d1c1d73b4.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166861

From: Martin Jansa <Martin.Jansa@gmail.com>

* add missing space to fix:
  /bin/sh: 1: [: Illegal number: 119)
  shown in the log.do_compile (isn't fatal for the build)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8f785f35c8a9cdc0107fbaa76b20df5199159ee0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
index 361a59c2e5..d27cbc314f 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
@@ -35,7 +35,7 @@ index 5478447..31e0ee8 100644
 +    if [ \( ! \( $(VERSION) -ge 6 \
 +      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \
 +      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 15 -a $(SUBLEVEL) -ge 44 \) \
-+      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 10 -a $(SUBLEVEL) -ge 119\) \) \) \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 10 -a $(SUBLEVEL) -ge 119 \) \) \) \
        -a \
        $(VERSION) -ge 4 \
        -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
-- 
2.25.1


