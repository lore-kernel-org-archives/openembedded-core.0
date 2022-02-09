Return-Path: <mans.zigher@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032E4C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 13:50:40 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web08.26568.1644414638813380634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A+qo6OjY;
 spf=pass (domain: gmail.com, ip: 209.85.217.52,
 mailfrom: mans.zigher@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id j21so2623821vsg.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=/wVkVsOpFi5Ft5KRDWKIh7aQzS1SVAjGrP2gtDFcgTM=;
        b=A+qo6OjYbG1JJ+tRsQtKx5a6Bhg2NwulieKIzCFiwIaIlnebb/4+EMFBXdA7es15Jn
         Asn7LvNjZbEcas5UFYharZIjTgK3+fypHkp26A4muK4PpnsoARrswM/Uy5rhaG5yyLn9
         0X/dHUTl+L9D4GQL5wfnVw3niVsFFxmLdmZZmlGXVsZBKiqahu4vPOY01RXr4iR45ppa
         T3O+z7whaQCeVtVetBuw9N6IO3NRrVKCi+n9riwyZDpM0j5QrEcsEp3EZCRW++RfJ5aq
         HXeGDGR/0/VV6eaiiPLa7fPZvtCCg37lfdLQbtYOymBm4+TuscIlGnsAQfQw6yBK37M7
         Ja/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/wVkVsOpFi5Ft5KRDWKIh7aQzS1SVAjGrP2gtDFcgTM=;
        b=Kfy0v/QKpknEkUw6PE/8eXEggqnlgsVPruGYjlKOkHv86Bm3Rlbj9asWETpSwInzWD
         WY1lK00IIClVX2thrODlFpENI4bHBazzEvSrOQwIYqEyXuiy66v6WrVihVEY52+YgkRo
         bJUWU/g/sSd018HN7Q5QLcZ+TB8Yi9rxownUkHv1obd3DpbNvHjismuPFe57eSV74ZER
         48bvpkd7o+DboKtwQekDgtX3R4i1Cm5ndsOorl24I4P7pBi+DYqrOMp2cKI+Kp0Kn5nf
         BLbvpKkxBXaiiCV+v6Dm76GG/X99Q3rut8YVE3wA7QAUmCDBDOxuORqQGwFFQmOx1cBG
         98RA==
X-Gm-Message-State: AOAM531E0MCiDg61e3Wn5MMsQgap11+pnOZK64aiY7b3ws6rQEAPeiVM
	MWUyYj9nbb5t/9bTXi3l+bCAL1Bm92cUgglmk10J3Vjo1rg=
X-Google-Smtp-Source: 
 ABdhPJw93OyD0Mj9+NSQqCZzRgNz8bGrcE4w/xHTLtcVuz42DAVJ5rLMaeLpkR8ciLksh1Qs2aaY2QOHGk9LM/1XHaA=
X-Received: by 2002:a67:7185:: with SMTP id m127mr37533vsc.4.1644414637544;
 Wed, 09 Feb 2022 05:50:37 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?TcOlbnM=?= <mans.zigher@gmail.com>
Date: Wed, 9 Feb 2022 14:50:26 +0100
Message-ID: 
 <CAEhQi8kj1kqd6cdG-1LOrmVJ75nR4W47wsa3b5r0RkwmyQho3g@mail.gmail.com>
Subject: Missing python.h when building ntpsec
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 13:50:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161562

Hi,

I am trying to backport ntpsec from master to Thud but I have
encountered an issue where python.h is missing in the sysroot for the
ntpsec so the configuration task is failing. The ntpsec recipe has

DEPENDS += "bison-native \
            openssl \
            python3"

So should that not result in python.h being included to the sysroot
for the ntpsec? Any hints on what to look for?

Thanks,

