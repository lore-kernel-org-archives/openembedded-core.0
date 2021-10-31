Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448DFC433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:27 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.32834.1635699506833227340
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yGNbUetO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id o14so743594pfu.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3LxJWu7BeTK7bjYGOvisxh+VCiw5CVUz5dpZ0dxSYGg=;
        b=yGNbUetOod8kbDdGRCuW4Ihvgg6MRTt/mGFzEK1i/FWrTi0NvkwQR/CvzdYIlRLBZe
         y3rqYGSmMgRIDdKlh7TdpqayyLvoT2GUZUkSIzXV6VAvGOFsiI8cu9Yfs5RRoFAQOxLB
         gsPIBEfLR8/y9y//71afHaA13f5kzpIwkxAUeEvwvkY9nuruftcfFW/NPZWDDNTZIUXm
         2N7NVFBBlLnC3cQlb7CLolOg3naVpy1uA3aUefrThRTZ2LGiH6EWYaWSsWDe47gW/C2O
         HrGbATtPJRRNiSK/wPXnkEpsqCaBFEtaBCEUvYi2m77emyNOxL2iaVQR9WcsqZKMQUv1
         Ra7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3LxJWu7BeTK7bjYGOvisxh+VCiw5CVUz5dpZ0dxSYGg=;
        b=FqWB1LU2HEUE2qNjm0ZkzlJmj11NqhR6SbgAX5ggPrcKx6WYbTmeS1WANX5NCHjNT8
         ksG/8DxVlItVIDK79eyahuOVhHhDiUVgfx9C4zQEdB6/lI7kMkDzb/+vjhwwQSY+diZT
         a9lWOqgjhWgwAWVi7gmzy+HlBEHHeU0yIlf9021xezJM/nz5HBt5ANJ8uHFGVO/p927g
         ItvQpDwHImNoVVt0Lh8Rej55HxVWlvgumIvq6mu8y1U2uoPZBthPVHuBH3CwIkoXaA4z
         7asL9gf2CISr4GQNNBeCJcdQ6eaFjzTM5P4izIDUtHwLZuU5cnV85YnwzruB/QyaFFaI
         b3wA==
X-Gm-Message-State: AOAM5310n16RY1pC0D/yBN6TRj4Qz8F0WUQSy9IB2hdWRE0RW+dbU9Q7
	B8zbgI017d/gzS81RhWrbCW931BkFWyFSpQFmSI=
X-Google-Smtp-Source: 
 ABdhPJw/jCGC8/Fl1zpNp4k3EvXDf5P3M17E77qij0NzkdBBKLAf/EZOWeBOV6V1V/JyLXkO4IuhxA==
X-Received: by 2002:a63:85c1:: with SMTP id u184mr7935353pgd.55.1635699505917;
        Sun, 31 Oct 2021 09:58:25 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/29] reproducible_build: Drop obsolete sstate
 workaround
Date: Sun, 31 Oct 2021 06:57:31 -1000
Message-Id: 
 <81b602eaab686fa5a523c023285f8ffd7050888d.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157670

From: Richard Purdie <richard.purdie@linuxfoundation.org>

sstate has been sufficiently invalidated since this change was made, drop
the workaround now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a497d8f30f21bafc78d0f22f3442a9cc99544cb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/reproducible_build.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 62655c2a5b..b44053d076 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -104,10 +104,6 @@ def get_source_date_epoch_value(d):
             s = f.read()
             try:
                 source_date_epoch = int(s)
-                # workaround for old sstate with SDE_FILE content being 0 - use SOURCE_DATE_EPOCH_FALLBACK
-                if source_date_epoch == 0 :
-                    source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
-                    bb.warn("SOURCE_DATE_EPOCH value from sstate '%s' is deprecated/invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK '%s'" % (s, source_date_epoch))
             except ValueError:
                 bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK" % s)
                 source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
-- 
2.25.1


