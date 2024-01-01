Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E79C4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 18:27:51 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.11554.1704133661123101538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 10:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hBzNgaLe;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e7c6f0487so5442943e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 10:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704133659; x=1704738459; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GX5QaT6m8chw8TOjNxocJu+CcW3QfDwn3Bc1fHuyyA8=;
        b=hBzNgaLekpJsHlT6L8ET98xNQcI3Rp3qE/vRE2fPSGc6dUItj3G945Wjz8lFZgDZKx
         ZL3sWy9y5Nz0exzkxRxJqdrctOrbSOjktAxHV5J6kQhlf7Po8zSAgSy33cUGK0FqKKIV
         VvGBcsS3Y4ew5SpDrgMSV/fYEoLmVFC6vYggY8s/tMLTrCTakmb/iwNhcZN9g/IwJyvt
         J4NaGhYyrB9ZZKxOKP+ycBrHVoXJfBcrmdyoUwMvpWq7+ABtJZH8u2Cn625fAU5AmiyP
         pv2S0fvKCf0y4t7DtQxOHdpZp0C3g99Luv3lXyO89VqEIkH4BHZDPMoA3n2A8bIFRWTx
         033A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704133659; x=1704738459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX5QaT6m8chw8TOjNxocJu+CcW3QfDwn3Bc1fHuyyA8=;
        b=V6PbJJAIrzk5dLKpm5hCXinVJ+Otc+5G+LdyaS/4GptWddQcI6l5MX/k7Ja9Fl66al
         Rl8gdfpcx+RhCYGx2wiMuXL7dZs6fDPx3Gkv/juS2FVdlTkZT7seDUiKfVnbdhjcGPPx
         FCz5C2OeKXcqsZutoU/cVw7k7e+SsnJqwvK6GXEqE+YZ0m9T25i3aNt2qhg4ImhMGDGY
         1QjM96IeJLBZwdvvIQfYQbz96WO+UHigFp+QYVOYBi5claM5p3wVGu7LF8H/gggv7iqJ
         ObR35hWG7kS3zvH4WR22pHP9X0mZscQE9bQ5dTJsATxkzLTdBEWHqbN1VzocfuTGis7F
         FGzQ==
X-Gm-Message-State: AOJu0Yy+/Ar5JteepeLlW5nla2rPUgRunVObFtNWyCwv6AHZEfYcmMkR
	PO0KBlA/PgXYZRiaHq3lObnsvwkEJ7eywb1ZMSJ2j+ngnfw=
X-Google-Smtp-Source: AGHT+IE8KK5egmTZhcG8ptFhlHXQirskrqVwzbji5/XIcbKR308BeTvl6sbZW8veXZglKFBu8v0LvzmtUOnvU5yynJ8=
X-Received: by 2002:ac2:4882:0:b0:50e:4448:75aa with SMTP id
 x2-20020ac24882000000b0050e444875aamr4360178lfc.104.1704133658984; Mon, 01
 Jan 2024 10:27:38 -0800 (PST)
MIME-Version: 1.0
References: <20231218084403.599015-1-alex@linutronix.de> <20231218084403.599015-2-alex@linutronix.de>
 <20240101130031da8cf15c@mail.local>
In-Reply-To: <20240101130031da8cf15c@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jan 2024 19:27:27 +0100
Message-ID: <CANNYZj_zFK0iRoh9oFmqm7oKoQLq=Mmi5NXYvtDUHb27dZMyTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/7] selftest/sstatetests: fix up printdiff test
 to match rework of printdiff logic
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 18:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193189

RP has reported the same issue elsewhere:
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6254/steps/14/logs/stdio

  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/runqueue.py",
line 1799, in RunQueue.write_diffscenetasks(invalidtasks={'/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb:do_configure',
'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_configure',
'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_configure',
'/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb:do_configure',
'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure',
'/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_configure',
'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_configure',
'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-extended/pigz/pigz_2.8.bb:do_configure',
'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb:do_configure',
'/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-extended/timezone/tzcode-native.bb:do_configure'}):
                 if matches:
    >                latestmatch = matches[sorted(matches.keys(),
key=lambda h: matches[h]['time'])[-1]]['path']
                     prevh = __find_sha256__.search(latestmatch).group(0)
TypeError: '<' not supported between instances of 'NoneType' and 'float'

It seems as though some of the entries lack timestamp information,
probably because obtaining it from the filesystem had failed and the
code placed 'None' into the data structure instead. I'll take a look
at why that isn't reported sooner.

Alex

On Mon, 1 Jan 2024 at 14:00, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> I've been carrying the series for a while without any issue but got this
> yesterday:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6262/steps/14/logs/stdio
>
>
> On 18/12/2023 09:43:58+0100, Alexander Kanavin wrote:
> > Other than the formatting changes, there are two functional ones:
> >
> > - use perlcross instead of quilt, as quilt is special in the sense
> > of being excluded from task hash calculcations. perlcross is a full
> > participant.
> >
> > - run the full test (local + sstate) for gcc do_preconfiure change
> > as the necessary fix has been implemented
> > (sstatesig/find_siginfo: special-case gcc-source when looking in sstate caches)
> >
> > Note that when several tasks are found to have changed (as is the case
> > when base do_configure is adjusted), find_siginfo() runs
> > glob.glob("*/*/*taskname*") against autobuilder sstate cache for each
> > of those tasks (six or seven times). This is an expensive operation
> > taking several minutes. I left it in for now, but if it's proven too slow
> > the test would have to be reduced to checking a specific base recipe
> > (e.g. zstd-native) rather than a distant image target.
> >
> > [YOCTO #15289]
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../perlcross_%.bbappend}                     |  0
> >  meta/lib/oeqa/selftest/cases/sstatetests.py   | 22 +++++++++++--------
> >  2 files changed, 13 insertions(+), 9 deletions(-)
> >  rename meta-selftest/recipes-test/{quilt-native/quilt-native_%.bbappend => perlcross/perlcross_%.bbappend} (100%)
> >
> > diff --git a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend b/meta-selftest/recipes-test/perlcross/perlcross_%.bbappend
> > similarity index 100%
> > rename from meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> > rename to meta-selftest/recipes-test/perlcross/perlcross_%.bbappend
> > diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
> > index f827615ba1b..6af3c8f2178 100644
> > --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> > +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> > @@ -824,14 +824,16 @@ TMPDIR = "${{TOPDIR}}/tmp-sstateprintdiff-difftmp-{}"
> >
> >
> >      # Check if printdiff walks the full dependency chain from the image target to where the change is in a specific recipe
> > -    def test_image_minimal_vs_quilt(self):
> > -        expected_output = ("Task quilt-native:do_install couldn't be used from the cache because:",
> > +    def test_image_minimal_vs_perlcross(self):
> > +        expected_output = ("Task perlcross-native:do_install couldn't be used from the cache because:",
> >  "We need hash",
> >  "most recent matching task was")
> > -        expected_sametmp_output = expected_output + ("Variable do_install value changed",'+    echo "this changes the task signature"')
> > +        expected_sametmp_output = expected_output + (
> > +"Variable do_install value changed",
> > +'+    echo "this changes the task signature"')
> >          expected_difftmp_output = expected_output
> >
> > -        self.run_test_printdiff_changerecipe("core-image-minimal", "quilt-native", "-c do_install quilt-native",
> > +        self.run_test_printdiff_changerecipe("core-image-minimal", "perlcross", "-c do_install perlcross-native",
> >  """
> >  do_install:append() {
> >      echo "this changes the task signature"
> > @@ -846,10 +848,10 @@ expected_sametmp_output, expected_difftmp_output)
> >          expected_output = ("Task {}:do_preconfigure couldn't be used from the cache because:".format(gcc_source_pn),
> >  "We need hash",
> >  "most recent matching task was")
> > -        expected_sametmp_output = expected_output + ("Variable do_preconfigure value changed",'+    print("this changes the task signature")')
> > -        #FIXME: printdiff is supposed to find at least one preconfigure task signature in the sstate cache, but isn't able to
> > -        #expected_difftmp_output = expected_output
> > -        expected_difftmp_output = ()
> > +        expected_sametmp_output = expected_output + (
> > +"Variable do_preconfigure value changed",
> > +'+    print("this changes the task signature")')
> > +        expected_difftmp_output = expected_output
> >
> >          self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-source", "-c do_preconfigure {}".format(gcc_source_pn),
> >  """
> > @@ -873,7 +875,9 @@ expected_sametmp_output, expected_difftmp_output)
> >  "Task gnu-config-native:do_configure couldn't be used from the cache because:",
> >  "We need hash",
> >  "most recent matching task was")
> > -        expected_sametmp_output = expected_output + ("Variable base_do_configure value changed",'+   echo "this changes base_do_configure() definiton "')
> > +        expected_sametmp_output = expected_output + (
> > +"Variable base_do_configure value changed",
> > +'+   echo "this changes base_do_configure() definiton "')
> >          expected_difftmp_output = expected_output
> >
> >          self.run_test_printdiff_changeconfig("core-image-minimal",
> > --
> > 2.39.2
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192613): https://lists.openembedded.org/g/openembedded-core/message/192613
> > Mute This Topic: https://lists.openembedded.org/mt/103239347/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

