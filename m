Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFD4C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 14:56:25 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.25297.1709650581902451632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 06:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GcsEGZla;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-47268928105so160593137.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 06:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709650581; x=1710255381; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NTI/RlkegXhMs+D5jFkY7vU2TtW+tMiMOxZKBWAk/pw=;
        b=GcsEGZla8xSpsP5C8UFvhW0rClVyRe4b/rzq7IfB89z4U4tLFZZuibWoaBrDWutv6Y
         CofbwfKrZFUVes861ATfGT4ZJhwb1Exk6T8o3AGfgb7Np/uZvA68UIjbyMgdOC/n9Now
         UvpiRnf+BBtz9Gx6LpA2lbm+wJ4G/kzA5OE+cfWk5JUmG+FM1bhKUp0ENyP/qGV6fE7c
         CT9Mxjj6LB716H8B3wCL8HfxNiK8mXuBaeVtWgW1zuyDENxmGEMqcFvXlUTk9ToDKVdM
         DQ3fAdVXyfgYGy8CZjIzLuwjGTpxDVCJBhbuVBmkMYiuILv64iVqQAPF/0e3c1yw5sJb
         wrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709650581; x=1710255381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTI/RlkegXhMs+D5jFkY7vU2TtW+tMiMOxZKBWAk/pw=;
        b=DGuix3jYoNpkvkEcwwMLx7h9Sokygz5HPZHvYAHvmxoenMMQ8PDfR7fpxPnPLy3pke
         3scM6/Ca5vpmkqDKdNnP99HXaqZpS+Z3amd93sxWMFEVfeaHekCEQxM0j+hhfxSgYn2X
         BnH379aKOJaNQkKmuR7VO5AI2DcpsQp0FtHQveYc3utnDe8tewySVFWKuco/CzmAbVbM
         8SxDr6jKAh72Br+4Xhcboq4tQX9EBkKDdMRRj007ZOtVQ7KSWtwrYLoPaguDHk9cLjLZ
         69StVou5hifBpwbfBqtLZhn2/YdsFrOXEq5ho1WUw6Zf7rM2FW8S6AuSszEwj3bZ9dBd
         FeSg==
X-Gm-Message-State: AOJu0YynzcXnlIUNYME9os5MWL0BUqK3v7qUKB9Hi63PMsSv8yLte8YD
	qcf3om64kypBc/FEkGAJyS8CDPoveD6TTxRx4BJZeau29IxVN/Ms+gRVxUfmmE2W7yFwPsqZ5i4
	unwLd7WoCMwmOgtUJRn00CcTYbg8=
X-Google-Smtp-Source: AGHT+IFM76bz/5u/wGRDNJSHmpdHfazecwLh5WYrkC7LYUW846IWhER3yCPyMOrarmdjuu2GszHU3oKv2UnLnyLO90o=
X-Received: by 2002:a05:6102:304c:b0:470:6fe6:5a08 with SMTP id
 w12-20020a056102304c00b004706fe65a08mr2452509vsa.34.1709650580714; Tue, 05
 Mar 2024 06:56:20 -0800 (PST)
MIME-Version: 1.0
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
 <20240228183011.1495807-6-jose.quaresma@foundries.io> <17B89B4F303DC3DB.30419@lists.openembedded.org>
 <7fb48d27acb136ee014d8e0bcd7c56e79657bd55.camel@linuxfoundation.org>
In-Reply-To: <7fb48d27acb136ee014d8e0bcd7c56e79657bd55.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 5 Mar 2024 14:56:09 +0000
Message-ID: <CANPvuRm2v5r_Afv_oNGdpCn4LMdDCRnWSm7aGZF=4qrpJ_LQ4A@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH v2 6/7] go: upgrade 1.21.5 -> 1.21.7
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000008dcd430612eb0b06"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 14:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196635

--0000000000008dcd430612eb0b06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (domingo,
3/03/2024 =C3=A0(s) 16:31):

> On Fri, 2024-03-01 at 09:53 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2024-02-28 at 18:30 +0000, Jose Quaresma wrote:
> > > Upgrade to latest 1.21.x release [1]:
> > >
> > > $ git --no-pager log --oneline go1.21.5..go1.21.7
> > > f29208030a (tag: go1.21.7) [release-branch.go1.21] go1.21.7
> > > 2fdad8af6d [release-branch.go1.21] cmd/internal/obj/arm64: fix
> > > frame pointer restore in epilogue
> > > 01c93ad049 [release-branch.go1.21] cmd/go/internal/generate: call
> > > modload.InitWorkFile
> > > db74bfba18 [release-branch.go1.21] Revert "crypto/internal/boring:
> > > upgrade module to fips-20220613" +1
> > > 916e6cddf1 [release-branch.go1.21] runtime: fix Pinner.Pin
> > > documentation
> > > 6552f3d4ac [release-branch.go1.21] cmd/go/internal/toolchain: apply
> > > the -modcacherw flag when downloading a module to determine what
> > > toolchain it needs
> > > 3960318b87 [release-branch.go1.21] crypto/x509: properly gate test
> > > on macos version
> > > 00f974eb1f [release-branch.go1.21] go/types, types2: don't lose
> > > position info of interface embeddings
> > > 2f91c16e68 [release-branch.go1.21] runtime: properly model rwmutex
> > > in lock ranking
> > > 2540b1436f [release-branch.go1.21] slices: explicitly discard
> > > results of some functions
> > > 7e34c4308f [release-branch.go1.21] runtime: clear g0 stack bounds
> > > in dropm
> > > 491c1e7e95 [release-branch.go1.21] runtime: allow update of system
> > > stack bounds on callback from C thread
> > > caafb50c0d [release-branch.go1.21] runtime: don't print "unexpected
> > > SPWRITE" when printing traceback
> > > cc85462b3d (tag: go1.21.6) [release-branch.go1.21] go1.21.6
> > > d2cb140194 [release-branch.go1.21] crypto/tls: align FIPS-only mode
> > > with BoringSSL policy
> > > 368e2a9461 [release-branch.go1.21] crypto/internal/boring: upgrade
> > > module to fips-20220613
> > > 8c6078adfb [release-branch.go1.21] runtime: add race annotations in
> > > IncNonDefault
> > > f6b203c828 [release-branch.go1.21] maps: fix aliasing problems with
> > > Clone
> > > 43818206dc [release-branch.go1.21] runtime: put ReadMemStats debug
> > > assertions behind a double-check mode
> > > cf65d74bc5 [release-branch.go1.21] runtime: add the disablethp
> > > GODEBUG setting
> > > ad1ec60a5b [release-branch.go1.21] runtime/pprof: fix generics
> > > function names
> > > bbab863ada [release-branch.go1.21] os/signal: skip nohup tests on
> > > darwin builders
> > > 7dc67e8f29 [release-branch.go1.21] os/signal: remove go t.Run from
> > > TestNohup
> > > 9f8b3ac8c4 [release-branch.go1.21] cmd/compile: fix escape analysis
> > > of string min/max
> > > 8c840b10d0 [release-branch.go1.21] cmd/compile: fix memcombine pass
> > > for big endian, > 1 byte elements
> > >
> > > [1] https://github.com/golang/go/compare/go1.21.5...go1.21.7
> > >
> > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > > ---
> > >  meta/recipes-devtools/go/{go-1.21.5.inc =3D> go-1.21.7.inc} | 2 +-
> > >  ...binary-native_1.21.5.bb =3D> go-binary-native_1.21.7.bb} | 6 +++-
> > > --
> > >  ...oss-canadian_1.21.5.bb =3D> go-cross-canadian_1.21.7.bb} | 0
> > >  .../go/{go-cross_1.21.5.bb =3D> go-cross_1.21.7.bb}         | 0
> > >  .../go/{go-crosssdk_1.21.5.bb =3D> go-crosssdk_1.21.7.bb}   | 0
> > >  .../go/{go-native_1.21.5.bb =3D> go-native_1.21.7.bb}       | 0
> > >  .../go/{go-runtime_1.21.5.bb =3D> go-runtime_1.21.7.bb}     | 0
> > >  ...go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch | 2 +-
> > >  .../go/go/0003-ld-add-soname-to-shareable-objects.patch   | 8
> > > ++++----
> > >  meta/recipes-devtools/go/{go_1.21.5.bb =3D> go_1.21.7.bb}   | 0
> > >  10 files changed, 9 insertions(+), 9 deletions(-)
> > >  rename meta/recipes-devtools/go/{go-1.21.5.inc =3D> go-1.21.7.inc}
> > > (89%)
> > >  rename meta/recipes-devtools/go/{go-binary-native_1.21.5.bb =3D> go-
> > > binary-native_1.21.7.bb} (78%)
> > >  rename meta/recipes-devtools/go/{go-cross-canadian_1.21.5.bb =3D>
> > > go-cross-canadian_1.21.7.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-cross_1.21.5.bb =3D> go-
> > > cross_1.21.7.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-crosssdk_1.21.5.bb =3D> go-
> > > crosssdk_1.21.7.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-native_1.21.5.bb =3D> go-
> > > native_1.21.7.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-runtime_1.21.5.bb =3D> go-
> > > runtime_1.21.7.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go_1.21.5.bb =3D> go_1.21.7.bb}
> > > (100%)
> > >
> > > diff --git a/meta/recipes-devtools/go/go-1.21.5.inc b/meta/recipes-
> > > devtools/go/go-1.21.7.inc
> > > similarity index 89%
> > > rename from meta/recipes-devtools/go/go-1.21.5.inc
> > > rename to meta/recipes-devtools/go/go-1.21.7.inc
> > > index f009ea77c7..6de24e1e22 100644
> > > --- a/meta/recipes-devtools/go/go-1.21.5.inc
> > > +++ b/meta/recipes-devtools/go/go-1.21.7.inc
> > > @@ -15,4 +15,4 @@ SRC_URI +=3D "\
> > >
> > > file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patc=
h
> > >  \
> > >
> > > file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
> > >  "
> > > -SRC_URI[main.sha256sum] =3D
> > > "285cbbdf4b6e6e62ed58f370f3f6d8c30825d6e56c5853c66d3c23bcdb09db19"
> > > +SRC_URI[main.sha256sum] =3D
> > > "00197ab20f33813832bff62fd93cca1c42a08cc689a32a6672ca49591959bff6"
> > > diff --git a/meta/recipes-devtools/go/go-binary-native_1.21.5.bb
> > > b/meta/recipes-devtools/go/go-binary-native_1.21.7.bb
> > > similarity index 78%
> > > rename from meta/recipes-devtools/go/go-binary-native_1.21.5.bb
> > > rename to meta/recipes-devtools/go/go-binary-native_1.21.7.bb
> > > index cc79a277ff..d8826e20f1 100644
> > > --- a/meta/recipes-devtools/go/go-binary-native_1.21.5.bb
> > > +++ b/meta/recipes-devtools/go/go-binary-native_1.21.7.bb
> > > @@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
> > >
> > >  # Checksums available at https://go.dev/dl/
> > >  SRC_URI =3D
> > > "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar
> > > .gz;name=3Dgo_${BUILD_GOTUPLE}"
> > > -SRC_URI[go_linux_amd64.sha256sum] =3D
> > > "e2bc0b3e4b64111ec117295c088bde5f00eeed1567999ff77bc859d7df70078e"
> > > -SRC_URI[go_linux_arm64.sha256sum] =3D
> > > "841cced7ecda9b2014f139f5bab5ae31785f35399f236b8b3e75dff2a2978d96"
> > > -SRC_URI[go_linux_ppc64le.sha256sum] =3D
> > > "1f6dd06aa34f292f33c2c70ea9b4456e3a9e5cbd1d99968f3f463a4805b40ece"
> > > +SRC_URI[go_linux_amd64.sha256sum] =3D
> > > "13b76a9b2a26823e53062fa841b07087d48ae2ef2936445dc34c4ae03293702c"
> > > +SRC_URI[go_linux_arm64.sha256sum] =3D
> > > "24744edcaeb827aafb76c67ebd406b5ae13291023b0ad9f061dd7a0e75b275ba"
> > > +SRC_URI[go_linux_ppc64le.sha256sum] =3D
> > > "48a99ecce9b1e632870c29420088f61cf17a6f0c5bdb3cc821ff5c00e14b1a8a"
> > >
> >
> > I checked and for some reason, some of these checksums aren't correct
> > in this or the previous patch. I'll try fixing them up locally.
>
> With the checksums fixed, 1.21 seemed to pass enough to merge. There
> were some meta-oe recipes which failed.
>

I did this minor bump a bit in a hurry and let it go.
My tests were all carried out using an amd64 host and that's why I didn't
see the others.

Sorry for this and thanks for fixing.

Jose


>
> 1.22 still has further issues blocking it.
>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000008dcd430612eb0b06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxf=
oundation.org</a>&gt; escreveu (domingo, 3/03/2024 =C3=A0(s) 16:31):<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2024-03-01 at =
09:53 +0000, Richard Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Wed, 2024-02-28 at 18:30 +0000, Jose Quaresma wrote:<br>
&gt; &gt; Upgrade to latest 1.21.x release [1]:<br>
&gt; &gt; <br>
&gt; &gt; $ git --no-pager log --oneline go1.21.5..go1.21.7<br>
&gt; &gt; f29208030a (tag: go1.21.7) [release-branch.go1.21] go1.21.7<br>
&gt; &gt; 2fdad8af6d [release-branch.go1.21] cmd/internal/obj/arm64: fix<br=
>
&gt; &gt; frame pointer restore in epilogue<br>
&gt; &gt; 01c93ad049 [release-branch.go1.21] cmd/go/internal/generate: call=
<br>
&gt; &gt; modload.InitWorkFile<br>
&gt; &gt; db74bfba18 [release-branch.go1.21] Revert &quot;crypto/internal/b=
oring:<br>
&gt; &gt; upgrade module to fips-20220613&quot; +1<br>
&gt; &gt; 916e6cddf1 [release-branch.go1.21] runtime: fix Pinner.Pin<br>
&gt; &gt; documentation<br>
&gt; &gt; 6552f3d4ac [release-branch.go1.21] cmd/go/internal/toolchain: app=
ly<br>
&gt; &gt; the -modcacherw flag when downloading a module to determine what<=
br>
&gt; &gt; toolchain it needs<br>
&gt; &gt; 3960318b87 [release-branch.go1.21] crypto/x509: properly gate tes=
t<br>
&gt; &gt; on macos version<br>
&gt; &gt; 00f974eb1f [release-branch.go1.21] go/types, types2: don&#39;t lo=
se<br>
&gt; &gt; position info of interface embeddings<br>
&gt; &gt; 2f91c16e68 [release-branch.go1.21] runtime: properly model rwmute=
x<br>
&gt; &gt; in lock ranking<br>
&gt; &gt; 2540b1436f [release-branch.go1.21] slices: explicitly discard<br>
&gt; &gt; results of some functions<br>
&gt; &gt; 7e34c4308f [release-branch.go1.21] runtime: clear g0 stack bounds=
<br>
&gt; &gt; in dropm<br>
&gt; &gt; 491c1e7e95 [release-branch.go1.21] runtime: allow update of syste=
m<br>
&gt; &gt; stack bounds on callback from C thread<br>
&gt; &gt; caafb50c0d [release-branch.go1.21] runtime: don&#39;t print &quot=
;unexpected<br>
&gt; &gt; SPWRITE&quot; when printing traceback<br>
&gt; &gt; cc85462b3d (tag: go1.21.6) [release-branch.go1.21] go1.21.6<br>
&gt; &gt; d2cb140194 [release-branch.go1.21] crypto/tls: align FIPS-only mo=
de<br>
&gt; &gt; with BoringSSL policy<br>
&gt; &gt; 368e2a9461 [release-branch.go1.21] crypto/internal/boring: upgrad=
e<br>
&gt; &gt; module to fips-20220613<br>
&gt; &gt; 8c6078adfb [release-branch.go1.21] runtime: add race annotations =
in<br>
&gt; &gt; IncNonDefault<br>
&gt; &gt; f6b203c828 [release-branch.go1.21] maps: fix aliasing problems wi=
th<br>
&gt; &gt; Clone<br>
&gt; &gt; 43818206dc [release-branch.go1.21] runtime: put ReadMemStats debu=
g<br>
&gt; &gt; assertions behind a double-check mode<br>
&gt; &gt; cf65d74bc5 [release-branch.go1.21] runtime: add the disablethp<br=
>
&gt; &gt; GODEBUG setting<br>
&gt; &gt; ad1ec60a5b [release-branch.go1.21] runtime/pprof: fix generics<br=
>
&gt; &gt; function names<br>
&gt; &gt; bbab863ada [release-branch.go1.21] os/signal: skip nohup tests on=
<br>
&gt; &gt; darwin builders<br>
&gt; &gt; 7dc67e8f29 [release-branch.go1.21] os/signal: remove go t.Run fro=
m<br>
&gt; &gt; TestNohup<br>
&gt; &gt; 9f8b3ac8c4 [release-branch.go1.21] cmd/compile: fix escape analys=
is<br>
&gt; &gt; of string min/max<br>
&gt; &gt; 8c840b10d0 [release-branch.go1.21] cmd/compile: fix memcombine pa=
ss<br>
&gt; &gt; for big endian, &gt; 1 byte elements<br>
&gt; &gt; <br>
&gt; &gt; [1] <a href=3D"https://github.com/golang/go/compare/go1.21.5...go=
1.21.7" rel=3D"noreferrer" target=3D"_blank">https://github.com/golang/go/c=
ompare/go1.21.5...go1.21.7</a><br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@=
foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/recipes-devtools/go/{go-1.21.5.inc =3D&gt; go-1.21.7.i=
nc} | 2 +-<br>
&gt; &gt; =C2=A0...<a href=3D"http://binary-native_1.21.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">binary-native_1.21.5.bb</a> =3D&gt; <a href=3D"http=
://go-binary-native_1.21.7.bb" rel=3D"noreferrer" target=3D"_blank">go-bina=
ry-native_1.21.7.bb</a>} | 6 +++-<br>
&gt; &gt; --<br>
&gt; &gt; =C2=A0...<a href=3D"http://oss-canadian_1.21.5.bb" rel=3D"norefer=
rer" target=3D"_blank">oss-canadian_1.21.5.bb</a> =3D&gt; <a href=3D"http:/=
/go-cross-canadian_1.21.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross=
-canadian_1.21.7.bb</a>} | 0<br>
&gt; &gt; =C2=A0.../go/{<a href=3D"http://go-cross_1.21.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">go-cross_1.21.5.bb</a> =3D&gt; <a href=3D"http://go=
-cross_1.21.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.21.7.bb</=
a>}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0<br>
&gt; &gt; =C2=A0.../go/{<a href=3D"http://go-crosssdk_1.21.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">go-crosssdk_1.21.5.bb</a> =3D&gt; <a href=3D"htt=
p://go-crosssdk_1.21.7.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk=
_1.21.7.bb</a>}=C2=A0=C2=A0 | 0<br>
&gt; &gt; =C2=A0.../go/{<a href=3D"http://go-native_1.21.5.bb" rel=3D"noref=
errer" target=3D"_blank">go-native_1.21.5.bb</a> =3D&gt; <a href=3D"http://=
go-native_1.21.7.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.21.7.=
bb</a>}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0<br>
&gt; &gt; =C2=A0.../go/{<a href=3D"http://go-runtime_1.21.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-runtime_1.21.5.bb</a> =3D&gt; <a href=3D"http:=
//go-runtime_1.21.7.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.2=
1.7.bb</a>}=C2=A0=C2=A0=C2=A0=C2=A0 | 0<br>
&gt; &gt; =C2=A0...go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch |=
 2 +-<br>
&gt; &gt; =C2=A0.../go/go/0003-ld-add-soname-to-shareable-objects.patch=C2=
=A0=C2=A0 | 8<br>
&gt; &gt; ++++----<br>
&gt; &gt; =C2=A0meta/recipes-devtools/go/{<a href=3D"http://go_1.21.5.bb" r=
el=3D"noreferrer" target=3D"_blank">go_1.21.5.bb</a> =3D&gt; <a href=3D"htt=
p://go_1.21.7.bb" rel=3D"noreferrer" target=3D"_blank">go_1.21.7.bb</a>}=C2=
=A0=C2=A0 | 0<br>
&gt; &gt; =C2=A010 files changed, 9 insertions(+), 9 deletions(-)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/go/{go-1.21.5.inc =3D&gt; go-1=
.21.7.inc}<br>
&gt; &gt; (89%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-binar=
y-native_1.21.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1=
.21.5.bb</a> =3D&gt; go-<br>
&gt; &gt; <a href=3D"http://binary-native_1.21.7.bb" rel=3D"noreferrer" tar=
get=3D"_blank">binary-native_1.21.7.bb</a>} (78%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross=
-canadian_1.21.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian=
_1.21.5.bb</a> =3D&gt;<br>
&gt; &gt; <a href=3D"http://go-cross-canadian_1.21.7.bb" rel=3D"noreferrer"=
 target=3D"_blank">go-cross-canadian_1.21.7.bb</a>} (100%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross=
_1.21.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.21.5.bb</a> =3D=
&gt; go-<br>
&gt; &gt; <a href=3D"http://cross_1.21.7.bb" rel=3D"noreferrer" target=3D"_=
blank">cross_1.21.7.bb</a>} (100%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross=
sdk_1.21.5.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.21.5.bb</=
a> =3D&gt; go-<br>
&gt; &gt; <a href=3D"http://crosssdk_1.21.7.bb" rel=3D"noreferrer" target=
=3D"_blank">crosssdk_1.21.7.bb</a>} (100%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-nativ=
e_1.21.5.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.21.5.bb</a> =
=3D&gt; go-<br>
&gt; &gt; <a href=3D"http://native_1.21.7.bb" rel=3D"noreferrer" target=3D"=
_blank">native_1.21.7.bb</a>} (100%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-runti=
me_1.21.5.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.21.5.bb</a>=
 =3D&gt; go-<br>
&gt; &gt; <a href=3D"http://runtime_1.21.7.bb" rel=3D"noreferrer" target=3D=
"_blank">runtime_1.21.7.bb</a>} (100%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go_1.21.=
5.bb" rel=3D"noreferrer" target=3D"_blank">go_1.21.5.bb</a> =3D&gt; <a href=
=3D"http://go_1.21.7.bb" rel=3D"noreferrer" target=3D"_blank">go_1.21.7.bb<=
/a>}<br>
&gt; &gt; (100%)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.21.5.inc b/meta/recipe=
s-<br>
&gt; &gt; devtools/go/go-1.21.7.inc<br>
&gt; &gt; similarity index 89%<br>
&gt; &gt; rename from meta/recipes-devtools/go/go-1.21.5.inc<br>
&gt; &gt; rename to meta/recipes-devtools/go/go-1.21.7.inc<br>
&gt; &gt; index f009ea77c7..6de24e1e22 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/go/go-1.21.5.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.21.7.inc<br>
&gt; &gt; @@ -15,4 +15,4 @@ SRC_URI +=3D &quot;\<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; &gt; file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.=
patch<br>
&gt; &gt; =C2=A0\<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; &gt; file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch=
=C2=A0\<br>
&gt; &gt; =C2=A0&quot;<br>
&gt; &gt; -SRC_URI[main.sha256sum] =3D<br>
&gt; &gt; &quot;285cbbdf4b6e6e62ed58f370f3f6d8c30825d6e56c5853c66d3c23bcdb0=
9db19&quot;<br>
&gt; &gt; +SRC_URI[main.sha256sum] =3D<br>
&gt; &gt; &quot;00197ab20f33813832bff62fd93cca1c42a08cc689a32a6672ca4959195=
9bff6&quot;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary=
-native_1.21.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.=
21.5.bb</a><br>
&gt; &gt; b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.2=
1.7.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.21.7.bb</a>=
<br>
&gt; &gt; similarity index 78%<br>
&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-=
native_1.21.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.2=
1.5.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-binary-na=
tive_1.21.7.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.21.=
7.bb</a><br>
&gt; &gt; index cc79a277ff..d8826e20f1 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native=
_1.21.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.21.5.bb=
</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native=
_1.21.7.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.21.7.bb=
</a><br>
&gt; &gt; @@ -9,9 +9,9 @@ PROVIDES =3D &quot;go-native&quot;<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; =C2=A0# Checksums available at <a href=3D"https://go.dev/dl/" rel=
=3D"noreferrer" target=3D"_blank">https://go.dev/dl/</a><br>
&gt; &gt; =C2=A0SRC_URI =3D<br>
&gt; &gt; &quot;<a href=3D"https://dl.google.com/go/go$%7BPV%7D.$%7BBUILD_G=
OOS%7D-$%7BBUILD_GOARCH%7D.tar" rel=3D"noreferrer" target=3D"_blank">https:=
//dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar</a><br>
&gt; &gt; .gz;name=3Dgo_${BUILD_GOTUPLE}&quot;<br>
&gt; &gt; -SRC_URI[go_linux_amd64.sha256sum] =3D<br>
&gt; &gt; &quot;e2bc0b3e4b64111ec117295c088bde5f00eeed1567999ff77bc859d7df7=
0078e&quot;<br>
&gt; &gt; -SRC_URI[go_linux_arm64.sha256sum] =3D<br>
&gt; &gt; &quot;841cced7ecda9b2014f139f5bab5ae31785f35399f236b8b3e75dff2a29=
78d96&quot;<br>
&gt; &gt; -SRC_URI[go_linux_ppc64le.sha256sum] =3D<br>
&gt; &gt; &quot;1f6dd06aa34f292f33c2c70ea9b4456e3a9e5cbd1d99968f3f463a4805b=
40ece&quot;<br>
&gt; &gt; +SRC_URI[go_linux_amd64.sha256sum] =3D<br>
&gt; &gt; &quot;13b76a9b2a26823e53062fa841b07087d48ae2ef2936445dc34c4ae0329=
3702c&quot;<br>
&gt; &gt; +SRC_URI[go_linux_arm64.sha256sum] =3D<br>
&gt; &gt; &quot;24744edcaeb827aafb76c67ebd406b5ae13291023b0ad9f061dd7a0e75b=
275ba&quot;<br>
&gt; &gt; +SRC_URI[go_linux_ppc64le.sha256sum] =3D<br>
&gt; &gt; &quot;48a99ecce9b1e632870c29420088f61cf17a6f0c5bdb3cc821ff5c00e14=
b1a8a&quot;<br>
&gt; &gt; =C2=A0<br>
&gt; <br>
&gt; I checked and for some reason, some of these checksums aren&#39;t corr=
ect<br>
&gt; in this or the previous patch. I&#39;ll try fixing them up locally.<br=
>
<br>
With the checksums fixed, 1.21 seemed to pass enough to merge. There<br>
were some meta-oe recipes which failed.<br></blockquote><div><br></div><div=
>I did this minor bump a bit in a hurry and let it go.</div><div>My tests w=
ere all carried out using an amd64 host and that&#39;s why I didn&#39;t see=
 the others.<br></div><div><br>Sorry for this and thanks for fixing.</div><=
div><br></div><div>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
1.22 still has further issues blocking it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000008dcd430612eb0b06--

