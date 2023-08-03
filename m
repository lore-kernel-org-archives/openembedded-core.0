Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C2BC001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 07:19:36 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.8810.1691047168874572818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 00:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=KsVRjls1;
 spf=pass (domain: baylibre.com, ip: 209.85.208.41, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso696330a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 00:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691047167; x=1691651967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcC+DUaspHLldMZtHU7FZGC+7y/JHPFwsfVk4HEteMM=;
        b=KsVRjls1Q9PD+J50PLbxWfBQKqUeXFCbdvnzdKValEmWpcu01/6g7DwqOv8eXJqZff
         wHTXrhZ1xN2ViSN8A2xACYOFXOh5TEQqgEWS0I44HpSvn8BwKuCIq/CEKcJouKSRYWUS
         pxuWm8+FQKZMPDkPPHZg7x3oHGEM2ois6gC6augCNdDuCSCCiawn469QQML0yG316F+G
         IVOtziMxEi1sdsdWkJpavIsEmao2z/jaeStr+dspicYPBigbKh7scgZLV54P+I4h9/MH
         BgR0Nr+Ix2YN13c3NfT4Owh+RKCmyEo6MfkoiZBPRSeb8NokJyOZqC/m9V6aV7Q9fFus
         mBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691047167; x=1691651967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcC+DUaspHLldMZtHU7FZGC+7y/JHPFwsfVk4HEteMM=;
        b=XCN+sRH+fQTewfULJMyh72lbiF+QLX4NkBeJXd6hJiPYtEa8FnhMiXTgH8iqL9bXF7
         hhX+qnI5TC2Q6a1qhBVLr1s0ER1TVk+aurV5zyYW9l+XAerOqtOMtOacshkOAhTDQAPG
         o+LIFlwbylNbqww9O6gZamed31mncKU/1Hbc7YTURjVpc9kN6u+0jJJyx4OD4gcE3dil
         XHrCUnXAyic6B40po1pL0+60a+hrl1w9nd4L2YSr3j9GbD5kwzrRApU5t6D1tYTF/mrL
         E8edv7anrAPpi6oRu7qa1sj4BQoZVMZLjbsNteCUWc/nlCVLjPw5QJlhfN6q/d+lIGTW
         RjyQ==
X-Gm-Message-State: AOJu0YwW1+cTLMBUkTjsbEv/6BgyvmTbW5TKhojfiSIAIyx5YidyRPx3
	thKT1s5c/01TkDflpsjS+5jmr2bR2SWIGkZjGM5c5Q==
X-Google-Smtp-Source: AGHT+IEEG1DW9XxmLpMiAovkyGLorsn9X3GBEh1pXvcMKdahGlJwf9lQLJatpL72CxjLv+Ra4MciBKE1sO6DT5dH7hs=
X-Received: by 2002:aa7:dbda:0:b0:523:f29:a912 with SMTP id
 v26-20020aa7dbda000000b005230f29a912mr502780edt.21.1691047166624; Thu, 03 Aug
 2023 00:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230802142432.2296716-1-jstephan@baylibre.com> <CO6PR11MB5602AC59B4BC790DF4D954DBED08A@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5602AC59B4BC790DF4D954DBED08A@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 3 Aug 2023 09:19:14 +0200
Message-ID: <CAEHHSvaPmEmxKVD1JD_it8QueDy4799RLY95KvzyASYKKJkDhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/5] Add bblock helper scripts
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185460

Le jeu. 3 ao=C3=BBt 2023 =C3=A0 04:57, Chen, Qi <Qi.Chen@windriver.com> a =
=C3=A9crit :
>
> When ' include conf/bblock.conf' line can be more flexibly added to/remov=
ed from local.conf, is there some specific reason why we should put it in b=
itbake.conf by default?
>
> Regards,
> Qi
>

Hi Qi,

This was a request from Richard on the first submission [1] :

> To simplify things, I think it would be reasonable to add a bblock.inc
> file unconditionally in our core configuration so that it is always
> included if present, just to make the tool easier since I think this
> will be a common use.

Cheers
Julien

[1): https://lists.openembedded.org/g/openembedded-core/message/184586

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Julien Stephan
> Sent: Wednesday, August 2, 2023 10:24 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Julien Stephan <jstephan@baylibre.com>
> Subject: [OE-core] [PATCH v4 0/5] Add bblock helper scripts
>
> Hi all,
>
> This is v4 for bblock script.
>
> Improvement from v3:
> * Add self test
> * Add a new "info" level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK: this allows=
 to
>   display a Note when recipe contains locked task(s)
>
> Limitations:
> * Silently does nothing if given task doesn't exist
> * Silently does nothing when resetting a recipe that doesn't exist
>
> Improvement from v2:
> * Add a function in bb.cooker to compute task signatures
> * Replace the findSigInfo function by the new created one. This has the
>   following advantages:
>     * findSigInfo needs the task to be already built to get the siginfo
>       file, meaning we cannot lock a recipe on a fresh build
>     * we can now generate the signatures for all available task of a give=
n
>       recipe
> * Check if a given task is already locked. If so, don't duplicate
>   entry in bblock.conf
>
> Limitations:
> * Needs to taint tasks that are locked, to display a warning
> * I may be still missing some checks on user input
> * Silently does nothing if given task doesn't exist
> * Silently does nothing when resetting a recipe that doesn't exist
>
> I did some tests using qemux86-64 and qemuarm but I may be missing some c=
orner cases.
>
> Improvement from V1:
> * Signatures are now package architecture specific meaning that if you
>   switch MACHINE, the lock sig will not be taken into account
> * I added the -r option to unlock recipes
> * I added a -d option to display the current bblock.conf
> * Added an include directive for conf/bblock.conf inside bitbake.conf
> * Added -t option to specify the tasks to lock/unlock
>
> Limitations:
> * I may be still missing some checks on user input
> * I need to find a way to get the list of tasks ( by default still lock
>   only the do_compile for now, unless -t is specified)
> * Do not check if a particular recipe/task is already locked when trying
>   to add lock. So entries may appear multiple times
> * We still need the signature of the tasks to be already computed before
>   locking. Need to find a way to generate it if missing
>
> V3: https://lists.openembedded.org/g/openembedded-core/message/184932
> V2: https://lists.openembedded.org/g/openembedded-core/message/184697
> V1: https://lists.openembedded.org/g/openembedded-core/message/184584
>
> My branch is available here [1]
>
> Cheers
> Julien
>
> [1]: https://git.yoctoproject.org/poky-contrib/commit/?h=3Djstephan/bbloc=
k
> Julien Stephan (5):
>   bitbake.conf: include bblock.conf
>   bitbake: cooker: add a new function to retrieve task signatures
>   sstatesig: add a new info level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK
>   scripts/bblock: add a script to lock/unlock recipes
>   oeqa/selftest/bblock: add self test for bblock tool
>
>  bitbake/lib/bb/command.py              |   6 +
>  bitbake/lib/bb/cooker.py               |  16 +++
>  bitbake/lib/bb/event.py                |   8 ++
>  meta/conf/bitbake.conf                 |   1 +
>  meta/lib/oe/sstatesig.py               |  13 +-
>  meta/lib/oeqa/selftest/cases/bblock.py | 146 ++++++++++++++++++++
>  scripts/bblock                         | 182 +++++++++++++++++++++++++
>  7 files changed, 371 insertions(+), 1 deletion(-)  create mode 100644 me=
ta/lib/oeqa/selftest/cases/bblock.py
>  create mode 100755 scripts/bblock
>
> --
> 2.41.0

