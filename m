Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665EACDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 11:30:35 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4815.1782300634952891779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 04:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NskZnIbr;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8dea42b547eso14311026d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 04:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782300634; cv=none;
        d=google.com; s=arc-20240605;
        b=kgUyB4DxlH/G7YEba9+WFFI7NlUg3HjpDf0AjIEnPy5HR5JDBZ84KzgRIMm3mYKmJ/
         YfsVNqS3pbULEPuTCc3V12SPOrDVMoTnE+l6sK91yp3zIo3YmiJ2h5K8YQHis1jTiatf
         cMgUtIfFsDBOAGxhdUZeIdzppE87jRqZwyMeTZd4n/ctus2Wd5CNbExG3b9TUytL3yN7
         l/H8ESX60RmQzklpOfHIAyLNuEc76Ds1RkxjvGvrI+DWXjw42YYkNXclo+hssEEYlDEU
         iWfWC+Za7KcjN+hm0XY2fY49SvaZ+GZOYXksBcxM+umYFmYQFeyfjpHweJU4kWDHMKvN
         uirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ErW9kEmnzb/SoevwFB6JvWFguIFiY8vD87DwjDvKvnE=;
        fh=VOVZu8FjXojtP/2iv884q8pvwCQeeuFgwI9OY1sYm5U=;
        b=O686Ot9lr2a20/e/ZeQQfHwfhqm4OY9Ms0LUCzNKdGw/Wvt9SAWTg+CYHYHbOO5i5e
         YFrX3sX6++QwzpsUWVujGPU+se7T1Wf9t82IXPQnBvjDZ3YVBBNPo4ufazFBG22KpGup
         FOzS45wr2SJzK/mNow6TokD2RxhcNiYoSKMeE1IgpOetYqqc2JjMQ4BUOgHMbLxpw3mA
         LMTqIf3+SzhrXUrI1jjmFHWJleV/BpJ1zDB9RyNNwMBuFHcN2RiGE0CRrAlUFa2oAOLp
         NqjFJvm6kgXAQGBNdq2E9pLIWwToW9TxINEv/BxuxtrE3ddNcZEMoyWQQv2F9Lv3epiz
         XRQw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782300634; x=1782905434; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ErW9kEmnzb/SoevwFB6JvWFguIFiY8vD87DwjDvKvnE=;
        b=NskZnIbr70bOqG1MMNP+92+FcUlUDE07ZhyfULX8hSfHoezg/PEidoiMh1PUaNh67D
         PyqJBuiQxn4OrBfgGbX563sBS/Qbe7TMovZokcndpEavakTiaLdL0GRGhHJAFo9C7ALP
         8sxQ+S4MV7VzGuep1nP/UoxK3Ba8/L2f2bTgIvVWuETEk7I2DnwCn9lTzuNEKjfwWbq3
         Gj3EVBCP4az7gnDn+EZWXXpzDmQ7HNI4uX1F7m4goLtYkZ6Sc5NI/M4PrSHoEr1AHuyh
         QB7FFlAgtQ5kLSpspOl9XUhkZlyLUxuzRYRMI6DlK8jhv3YOERRUc4F4TZiWYxIh6jY8
         T+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782300634; x=1782905434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErW9kEmnzb/SoevwFB6JvWFguIFiY8vD87DwjDvKvnE=;
        b=coUKbBZjrS5DZHj3zaD1VehWkA6qiKa1ZFYX9ZEWIWNWrv6R4ildUm3F1PHamB/+r1
         nPTWQRoLPQ7dwLnNInC/5Q4bR8d5YNWPO+HiyEdRfkDDfRWBcv/oP96SNMybE9LnwqB8
         7LObAOkKBmy1XXw/oa9qG5paRdlAeUjUxj1bHMEIEK4FS3M7xcmqZDL7RkkkrkXMrG49
         nq1Dk2NxexHR/8v9J1Z0Hdebjo+FjsVApOwc9lTsGSFUuDu3jOZrO9n7K26BisEyxP0H
         wf2G/HZfBPsQF0LimP1+dSbbB32aDTepdJC12ohMGvS1d8iHQGWHPa46mdlyKfbtGfgP
         dXbw==
X-Gm-Message-State: AOJu0YxzE4eDPkm1g49Na/ylcm8C+mH9muSun3j/PlHfKh6tuW5HL5iU
	uHlHa0ZPlPZGoSbWVbbIWkLIBSrcUg/Q2WkAzbhSw39RtYTA1YwiDtF1ih1HtU+dAggfwOhVm+e
	ACUDQhjSF5BMAb/UIcyHTgfoDqmhGnhOagONwYITsDw==
X-Gm-Gg: AfdE7clHnchUYR/vQi1/iOPQN/FBMYmNk/Hu2nQ5S9iuna0yFXJCvHEmx488TKtEtm/
	UDPKjh1kLOrxBTOtYpM08knih2MQrBVeVMUCj94x4WhN5rfjJm54KTuIEU9j+kt4NDlnFHtYHs+
	K96lSNHy7HbsnhYtWoplAKPCgeK3A2pqmogow0Kn+4usqF6G8ZP4RaSbGPacks/HO1wDPitbV5A
	MAWNVUoOUi8ja7x1qxVaU8ZdedMAQjn+fuMo+maptqJudHhC70bEgYE+xN4NIZhfRpqCNURylJs
	G9RKrMRebxXyJqdJ+W58ijHwzMP0sA==
X-Received: by 2002:a05:6214:55c8:b0:8dc:2c11:e478 with SMTP id
 6a1803df08f44-8e5300876c2mr47823136d6.28.1782300633683; Wed, 24 Jun 2026
 04:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260618091736.2319572-1-sivakumar.bs@gmail.com> <639C09DF-7336-4819-B0A2-B201BE80A608@arm.com>
In-Reply-To: <639C09DF-7336-4819-B0A2-B201BE80A608@arm.com>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Wed, 24 Jun 2026 17:00:07 +0530
X-Gm-Features: AVVi8CfOjTgyVL6IAwmVGkQ2fHT55hcq1GVtU6V-B1lNAUePMJ5zaFd_9Rr9u2o
Message-ID: <CACFV95JRJQ7SZBudr9qh8TpRZEErSO3EsjzC87zANsev91Ddig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/devtool: add regression test for
 kernel cfg in subdirs
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000275a370654fe3409"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 11:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239490

--000000000000275a370654fe3409
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Ross.

v2 sent:
https://patchwork.yoctoproject.org/project/oe-core/patch/20260624112608.114=
0151-1-sivakumar.bs@gmail.com/

- Switched the `devtool modify -x` extract dir to
  `with tempfile.TemporaryDirectory()`.

- For the created layer's parent dir I kept `tempfile.mkdtemp()` +
  `track_for_cleanup()` instead of a `with` block.
  `OESelftestTestCase.tearDown()` runs the queued teardown commands -
  including `bitbake-layers remove-layer` - before it deletes
  `track_for_cleanup()` paths. A body-scoped `with` deletes the layer
  directory when the test method returns, i.e. before `tearDown` runs,
  so `remove-layer` then fails on a `bblayers.conf` that points at a
  missing layer. I confirmed this with an actual oe-selftest run:
  teardown fails with the `with` form and is clean with `mkdtemp()` +
  `track_for_cleanup()`. I also added `|| true` to that `remove-layer`,
  matching the existing devtool tests.

- Dropped the `bitbake -c cleansstate` call as you noted - the test only
  does `devtool modify`, so it wasn't doing anything.

Verified on current master: `test_devtool_modify_kernel_cfg_subdirs
PASSED`, no teardown warnings.

On Mon, Jun 22, 2026 at 10:52=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> =
wrote:

> On 18 Jun 2026, at 10:17, Siva Balasubramanian via lists.openembedded.org
> <sivakumar.bs=3Dgmail.com@lists.openembedded.org> wrote:
> > +        tempparentdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
> > +        self.track_for_cleanup(tempparentdir)
>
> I know that this is what other tests so, but using =E2=80=9Cwith
> tempfile.TemporaryDirectory(=E2=80=A6)=E2=80=9D is neater.
>
> > +        bitbake('%s -c cleansstate' % realrecipe)
>
> There should be no reason to call cleansstate.  This is usually a proxy
> for =E2=80=9CI want to cause this recipe to rebuild=E2=80=9D which can be=
 done with
> "bitbake -C unpack [recipe]=E2=80=9D, but as this test just does a =E2=80=
=98devtool modify=E2=80=99
> I=E2=80=99m not sure what it=E2=80=99s achieving?
>
> > +        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
> > +        self.track_for_cleanup(tempdir)
>
> As above.
>
> Ross



--=20

Sivakumar B

--000000000000275a370654fe3409
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Thanks Ross.<br><br>v2 sent: <a href=3D"https://patchwo=
rk.yoctoproject.org/project/oe-core/patch/20260624112608.1140151-1-sivakuma=
r.bs@gmail.com/">https://patchwork.yoctoproject.org/project/oe-core/patch/2=
0260624112608.1140151-1-sivakumar.bs@gmail.com/</a><br><br>- Switched the `=
devtool modify -x` extract dir to<br>=C2=A0 `with tempfile.TemporaryDirecto=
ry()`.<br><br>- For the created layer&#39;s parent dir I kept `tempfile.mkd=
temp()` +<br>=C2=A0 `track_for_cleanup()` instead of a `with` block.<br>=C2=
=A0 `OESelftestTestCase.tearDown()` runs the queued teardown commands -<br>=
=C2=A0 including `bitbake-layers remove-layer` - before it deletes<br>=C2=
=A0 `track_for_cleanup()` paths. A body-scoped `with` deletes the layer<br>=
=C2=A0 directory when the test method returns, i.e. before `tearDown` runs,=
<br>=C2=A0 so `remove-layer` then fails on a `bblayers.conf` that points at=
 a<br>=C2=A0 missing layer. I confirmed this with an actual oe-selftest run=
:<br>=C2=A0 teardown fails with the `with` form and is clean with `mkdtemp(=
)` +<br>=C2=A0 `track_for_cleanup()`. I also added `|| true` to that `remov=
e-layer`,<br>=C2=A0 matching the existing devtool tests.<br><br>- Dropped t=
he `bitbake -c cleansstate` call as you noted - the test only<br>=C2=A0 doe=
s `devtool modify`, so it wasn&#39;t doing anything.<br><br>Verified on cur=
rent master: `test_devtool_modify_kernel_cfg_subdirs<br>PASSED`, no teardow=
n warnings.<br></div></div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 22, 2026 at 10:52=E2=
=80=AFPM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton=
@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 18 Jun 2026, at 10:17, Siva Balasubramanian via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> &lt;<a href=3D"http://sivakumar.bs" rel=3D"noreferrer" targe=
t=3D"_blank">sivakumar.bs</a>=3D<a href=3D"mailto:gmail.com@lists.openembed=
ded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tempparentdir =3D tempfile.mkdtemp(prefix=
=3D&#39;devtoolqa&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(tempparentdir)<br>
<br>
I know that this is what other tests so, but using =E2=80=9Cwith tempfile.T=
emporaryDirectory(=E2=80=A6)=E2=80=9D is neater.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;%s -c cleansstate&#39; % rea=
lrecipe)<br>
<br>
There should be no reason to call cleansstate.=C2=A0 This is usually a prox=
y for =E2=80=9CI want to cause this recipe to rebuild=E2=80=9D which can be=
 done with &quot;bitbake -C unpack [recipe]=E2=80=9D, but as this test just=
 does a =E2=80=98devtool modify=E2=80=99 I=E2=80=99m not sure what it=E2=80=
=99s achieving?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tempdir =3D tempfile.mkdtemp(prefix=3D&#3=
9;devtoolqa&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(tempdir)<br>
<br>
As above.<br>
<br>
Ross</blockquote></div><div><br clear=3D"all"></div><div><br></div><span cl=
ass=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><br></div>Sivakuma=
r B<span></span><span></span></div></div></div></div>

--000000000000275a370654fe3409--

