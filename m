Return-Path: <maxims@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF6EC433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 22:25:06 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.12599.1636151105540510411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 15:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=ATdB/n6f;
 spf=pass (domain: google.com, ip: 209.85.219.182,
 mailfrom: maxims@google.com)
Received: by mail-yb1-f182.google.com with SMTP id s186so26239696yba.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 15:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=6f9G2F8Dn1W0FyTTyRibDMQdSusI3cRM9meTu7RawSg=;
        b=ATdB/n6fhdpWDJWPX3jUpMU2aOqsZtahDUVYngtH57mIru3Lek6NrceO9K0PNoJoeb
         ga3aieG//Bxg5kCKwOE0E57A+qU4nc2Z4LPM3Qg3sQR7drf52rjMngA686YUllIo1DyX
         YoQGj35Bp9gLvEbZEcY8MfVr4/0eClh2DGTCYXRDxPj/on8392x2Q2akoSMdIN9vSHdh
         VafJHifrPb/AE7J7E75pRwqsWDITh5GXKn5+6zQ4XHDd3Qredlft7bnYfuKpk0GSu0sI
         eyoNGv7LmvfBhsY5pm4OWnRZ/R72D2dH/wuLYGJlrDiU/X/jEnmp66UEoOP4FvxpNzE1
         Nn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=6f9G2F8Dn1W0FyTTyRibDMQdSusI3cRM9meTu7RawSg=;
        b=H1if3QF0Wp/nMAepJvtMumbwabmn/yYI2kZhEAPncny5TtXtpemdH+/2Sz8J0fw+me
         vOjd69HMznpNAUdIoIQoU83YGrn7qay+/woVEZbnkic8gVSDIQnz+WX4MHCM1F71tntp
         gAt6R7d7NINRjq/5HIj/WW5CtpX3yV4KG4F4iUvCjrNTZ8R11kV50d4Qz0rQq3mX+bXi
         tHXU8gpPCO0FcREWt3+rVb4WyaJl0UbpRa23etqENbDn98ilkxjFWldVlN9c2+2i5sv9
         pfFnrGOBDOLhLjT+Z7Pd+vbMmIPLkFP5znAJcX9AXBl7Bp7U7XK8ZJyAK3YvjRzqUCbg
         FoFA==
X-Gm-Message-State: AOAM532dRVDLQDD9IAgfcx+f3n5clQ1ZUBDe+Sqk96snooIJiHmG2fHp
	Q2xHS5KfAMXOkab5LA+hFOHGsn9YSJVDzIyHADZoSdUFwUXg1Q==
X-Google-Smtp-Source: 
 ABdhPJwE1RaEzsMtnQh5S/uvv/fVTDUpoKOvpYa2tklMKZq139eDNM0FY35SjnqCjPlDft7ud9u6pWanW4hMleH50rw=
X-Received: by 2002:a5b:483:: with SMTP id n3mr52293898ybp.308.1636151104378;
 Fri, 05 Nov 2021 15:25:04 -0700 (PDT)
MIME-Version: 1.0
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 5 Nov 2021 15:24:53 -0700
Message-ID: 
 <CAFR_W8oXpAQ7y7iCDKkDruGUjfE3DXQ6CQQq1ou5XP7nDcfJZQ@mail.gmail.com>
Subject: Depending on other package's config
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 22:25:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157929

Hi all,

Posting this to openembedded-core, as it was suggested to me.

The recipe that I'm working on for our system (let's call it A) has a
dependency on a certain feature being enabled in another package (B).
So, in B, we have:

PACKAGECONFIG[nice-feature] = "..."

and my recipe (or rather, the tool built by the recipe), needs that
feature to be enabled to work properly. What's worse, is that this is
a runtime dependency, so if somebody just forgets to enable that
feature, the image will build fine, but the tool won't work. I would
like this to be a build time failure.

My plan is to change recipe A, so that if the "nice-feature" is
enabled, the package will PROVIDE one more thing:

PROVIDES += "${PN}-nice-feature"

and in my recipe B, I'll declare this as a dependency:

RDEPENDS:${PN} += "package-a-nice-feature".

Now I'm thinking, wouldn't it be great if package A could specify
extra PROVIDES when the feature is configured? This would be similar
to the way it's done for package's R?DEPENDS:

PACKAGECONFIG ??= "f1 f2 f3 ..."
     PACKAGECONFIG[f1] = "\
                          --with-f1, \
                          --without-f1, \
                          build-deps-for-f1, \
                          runtime-deps-for-f1, \
                          runtime-recommends-for-f1, \
                          packageconfig-conflicts-for-f1 \
                          provides-for-f1 \
                          "

The last line would be a change that I propose. It looks like it would
be relatively easy to implement this in base.bbclass

What do you think? Will this be useful? Did I miss an existing way to do this?

Thanks,

-- 
-MS

