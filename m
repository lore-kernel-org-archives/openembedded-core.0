Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36489C6FD18
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 13:01:56 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.65595.1680008511726924584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 06:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W6AMWCll;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id t14so12474327ljd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 06:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680008510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C0VCDeNraBdrxcyunTMnCDTut8cuj7d4Xb2ZvZ5GaF8=;
        b=W6AMWCllzfeHHXVSEcSmzkYb2uqtXmwSd40PET468uCOFgbKw2oqOhhipaEthXecGs
         lKk/fimcbBik7XHimP42nW+OGXD6KbUsQO4uvzGbU6BlmOF/DENfPyilsxhuV6Krtr3s
         famoVih2RlDwV3sE/Bu63f3ZV3lH1/Otmk69VdM98cwTqndG4Xb0VRdfem9UdcSZg1c+
         tSk2moPd6Z2GlVmqtmpq0y1RiEy6a1cVj5ymtqLWDt5vF2uonadsq2uYu1q6iXpBig0C
         YLMZfBrwlHTveva7iG4mIRfKNjGMUkZN/473ojUZTlWTuxas29k0GvyIAnw3s8Z1Bom1
         QJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680008510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0VCDeNraBdrxcyunTMnCDTut8cuj7d4Xb2ZvZ5GaF8=;
        b=xtJPHmBv3wTC8lyV3pkKeVP/tj6YF81nNKHbLnftLEAoVtQ6LL3YDAnbr/1qUsE4sW
         wzZSQvWPDadysE7bD8NU62GpAxSLiS7YUSeZL3IXcN05rUSTtkl3v47WM3zsUkCjQOQG
         Vx59kFQNP1mA/qceGk8yVKg96BW8IcciJfPISf6PAqyFfvCO7b8GhxCmHD2maySh0Cws
         TBgblV4yD6B7+0OwXpgkywliWpW9ei8KfNk8sjnhqG3MVm1U5iZf+xu1/ek1ySsah000
         ZHiDEpeAW8rtFQdDLBSFw8eV3dAhJYXiUB4cZEqADdjRiwnIPCjzKuvVh8SCBd38ya71
         Hz6Q==
X-Gm-Message-State: AAQBX9c/MPfLj2XBsG6Q/tZ5hl1OGJ7EiOsh99xAHLZ7Q/ULsaxZURL0
	psyQIiAd3Jrx5chWEHxpa3+pPTWFszvL7za34H8=
X-Google-Smtp-Source: AKy350aGuGEDOrv025OWINaV9modWaNB9KTsE2sqoAdM9z6j6HO+PvcAwU6X5K/cwD/NTEJdMjbtC1j0a5kR69FOZHA=
X-Received: by 2002:a2e:6a07:0:b0:29f:caf0:f77f with SMTP id
 f7-20020a2e6a07000000b0029fcaf0f77fmr4748961ljc.3.1680008509688; Tue, 28 Mar
 2023 06:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
 <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
 <53196741237572435b0a5965aa77a72b021d6fed.camel@linuxfoundation.org> <CA+cAkeo_CnnQDLrrmcDE1PP_65qoxkAXU20Ho8r_N-BwqqbObw@mail.gmail.com>
In-Reply-To: <CA+cAkeo_CnnQDLrrmcDE1PP_65qoxkAXU20Ho8r_N-BwqqbObw@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 28 Mar 2023 15:01:38 +0200
Message-ID: <CA+cAkepyw6es7w+VdQCQDTAV9-nm+2RVtXt-bLr32iTnfjAr2g@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest for devtool failed
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/mixed; boundary="000000000000709dc505f7f576be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 13:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179233

--000000000000709dc505f7f576be
Content-Type: multipart/alternative; boundary="000000000000709dc305f7f576bc"

--000000000000709dc305f7f576bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah sorry, I take it back, only test_devtool_modify passed, I still
have errors on test_devtool_modify_git:

NOTE: recipe psplash-0.1+git999-r0: task do_configure: Started
ERROR: psplash-0.1+git999-r0 do_configure: no configure script found at
../../../../../../../../../../../../tmp/devtoolqantpyns7p/configure
ERROR: psplash-0.1+git999-r0 do_configure:
ExecutionError('/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/w=
ork/core2-64-poky-linux/psplash/0.1+git999-r0/temp/run.do_configure.3768172=
',
1, None, None)
ERROR: Logfile of failure stored in:
/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/core2-64-pok=
y-linux/psplash/0.1+git999-r0/temp/log.do_configure.3768172
NOTE: recipe psplash-0.1+git999-r0: task do_configure: Failed
ERROR: Task
(/tmp/devtoolqak9io3385/core-copy/meta/recipes-core/psplash/psplash_git.bb:=
do_configure)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 910 tasks of which 904 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:
  /tmp/devtoolqak9io3385/core-copy/meta/recipes-core/psplash/psplash_git.bb=
:
do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.

Full log of this run joined.

Note that my machine is a dedicated build machine (ubuntu 22.04, 32 Xeon
Silver, 126GB ram), I'll
try on my personnal computer if I manage to have enough disk size



On Tue, 28 Mar 2023 at 14:40, Fr=C3=A9d=C3=A9ric Martinsons <
frederic.martinsons@gmail.com> wrote:

> I just finished a pristine build of core-image-sato on poky master,
> and set up SSTATE_DIR in my local.conf.
> Tests are now ok, I can start to write some now.
>
> If anyone is interested , please find attached the full log of the two
> first failures.
>
> On Tue, 28 Mar 2023 at 14:28, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Tue, 2023-03-28 at 10:54 +0200, Alexander Kanavin wrote:
>> > oe-selftest is executed on the autobuilder all the time, so if it
>> > fails this way we'd know.
>> >
>> > Can you try making a pristine build from scratch and run oe-selftest
>> > in it? You should set up sstate cache outside of the build directory,
>> > so that selftest would reuse it.
>>
>> It is almost certainly some local setting or other difference which is
>> causing the issue. I'd like to know what it is though so we can try and
>> improve the test execution and avoid this.
>>
>> Cheers,
>>
>> Richard
>>
>

--000000000000709dc305f7f576bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah sorry, I take it back, only test_devtool_modify passed,=
 I still<div>have errors on test_devtool_modify_git:</div><div><br></div><d=
iv>NOTE: recipe psplash-0.1+git999-r0: task do_configure: Started<br>ERROR:=
 psplash-0.1+git999-r0 do_configure: no configure script found at ../../../=
../../../../../../../../../tmp/devtoolqantpyns7p/configure<br>ERROR: psplas=
h-0.1+git999-r0 do_configure: ExecutionError(&#39;/var/lib/jenkins/YOCTO_PO=
KY_MASTER_TEST/poky/build-st/tmp/work/core2-64-poky-linux/psplash/0.1+git99=
9-r0/temp/run.do_configure.3768172&#39;, 1, None, None)<br>ERROR: Logfile o=
f failure stored in: /var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/=
tmp/work/core2-64-poky-linux/psplash/0.1+git999-r0/temp/log.do_configure.37=
68172<br>NOTE: recipe psplash-0.1+git999-r0: task do_configure: Failed<br>E=
RROR: Task (/tmp/devtoolqak9io3385/core-copy/meta/recipes-core/psplash/pspl=
ash_git.bb:do_configure) failed with exit code &#39;1&#39;<br>NOTE: Tasks S=
ummary: Attempted 910 tasks of which 904 didn&#39;t need to be rerun and 1 =
failed.<br><br>Summary: 1 task failed:<br>=C2=A0 /tmp/devtoolqak9io3385/cor=
e-copy/meta/recipes-core/psplash/psplash_git.bb:do_configure<br>Summary: Th=
ere were 2 ERROR messages, returning a non-zero exit code.<br></div><div><b=
r></div><div>Full log of this run joined.</div><div><br></div><div>Note tha=
t my machine is a dedicated build machine (ubuntu 22.04, 32 Xeon Silver, 12=
6GB ram), I&#39;ll</div><div>try on my personnal=C2=A0computer if I manage =
to have enough disk size</div><div><br></div><div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 28 Mar =
2023 at 14:40, Fr=C3=A9d=C3=A9ric Martinsons &lt;<a href=3D"mailto:frederic=
.martinsons@gmail.com">frederic.martinsons@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I just=
 finished a pristine build of core-image-sato on poky master,<div>and set u=
p SSTATE_DIR in my local.conf.</div><div>Tests are now ok, I can start to w=
rite some now.</div><div><br></div><div>If anyone is interested , please fi=
nd attached the full log of the two</div><div>first failures.</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
28 Mar 2023 at 14:28, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Tue, 2023-03-28 at 10:54 +0200, Alexander Kanavin wrote:<br>
&gt; oe-selftest is executed on the autobuilder all the time, so if it<br>
&gt; fails this way we&#39;d know.<br>
&gt; <br>
&gt; Can you try making a pristine build from scratch and run oe-selftest<b=
r>
&gt; in it? You should set up sstate cache outside of the build directory,<=
br>
&gt; so that selftest would reuse it.<br>
<br>
It is almost certainly some local setting or other difference which is<br>
causing the issue. I&#39;d like to know what it is though so we can try and=
<br>
improve the test execution and avoid this.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>
</blockquote></div>

--000000000000709dc305f7f576bc--

--000000000000709dc505f7f576be
Content-Type: application/gzip; 
	name="oe-selftest_test_devtool_modify_git_2.log.gz"
Content-Disposition: attachment; 
	filename="oe-selftest_test_devtool_modify_git_2.log.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_lfs9lov20>
X-Attachment-Id: f_lfs9lov20

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
I+sAAA==
--000000000000709dc505f7f576be--

