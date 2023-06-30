Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD29DC001DB
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:30:04 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.3869.1688092198887817648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=2DDdEgv1;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a1a47b33d8so998077b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092198; x=1690684198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kE5qWB6yS4duQgtYr5iubACagLQOrYU04Wa1CKgiOYM=;
        b=2DDdEgv1aRqyy5ocakp2ap03yOAi05UDVbiSHD5AxWUeRj7GEQbTj2MwHnzWtQZTdw
         HJhQCx/gjzNZJolTYYtEjRzBSj+AGvcnuS97NUB20lyB/93gu81gHJVyyxqMfQKRt0Xo
         oq3oL5hsEGiGWOHySKRR1fcRaSBFgtfHG/W5ZuDN/dnBPjs8uyPPAnkJKiwfMENh1BPv
         sOuFjSjK7x95EQ0YSTmzMFv1rVleeyUN3yx9l297VlikfZAFiS2Q8wSsBgzsPsSdW1DK
         d1fmf4kZvBJDPD57g0c8+7BwOlDJKSI9lSp10J+xOiHIF18KXwZNelJLZbTTZ1q/dFS1
         shqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092198; x=1690684198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kE5qWB6yS4duQgtYr5iubACagLQOrYU04Wa1CKgiOYM=;
        b=HrM2WvArsuGCOiW/utKaH29SGPsWPUldyCkPhkRRfesjWe9eKtLLwDaSs0o5sPIGis
         2x3i7UHtJJ2DBnFtSpji+sy4gViLVI++j8B9/F1JYk5d5/Rt1Yi07xNIm1wdV2CDGXhH
         LoMmK5KykPWiQEjE9Og7KdUad0FWT4fz+iEGXZYH4a6MjUclb8u982MIrueAq9R/HjJ7
         COBiU3/1adLfngX/45oCp/GnrV1o0H136U5S4nFusqhegetuHjs3jpez2xj0Oo387RiD
         pPQssiKxPyzYQgEGeqHsm3HUukh4LxmypNehkgHEvMY+ikr3LqOE0cZKH8bLuGUWwFq/
         pRVw==
X-Gm-Message-State: AC+VfDypivs0yGkPSl+zDyXsEe5Kr7BK7xaI3IFVhHOW7kQXJmNj9eH/
	z4khWLHld/KV/D107eVMk3hJjMPeesueMJmvWw0T0A==
X-Google-Smtp-Source: ACHHUZ6GHUP/WpfOKjybPvlQYZVvxIkejYtq065Btx3JzC+aouRgdPFkugn6kTXnN3uZBdDeySMTjQ==
X-Received: by 2002:a05:6808:198d:b0:3a1:e371:41ee with SMTP id bj13-20020a056808198d00b003a1e37141eemr1447567oib.39.1688092197883;
        Thu, 29 Jun 2023 19:29:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 28/30] useradd-staticids.bbclass: improve error message
Date: Thu, 29 Jun 2023 16:29:04 -1000
Message-Id: <3285f6080161ccc808efb7fce7db9dc0dd236ffa.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183668

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Current error message is difficult to read:

ERROR: Nothing PROVIDES 'image'
trs-image was skipped: image - image: normal username test does not have a static ID defined. Add test to one of these files

It's not clear that first "image" is recipe name, second "image" is
binary package name and that "test" is the user account which does not
have a static ID defined. Improve the error message so that these are
more explicit. Now the error message looks like:

image was skipped: Recipe image, package image: normal username "test" does not have a static ID defined.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 07898218f3908a83e07178b6530dfa48d55d4ec2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/useradd-staticids.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index abe484eb46..1dbcba2bf1 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -47,7 +47,7 @@ def update_useradd_static_config(d):
     def handle_missing_id(id, type, pkg, files, var, value):
         # For backwards compatibility we accept "1" in addition to "error"
         error_dynamic = d.getVar('USERADD_ERROR_DYNAMIC')
-        msg = "%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN'), pkg, type, id)
+        msg = 'Recipe %s, package %s: %sname "%s" does not have a static ID defined.' % (d.getVar('PN'), pkg, type, id)
         if files:
             msg += " Add %s to one of these files: %s" % (id, files)
         else:
-- 
2.34.1


