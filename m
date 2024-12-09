Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49677E77180
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 09:50:51 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.97421.1733737849066244590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 01:50:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VUBTWmV5;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85b83479f45so749635241.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 01:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733737848; x=1734342648; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YxQeN2TnKlMPF4xrfYEslLhu4lW6Qqj+CmMExBnK8g4=;
        b=VUBTWmV5ir8GuY1WmLwLH0UBKXSYYPnTw5sIwHc5ugjDBrYYSo613YYk8jwXx7ccZ8
         qvwqVKTpCPPa0EsTupNAg6pZiHL0/nCHxEAWGQVjB3Q75Vbps9nH0inXUnvqizBI8k/o
         Kqm/dE0R52mWdMUZ9WAbFuGUXQv6b3scKQPJPOnXtLaOkKaxDTxuRNVdY9pljpXVSdI+
         BtCjPusw0ajxsG7R/sNsc2RSSIhmyEXi2axUVlB2BBDd6QPXRuw1+ROBj7Ub/G8o24Jb
         5SQIiw5bF0SXO9lLnLBuk6wzt8h4Jr8vEAWqbUFhXAZ5nGZX6tBWzxc6qSneuAWtwD2a
         OIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733737848; x=1734342648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxQeN2TnKlMPF4xrfYEslLhu4lW6Qqj+CmMExBnK8g4=;
        b=tu7HSOt7hSDUT5QS3ZUM58NiNSXrWmR7Abmi2hXijQTPzb9KaCHF/7z6e79T0sItPM
         u1yttLBUr9uJhOD30nWrP981NxxONSLVn7ngx07Y3cectTaEGZxdGWX1iwWOx3U1IsbP
         UFjboIjmaZ603iDTyop/wcOlHjrcGUwv3IlaOnAXSq1NBfwmWGX7Uy8E6JboUNbu+eGW
         XuklgWxEjeC/vOJthHtu/nd4PHbQuENVV5bBkZD3PCqloT0VPMH//vNtqf0UBQpZaic1
         e3P364UK5Vs5G6/CvBNGWbsGbstoTt478KMSgzpeW5+xf1FF7imtTv7w3RD8KiqWmU7k
         YqpA==
X-Gm-Message-State: AOJu0YzrNx6mdMyg/27v/Em3WsKNzO4rcCGKStENW7zR2VXuxYFzfTMD
	9uqSayCwV0jyQoOM9wXT+cVlQJFAl1JozRq19vE4AKtRWgMBEFGhrctqdzsmnSG7Rib+6JBJMpx
	KA51+pIiWkBLlP0qN6SIldzCZjBKmRw==
X-Gm-Gg: ASbGncu8+F2UW0fETXLAo+wxOxiJp/DNut/VNKhAXbFmtDtWGCRa3a7wRzlN+Zpn0Tw
	Ssl57WOCkgs+jRMnsuC7kGsW+GCFCyAeY4suTPtDxyunLpeLt5GV5dVA5t1auIJsZbQ==
X-Google-Smtp-Source: AGHT+IGaPCzX4eHd/182Ju6w/DX+fmnbC9yYE/xp6Uw9WuF9BeLrIaDITHhu8rGooY2gITEFdiaiuvQU50fnCqtiOa4=
X-Received: by 2002:a05:6102:b05:b0:4ac:fe47:1bcf with SMTP id
 ada2fe7eead31-4afcab15935mr11104998137.24.1733737847921; Mon, 09 Dec 2024
 01:50:47 -0800 (PST)
MIME-Version: 1.0
References: <20241209084142.939432-1-jamin_lin@aspeedtech.com>
 <CANNYZj_i1OCJMUT6oc9fSo0=eb=P+zS8zj=W-aP=aVhOjoekcA@mail.gmail.com> <SI2PR06MB504120C9AFEC4523F1911A21FC3C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
In-Reply-To: <SI2PR06MB504120C9AFEC4523F1911A21FC3C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Dec 2024 10:50:36 +0100
Message-ID: <CANNYZj8W0GnxXJbTGCcOVYeVzp=kiYzKtruqh_m+zwp2wJJffA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1] python3-pyhsslms: Add 2.0.0 recipe
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Troy Lee <troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 09:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208478

Hello,

thanks for the explanation. I'd say it is indeed better placed in
meta-python, can you send a patch to openembedded-devel list?

Also I would recommend testing the module on a target image.
Particularly, it doesn't list any RDEPENDS items, and will likely not
work properly because of it.

Alex

On Mon, 9 Dec 2024 at 10:43, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>
> Hi Alex
>
> I followed this recipe, python3-cryptography.bb and send this patch to place pyhsslms into OpeneEmbedded-Core/meta layer
> https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-devtools/python/python3-cryptography.bb
> I am okay to resend this patch and add this recipe into meta-openembedded/meta-python meta layer.
>
> This python module is used for LMSS algorithm support and it is not a HARDWARE/BOARD specific. This python module use
> Software to sign with LMSS algorithm.
> I tested it in NATIVE build environment with devshell and my tested steps as following.
>
> 1. DEPENDS += "python3-pyhsslms-native" in u-boot_2024.10.bb
> 2. bitbake -c devshell virtual/bootloader
> 3. Add mytest.py and the contents of this file as following.
> ```
> import pyhsslms
>
> priv_key = pyhsslms.HssLmsPrivateKey.genkey('mykey', levels=2)
> priv_key.signFile('myfile.txt')
> ```
> 4. touch myfile.txt
> 5. python3 mytest.py
>
> Then, it created signing file, myfile.txt.sig.
> hexdump myfile.txt.sig
> 00006a0 9ef9 d537 11c0 9766 4116 cc5c cdcc 0669
> 00006b0 f7f6 e20f 4c11 e4d8 fbdc bca5 3037 b4c8
> 00006c0 c8d2 d5f5 1819 ada3 a7b0 ce22 5338 7a54
> 00006d0 bdf6 7e71 8125 756f daba 4a43 13f3 b69c
> 00006e0 e702 040f 8e88 ea79 9ed1 ef48 c135 234c
>
> I refer to this README.md to create this test file to test this python module.
> https://github.com/russhousley/pyhsslms
> https://github.com/russhousley/pyhsslms/blob/master/README.md
>
> Thanks-Jamin
>
> > Subject: Re: [OE-core] [PATCH v1] python3-pyhsslms: Add 2.0.0 recipe
> >
> > Hello,
> >
> > I'd like to better understand the use case for this recipe. What makes it
> > important enough to be included in oe-core, and not, for example, in
> > meta-python under meta-oe? If it is indeed broadly useful, should it have tests
> > that ensure it works?
> >
> > Alex
> >
> > On Mon, 9 Dec 2024 at 09:41, Jamin Lin via lists.openembedded.org
> > <jamin_lin=aspeedtech.com@lists.openembedded.org> wrote:
> > >
> > > This recipe was placed in meta-arm meta layer,
> > > https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-devtools/p
> > > ython/python3-pyhsslms_2.0.0.bb
> > >
> > > However, users may want to build this python module but do not want to
> > > add "meta-arm" layer. To make this recipe more flexible, move this
> > > recipe from meta-arm to OpenEmbedded-Core/meta layer.
> > >
> > > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > > ---
> > >  .../python/python3-pyhsslms_2.0.0.bb               | 14
> > ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >  create mode 100644
> > > meta/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> > >
> > > diff --git a/meta/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> > > b/meta/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> > > new file mode 100644
> > > index 0000000000..b18d1c8e86
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> > > @@ -0,0 +1,14 @@
> > > +SUMMARY = "Pure-Python implementation of HSS/LMS Digital Signatures
> > (RFC 8554)"
> > > +HOMEPAGE ="https://pypi.org/project/pyhsslms"
> > > +LICENSE = "MIT"
> > > +LIC_FILES_CHKSUM =
> > "file://LICENSE.txt;md5=bbc59ef8bf238c2902ca816b87b58571"
> > > +
> > > +inherit python_setuptools_build_meta
> > > +
> > > +# Maintainer refused to upload source to pypi.org, but said he would
> > > +in a future release.  In the meantime, do github SRC_URI =
> > "git:///github.com/russhousley/pyhsslms.git;branch=master;protocol=https"
> > > +SRCREV = "c798728deed6d3f681c9e6bfd7fe8a6705f5638b"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +BBCLASSEXTEND = "native nativesdk"
> > > --
> > > 2.25.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#208475):
> > > https://lists.openembedded.org/g/openembedded-core/message/208475
> > > Mute This Topic: https://lists.openembedded.org/mt/110002797/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > > [alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

