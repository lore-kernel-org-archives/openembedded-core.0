Return-Path: <nathan@nathanrossi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B629C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 03:34:07 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.3989.1667878439513579966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 19:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=SVLliClo;
 spf=pass (domain: nathanrossi.com, ip: 209.85.208.54, mailfrom: nathan@nathanrossi.com)
Received: by mail-ed1-f54.google.com with SMTP id v27so20593649eda.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 19:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8/HtM9PJ9YE7rDeQpaz0r9huww/FHnOJ9P3AIIci1kM=;
        b=SVLliCloI9Bl/sOfjjdCHfszZRr73f65r3ILYbH+miC/RGsrAFqJwgvIBBQD7K2W/J
         ImTMGH2yg8e4Z8M3q+g35RctwqIwocSydP2aeSLaN3fLymKpEJ1fDA0FLBpAFYijsVrK
         CaPRDNYadRn+eftsVD3mD1wso5D/A/Z/XZKnU4ANL2SKZzYuDB86bXkjEShh4rFeUNgG
         7OiXauCb8IbKwOvd5xlbRdjriAsJp/0mqTxI1zOZwEBWd0PdQ3A3QlvKLQTmOjIdOqmT
         DQ6u0U6y3NgjMhwcbZ67Cxd4JPu9KgXaDlrCl+T5oon6PdHJHMunwDyLWEJkmlnOFelF
         +eIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/HtM9PJ9YE7rDeQpaz0r9huww/FHnOJ9P3AIIci1kM=;
        b=35/zlSAbcrcXXwMoAptkpBg2oTwO6CHdVO/dhnjZXQMoX3TD0rU67KeQHO9PVKQSte
         BvmYJYZHxnLaMe1mgLRqi0QWYlRBA2KA0lcsCyLLP/U2tfwWl9eH/GmKVbjvToQP9MCb
         7/obdBATlAFJbqdyNg/JmwJBH75wZ6sMmbAgKBcmICuZBzwxHeSvOcmFtoX6gnq5ZJ0o
         4JHWfK5wa6PrBnwu/OA61qae3wyPIxHR/KqlGrK5fxEkpxr1G1GkJ3sLmWziDQaZ8M2L
         7s1lc948177w6AzGgEhC10kbxRDpFRMkhxhpmrxk95OPrlHV5zgpKBKpB3Kky+UFHKoe
         skUA==
X-Gm-Message-State: ACrzQf0bnTyz85tnDa16y9HWwTvblFr9fIap3TZNaVPAKsOlFbeBQ8RF
	kH90rhGdbMWFBUVOs/UKVvWkVSpuBUGhSbLgJx8MhQ==
X-Google-Smtp-Source: AMsMyM5C7Qpa1inZVEu9RIOQB16XDv3Dc4gDlQPG9r/k0CuZenE6Qp4OAsetj/cPJ7cMev/4Z9sBJWBvj+rKqSi3ISw=
X-Received: by 2002:a05:6402:366:b0:463:11e8:13cb with SMTP id
 s6-20020a056402036600b0046311e813cbmr52338974edw.367.1667878437857; Mon, 07
 Nov 2022 19:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20221103075606.208982-1-nathan@nathanrossi.com>
 <20221103075606.208982-3-nathan@nathanrossi.com> <Y2fY05Xy+3SjNN3q@mail.local>
In-Reply-To: <Y2fY05Xy+3SjNN3q@mail.local>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 8 Nov 2022 13:33:46 +1000
Message-ID: <CA+aJhH22n3HDQgVuQaTnMixz3A=mdDfVen9oRf4mmkXn1hSyDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] package: Fix handling of minidebuginfo with
 newer binutils
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Nathan Rossi <nathan.rossi@digi.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 03:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172947

On Mon, 7 Nov 2022 at 01:55, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This series causes the following failure on the autobuilders:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4354/steps/14/logs/stdio

I looked into these failures, the SRC_URI error appears to be an issue
with the lic_checksum test itself, and it presents without this
series. I have posted a patch to resolve it
https://lists.openembedded.org/g/openembedded-core/message/172945.

The other errors around "test.bb" bash hash changes do not appear to
be errors from the recipetools bitbake execution (note the "2 ERROR
messages"). I suspect they are just captured during the fetch selftest
cases in a common stderr buffer? I was unable to reproduce them
locally when running fetch/recipetool.

Regards,
Nathan



>
> 2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_add: ERROR
> 2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_add_bindir: ERROR
> 2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_add_machine: ERROR
> 2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_alternatives: ERROR
> 2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_basic: ERROR
> 2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_binary: ERROR
> 2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_extlayer: ERROR
> 2022-11-06 00:37:54,099 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_inst_func: ERROR
> 2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_inst_glob: ERROR
> 2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_inst_todir_glob: ERROR
> 2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_invalid: ERROR
> 2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_orig: ERROR
> 2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_patch: ERROR
> 2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_postinstall: ERROR
> 2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_renamed: ERROR
> 2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_script: ERROR
> 2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_subdir: ERROR
> 2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_todir: ERROR
> 2022-11-06 00:37:54,100 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolAppendTests.test_recipetool_appendfile_wildcard: ERROR
>
> On 03/11/2022 07:56:06+0000, Nathan Rossi wrote:
> > From: Nathan Rossi <nathan.rossi@digi.com>
> >
> > Newer versions of binutils (2.38+) have changed how the
> > "--only-keep-debug" of objcopy behaves when stripping non-debug sections
> > from an ELF.
> >
> >   https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=68f543154e92ab0f5d6c569e0fa143f5e8bd2d80
> >
> > This change causes associated sections to be correctly marked as NOBITS
> > with the section contents removed from the output. The side effect is
> > that this causes issues with objcopy's ability to perform symbol and
> > relocation stripping (-S/--strip-all) on the debug split ELF, such that
> > with some object files (e.g. kernel modules) objcopy fails to strip
> > symbols/relocations with an error like the following:
> >
> >   .../.debug/nls_cp950.ko[.rodata]: file truncated
> >
> > Because of this it is now problematic to generate minidebuginfo for
> > these types of ELF objects. However it is not typically useful to inject
> > minidebuginfo into these types of ELFs, and other distributions (e.g.
> > Fedora, referring to find-debuginfo.sh of debugedit) only insert
> > minidebuginfo into executables and shared libraries.
> >
> > This change causes the minidebuginfo injection to only apply to EXEC/DYN
> > type ELFs, which limits the injection to executables and shared
> > libraires.
> >
> > Additionally this change fixes the parsing of the sections from the
> > "readelf -W -S" output which was not accounting for the section index
> > column having leading spaces for single digit index values e.g. "[ 1]".
> >
> > Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
> > ---
> >  meta/classes-global/package.bbclass | 21 ++++++++++++++++++---
> >  1 file changed, 18 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
> > index 2d985d8aff..7a0a428b30 100644
> > --- a/meta/classes-global/package.bbclass
> > +++ b/meta/classes-global/package.bbclass
> > @@ -490,16 +490,31 @@ def inject_minidebuginfo(file, dvar, dv, d):
> >          bb.debug(1, 'ELF file {} has no debuginfo, skipping minidebuginfo injection'.format(file))
> >          return
> >
> > +    # minidebuginfo does not make sense to apply to ELF objects other than
> > +    # executables and shared libraries, skip applying the minidebuginfo
> > +    # generation for objects like kernel modules.
> > +    for line in subprocess.check_output([readelf, '-h', debugfile], universal_newlines=True).splitlines():
> > +        if not line.strip().startswith("Type:"):
> > +            continue
> > +        elftype = line.split(":")[1].strip()
> > +        if not any(elftype.startswith(i) for i in ["EXEC", "DYN"]):
> > +            bb.debug(1, 'ELF file {} is not executable/shared, skipping minidebuginfo injection'.format(file))
> > +            return
> > +        break
> > +
> >      # Find non-allocated PROGBITS, NOTE, and NOBITS sections in the debuginfo.
> >      # We will exclude all of these from minidebuginfo to save space.
> >      remove_section_names = []
> >      for line in subprocess.check_output([readelf, '-W', '-S', debugfile], universal_newlines=True).splitlines():
> > -        fields = line.split()
> > -        if len(fields) < 8:
> > +        # strip the leading "  [ 1]" section index to allow splitting on space
> > +        if ']' not in line:
> > +            continue
> > +        fields = line[line.index(']') + 1:].split()
> > +        if len(fields) < 7:
> >              continue
> >          name = fields[0]
> >          type = fields[1]
> > -        flags = fields[7]
> > +        flags = fields[6]
> >          # .debug_ sections will be removed by objcopy -S so no need to explicitly remove them
> >          if name.startswith('.debug_'):
> >              continue
> > ---
> > 2.37.2
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#172617): https://lists.openembedded.org/g/openembedded-core/message/172617
> > Mute This Topic: https://lists.openembedded.org/mt/94752153/3617179
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

