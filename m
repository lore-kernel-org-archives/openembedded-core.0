Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC805D1626E
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:46:16 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.55484.1728913575053182067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 06:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xjr8Afvn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4305413aec9so41819545e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728913573; x=1729518373; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jqAEN5wnGPNrNpvssuFek37r/09fRBe2D6eluBj8IyI=;
        b=Xjr8AfvnTzhVcfbQG0fYwroT7uwHWbdS4k9HqjNpF1Vn44+Z2j2zHNtiTMJZh7hte2
         G7hUrVkB0zymUoV2+kS1njM43OHyGoR2VAzII1JmuKTKHwJh35FE1ciZP8MvM2bnraER
         sNlKKeCJK549Jo839m2j4vhcLAr/ZP4I0yYmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728913573; x=1729518373;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jqAEN5wnGPNrNpvssuFek37r/09fRBe2D6eluBj8IyI=;
        b=PQ0ZFVCGsA05U4kzY98a6MQl/0bWAl++n1urYxc/8jE86tGRqPtaW60Qu2LUnJqc1J
         Zh6+mN7gney5nIcBAPD+RmpHKZPRKInRlSlUOT3e1FsLS171dq4IGpPYyIlVF5YJrvZ9
         TvjKT1yKdx+if+pb6oA5l9Oy4UwdZFP9U4FoEP3rCK0UP1AfpzQt9kagH7iUUmlY31Eb
         o2pn8XJQeGs2WhqBXrneBO5s5Qzv/0Ru25sTe3O6DSMBjOFkoHP8SoHCKOBDEeiqRMiB
         OvSOQ5/tohf3GHc0zMbYCfWdWDkkfwt3Ba5kaOHF0whaLe+Z5lqNx6m98vOH0ie40E6T
         Ij+w==
X-Gm-Message-State: AOJu0Yw0yVK1klRQ5sOnMebJ2WkiQQaoTKqc/8MkZXpcUQJMG2QBcQvY
	KN7JNNi2elNF/8FMeNEwAlEAmc2ZBM9KGOFrqK/wYLcM8PAHszUHrcMxCFwxot8MfybltBL+ZNJ
	T
X-Google-Smtp-Source: AGHT+IHFhzEEZTFxUy4RlM8mFqkeCr36wdg8aRf6TO4BdboL/VViJEzpzSq2IAcPnjZxeck4U1Df5A==
X-Received: by 2002:a05:600c:3ba4:b0:42c:acb0:ddb6 with SMTP id 5b1f17b1804b1-4311ded3563mr105496855e9.9.1728913573106;
        Mon, 14 Oct 2024 06:46:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4468:7613:7612:e2d5? ([2001:8b0:aba:5f3c:4468:7613:7612:e2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d70b4331sm155281885e9.36.2024.10.14.06.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:46:12 -0700 (PDT)
Message-ID: <43a7cfaa3cc1304ba4c5c43a802d97d7edb06233.camel@linuxfoundation.org>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Ross Burton <ross.burton@arm.com>, Chuck Wolber
 <chuck.wolber@boeing.com>,  Adrian Freihofer
 <adrian.freihofer@siemens.com>, Marta Rybczynska
 <marta.rybczynska@syslinbit.com>, Jon Mason <Jon.Mason@arm.com>, Michael
 Halstead <mhalstead@linuxfoundation.org>
Date: Mon, 14 Oct 2024 14:46:11 +0100
In-Reply-To: <17FE0CA1425F2338.24631@lists.openembedded.org>
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 13:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205777

It was suggested I should write down a list of other issues we have on
the autobuilder right now. Some of these are related to the transition
to new infrastructure, some are previously seen issues occurring more
frequently, some are entirely new. I appreciate these should all have
bugs. I'm copying various people including those helping with SWAT so
we can transition those we don't get solved into bugzilla.

a) insane do_package_qa intermittent failures
---------------------------------------------

Two levels of probems. The cachedpath code returns False instead of
exceptions so there was unexpected API changes. The recent insane
changes also stopped handling DEBIAN files correctly leading to races.
This is perhaps the best backtrace we have:

https://valkyrie.yoctoproject.org//#/builders/43/builds/246

Who/Plan: RP has a partial revert for the first part to fix builds.
Ross is aware and working on the second.

b) docs build failing in missing inkscape
-----------------------------------------

e.g. https://valkyrie.yoctoproject.org//#/builders/34/builds/9

We could install inkscape on all the workers but I'm reluctant to do so
as it starts to add large dependency chains potentially and reduces our
host dependency checking. We could to with other tools to generate pdf
and epub docs during release and docs builds too.

Proposal is to add a new buildtools-docs target to the AB which can
pull in the meta-oe layer and build a more fully features docs
buildtools. This would also be useful for the screenshot QA imagemagick
tests we want to add.

Who/Plan: TBD

c) source mirroring failing on AB
---------------------------------

https://valkyrie.yoctoproject.org//#/builders/82/builds/15
https://valkyrie.yoctoproject.org//#/builders/82/builds/16

Sources are still mirrored off typhoon but we've stopped that cluster
and are running off valkyrie. This could mean sources don't appear
"fast" in the mirror until that mirroring moves to the new NAS.

Who/Plan: Michael to transition mirroring to run of valkyrie NAS

d) CDN artefacts are failing

Same deal as sources, we need to move the mirroring to be based off
valkyrie's NAS.

Who/Plan: Michael to transition CDN to run of valkyrie NAS

e) bitbake server timeout issues
--------------------------------

https://valkyrie.yoctoproject.org//#/builders/48/builds/185/steps/14/logs/s=
tdio

I've saved=C2=A0

https://valkyrie.yocto.io/pub/shared-failure-data/fedora41-vk-1-selftest/

 - the json logs are something we've not had before for that
 - the key message in cookerdaemon is "Idle loop didn't finish queued
commands after 30s, exiting."
 - that message is there twice, it failed twice
 - can we decode the json logs and get timestamps
 - looks like it happens in particular in the siggen code?

Who/Plan: TBD

f) CVE database corruption
--------------------------

See list discussion:

https://lists.openembedded.org/g/openembedded-core/message/205715

Has a bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14899

I'm at a loss on this one. Started to wonder if an rsync job is
trampling the file. Check with Michael.

Who/Plan: Ask Michael about rsync job

g) Toaster test issues
----------------------

Toaster testing is more intermittent on the new faster workers. Have
some patches in progress but is has highlighted issues with the tests.

Help in changing "assertTrue(X in Y)" to "assertIn(X, Y)" in the
toaster tests would be welcome. I've made a few patches, more are
needed.

Help in being able to delete a project from the database before
starting tests would also be useful. Having trouble doing it in the
tests themselves due to database locking and can't work out the way to
call the rest DELETE API from selenium yet.

My plan is to length the timeouts and drop all the sleep/poll calls,
clean up the timeouts. This will make the tests much faster too. This
does mean adding "wait for alert to display" code. Have tried doing
this but tests need fixing.

Who/Plan: RP has ideas but would welcome help. RP needs to send
"debugging toaster tests email with tips".

h) weird networking issues causing test failures

See original email in this thread:
https://lists.openembedded.org/g/openembedded-core/message/205723

RP is at a loss.

Who/Plan: TBD

i) rust toolchain test failures mips/ppc

e.g.: https://valkyrie.yoctoproject.org//#/builders/21/builds/226

Who/Plan: Need to write email asking for mips/ppc help. Can
Adrian/Chuck help?

j) SPDX build warnings

RP hasn't merged Joshua's patch. Need to include in next testing run

Who/Plan: RP to test and merge patch

k) ssh test still causing failures

RP's fix looks to be incorrect, changed the wrong number. Correct fix
queued in master-next

Who/Plan: RP to test and merge patch


I'm sure there are more but I've put the ones I have in my head down
for now. I'm pretty sure people find fixing one issue painful, trying
to keep track of this many in my head is bad enough without trying to
fix them! Help on any of these is welcome.

Cheers,

Richard


