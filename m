Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5765C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:42 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.28250.1658155833657729583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7uWuNcbw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso18445636pjc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9kDZNi9mXz38rnPrMB81L2bcphHmMeciq35+x83HQbA=;
        b=7uWuNcbwWH7RbW+ChS8n11kEjwitznPqYnrE18zuPBm0RUxDVaG6SEg6rnfKNMPTaO
         NOGFLdKR2aTsLnE0cqBuNFTl7lmhjvHStjHCocnhvKb5QbRWgI8FL1ClgpFBhdQ8cfIh
         b70RxYgoi13EbdJ9BGZAXv2Eb8knRhGWyENSn5QeDYjQk88EZMYcquvZrCapJBFVHQHq
         RfA8gmPj9SijGS7EUOhcgPcU77DiEnT4lvgsL1CNx1Cejc5oUGqcWbo0RVNjklxYmFv7
         LMtLho0Y75KhMkgPaoBDJ6sovwlMurKMDOXBSy4Q4NeAbe90lsyBb5QjeHgLM2ZYdgxQ
         JWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9kDZNi9mXz38rnPrMB81L2bcphHmMeciq35+x83HQbA=;
        b=4g4b3WR01XWpTZGb+aMpj5zIMbsiPzBTefiXY6DOYiiZNKmQy7okjt1nVuvR1Zpylo
         tMdS3yGsgPf1X92kgfZhkkUJlwg5QV2JCqhqsMc5xRanZGFoxtjKJxeC48voMD1ZKSsS
         O01ioI70ZDeFSyYSOLvvV3XyswevwgaqaJTwdnLFopxc8pIipOwuoaCzIz0iEtaPnN/r
         FL0pktBVDdpZoxAq1hlUNZpOqWuq1ACBi4hhsmJoKNdxTxlX+M/htM0x6wXxenjohTFj
         CtiCQDzJn26jxnMisdgLxEFCsn4h++DPK/FTKr3hmGD4zjOjHRIK3aE/yv6Zxq7ui3pU
         FnAA==
X-Gm-Message-State: AJIora9EZF6Ca3ycYVUbTKnMSDtc3RnrN13Cs+xJB4oSgyE4tJMAQLJf
	8P3CLRP6fBjBD5X0QzzNldhDC9mpZYRxRewi
X-Google-Smtp-Source: 
 AGRyM1veUOZkfrCoNASHLIy0L8atp01L6LojuqvOiCL1612IUrCSt9+rZXKBQTM9A8bGW+a7/ofbOg==
X-Received: by 2002:a17:903:249:b0:16b:9cf3:596e with SMTP id
 j9-20020a170903024900b0016b9cf3596emr28137871plh.60.1658155832641;
        Mon, 18 Jul 2022 07:50:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/35] devtool: ignore pn- overrides when
 determining SRC_URI overrides
Date: Mon, 18 Jul 2022 04:48:50 -1000
Message-Id: 
 <9beb3472624050593fc30d5a00d3d13fec4441df.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168225

From: Paul Eggleton <paul.eggleton@microsoft.com>

If (perhaps foolishly) at your configuration level you have e.g.

  SRC_URI_append_pn-recipename = " file://patchname.patch"

and then run devtool modify on a different recipe, an error occurs:

  INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
  ...
  ERROR: [Errno 2] No such file or directory: '/path/to/downloads/patchname.patch'

pn- overrides would not constitute an alternative configuration that we
should handle in this context, so just ignore them to avoid the issue.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3f2a812ade42ece0bb59b2d303125a91b29936dd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4b50e3c63b..e53569c5cc 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -520,7 +520,9 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         for event in history:
             if not 'flag' in event:
                 if event['op'].startswith((':append[', ':prepend[')):
-                    extra_overrides.append(event['op'].split('[')[1].split(']')[0])
+                    override = event['op'].split('[')[1].split(']')[0]
+                    if not override.startswith('pn-'):
+                        extra_overrides.append(override)
         # We want to remove duplicate overrides. If a recipe had multiple
         # SRC_URI_override += values it would cause mulitple instances of
         # overrides. This doesn't play nicely with things like creating a
-- 
2.25.1


