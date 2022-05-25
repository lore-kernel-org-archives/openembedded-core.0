Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7980C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 17:40:27 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.10005.1653500420075854352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 10:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fcUDKqgn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id e28so30482892wra.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 10:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=kwgMK6ICI9RAp9rdqR/Wy/o9U+hXh70ztiSWXdFVecs=;
        b=fcUDKqgnMcuBa7tsIFcwec1cpVKxm4ckxDwNCU1HE0mj+rfjbj34P6LlwbYkZFaDFM
         hTBfJSJcsqkdqQ4/j/1hX7g7w9IO/GURYv+7Qn9/xo9ehBNy3xDbP54h6x06cJigEYee
         7v/8lVmdZezmI1UkNU0oCctAppgtNUpdLJM2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=kwgMK6ICI9RAp9rdqR/Wy/o9U+hXh70ztiSWXdFVecs=;
        b=rVTUm6dRIvyWgEEAf6vB1pvLih2lPuS+4K+79QFh1krt6xOC+ye/UbPQHx01mAitRH
         //6QSkBW3X0CDlW7MC3dee1RTi7mdiBaMX4zR3KVKbzYvH77HBHcMwPptuVWU3/Heych
         fszJRFc2bnF8pEw8/e4t7opWgykqY+1djVaAfuufZe4kotBEhKWsmaiX9N31jXlWSZBs
         rluQv3UatnqyGLe2pzLuk9ksVTZyuCTRqK0GyAGhfXM5Kod0I3DWAsdSapd8+TGWzL1F
         yP298w17JtieqECZ0w2Ynrmal+cQoWKoud1mP1jN70K0POU100QpJeqGCyG72XzIVZrx
         dbmA==
X-Gm-Message-State: AOAM530gLp+Tv3qJeR/FHhZt3L9d+QiehuAsEBnnnqRGEoChZM72KWf8
	hlchHYFP6qny8bKI27nsNvj7+A==
X-Google-Smtp-Source: 
 ABdhPJxAWuiZ7R1qzP+DMdbcXt+nhZTe/IKDySU8iPW3wQS+uXS45vboknzIqu48uMljPUgprrDYWw==
X-Received: by 2002:a05:6000:1f19:b0:20f:ff31:7f38 with SMTP id
 bv25-20020a0560001f1900b0020fff317f38mr3459022wrb.496.1653500418497;
        Wed, 25 May 2022 10:40:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:e02b:90d6:3f52?
 ([2001:8b0:aba:5f3c:5808:e02b:90d6:3f52])
        by smtp.gmail.com with ESMTPSA id
 t22-20020a1c7716000000b00397381a7ae8sm2298394wmi.30.2022.05.25.10.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 10:40:17 -0700 (PDT)
Message-ID: 
 <635be3636274a9d981eb585c140c2dd9c5c30284.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] go.bbclass: fix path to linker in native Go
 builds
From: richard.purdie@linuxfoundation.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Dmitry Baryshkov
	 <dbaryshkov@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2022 18:40:16 +0100
In-Reply-To: <413d68f9-34e0-708f-5f81-a1673d918279@linaro.org>
References: <20220525162035.808477-1-dmitry.baryshkov@linaro.org>
	 <2178df0a12a6f5cb7723a26bda7fc42cbc6e9c71.camel@linuxfoundation.org>
	 <413d68f9-34e0-708f-5f81-a1673d918279@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 17:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166158

On Wed, 2022-05-25 at 20:28 +0300, Dmitry Baryshkov wrote:
> On 25/05/2022 20:15, richard.purdie@linuxfoundation.org wrote:
> > On Wed, 2022-05-25 at 19:20 +0300, Dmitry Baryshkov wrote:
> > > Building native Go tools results in the tool pointing to the wrong
> > > location of dynamic linker (see below). The linker is looked up in th=
e
> > > temporary dir, which can be removed if rm_work is inherited. This
> > > results in being unable to execute the program with the 'No such file=
 or
> > > directory' error. Override linker specificiation for native recipes (=
and
> > > let Go build environment to pick up a correct one on it's own).
> > >=20
> > > Without this patch:
> > >=20
> > > $ ldd tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/b=
in/go-md2man
> > > 	linux-vdso.so.1 (0x00007ffe945ec000)
> > > 	libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f3a7490e000)
> > > 	/home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/x86_64-linux/g=
o-md2man-native/1.0.10+gitAUTOINC+f79a8a8ca6-r0/recipe-sysroot-native/usr/l=
ib/ld-linux-x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x00007f3a74d1300=
0)
> > > $ tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/g=
o-md2man  --help
> > > -bash: tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/=
bin/go-md2man: No such file or directory
> > >=20
> > > With the patch
> > >=20
> > > $ ldd tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/b=
in/go-md2man
> > > 	linux-vdso.so.1 (0x00007ffd19dbf000)
> > > 	libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f2d44181000)
> > > 	/lib64/ld-linux-x86-64.so.2 (0x00007f2d44586000)
> > > $ tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/g=
o-md2man  --help
> > > Usage of tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/us=
r/bin/go-md2man:
> > >    -in string
> > > 	Path to file to be processed (default: stdin)
> > >    -out string
> > > 	Path to output processed file (default: stdout)
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   meta/classes/go.bbclass | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > This is definitely not the correct fix. It should be pointing at the
> > uninative binaries, not the host system one.
>=20
> If uninative is enabled, installed binaries will be patched automatically=
:
>=20
> $ ldd=20
> tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2m=
an
> 	linux-vdso.so.1 (0x00007fff4a3ef000)
> 	libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f86998a9000)
> 	/home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/sysroots-uninative/x86_=
64-linux/lib/ld-linux-x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x00007=
f8699caf000)
>=20
> However I can make this more explicit by using UNINATIVE_LOADER in=20
> go.bbclass. Is that what you'd like to?

Were you using this without uninative when you sent the patch which is
why it was breaking?

I'd like to understand which scenarios you're testing.

Patching to the uninative loader would in some ways would be better but
would break the non-uninative use case so this does get tricky.

Cheers,

Richard



