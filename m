Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06715C433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 18:01:07 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.15125.1637863266178670959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 10:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PQigvDil;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id r25so28742682edq.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 10:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fM/ZFQEmEAow6PreniQqswChqVLdsIx3zh/aLSU9V74=;
        b=PQigvDilLdDlYHCiVYSrnaWXDYBjgrOasqkD7OA1VkE8VwFYkv0+nGrMoxZzk5LxOT
         6NJLFhATSNc/s4UAJUGM224yisip2HkFumNwYDS812KKhoEAlJANpjKVc02ZMiINoQU1
         6d7jrqoIoTqOYpxmMSAFLD5U0EYuHJ8qJkclicLdfbZit2nf7GnYJ59LeebnBGAqci7W
         18pA5tafkt7hELHNoMBJIe2XZiKNmpTKYfgn9fLn7aofRapweyqsBhW4Q5ibawSAiusR
         ALz8bPEQu/ZC25hZhJmgWi3u8y5rLDHRAkiRhQ5lYc5ora9l85h5bl3l9780wuw+ZjSA
         CDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fM/ZFQEmEAow6PreniQqswChqVLdsIx3zh/aLSU9V74=;
        b=ETSOfB/R24xgNyfNKbwaD3A69OTj1j2MMechHlSMFn3ohGNxvxVEo2iOM1YKQ6f6cX
         VXr+rmX7+uKUfHBTAxX7SuQ6WwRfRcpDGmBKfltXrX/dRz5kdQpiYdIN//UeZ1mxElu3
         faXDjVNbnyX4Rk0oHWuRVYvuDpv/o/8j6qyKIL3/uVPNiIN3tlpZqIWUMuJOMgnnukBW
         oiOcoHlokD57QjoObKQVqfvHAGJouSfoSzhu6Zkr2TSd69swMbsEg8Ky/8tdXcXJGRf4
         KtoGDbBWyxSBwkPNm9TQ/4lAUxki/xfEfCkK1bJtqZAzTDUdELKPHZ+YpqNB/Bm1ROfQ
         0kmA==
X-Gm-Message-State: AOAM533DoOO0g1gBj+UgxfkefjUAD/uzVXNc4T8N2DO54HhEFzwb90EH
	QGytQLQrbnwJgk3R1BmwPoczmOI46Z4pDjDXlQI=
X-Google-Smtp-Source: 
 ABdhPJzg1lqIS1FEeIrYB8Vxm81uP9YhgPyLF59+iWDTk6OA9jXRhCLYvIwl1m5GcssJurGaW3qnyBUSn+SJ399eaqA=
X-Received: by 2002:a17:907:1689:: with SMTP id
 hc9mr32791404ejc.445.1637863264300;
 Thu, 25 Nov 2021 10:01:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
 <c653e0c3cd0edd038b3c3a2d9df442d2fe5ea745.1637788184.git.bruce.ashfield@gmail.com>
 <CAMKF1sqXFdQCtOHcc36CZgfoxwL0ASFeU2PyWW7LiD22drJVLA@mail.gmail.com>
 <CADkTA4PpHJJ_QRq=5PC_fctLGt5yyLANwiP9bKcJz1T_OtqH-g@mail.gmail.com>
 <a31990ed-7583-e8d5-efe9-a22172aa5d0d@gmail.com>
In-Reply-To: <a31990ed-7583-e8d5-efe9-a22172aa5d0d@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Nov 2021 13:00:53 -0500
Message-ID: 
 <CADkTA4NKNK2hY0Zca_=giGJtN+M4TEf4eEWfrtxFwfo=ksSCvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/20] python: introduce python3-dtschema
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Tim Orling <TicoTimo@gmail.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 18:01:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158794

On Thu, Nov 25, 2021 at 12:53 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 11/25/21 9:51 AM, Bruce Ashfield wrote:
> > On Thu, Nov 25, 2021 at 12:36 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> fails to build for me
> >>
> >> https://errors.yoctoproject.org/Errors/Details/618010/
> >
> > It was updated in-branch with fixups.  The version in this patch is
> > known to break on a target build.
>
> thanks, my grinder runs slowly since it builds a lot of stuff, so it
> gets to errors a bit late :). Are these fixes already in master-next now ?

Yup,

Richard picked up the fix after I noticed the failure in my AB run, I see the

DEPENDS += "python3-setuptools-scm-native"

In the master-next version, which was the fix for the target build issue.

Bruce

>
> >
> > Bruce
> >
> >>
> >> On Wed, Nov 24, 2021 at 1:14 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>>
> >>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>
> >>> kernel commit 53182e81f47d [kbuild: Enable DT schema checks for %.dtb
> >>> targets], which is part of v5.16+, makes the checking of dtb schemas
> >>> manditory.
> >>>
> >>> To support the checking, we introduce this new recipe dtschema.
> >>>
> >>> Dependencies will be imported in subsequent commits, so we can
> >>> track the dependency need on a per-import basis.
> >>>
> >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>> ---
> >>>   .../python/python3-dtschema_2021.10.bb           | 16 ++++++++++++++++
> >>>   1 file changed, 16 insertions(+)
> >>>   create mode 100644 meta/recipes-devtools/python/python3-dtschema_2021.10.bb
> >>>
> >>> diff --git a/meta/recipes-devtools/python/python3-dtschema_2021.10.bb b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
> >>> new file mode 100644
> >>> index 0000000000..f16232d610
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
> >>> @@ -0,0 +1,16 @@
> >>> +DESCRIPTION = "Tooling for devicetree validation using YAML and jsonschema"
> >>> +HOMEPAGE = "https://github.com/devicetree-org/dt-schema"
> >>> +LICENSE = "BSD-2-Clause"
> >>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=457495c8fa03540db4a576bf7869e811"
> >>> +
> >>> +inherit pypi setuptools3
> >>> +
> >>> +PYPI_PACKAGE = "dtschema"
> >>> +
> >>> +SRC_URI[md5sum] = "d2f0d847ba2ad4d223317ef7304342b0"
> >>> +SRC_URI[sha256sum] = "d09c94d13f46e6674ba11ff31220651ad1b02dae860f5a87905dfac6b8d768d9"
> >>> +
> >>> +DEPENDS += "python3-setuptools-scm"
> >>> +RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
> >>> +
> >>> +BBCLASSEXTEND = "native nativesdk"
> >>> --
> >>> 2.19.1
> >>>
> >>>
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#158749): https://lists.openembedded.org/g/openembedded-core/message/158749
> >>> Mute This Topic: https://lists.openembedded.org/mt/87290455/1997914
> >>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>
> >
> >
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

