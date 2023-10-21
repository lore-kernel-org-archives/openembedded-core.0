Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BBFC0032E
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 12:57:16 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.78813.1697893033042914243
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 05:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bQUaHS7B;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso28086531fa.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697893031; x=1698497831; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t1q5Y6KfLHDudRM86ERcMDTIZ8iZL16m+PhEewf8t4Y=;
        b=bQUaHS7BkCSjb26zFU797LBnnQLI+sOXrmETWAHNUWGrd0tscgAy5hb8BpaPf1zPYj
         tde1DKFZONzn5JpRwGiGgsgHNChG2iy8GQxSbzi9+TAUmuEVOQ7rxUQ65NsyXH0YkwFP
         TBkYWoTvEaBRCqbl0mDmjjZV56IiLquEFiKPwovrhc/9HZjjgDqYzjX4PCfJzNRwDmx+
         r8qDZmWagmIh1V2iuF0tNZuavJwfijvh9XdOfLHmF93W2N4jTy1BRWv5j0Jl6hkiPLJO
         oszsIYQ9uTdzq6qNoe7mpy9MLoxchkhxpwenc2Gw4ZW/xootT1b1Z8ZfOw+DaO9qfXIn
         WGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697893031; x=1698497831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1q5Y6KfLHDudRM86ERcMDTIZ8iZL16m+PhEewf8t4Y=;
        b=aCt4rL2OIz4mscybLoHpR/CzKh1y/JNCEQswL1Oc8Ccu2Eofr1lr44HRh+P9e/1Hxf
         BO5fLlP5Crnat+9lc1cFmbAvHQ3SrL6HHsGhjvFjQAF8hZFmch7Z3q4PKxINZAMT4t3X
         cGTeeAdGj7tIjK/HmyrIsbEB2hiCBMIev6TREMn4Pnwoou5uIzYhkkJ3pIyReF2LAV5y
         e4N1nl1c/E+k4cq1vp99RW01IWA3nrCKjbXPUOculqw8eVZkp/raeXFj8yzzZEtV8I3v
         kRq3enwH+sqBnELpMGsKQXqgFIpahVpru9NS14+euumipHRg2675Hr8Sb5AnG35+uiVN
         DDkg==
X-Gm-Message-State: AOJu0YyVKXTG+nXjPSnTizSfhT7kJ60oEhlX3N4+eqIF+OVkMhTS0uYx
	YNfM3XoWI9EPy1MFctE3Adjjzo12eZeEpC3upAA=
X-Google-Smtp-Source: AGHT+IGO5LuiXWISt03F7SGbobTOJRaYoL0dwOrE0/HiT91GC0eqTTB4jHEDcnUAxOKmpkcGYfb8DseFLIN+CpwWYSc=
X-Received: by 2002:a2e:a589:0:b0:2c5:1a40:f26a with SMTP id
 m9-20020a2ea589000000b002c51a40f26amr3090883ljp.13.1697893031095; Sat, 21 Oct
 2023 05:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231020171232.3072396-1-alex@linutronix.de> <20231020171232.3072396-2-alex@linutronix.de>
 <20231020225853ada76b3a@mail.local>
In-Reply-To: <20231020225853ada76b3a@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 21 Oct 2023 14:56:59 +0200
Message-ID: <CANNYZj9ZhOXCVbG=Bvav6rE8ToLW=6bVHTr6WykfGA012ASckg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] selftest/sstatetests: add a test for CDN
 sstate cache
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 12:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189586

Right, I omitted the printdiff tests and that created a conflict with
master. I resent a version that's rebased directly on that.

Alex

On Sat, 21 Oct 2023 at 00:58, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Alex,
>
> This doesn't apply cleanly, it seems the context is from another series.
>
> On 20/10/2023 19:12:32+0200, Alexander Kanavin wrote:
> > Specifically, the test checks that everything needed for building
> > standard oe-core images for x86_64 and arm64 is available from
> > the cache (with minor exceptions). Going forward, a complete
> > world check could be enabled and additional configurations,
> > but that requires improvements to performance of hash equivalence
> > server in particular.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/lib/oeqa/selftest/cases/sstatetests.py | 47 +++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
> > index 6ef339897bf..e392d6a1a63 100644
> > --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> > +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> > @@ -14,6 +14,7 @@ import re
> >
> >  from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, get_bb_vars
> >  from oeqa.selftest.case import OESelftestTestCase
> > +from oeqa.core.decorator import OETestTag
> >
> >  import oe
> >  import bb.siggen
> > @@ -879,3 +880,49 @@ expected_sametmp_output, expected_difftmp_output)
> >  INHERIT += "base-do-configure-modified"
> >  """,
> >  expected_sametmp_output, expected_difftmp_output)
> > +
> > +@OETestTag("yocto-mirrors")
> > +class SStateMirrors(SStateBase):
> > +    def check_bb_output(self, output, exceptions):
> > +        in_tasks = False
> > +        missing_objects = []
> > +        for l in output.splitlines():
> > +            if "The differences between the current build and any cached tasks start at the following tasks" in l:
> > +                in_tasks = True
> > +                continue
> > +            if "Writing task signature files" in l:
> > +                in_tasks = False
> > +                continue
> > +            if in_tasks:
> > +                recipe_task = l.split("/")[-1]
> > +                recipe, task = recipe_task.split(":")
> > +                for e in exceptions:
> > +                    if e[0] in recipe and task == e[1]:
> > +                        break
> > +                else:
> > +                    missing_objects.append(recipe_task)
> > +        self.assertTrue(len(missing_objects) == 0, "Missing objects in the cache:\n{}".format("\n".join(missing_objects)))
> > +
> > +
> > +    def run_test_cdn_mirror(self, machine, targets, exceptions):
> > +        exceptions = exceptions + [[t, "do_deploy_source_date_epoch"] for t in targets.split()]
> > +        exceptions = exceptions + [[t, "do_image_qa"] for t in targets.split()]
> > +        self.config_sstate(True)
> > +        self.append_config("""
> > +MACHINE = "{}"
> > +BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
> > +SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
> > +""".format(machine))
> > +        result = bitbake("-S printdiff {}".format(targets))
> > +        self.check_bb_output(result.output, exceptions)
> > +
> > +    def test_cdn_mirror_qemux86_64(self):
> > +        # Example:
> > +        # exceptions = [ ["packagegroup-core-sdk","do_package"] ]
> > +        exceptions = []
> > +        self.run_test_cdn_mirror("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-weston core-image-sato-sdk", exceptions)
> > +
> > +    def test_cdn_mirror_qemuarm64(self):
> > +        exceptions = []
> > +        # core-image-weston isn't produced for arm64 currently
> > +        self.run_test_cdn_mirror("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
> > --
> > 2.39.2
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#189575): https://lists.openembedded.org/g/openembedded-core/message/189575
> > Mute This Topic: https://lists.openembedded.org/mt/102085736/3617179
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

