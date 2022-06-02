Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08898C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 14:20:31 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.7024.1654179628591481020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 07:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TDGi2QKH;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id h19so6513094edj.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 07:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IapkJ3AlYeOIT2lwIlQjhNah4HfGtQi9jMBn/S+fyb4=;
        b=TDGi2QKHwBVwW18ExEV1RJTwRsRGlBKb1wLhm/BAztT+LCKTArqhK3oBZnb7PpHyYj
         umZbvywZI+VUJo8/LIE7LDNwYcjZeK4fUQytc5ANCMpE14HGcjaVTJaYrNHu/2LievVF
         lVN06kdS9TtrrR+5gTIvBq1ahvKmuUexGb2ZqdToPaezl0g/VFCRpb2wqFvWt86bW1ot
         5qqQrp7AYKvH0eVOp2ooARJPIjFg8WSHvc/xtpoNjOqUaMSwVWp3ZEkJ05w7KPBiy440
         OcljA/F2tyhidpbG0uwkmxPBjc1NizTBOQDFhpX9X93urQiZEHdjrPZerApLSLCVTQSB
         BTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IapkJ3AlYeOIT2lwIlQjhNah4HfGtQi9jMBn/S+fyb4=;
        b=k8739iiYYG2Xdkm7YW3prr6hMnaBAiqu/Q4rBKUnX606Uh7ay2G5TgHy5Vef81hAVQ
         Cdu6yokiOfXGjoIulqgKB+Voo/V1IDv77OENeHzD1yXVwFLVheumAHfwL1EGWaaU9oyu
         AUgRHsogniTHwq6Mo0ZBLxPqeUibMl0PzYz4VMfUaVYSM3fLGLl6m3sWmC5f9/teyo3/
         l++eWhzuNSLoCDpru8XKMqjgdOVb8efXiIQlwpAE2tPmgz3KpUhb1WNgfW8CpIuBKkPc
         CWTVhJa3NbU96+J4KfTGbOwkdvPHSNbHPr4loyNET9KKpU2ZUlwBe4PYINdQVQoqeN6r
         0G4Q==
X-Gm-Message-State: AOAM533RlSLgN31FDZHYqMDaXzm8OX5VEPP6AbuRT1jKMzN0MnNaD3eW
	WKhroVrmQojIuXHxo03W36bbwqHG3kTlivnDFVqh4g==
X-Google-Smtp-Source: 
 ABdhPJwYsiuCjA4FjgBBuTMy7p+UDf7dJE2r4/7mGdCnhdUy/1tNSoDzF7hKIo5FgS16e5A/E3uqh+/NTWqArNskzMw=
X-Received: by 2002:aa7:dd4e:0:b0:42b:7dbb:3a5b with SMTP id
 o14-20020aa7dd4e000000b0042b7dbb3a5bmr5657016edw.203.1654179626733; Thu, 02
 Jun 2022 07:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
 <CAOSpxdY=WZZfZNAEYQRyVG_jmE0=0_6xAH9fDCALMDjm=K9k6g@mail.gmail.com>
 <CA+chaQfSE-oiUxdSJxqCT-GjUP_KGA4dOvcD49xPqwez=ohhFg@mail.gmail.com>
 <CAOSpxdYXrnJRdc_NghthSexaq_R10h0=JBTfqPTP3TR7PbwGLA@mail.gmail.com>
 <3aea71febbe02c97dabec307ace0c4389d45d913.camel@linuxfoundation.org>
 <CAOSpxdYO+QJV64ugouK+Yw8M3VNKv=War5MQRo3JfT6EY8uLjQ@mail.gmail.com>
 <537cde730f1ed3450554e504141612d854ca4766.camel@linuxfoundation.org>
 <CAOSpxdZByfRQ6OiWXWO2HQwmPUiRAihs06JVTGr-rJnzK21iuw@mail.gmail.com>
 <8c0a4c49572770c7164bc3822acef773e7b382f0.camel@linuxfoundation.org>
In-Reply-To: 
 <8c0a4c49572770c7164bc3822acef773e7b382f0.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 2 Jun 2022 04:20:14 -1000
Message-ID: 
 <CAOSpxdaD41ACXyyqJf6jaG4T7q=_TeHAW=af22Lf=d3irOoLTQ@mail.gmail.com>
Subject: Re: [kirkstone][PATCH 1/2] gcc: Upgrade to 11.3 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-core@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 14:20:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166472

On Wed, Jun 1, 2022 at 10:16 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-06-01 at 07:01 -1000, Steve Sakoman wrote:
> > On Wed, Jun 1, 2022 at 6:32 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2022-06-01 at 06:21 -1000, Steve Sakoman wrote:
> > > > On Wed, Jun 1, 2022 at 6:10 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Wed, 2022-06-01 at 05:29 -1000, Steve Sakoman wrote:
> > > > >
> > > > >
> > > > > Keep in mind that the test uses sstate to compare against so even that
> > > > > isn't a guarantee of identifying the issue.
> > > > >
> > > > > Did you try the strings comparison I suggested? Do you have the file
> > > > > section tables comparison (diff) I could look at?
> > > >
> > > > Are you referring to the section header info from objdump -h ?
> > > >
> > > > If so I've attached the a/b info, they are quite compact.
> > >
> > > Yes, I couldn't remember the option to objdump offhand. The diff looks
> > > like:
> > >
> > > --- /tmp/headersa.txt   2022-06-01 17:22:57.272277627 +0100
> > > +++ /tmp/headersb.txt   2022-06-01 17:22:43.972218408 +0100
> > > @@ -1,5 +1,5 @@
> > >
> > > -a/usr/lib/libwebkit2gtk-4.0.so.37.56.5:     file format elf64-x86-64
> > > +b/usr/lib/libwebkit2gtk-4.0.so.37.56.5:     file format elf64-x86-64
> > >
> > >  Sections:
> > >  Idx Name          Size      VMA               LMA               File off  Algn
> > > @@ -63,15 +63,15 @@
> > >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > >   29 .debug_abbrev 00c6ce64  0000000000000000  0000000000000000  921c9968  2**0
> > >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > > - 30 .debug_line   09025ee1  0000000000000000  0000000000000000  92e367cc  2**0
> > > + 30 .debug_line   09025ede  0000000000000000  0000000000000000  92e367cc  2**0
> > >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > > - 31 .debug_str    1820ba50  0000000000000000  0000000000000000  9be5c6ad  2**0
> > > + 31 .debug_str    1820ba50  0000000000000000  0000000000000000  9be5c6aa  2**0
> > >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > > - 32 .debug_line_str 0005d9f4  0000000000000000  0000000000000000  b40680fd  2**0
> > > + 32 .debug_line_str 0005d9f4  0000000000000000  0000000000000000  b40680fa  2**0
> > >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > > - 33 .debug_loclists 13d74aa2  0000000000000000  0000000000000000  b40c5af1  2**0
> > > + 33 .debug_loclists 13d74aa0  0000000000000000  0000000000000000  b40c5aee  2**0
> > >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > > - 34 .debug_rnglists 034c6c08  0000000000000000  0000000000000000  c7e3a593  2**0
> > > + 34 .debug_rnglists 034c6bf6  0000000000000000  0000000000000000  c7e3a58e  2**0
> > >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > > - 35 .gnu_debuglink 00000024  0000000000000000  0000000000000000  cb30119c  2**2
> > > + 35 .gnu_debuglink 00000024  0000000000000000  0000000000000000  cb301184  2**2
> > >                    CONTENTS, READONLY
> > >
> > > I'm a bit puzzled since usually the debug symbols are moved off to the
> > > -dbg package and yet they seem combined here with the library. What the
> > > above seems to say is that the debug_line, loclists and rnglists
> > > sections changed size, the rest changed offset (and we ignore
> > > gnu_debuglink since that is a checksum which would depend on the other
> > > bits).
> > >
> > > That would imply that some piece of code used to compile webkit has
> > > different line numbering on one system compared to another but
> > > generates identical code. You should be able to parse the debuginfo to
> > > get a filename and linenumber out of it but I can't remember how, I
> > > think I learnt to read dwarfish last time I did this :/.
> >
> > I did a dump of the debug sections with objdump -g and got absolutely
> > huge output files that crashed all of the diff programs I tried.
> >
> > I guess the next step is to split those files into smaller chunks and
> > diff those :-(
> >
> > Have I mentioned how much I hate webkit-gtk?
>
> Steve ran readelf against them and found there were some differences
> with the _ZZN7WebCore11CSSProperty symbol. A grep on a build directory
> shows:
>
> tmp/work/core2-64-poky-linux/webkitgtk/2.36.1-r0$ grep WebCore11CSSProperty build webkitgtk-2.36.1 -R
> grep: build/lib/libWebCoreGTK.a: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-2f84417a-14.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-2f84417a-17.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-84c9f43f-5.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-26ec8d00-4.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-2f84417a-7.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-950a39b6-5.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-a6b8b600-2.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-26ec8d00-2.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-8feba646-7.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-26ec8d00-5.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-043dd90b-14.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-950a39b6-14.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-2f84417a-16.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-2f84417a-10.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-950a39b6-7.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-2f84417a-1.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-26ec8d00-3.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-043dd90b-22.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/unified-sources/UnifiedSource-f34946be-2.cpp.o: binary file matches
> grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSources/CSSPropertyNames.cpp.o: binary file matches
> grep: build/Source/WebKit/CMakeFiles/WebKit.dir/__/__/DerivedSources/WebKit/unified-sources/UnifiedSource-50d0d8dd-6.cpp.o.d: No such file or directory
>
> which fills me with dread since I worry it may be changing the output
> depending on the order it is linking these in. Just a guess but...

And of course now I'm not able to get this to reproduce.  I tried
twice in the hopes of grabbing the source trees from A/B builds so I
could compare them, but no joy.

I'm beginning to suspect that this really isn't related to the gcc
11.3 version bump.

Steve

