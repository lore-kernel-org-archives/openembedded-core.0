Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB6EC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 18:06:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.33.1668189970444700590
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 10:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IRoV4hNU;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id d9so2761909wrm.13
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 10:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pd4xRt/h+M+oa08l7TAo8tRyr9KMfcJwRdj/dhQknZc=;
        b=IRoV4hNU+m0XbOQUReLcnaIOrYFvZ8D6kA/pE5y1A2nAL8tK5vrrKirYsOJOHXLwXP
         jicaFQ9iBF37HIB9zuD3Nb4fAazDzPQb2W1z0yMUO8rt98+IIvacRLEGSOmItwEyui6E
         WLhJDLo7ea7XD8o6L396moTvU8ri2G9tJ+Yd2f3GOlNFVGK6rAFLPgCWzaFMNT5TxP+a
         vSc4RzpfjJGIHt+vFCEUjIUeasMHCYT0sqZPwNXg7d+tHalFDi9tIcP5PC+USG8zaVkC
         JCCuGPiFf8JLufxTvBDEZrFekBQ71W17BUUpnw+RELtpyCWaihT2LkHENu1q1+r8ea/1
         eDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pd4xRt/h+M+oa08l7TAo8tRyr9KMfcJwRdj/dhQknZc=;
        b=XsmxXBC6Q76ixcAoBu4HLxm01ijemUBaN+hc/pR8Mbqtb+ghDhiRXGRJGTRqQDDf5w
         lNc1u3xjvpeKD06XHA17kRiBx5pfBkpdoMmPWB+bue9aUun2w8u3IpWnV9abYDTFYFaO
         0JgLZTAuC3KoSa8Fb6P4MI/jXBb5JotvtuvhO6/pwCuMhtgs0BlM3c9gexJcNNO8ySJi
         STgBI2Rx6fI5JeZeWrrZc30fLON1qn0qE7LLCC5ZG7uAMgtkfFxiXkx914fi5nYuWXHC
         xUquYOfzS7eu1HDO2PnoPM/ELfw8TDShjqr5PsgFdoGlJKlvec4qgMZX06GUQNYI7BZL
         3UOg==
X-Gm-Message-State: ANoB5plZFNTq8KCJPmeN/ui2tu+UCaUtDb7hsp+26Yc8qmwb5pV/TTVL
	E1gz6CGD8EmeD50+rgG4FDkFTi6xApdL7Q==
X-Google-Smtp-Source: AA0mqf7U58UvVgxwjvTdkbJqQxVioq+aAsEyugqYCIW/9kDcbcPdiz1KSx0p9tpQES84fR4ygKWyBQ==
X-Received: by 2002:adf:f7d0:0:b0:22e:3d63:80bc with SMTP id a16-20020adff7d0000000b0022e3d6380bcmr2071294wrq.30.1668189968599;
        Fri, 11 Nov 2022 10:06:08 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id bx32-20020a5d5b20000000b0023bb7e4b8b1sm2496714wrb.82.2022.11.11.10.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 10:06:07 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-Core][PATCH 2/2] rm_work: exclude the SSTATETASKS from the rm_work tasks sinature
Date: Fri, 11 Nov 2022 18:05:46 +0000
Message-Id: <20221111180546.2456993-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111180546.2456993-1-jose.quaresma@foundries.io>
References: <20221111180546.2456993-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 18:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173138

We can exclude the SSTATETASKS from the rm_work task signature
to avoid running the task when we remove some setscene tasks
from the dependencie chain.

The inject_rm_work handler on the rm_work bbclass triggers the
rm_work task running for any signature change in the dependencie
chain of the task do_build of each recipe.

i.e INHERIT:remove = "create-spdx" will trigger the do_rm_work
when we collect the sstate cache with INHERIT = "create-spdx"

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/rm_work.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index c493efff2f..4121a13279 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -112,6 +112,8 @@ do_rm_work () {
         fi
     done
 }
+do_rm_work[vardepsexclude] += "SSTATETASKS"
+
 do_rm_work_all () {
     :
 }
-- 
2.34.1


