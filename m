Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758A5C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 09:35:27 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.8368.1706002519826047090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 01:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OAk67yuU;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7abe4be4so5482301e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706002518; x=1706607318; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c2rKNLfWSxRADKj+ouojmLI5kMT6NGTxXI7dm+KPki4=;
        b=OAk67yuUa7eVokqV1vLQaF/RNnkcEVTxwdgDiTuWT5ZxUf3hSHrOLplG76p4UFCRbt
         I8d2Oz3UzjISOVSVjtlyDcNpaz4flu4N5tWm5eP4G7f2hde1ggEALjOBtmEAjdtY4Fwg
         lG08AELvtl1RhZhH6YhhVjCGCL/a2TTcdreZadRjj0gJJrs2JwXE143tOJsmTtFRdg7G
         V/1sasNcPzLgcbodAfHyd1UOk2Ex7AHnAizvjRxKXVszkb9U6kV++SuzjuZU0f3CAKzF
         fueAC15yarM7YLK50u8Ep2hc4MyzvZk3bhWbR/t51MGoyyFIQdAhJLwRZNn7AflvwLDk
         Pmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706002518; x=1706607318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2rKNLfWSxRADKj+ouojmLI5kMT6NGTxXI7dm+KPki4=;
        b=mCrG5JmU8gdnOfp4qO7fbcAg8s9g0lgRb7y7CU8/P0zl8UgOuBndTIbxjQz3/AkSJU
         jZxwkefJ+UaYkFQlmv829TzTOICWsm/g4mj99fmfYp07mYD4yVEQNJN/ySBAhcC9KTXL
         xXisigMKvcWl307GPEr/fFVjVOPsAUmRrYQJ4KTJ0aFlXS4+w4ztOhh/hmK8fCMh8jCd
         CwF+FYcw7IAld0lQFIcmW+rCfX8TA0uStOYINgflLQonB1JYM28zhHCcxundnsMKMOcq
         n8C/zwmO5eyIwykN0zctjtkgQObpeMTXT2zEY9IkCeugXWoUSwOHGsGtcIngpEvo6r5k
         STyg==
X-Gm-Message-State: AOJu0YyWM5VxHDkdPnyFQPsqu7ZFnpycMOsbJ4Na/6SoPGnQrsEoI6av
	4XCDuixrsOP+HSvsrmg586D/lFFQcWGBguUZChvGWRE5XnH6hN6IO3PeudRUN884/lUOz/ZBZsw
	WywXkbQy1TWhY052Bcitc/cj+c68=
X-Google-Smtp-Source: AGHT+IH1iZVZUpII55LGYWN4ZlnrFVTnFZDllcQBvUhtF3/BzNCxzVpif+nMK34KJ/cBaV2soM5pEqxSiymyr6HMi5I=
X-Received: by 2002:a05:6512:608:b0:510:9ea:ed14 with SMTP id
 b8-20020a056512060800b0051009eaed14mr250601lfe.64.1706002517747; Tue, 23 Jan
 2024 01:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20240122154919.42591-1-William.Lyu@windriver.com>
 <8157e567182f3b802404f1a3d95f82fd21f8c0ce.camel@linuxfoundation.org> <CY5PR11MB63428573A422F55A650E0A3DEE752@CY5PR11MB6342.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB63428573A422F55A650E0A3DEE752@CY5PR11MB6342.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jan 2024 10:35:06 +0100
Message-ID: <CANNYZj-WsY97xBV3cXsORdqGGXOyS9-YqK2w3bac-wzeL_2yJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perl: Fix perl-module-* being ignored via COMPLEMENTARY_GLOB
To: william.lyu@windriver.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 09:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194222

On Tue, 23 Jan 2024 at 00:51, Lyu, William via lists.openembedded.org
<william.lyu=windriver.com@lists.openembedded.org> wrote:
> > Do you have some examples of these packages which don't exist?
> >
> > I'd like to understand why they don't exist and perhaps not have them
> > listed in PACKAGES in the first place. Creating a load of empty/useless
> > packages with ALLOW_EMPTY seems a bit pointless/sad.
>
> The following is a list of empty packages perl-modules RDEPENDS on.
>
> tmp/work/core2-64-poky-linux/perl/5.38.2/packages-split$ find -maxdepth 1 -empty -name 'perl-module-*'
> ./perl-module-config
> ./perl-module-warnings-register
> ./perl-module-vars
> ./perl-module-strict
> ./perl-module-config-git
> ./perl-module-warnings

All of these are special-cased by the recipe to be packaged into the
main perl package (and it sets RPROVIDES for them too). As the module
package split is done with do_split_packages(), there are two options:
- adjust file regexes in calls to that function to exclude the above items
- (easier, and fine with me) set ALLOW_EMPTY only specifically for the
above list, and not all module packages.

Alex

