Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB1CC6FD19
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 22:44:49 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.7760.1678315488812024261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 14:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R3nkwDUG;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id y3so262150qvn.4
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 14:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678315487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIuq7klKMIM/+kjbeU/mNJQDn4f/ByXOdbEsV66ScnY=;
        b=R3nkwDUGvGok9ot+v9G0pOczxlfWP0JSQUt+iOt48AltOBmlSgWE1+pjeWGN/mdX6G
         hyntjyXmwjbw69pv2Q5HmC/98srgIP3RnME5dygQPm2XMlfWjuK/7k5v4Ma6NG44vJcQ
         SR5DbzyXWa2+KhXsbpX6tGNYTt23DrNAGmvB3LsYsqhSoqtfhfGier1e+RDdERqQuili
         0Gn9uIBcbrQhq1kTF2mczWkYhhJ02teMeuy3bLyTwDLDwhFdQXQ9ubQc7rTQjg4jd9hK
         ZQ6eu422Secg3GqQCvBYWMvkQkxipdT5b+p9wR1hb1Xu3v80MpDpVtInSlHFh+8zO5lZ
         4n4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678315487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIuq7klKMIM/+kjbeU/mNJQDn4f/ByXOdbEsV66ScnY=;
        b=5tiothXpCdbQ+QdHgfA5Lu8ZouGPupqlPcQuT/Iet8Kzp0ZPcHobNeNh8XbShWNl3u
         avgSmKLcEZpPWp1rf3SjXxRSY+Ud0uK50vd7l7YYKQHW1T5lmwJS3ASoT65veD7wDn57
         7WOoLfYxZPBCQHWpl1lGAbVQ7SiordzwaP+WQNhuh3vFpJMX2PZbYJpjz+U0VoYgTZj9
         syj0ySI3RAnajsrVroMd4zaw84TBi31mmxDZ9ZEEZD+Vqri0BfFHePjhm/3TSMTQLwJc
         81BkjM9ncLs0RJLkErjB0PcFOdvhf+37PTHBEX72yNjQmyMQWHvbrCQ8TfYHIAKaK2X2
         7D3Q==
X-Gm-Message-State: AO0yUKXSrF0dw2CDYBQuzMj1vEHcSdgx3DWkam4fdgHyNTuBeIxWejQK
	q0b7NGa9srYtT9G3wOT8Ht6sS1S3AD4=
X-Google-Smtp-Source: AK7set/GOmX2LDdaPM5qY6soa2TjZO22hNktMciPA37x289nK5RLjJTmiw0hSHDEf8tkuyNceU2IHw==
X-Received: by 2002:ad4:5968:0:b0:59b:922c:eb64 with SMTP id eq8-20020ad45968000000b0059b922ceb64mr794245qvb.43.1678315487217;
        Wed, 08 Mar 2023 14:44:47 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id dt17-20020a05620a479100b00742f250ebc0sm12228087qkb.9.2023.03.08.14.44.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 14:44:46 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] cups: use BUILDROOT instead of DESTDIR
Date: Wed,  8 Mar 2023 17:44:40 -0500
Message-Id: <20230308224442.33516-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 22:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178202

The cups documentation is clear that the correct way to install into an
alternate root directory is to use the BUILDROOT variable. From INSTALL.md:

	Use the `BUILDROOT` variable to install to an alternate root directory:

	    make BUILDROOT=/some/other/root/directory install

DESTDIR works, but we should use the mechanism the project specifically
created for this purpose.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 9c920bb133ff..b8b655a4fb85 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -66,7 +66,7 @@ EXTRA_OECONF = " \
 EXTRA_AUTORECONF += "--exclude=autoheader"
 
 do_install () {
-	oe_runmake "DESTDIR=${D}" install
+	oe_runmake "BUILDROOT=${D}" install
 
 	# Remove /var/run from package as cupsd will populate it on startup
 	rm -fr ${D}/${localstatedir}/run
-- 
2.36.0.rc2.17.g4027e30c53


