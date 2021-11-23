Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBBCC433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 13:48:57 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web12.11446.1637675336713375950
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 05:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ANErzqCS;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id t13so43790104uad.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 05:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhxOHbEmECYRT+Eq2WPWGc3DvqOFAz7L/4DPEYpZIwM=;
        b=ANErzqCSPAHMDWzU3dpl9X/6qH1S9dgLmKq7paLnChhOZ1zO4t4kfoNa1MDOupUVfC
         LIIOQbCKv8LegbvATbKSmzXGfTi95NGp1l9sDdIXgjLPKMSUi4Yt8trsoh2VrFGL0dwR
         SUb6to0nhDZzHqwh4Xu57oJUvDrycZ40vHppUMDN3fZywCI+4TulN9/GdKwlZj3mtA90
         8P+SFWAO15aCnkwSINymDmE5AZL2VoDvb6enm1SL87UMCUy92Y2zyavPGG4JORDEeKB3
         l/50e/rBsmiCLYO4L2qwbhQxGddheJyeic4jE7PnCV5mJi6HgnopbhVDd/aZn1Cd7J3t
         Bg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhxOHbEmECYRT+Eq2WPWGc3DvqOFAz7L/4DPEYpZIwM=;
        b=fOaRGHTUHje/uN0S0sDsmDXDfWSMADywlSbqtbcCSxBVH32Fy3FfcUMMLeBXLZIy4q
         q7Nm94/hQFYeL/GhZ3eBQ+J6n2JOM62PDaGMdO+2fdEkVC/kepA7UQKqW8br7GyVtI5/
         WFByCxAX9e86ZnOsMQM4DAqwC46SUoUAcVL9ASUyiK76fi8+oCXADIfjT6arPTjHqwqB
         CPs2S0NiVyeuslwqVvNTug1Oi4GdR4shBsKMU6l/zDHOqgmqeMwHe1/ViiWr5XLcIKmP
         gfGO7AMS+Z9bRAN8e08RNSKw6ta/ZfOiz/MURHyIWx9fCeYEASgS2LvBDOKHT9GJo3i3
         T5Lw==
X-Gm-Message-State: AOAM533Ltxjt+XAI7x+BSW9gtc6TO6GTWNNethqeEpm0DbrcnccOp6g7
	KHTIUf7SZJn814wGWkk1VkPf7HiP603Bcbk/obA=
X-Google-Smtp-Source: 
 ABdhPJzPg/uWudOmUp57zvrEsLjUHrVBNa9shNoOlhny1AwQipYn8ISNIX+Q7B/1Ln4KE9DQduXfIDmo8urGnyCVaXM=
X-Received: by 2002:ab0:6354:: with SMTP id f20mr9099722uap.116.1637675335693;
 Tue, 23 Nov 2021 05:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
 <CADkTA4PdbYSU+DMsh_wd58zsrKo0xVOTCAroZhvXHiVR2BNE5g@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PdbYSU+DMsh_wd58zsrKo0xVOTCAroZhvXHiVR2BNE5g@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Tue, 23 Nov 2021 14:48:44 +0100
Message-ID: 
 <CAEHkU3VPPcoZ=ekGu80-Kft3ZWvCsZQcNyQNWAeaS=1CKMJz-w@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] perf: sort-pmuevents: some fixes
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 13:48:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158600

Hi Bruce,

On Tue, Nov 23, 2021 at 2:41 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Mon, Nov 22, 2021 at 11:35 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> >
> > I am trying out a kernel recipe using linux master, 5.16-rc2. I found
> > that perf fails to build in do_compile with such a setup.
> > Root cause is that the kernel did add 'static' and 'const' to the
> > arrays of structs which sort-pmuevents does sort.
> > This is addressed in the second commit.
> >
> > While at it I noticed that there are some struct arrays which neither
> > have a name or cpuid element with 1 array element. That 1 element was
> > dropped. I did not verify if that causes any issues at runtime, however
> > that behaviour was improved with the first commit.
>
> What MACHINE were you testing against ? When I build perf against my
> -rc2 dev kernel, I still run into the build issues with these commits
> in place.
>
> I just want to make sure that I'm not seeing something different .. so
> I can do some runs against a similar config as you are using.
>

I did the inital work against a Toradex machine, apalis-imx6.
However I built before sending the patches with qemuarm64 qemuarm qemux86-64
with the following modification to use my 'master' kernel recipe:
+PREFERRED_PROVIDER_virtual/kernel = "linux-toradex-mainline"
+KBUILD_DEFCONFIG:arm = "tegra_defconfig"
+KBUILD_DEFCONFIG:aarch64 = "defconfig"
+KBUILD_DEFCONFIG:qemux86-64 = "x86_64_defconfig"

I tried again. With the patches perf builds for all three machines,
reverting the patches and it fails again.
The x86 compiles forever, for the two ARM machines I get:
...
Traceback (most recent call last):
  File "/build/krm/oe-core_master/build/tmp/work/qemuarm64-tdx-linux/perf/1.0-r9/perf-1.0/sort-pmuevents.py",
line 83, in <module>
    print( preamble.group(1) )
AttributeError: 'NoneType' object has no attribute 'group'
...

Max

>
> >
> > Note that the kernel itself doesn't build either as after 5.15 it now
> > does try to run the dt_binding_check for which the kernel recipe does
> > not provide whatever stuff is needed.
> > I just did a revert patch for commit 53182e81f47d ("kbuild: Enable
> > DT schema checks for %.dtb targets") to get over that.
> >
> > Max Krummenacher (2):
> >   perf: sort-pmuevents: don't drop elements
> >   perf: sort-pmuevents: allow for additional type qualifiers and storage
> >     class
> >
> >  .../perf/perf/sort-pmuevents.py               | 28 +++++++++++--------
> >  1 file changed, 16 insertions(+), 12 deletions(-)
> >
> > --
> > 2.20.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

