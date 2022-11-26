Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFCBC4708A
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:16 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.70859.1669472172226596611
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6FDcGvVH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id w37so955611pga.5
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6PKjfpZ3L7r6rkhQ7KvbcbPAQmVNLb5FhD8r/k6U4U=;
        b=6FDcGvVH94ylBrVEId3sMzK6NaI3j12BFamNcq1I3iK0FS8I6doKlZJyrpVP43ZTOo
         ev5B5wEMn3dkOsJb2DYr3K914s03B8V02KaiFPB5GOU9tTKiXze6RV/+lgIZFphqo+cs
         q/W5tfFEfI/yky+LE9HzOyan793M7jp1OwFDNij58wet3HftMky86k43gsOObeF0o2nF
         ZYy3W9L9fU+IrfpDeQ7kLic0s8AjTA2ghRorWz9cq1aoFvRe3QigqHtRPmZgK+Jd69Ui
         nZhwU06f7fSeMFTc14jNr4b8uMTVtU8AzkBqE1XSV4q2hB80OFBaMEl0Jm0O+Uza0I6r
         HTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6PKjfpZ3L7r6rkhQ7KvbcbPAQmVNLb5FhD8r/k6U4U=;
        b=S2IOU5mIeWUQTd4mPIKsyVtRDm2TTaSr3Y4VACoyBoXIrYj/n7tVeR41lfZb+GSASd
         SHSCnXzKB6VOcDahUTHX34G0FdwYPM33BpRBNS7E7H2GN91zsuDcrK0JZE46KOs54W74
         BclXIjb74+ame2nmNyPnoNu8byO5OAgRsAW2vTjhTVX0w4MJH77dQew0dKMu1iVUrnLc
         XWMnROjLyqiqoWlXmCBhlI8gpUdaHaOvWZUsaY76Z0FzD5RtmDKpWUUUMfldoZj9UU8h
         1Tmk2luK7Mv3WWKWyYO+aI/Lf2OW2csm74mEC8EnS7sCTAcy+QlthCCzy8jUK93G2qai
         Me5A==
X-Gm-Message-State: ANoB5pnwAjc/HU7+S7XdjY2sv37AnXNqyWXz8j1kWTyT+7f1naeA3sff
	rS/Hp+FNTVWQiNikzwi3SMqNkXXz9VYP3XOp6hw=
X-Google-Smtp-Source: AA0mqf7cVNxkLdxAuQ3Djyq2uEfXDF7lK90v7kY7OmKeHu+tQ6wRkzWi9vSDrtEXNJRkAijwN1ws6g==
X-Received: by 2002:a63:e20:0:b0:440:6e64:fb02 with SMTP id d32-20020a630e20000000b004406e64fb02mr19744003pgl.84.1669472171161;
        Sat, 26 Nov 2022 06:16:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.16.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:16:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 32/37] rm_work: exclude the SSTATETASKS from the rm_work tasks sinature
Date: Sat, 26 Nov 2022 04:14:36 -1000
Message-Id: <cc6ade7de20f6fb9dffe43bceb6e513209e2216a.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173825

From: Jose Quaresma <quaresma.jose@gmail.com>

We can exclude the SSTATETASKS from the rm_work task signature
to avoid running the task when we remove some setscene tasks
from the dependencie chain.

The inject_rm_work handler on the rm_work bbclass triggers the
rm_work task running for any signature change in the dependencie
chain of the task do_build of each recipe.

i.e INHERIT:remove = "create-spdx" will trigger the do_rm_work
when we collect the sstate cache with INHERIT = "create-spdx"

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 77729bea5b17d65dafb604fd1665c612091b28c7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


