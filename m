Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562DDC25B7A
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 10:08:01 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.11093.1715767680038889170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 03:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hk9SQtL7;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e538a264e0so72199171fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715767678; x=1716372478; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tZg0aL+TAdGSidIJBCFKZhYiZFQy1+oO6Gtim2464U=;
        b=hk9SQtL7Jb409qG75nnMa+x0iwacsNzgK6dB5qAVPF6yK8zGdioMTegwivL0cX1GYc
         hEc3lkLtqFYHj/6IqPipYw9cg3Wc0VrWLGh9pGlaMb67mIVytNHPdsuVJhPwM1OeQIOy
         f3tWiOG+8m6+jHTdX0q3Kfy8sZ81w1bJpuICGQ0wVdnrTZCXwlSDiA+xJv3nhZDXpPyO
         5zgQEkVI8Cf62GmWr1suzJ4ApJP2d2+8cP7YhEcc3/bALcwYbYmZFFF+AhDhtfwEpcTR
         AQXEg0/G0kHHpraaS0rfoM1XfQZyhANjm2Eq/l01NXoWnukYlaBqlO1QUMRPoV+G5act
         vvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715767678; x=1716372478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tZg0aL+TAdGSidIJBCFKZhYiZFQy1+oO6Gtim2464U=;
        b=mhqXPbd4PkYcXdhlZSqVXEsKQa1mJCCJJq+RaBTiYIdLbtPkyrKXS0qGbFYXQACtqU
         j7e8fViYOREcxCvIusd34tDET2hWGt/V2UNjR2V8r6YK5pmC9mMW5fAG1MgxWOWKkhhq
         jINZ6bhpW7x7TRn6Rv32OtleqKCrNlyo8MnqPpj/YVfifrwZg1ZyTvctK7RjzxA6PgaW
         9oaTBFn6cx122BA5pnQXYYGJklLpeXMXCpxrNhMZeGeMb8btoYjHU0z/3V+W/GJ2lhu2
         sjpnwpAWH7hDaplNVUjA+4NB8ZsUpUIOExU7spf5gtlpnVaBFcqycE4ZD1MG+3OKBf01
         gYmA==
X-Gm-Message-State: AOJu0Yy4rUR3TUujHmbOYFtK2JUYSbtaS9sEIRHiRecfYXZhIY8vJlHP
	EU2GDyJ2nmuQ/wyEbkz2w2KBqElTFv08Jj+QkiTOQcqGme93rIRIx+zHCcasprvl+QOAoWkn9mZ
	LZMJrzGt/VEzx6al//r/NVySSquM=
X-Google-Smtp-Source: AGHT+IEbivXq1AYmZ+VK/K6idc/qCK7gH/UcXYQc8Q36URc83hD5aMJMoRhlbj6lKUrRZOv7wAe6OZFcoZAt4Z1aIDQ=
X-Received: by 2002:a2e:3218:0:b0:2e1:61de:9d03 with SMTP id
 38308e7fff4ca-2e51fe537f8mr139269831fa.18.1715767677973; Wed, 15 May 2024
 03:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-uDz_gCpvkb5F9R6NkkQVGn768=mHXyvZJPHfKyZ-t2g@mail.gmail.com>
 <22166.1715765794274311096@lists.openembedded.org>
In-Reply-To: <22166.1715765794274311096@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 May 2024 12:07:45 +0200
Message-ID: <CANNYZj941KS_ULo9iwpyYCKmvpHRur-4djy0AD=bjUvjnwW1XA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Fix do_package race issues
To: pmi183@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 10:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199275

On Wed, 15 May 2024 at 11:36, pmi183 via lists.openembedded.org
<pmi183=3Dgmail.com@lists.openembedded.org> wrote:
> - why is it unable to find anything in packages-split/, if it executes af=
ter populate_packages which places things there?
>
> As far as i could understand, there is some concurrency issue between pac=
kage.bbclass and buildhistory.bbclass. Taking in consideration that `buildh=
istory_list_pkg_files` is triggered by checking if `BB_CURRENTTASK` is `pac=
kage` and at the same time `PACKAGESPLITFUNCS` is triggered on `do_package`=
, this leads to the issue with missing files since buildhistory bbclass mig=
ht be looking into something that wasnt yet created. In my findings, `build=
history_list_pkg_files` should be called in the end of `do_package` executi=
on where `packages-split` directory is created and populated.
>
> Is there any clear reason why we cant move `buildhistory_list_pkg_files` =
to `packagedata` task since its the next task to be executed?

The reason is that the issue is not fully understood, and this move
might be working around the real issue. The logs I saw indicate that
package_split completes before buildhistory_list_pkg_files starts.
This needs to be looked into further.

Alex

