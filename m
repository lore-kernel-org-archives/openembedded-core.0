Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C939C6379F
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:32 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.24071.1675260868424200432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xPgo5VoP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id z1so9694904pfg.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROXiKx1VeC6t2K9qvVys+jQEjZGL/qxpq1k95kNfnrc=;
        b=xPgo5VoPQVJdp+Zr+bC8aEpHDK2y8j0tJGMR5C7bYmj5o32qKDnE368mQNDEi6oP2P
         7SB8NbG8m9YsUv9jXbX0OKXL8cV8fgY5jrDtftEmEi7wjf3PbTBoTAsEZbXyPd9PRcIj
         fmhzEWjN3OZtMpaC33g0M6Z48hQJznF3Jm4yeyocFZkLJc71WV/hj3xC2m9z4OSZPy46
         ZaaTMSsjG65fkuhxwxRabQwYl5lxaAsKXzv8albz2GLr0FDHWfNiwaDlli6PPN/4eiFq
         o7cUKZIMeaR5G7lPYoi+Wqw1s4KE1l9nhXwylidsCXl4ddAjWifQ2ldsyhVdFqpYfdKS
         uXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROXiKx1VeC6t2K9qvVys+jQEjZGL/qxpq1k95kNfnrc=;
        b=keDouFh2ARVaD/00AJhKWCH/uMo7BeBWOtCMaV531Cv1mMokxgNFWIi1d/NJ4UFLQy
         Y6E7eInbkyjfpdf4G4gJnEWHstjHk/VIvhq+abvujmDUBdJOV23AONicT3JMTfZ6437d
         8Mvy75p7XAf2nTPFAHLuy4qVd4tOXaca3fROCuWETbwZDWOPmbCniHAAjcuXdI/d/vT/
         DVD7/wZbKUPsqQATli+S9qG8WwRklQ9nOl2LEBhNqPi/087YlSBRHqECC6q1JGbgf+Lq
         hL4//bOrUMZu0LyPX0FwZrIbVvsm05kuFE4lPP6ymcik/8fJz5smRC/+jm2qJdygzMmb
         wukA==
X-Gm-Message-State: AO0yUKXRHY0iuvyZYBESOy8Xq8nnIfJK2eAgQArG6qUnXMPEEDIMnT3B
	TnYVWyv7m5S2MfdQASFxu1bIUqXtwypUvFK12p8=
X-Google-Smtp-Source: AK7set8lRUrVho8NP6+P/mnTzvZ0rWG9c6IhzwpPizFQOGCUwA1g1A5luSV22UKbEGBIqfFIxkyPig==
X-Received: by 2002:a62:1a45:0:b0:592:453a:f8ec with SMTP id a66-20020a621a45000000b00592453af8ecmr14391691pfa.21.1675260867451;
        Wed, 01 Feb 2023 06:14:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/17] native: Drop special variable handling
Date: Wed,  1 Feb 2023 04:13:51 -1000
Message-Id: <6e307036a130b6b3f7162ca81746a90efb7b30e3.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176548

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Back when it was merged in https://git.yoctoproject.org/poky/commit/?id=c4257ed8b1040a5a0e9a95846d81961741239116
it appeared special handling in setVar was necessary. Likely due to
other fixes and improvements it no longer appears to be. The results of
"bitbake world -g" before and after this change are identical for oe-core
and meta-openembedded. Therefore drop the "parsing=True" special parameter to
setVar() meaning overrides can now be cleared.

This means that something like:

DEPENDS:append = " bash"

now functions as expected, adding bash to the target recipe and bash-native to
the native BBCLASSEXTENDED version.

Without this change, it would add bash to the native version as well as
bash-native which is clearly incorrect.

[YOCTO #15010]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 99a5105f7b5303cd36077b5910c662a865c1782c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/native.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 61ad053def..1e94585f3e 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -161,7 +161,7 @@ python native_virtclass_handler () {
                 newdeps.append(dep.replace(pn, bpn) + "-native")
             else:
                 newdeps.append(dep)
-        d.setVar(varname, " ".join(newdeps), parsing=True)
+        d.setVar(varname, " ".join(newdeps))
 
     map_dependencies("DEPENDS", e.data, selfref=False)
     for pkg in e.data.getVar("PACKAGES", False).split():
-- 
2.25.1


