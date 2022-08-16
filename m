Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274D8C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 22:52:11 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.22265.1660690328980056514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 15:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YWoNaowV;
 spf=pass (domain: gmail.com, ip: 209.85.128.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-332fc508d88so119754117b3.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 15:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=olZmsKxprt0LBA83/x99QYwVyj27n/ubO1G3bMLlghU=;
        b=YWoNaowV2WagLrNzEPZa6H9Y+ZN0ilqEepP0yZ7MlziWtI0CoiJp+Q3nfqj2X7SzSD
         il0AQQi833tinJMo5SzAbNRrRhOAzrPVGleYztyzrSihBhYLC6F/2OiXBWKL9pCCFhvm
         6Vk5wn+Qs6Ub5JdWjWgbvdQvDnRdAPf/qoKtqIk2Okevi9Y4uzad0XVLgtpNmMV7gMTK
         KruAUM2bSVr+kw7KGAjZXXY5f3oKbWulWpHYpxTOc/I47cnJ+a3Aqn71N+xUwj87uGNy
         meD2bRwKgyyCEyHi8D7rfKKs2tbI5v1K0juZwkfXsB3Yyi1e0Fk5kwMrDFEHXItCAGw7
         FyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=olZmsKxprt0LBA83/x99QYwVyj27n/ubO1G3bMLlghU=;
        b=Ap/DLTnNa2DPYuWfpZoq9Eaw7mNkDRUBl/sYPKhLK/eAVP1Q11ZJN3igfqwSMESNGY
         MneqSZeGYJEDOaCYhJNpV3VHU9coEJuXd9vn8hJ2T66kEWHQwzNEQHjHFKmoAK6SB3mE
         cl485EY/9izxby2eJeX/xO8jOggah1UKHRtYUB/+2XhYx3WPn4FJqRdDYg7fu3QGwx7J
         OcOkSJZZwlGg3FWjZXiCcn+tgX40A8H3tkFVMN0yXXAEv7806DWxDnIIZoRBkW701DT9
         MFNjIJL/H2FUt0UuOSH0/5l7EhPyY5V28x6tmhtG4+POZByiWPtcgOGJLYGYmvT6CKIZ
         cASA==
X-Gm-Message-State: ACgBeo18e/jyujs3+vTZjiU4vynWwi8b8KDhpyxeipv6ObRKwE5rH78w
	Af5NsXSF3iAjQRwQ/dI84rccnnUxa5ZBpLqKRq4=
X-Google-Smtp-Source: 
 AA6agR7lVy+7QvjldsirhprxEJisQ0/x5BmvBOWgKIqxmzWwI2zSAe40oV/peja4RoUh5JWcsjJhjPzfn9I0xXxP+nw=
X-Received: by 2002:a81:88c5:0:b0:31e:f1e:dc23 with SMTP id
 y188-20020a8188c5000000b0031e0f1edc23mr19746757ywf.139.1660690328015; Tue, 16
 Aug 2022 15:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
 <CABcZAN=A7X5E1442ci-br2EJhX_hOwaNHFYmv1A+RhB73KRbEQ@mail.gmail.com>
In-Reply-To: 
 <CABcZAN=A7X5E1442ci-br2EJhX_hOwaNHFYmv1A+RhB73KRbEQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2022 15:51:41 -0700
Message-ID: 
 <CAMKF1spJdVvep-dtL6pbLsCvyAMDyjCuOooS+mpmprRGhX6h=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/8] package: Switch debug source handling to
 use prefix map
To: Christopher Larson <kergoth@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 22:52:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169465

Series looks good now to me. I think we should upstream the gcc
patches as well since its
a good change to have everywhere. I am seeing one issue in curl-config
now getting buildpaths [1]
emitted into it, but it could be clang only problem too, I will look
more into it

[1] http://sprunge.us/JmSaGG

On Tue, Aug 16, 2022 at 2:24 PM Christopher Larson <kergoth@gmail.com> wrote:
>
> Looks like a good series, thanks for your work on this. LGTM.
>
> On Tue, Aug 16, 2022 at 1:57 PM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> Reproducible builds are no longer a configuration option but are required.
>> We also rely on the prefix mapping capability of the compilers now.
>>
>> As such, rewrite the source locating code to use the prefix maps instead
>> of taking a guess about WORKDIR which isn't correct for kernels, gcc,
>> externalsrc and probably more.
>>
>> Instead, iterate the maps to locate any matching source code, keeping
>> in mind that multiple maps may map to one target location.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/classes-global/package.bbclass | 68 ++++++++++++-----------------
>>  1 file changed, 28 insertions(+), 40 deletions(-)
>>
>> diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
>> index 418400da8c9..2d985d8affd 100644
>> --- a/meta/classes-global/package.bbclass
>> +++ b/meta/classes-global/package.bbclass
>> @@ -565,26 +565,16 @@ def copydebugsources(debugsrcdir, sources, d):
>>          objcopy = d.getVar("OBJCOPY")
>>          workdir = d.getVar("WORKDIR")
>>          sdir = d.getVar("S")
>> -        sparentdir = os.path.dirname(os.path.dirname(sdir))
>> -        sbasedir = os.path.basename(os.path.dirname(sdir)) + "/" + os.path.basename(sdir)
>> -        workparentdir = os.path.dirname(os.path.dirname(workdir))
>> -        workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
>> -
>> -        # If S isnt based on WORKDIR we can infer our sources are located elsewhere,
>> -        # e.g. using externalsrc; use S as base for our dirs
>> -        if workdir in sdir or 'work-shared' in sdir:
>> -            basedir = workbasedir
>> -            parentdir = workparentdir
>> -        else:
>> -            basedir = sbasedir
>> -            parentdir = sparentdir
>> +        cflags = d.expand("${CFLAGS}")
>>
>> -        # If build path exists in sourcefile, it means toolchain did not use
>> -        # -fdebug-prefix-map to compile
>> -        if checkbuildpath(sourcefile, d):
>> -            localsrc_prefix = parentdir + "/"
>> -        else:
>> -            localsrc_prefix = "/usr/src/debug/"
>> +        prefixmap = {}
>> +        for flag in cflags.split():
>> +            if not flag.startswith("-fdebug-prefix-map"):
>> +                continue
>> +            if "recipe-sysroot" in flag:
>> +                continue
>> +            flag = flag.split("=")
>> +            prefixmap[flag[1]] = flag[2]
>>
>>          nosuchdir = []
>>          basepath = dvar
>> @@ -595,28 +585,26 @@ def copydebugsources(debugsrcdir, sources, d):
>>          bb.utils.mkdirhier(basepath)
>>          cpath.updatecache(basepath)
>>
>> -        # Ignore files from the recipe sysroots (target and native)
>> -        processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '((<internal>|<built-in>)$|/.*recipe-sysroot.*/)' | "
>> -        # We need to ignore files that are not actually ours
>> -        # we do this by only paying attention to items from this package
>> -        processdebugsrc += "fgrep -zw '%s' | "
>> -        # Remove prefix in the source paths
>> -        processdebugsrc += "sed 's#%s##g' | "
>> -        processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
>> -
>> -        cmd = processdebugsrc % (sourcefile, basedir, localsrc_prefix, parentdir, dvar, debugsrcdir)
>> -        try:
>> -            subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>> -        except subprocess.CalledProcessError:
>> -            # Can "fail" if internal headers/transient sources are attempted
>> -            pass
>> -
>> -        # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
>> -        # Work around this by manually finding and copying any symbolic links that made it through.
>> -        cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
>> -                (dvar, debugsrcdir, dvar, debugsrcdir, parentdir, dvar, debugsrcdir)
>> -        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>> +        for pmap in prefixmap:
>> +            # Ignore files from the recipe sysroots (target and native)
>> +            cmd =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '((<internal>|<built-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
>> +            # We need to ignore files that are not actually ours
>> +            # we do this by only paying attention to items from this package
>> +            cmd += "fgrep -zw '%s' | " % prefixmap[pmap]
>> +            # Remove prefix in the source paths
>> +            cmd += "sed 's#%s/##g' | " % (prefixmap[pmap])
>> +            cmd += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
>>
>> +            try:
>> +                subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>> +            except subprocess.CalledProcessError:
>> +                # Can "fail" if internal headers/transient sources are attempted
>> +                pass
>> +            # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
>> +            # Work around this by manually finding and copying any symbolic links that made it through.
>> +            cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
>> +                    (dvar, prefixmap[pmap], dvar, prefixmap[pmap], pmap, dvar, prefixmap[pmap])
>> +            subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>>
>>          # debugsources.list may be polluted from the host if we used externalsrc,
>>          # cpio uses copy-pass and may have just created a directory structure
>> --
>> 2.34.1
>>
>>
>>
>>
>
>
> --
> Christopher Larson
> chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
> Principal Software Engineer, Embedded Linux Solutions, Siemens Digital Industries Software
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169463): https://lists.openembedded.org/g/openembedded-core/message/169463
> Mute This Topic: https://lists.openembedded.org/mt/93068145/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

