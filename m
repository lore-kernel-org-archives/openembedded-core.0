Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8257C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 12:28:55 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.49796.1720009733310673179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 05:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xg7+zgNp;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e976208f8so845317e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 05:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720009731; x=1720614531; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GisQtH/qxx3+4ebgIgHJG5EXSMjq55Iwi6NiJlo9YH0=;
        b=Xg7+zgNp2DGrng2wX4EtVwF9XySFSKJ6AbGfBgs62Ia/EkwjQsVC5ihlNu/sOza4Od
         Xpu9weEyGMDwJs2NTXcfk1peUjUM2x+guTO8NnVxzWlErEtl09E5xkhxixZG5JtbTELW
         NzmsM9Lvzn7oUkbmkHucL5RZGJcgg8kTVw+aio2sODW1lPotQJ1WOXXCe7sTrtzRTlKa
         R+385MaC0EZEb9IM1IYWSYtcRixyCTdMbCWxFy6eSyKKsTA7D0B2vu7KTY4jGygK8ulX
         igeTlJpiBcBSKgUgKavjTjxefEYRX4DtaKO9zvgh9ZxFJoggmtRl59Xo/9qgKEND9ZKa
         l51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720009731; x=1720614531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GisQtH/qxx3+4ebgIgHJG5EXSMjq55Iwi6NiJlo9YH0=;
        b=wyIRV7CyU+cVfrXiSWDbFtfUKeIl1EuNl7lJyTqU0znHAvjpacBiq9JHksKGWg02RY
         Wq2TpwCC4TsJN/XhjxRhNpgh00Pu6k0aTen2D9rC2QNPOKbb2Qmct+tNCtMuPhCuO8h4
         kY2v++zdJvzFLAXB8Z11WTWM5+1l6o5Fk3A/h08pIbH/faDarYIvjDyRjDOyEF2ri2A1
         8XIiLK7mmndhs12L2XN/P5OPriUqtTGTud5i8dgsql7TsMcbW403+M2C4o2ZgmFM1V3r
         B2JpQp87xdl1BQzj3QMSdDstJjJms3qLBH3nIbczHjpRHuzYtFbKLSNr5v2YD9oTpyAw
         6X2A==
X-Gm-Message-State: AOJu0Ywsrz319ac2iLzmjRkEruF1xAXC6JF3ki4HOoRkoYJR5LjPa6BT
	kwQMPPeJ6PX7ahxoe9poedayvPx6sHdFB/qauDfAgDkjO4sobhttcutPe8w4Qe5oSf0MSiU8j3D
	rAcoaVXu7aTWccBl3eVb2W7rtNZo=
X-Google-Smtp-Source: AGHT+IECZ7WWZ9vc4cMsPCaEIjBTIW3/qua2xdgZfgQ+dBZWJbwVfnv8y1o0CHjKF2YbSLY9UNZilEjLRzQ6GGd18u8=
X-Received: by 2002:a05:6512:a8b:b0:52c:df83:ad52 with SMTP id
 2adb3069b0e04-52e8268b977mr9405764e87.36.1720009731160; Wed, 03 Jul 2024
 05:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
 <20240621103414.2842509-2-alex.kanavin@gmail.com> <de66e3216fb54cf24171e800ea032770517fab69.camel@linuxfoundation.org>
 <CANNYZj9hXzes_pH_tH1P4wVUsLOKiQpRnucds-YpVtJDQRTMuA@mail.gmail.com>
 <f9d0520c75c0144cb6f7a433769b593ddcf9091c.camel@linuxfoundation.org>
 <CANNYZj9xwEDEw9HxHQ5zAPJY2--iuq_JvTW0foOVTF=83zefsQ@mail.gmail.com> <3bd89c381318290050137e1ab5f65bd25f94ec83.camel@linuxfoundation.org>
In-Reply-To: <3bd89c381318290050137e1ab5f65bd25f94ec83.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Jul 2024 14:28:39 +0200
Message-ID: <CANNYZj_o8bFtNGWj48mhDwbrisjjowV1xR_xOfWWJ-Jx3pRwbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/11] devtool/upgrade: add RECIPE_UPGRADE_FINISH_EXTRA_TASKS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 12:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201471

On Tue, 25 Jun 2024 at 13:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I appreciate it calls this "inherits" but this is actually a list of
> any file included by the base recipe so any bbclass, .bb, or .inc file
> that was included should be listed here. The True/False associated with
> it is whether the file existed or not so that if it changed, we know to
> reparse.

This doesn't seem to be correct. I added

+        logger.info(tinfoil.cooker_data.inherits['/srv/work/alex/poky/meta/recipes-devtools/cmake/cmake_3.29.3.bb'])
+        logger.info(tinfoil.cooker_data.inherits['/srv/work/alex/poky/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb'])

to devtool to see how the data in that attribute looks like, and
unfortunately it contains only .bbclass filenames and not .inc or any
other dependent files:

INFO: ['/srv/work/alex/poky/meta/classes-global/base.bbclass',
'/srv/work/alex/poky/meta/classes-global/patch.bbclass',
'/srv/work/alex/poky/meta/classes/terminal.bbclass',
'/srv/work/alex/poky/meta/classes-global/staging.bbclass',
'/srv/work/alex/poky/meta/classes-global/mirrors.bbclass',
'/srv/work/alex/poky/meta/classes-global/utils.bbclass',
'/srv/work/alex/poky/meta/classes-global/utility-tasks.bbclass', ...

etc. - no cmake.inc mentioned anywhere.

So assuming I didn't miss something, this either needs further
bitbake/tinfoil extensions (even more work), or we can just write
manual hints for lockstep upgrades into recipes (there's not that many
of them so I'm leaning that way tbh).

Alex

