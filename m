Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1403EC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:13:55 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.8498.1646748834029534464
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IHxvSdwJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id bc27so16584602pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xqLlozCecKzMz7r3351ffs9bnjk5HwnQaxoJJQe6OEw=;
        b=IHxvSdwJ5whY3DkSPZqGIvANhOZMyKYD+nD4bqPYo11HhOUrSDvXCd/kuDO5hnlNGW
         x3/txEfh7+RdpZmelVTZCF5EOWLibdPxpQcJcHWPHpWauXQhriB0KbG/rZGRd0D+LWsT
         DwhbhlR41HIfaPw2aLeFtXkGt3HHfFKo4MyesToWpLExj0/r/i0xpc8IoqcbcNlIYkzb
         4cjiP6Mrl7WDdWx3xbvoUApNe0F3sy66epwbZhrZ5iGPG1kezwfIPedtERsH++6jeOdB
         SByIUwYR5mxOQBTFO1cJlXxgNTsiY3IJ9/mZmOVdMuQUnXJzfZYh1NhBjzpLvxLstPNN
         MmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xqLlozCecKzMz7r3351ffs9bnjk5HwnQaxoJJQe6OEw=;
        b=bAAdI0aTYiMGt7twZ8LFeYbKjDvU7jlDVatYyXjlhsm9/SYz/Hdp0h86wo4MozV8/4
         8oWl3WXNat776I1s/ozFJwej4YOyCinqAiDZBubCExLn9sjIX5J67MDft1l2NHz/tafl
         lz383f3m7SbFZYCHEfTdNEnKPrH7QTiSZR//+TjtljNmuXmROSc3OIxtGCJfCaNQfvOi
         A0bdzJbx5g1fhRyyz4tN+obl1PCUxqaaIkUIWjjUblHc21Qk6mo99MsHkP7LpQDzrAJR
         TSsCFmW17N7++i1Dr+9RcM2v8O/hYgd8rsd8fJisC7UlUuCqQfpmCtsFrjkYqRSgONAX
         zrGw==
X-Gm-Message-State: AOAM532lmZABN4EXhrGhHo1mH7y3cELBBJAzOtFKsL8g4hKlnTRJtBei
	MUbWcXZqpwr6hVZnQZ7A/IE3/j3aysdQClO+IZs=
X-Google-Smtp-Source: 
 ABdhPJyAZ+XvAsYDjo3ZG1xjKfDNccBtreOD3nzEGPZv3AKsly0ZzZiplb4VyP1lTwrdlmSklP2vnw==
X-Received: by 2002:a63:24c3:0:b0:37c:926d:daef with SMTP id
 k186-20020a6324c3000000b0037c926ddaefmr10140347pgk.280.1646748833111;
        Tue, 08 Mar 2022 06:13:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e21-20020a635455000000b00372badd9063sm15160884pgm.11.2022.03.08.06.13.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 06:13:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/3] systemd: Ensure uid/gid ranges are set
 deterministically
Date: Tue,  8 Mar 2022 04:13:31 -1000
Message-Id: 
 <56f57c70fb87beb9a7181df8cb5e7a4a0b5a184a.1646748150.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646748150.git.steve@sakoman.com>
References: <cover.1646748150.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:13:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162905

From: Richard Purdie <richard.purdie@linuxfoundation.org>

meson.build will fall back to greping /etc/login.defs for values of these
if they're not set. Different distros set them (Centos 7/8 does, Ubuntu
does not) so output was not deterministic. Avoid this by setting to the
default values. We now match the vaules from login.defs from shadow.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 77a6ac0ac266d71e4fe67fd332662081f30cd7bf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_244.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index 66446e2a7c..a648272bc0 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -216,6 +216,8 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
                   -Ddefault-locale=C \
+                  -Dsystem-uid-max=999 \
+                  -Dsystem-gid-max=999 \
                   "
 
 # Hardcode target binary paths to avoid using paths from sysroot
-- 
2.25.1


