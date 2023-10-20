Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D64C19F5C
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:51:59 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.57868.1697817117725396726
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Lj4sgcM0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c9e06f058bso16055975ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817117; x=1698421917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYAws4fh5tg8x3EywH73UZu88qGOyeqqo3aIDJZkmQk=;
        b=Lj4sgcM0sPg/CDdo+iaQuHA2cx76pmPVY+BCHJiTqFD9JPChDaXO+hQ0JYRxcloElR
         KI7qlh4cyNWiEIQz/iOogVEkutpGV2NQ9ewysscE0xtMclKS3PiQydfiAsv2sXyhGfhy
         zoPFz9w7J8mX6EuAY5lnXT8bs0vkjWn05PbQ+DzTSiJQ56szUTwG/bUjpe7gh8CMH7Qr
         O8Jq5NMG4E00laVz7sQcBebBwIRzGkzdpgwehN3inGD5xAjKQXOpfQTnHTXqI801VMm8
         X3PA9E3HSld09ZnSBPleFBOGlW6JIsO0c/Ij6qzw4lDvtICBE6vUUzIR1HV/nMX0duqY
         UP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817117; x=1698421917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYAws4fh5tg8x3EywH73UZu88qGOyeqqo3aIDJZkmQk=;
        b=P9Tn0SvFzxs8051UaPkF7NwUJrt2Zjthm1zF18S0TDCYZx4ql/gGTwbsCffEopkrMp
         RjRHx3gKD4EqwO+pD3vIASYHLaVdk/V4wczvobvSooXSApvcKNZNdCjo1kgWc0a5Gwkj
         y/TJyb7eyaxxcSpULcqBVswUeV74++QWoZ6z6oE8Qgg0f5RNFdTpvN201CcEL0OPmXPx
         Ti3pkOjERVO/3KfnN+dmITcL5uBLCU5qzSzoEJCV8y+VAg4dEZop5QhXw7os9vRBZSk1
         qhdW8ppAO4wDE1dRXTobuPs1FQ6Yrf+ObjPLdhyuUFhVp07h7ZKwq2IYQ2UGgSb0Tlam
         D2bg==
X-Gm-Message-State: AOJu0Yxn2JlITXfI26Dd4FU2aF2bsy+qj0Oi44fhLQYme8afaj6GJzzH
	G5QVx6lf2aJeDdNb6AM85nl2afrInU6q0Op36QM=
X-Google-Smtp-Source: AGHT+IG5MUB3ap0IxB0MPAXqjM9qBux++T8Ik1huaiwUclWv/DtKLy1OuZdShFWopwtfYN/2FPQaxg==
X-Received: by 2002:a17:903:1c3:b0:1c7:22ae:4080 with SMTP id e3-20020a17090301c300b001c722ae4080mr2975619plh.0.1697817116873;
        Fri, 20 Oct 2023 08:51:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/24] vim: Upgrade 9.0.2009 -> 9.0.2048
Date: Fri, 20 Oct 2023 05:51:15 -1000
Message-Id: <b385544941a4d974ab95b0a886031d5c9f3971ba.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189558

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5535.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5e06866692..58025828f2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2009"
-SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
+PV .= ".2048"
+SRCREV = "982ef16059bd163a77271107020defde0740bbd6"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


