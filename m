Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0F0C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 19:02:35 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.5156.1743793348759584994
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 12:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WoYww5fF;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e41e17645dso26500096d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 12:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743793348; x=1744398148; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cHzvaVK0NuclqRQLcDtTGdUEkK2vNVmYr/EJkTfUvu4=;
        b=WoYww5fFAwmiYi1xlu1n02qaBWWQThiM+U7wFUW7mD1wYGyDUnTpQlw10hM4hC44zu
         W3Mqt6Rh5tq5KIH1botLSbjndaaGRM1pf186ViRVl8llA+8OGu1GPXieqGEAWn3MxZuC
         /xcEvln4xS8aby5rqVQEDmYkHswIbU4mz+HeDwrgjGgTnDVuEaEdijUhABub9IUKW/Ae
         OEiEg1X0gBT2nBdoDHUwqP6g6fBBud3f4+sqUnEI/Pap5nTWYnndeD43pWL7VW+1pz6Y
         OGl+nsJQu9H8YKowTuEe3NJWzfes0eqdWwmDLRuOrsDmb+XR0yOVscJhqoUBM/zINkjh
         8u+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743793348; x=1744398148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHzvaVK0NuclqRQLcDtTGdUEkK2vNVmYr/EJkTfUvu4=;
        b=flH2X/BBxbi3T8dJWNimrtkdGz6XVwcMhnhHe18J6Ou2I91l9/rvOypeKg7/n8OVa9
         G3Df7JY5o1SaVek8x4zVuloS0ZKg5SUhL7kKd/us/hLVckgk02dCSa+bDnPFRKSpNRnH
         RhAfiSMHdvqmEpuWWPOorbcxE/SYA1jhpWsvH+j47z3zFpyU0ntyDGVEAGqA981nqj7a
         fde9OfrYlFMuQw+cebef73U7MZioMV5ULIc+cxz5ZFveaCmjhosp+pXyRtGXQnugQfQa
         2gaaEp0FMCOLVTYdN4w4/E5gUL/ruOsiXT799Las3sYY28q0gLwKUCs0hnQprf1z88An
         gt3A==
X-Forwarded-Encrypted: i=1; AJvYcCWLPtcnEILtrmdXcZqzxeAH/uMoc8iOhoJUqo5JoRrQHMJQGQlh/80FwRnoigQmvIuCieS8CI20ty96SRDZF8KeaQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyaeCQImQmbIyV2zuztcfCs09WNbZ2/+ME7EZnlhkBJ/lSLofOB
	Asa8qvNQbWzSA4KbavNilZkfw896VQuATq2MsY8Bv9OES/a8Epj7Rb3pC04n2Di/E82c/be1vWK
	1HJkI1RZs3d15QsgymkEn6qvzkqA=
X-Gm-Gg: ASbGncuej/S8M7P8QwysDJc4w6lRrXRRY81EN2WeUSYjhY3/Ag7nMYrFzyW85ihjonx
	Q/o52d8c2Miv5/bo/s4Az7v89Blid0MCR/0+J0SmGvqVhxi7z9J0LxuppiTDCT47o6yOtwrDDWi
	6YoZpUGzGnN07AxELCMEN+zBHw/xL0cDhX2ypXeAAdktOh9ss1UsDB1aE7bKzK
X-Google-Smtp-Source: AGHT+IEiReWJQbuHg8E0SEUlhy2AeGFkOu74QYEu40QXdFPjhBQGjMKKX2v3G9nZg566zHK0ftfGaBPyHUD4apZHB7A=
X-Received: by 2002:a05:6214:19cd:b0:6e8:f905:aff0 with SMTP id
 6a1803df08f44-6f064ac328bmr66294346d6.35.1743793347866; Fri, 04 Apr 2025
 12:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com> <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
 <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org>
 <FR3P281MB1917204FF59FC089654B5FCFB6A72@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <18300D8D696CD25C.32743@lists.openembedded.org> <CANNYZj8tqi5tnomg7t5k9iGHj_xCszmC6nCYfKmgh=yToiM9aQ@mail.gmail.com>
 <FR3P281MB1917CC7FE52D22DAF61020FAB6A62@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj_E+01hDV3hF=9AjPnEZTfmLCAwav203=XS7Y8sZquRuQ@mail.gmail.com> <FR3P281MB1917B56C58FEF4BC1FCEC291B6A92@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <FR3P281MB1917B56C58FEF4BC1FCEC291B6A92@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Apr 2025 21:02:15 +0200
X-Gm-Features: ATxdqUHg21F7SI3zNOhUiAfuS4XCkjfRki-nm2GK8UAtI-uBSebsFXxWUe_I7Fo
Message-ID: <CANNYZj8hp_OCYz3ZYSHg2GdO8QiE6LAxLVmz6k_U=ZdY8UAkrw@mail.gmail.com>
Subject: Re: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
To: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 19:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214366

On Fri, 4 Apr 2025 at 17:14, Mario Schuknecht
<Mario.Schuknecht@iris-sensing.com> wrote:
> I have found out the following:
>
> After applying the libgpg-error patch, the gnupg deb-packages are not rebuilt.
>
> My guess is that the gnupg recipe is missing a dependency on libgpg-error.
> However, gnupg uses the shared library from libgpg-error, so this dependency
> is necessary.
>
> That the gnupg built has been successful so far is probably due to the fact that
> gnupg depends on libgcrypt and libgcrypt depends on libgpg-error. As a
> result, libgpg-error was available in the recipe-sysroot directory of gnugp.
>
> libgpg-error should be added to gnupg's DEPENDS variable. Then the
> libgpg-error patch will work correctly.
>
> If this analysis is confirmed:
> Should I create a separate patch to add the dependency?
> Alternatively, someone else could do this and then the libgpg-error patch
> could be used unchanged.

Unfortunately this is not correct. DEPENDS has no relevance for
package dependencies; those are set either from RDEPENDS, or from
auto-discovery of shared library dependencies (this is done in
do_package by inspecting the binaries). Then there's code that maps
those shared library dependencies to packages that contain them.
That's why I asked you to look into packaging metadata, and I can only
repeat that:

If you have a bit of time, I'd appreciate if you narrrow it down:
inspect the metadata of the .deb packages: gnupg, and then gpg-error,
before and after the change. In other words, is the problem with apt,
or with not repackaging   gnupg properly? How does it compare to when
using rpm?

Alex

