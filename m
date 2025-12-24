Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE94E7490C
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 04:22:58 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.114678.1766550176535620721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 20:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AEg0nf71;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78f99901ed5so50612997b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 20:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766550176; x=1767154976; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RfaHeydj1v95OCOrG+qTwZlYqz8YaKkB/Ppm47TFbVc=;
        b=AEg0nf712UtedjaJJ91O8BBl0E9Y/WDC8+n7bhyggHRVcltk4SzFK0XmUui8Y71Olx
         BsxOxnwqsqehvK8mqy6+zh658omyXCHpPjaojk/u8nUC2IuhvNgC42SB/9Vi0SF4U3j6
         kqBQNo858AF7sSGmuC79J0I7n1H+QRyxYIRawnPzRyA3AH1Rh65MKwF9PkDN0goaQyzI
         hL+7Ccb+W3Gqi1iwNXaOpFVa18eiRckVABGWHUc+IIaQp6GK9cOM32YUfj7+XZ0dPmXD
         NvjUD7QJb3DOoDfIQDOKUvBFewqihsKrb2Dux+ZWLpAzYsI+kPMFLYKzioW/cqkGm89y
         Bqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766550176; x=1767154976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfaHeydj1v95OCOrG+qTwZlYqz8YaKkB/Ppm47TFbVc=;
        b=BEp+QdaW5s2VfafvH+w6s+QZNIQtqWpfANBFY0C2v7PRRHaY3JjbFPrZYO4VmGZqv0
         xA3rgqTI71TTmfC2PQuwikHn01bVNnl7QP4daq0gd4gDOLtZ72AmnRo9eQL5VyXGpjYn
         GKodYk7n7NUq3GqWOALIVyJyj0hU6bjlDmtQmzAWK7YDbhFHOfgUvaWuKxZKLqn2JpAX
         0nDWETzADA3CEdgCv4fhc/5EYBifEo8le15IPKI7K/T8+THQ0HHCse+CH7IAbMIOI2kS
         gPn2bePSfevUH58LzL49o9ifQlokpJsG14jbB4a+Bra0re0Bcpyffgh+6kIfuCtwdc/g
         J4Sg==
X-Gm-Message-State: AOJu0YwDjxqo+dTvGLLjqWYgfDMnEtPsX49dd82D89+C74Z00xx1TDdX
	mtV7xRHX8REKgduWX9JJnBPQ28Q5fcSYgn4omPKg7BJ7ip9K92oy2ZU1PxVvyNbcm1pFJXO+/Uq
	S0upUwMSPvRH+FZfoXJ0bk9FUse6p7rhPp5in
X-Gm-Gg: AY/fxX53im78avUBC2ubCbw2inTHc+L10sSleSiGyvqQl8OeLlRYm8Rry/EaYrv0AUw
	yxHVKo6GClBkkd6pJfyoH4lNM0oX8crVfkGbVEsGhSW2IqBEdPZzkOsxnof/XO+GYS7axrZ93qN
	ZzlQxT8BRUK6iYus94cceZkl+5blvYCXOD2SVlUsvlj9tDfIG0ajYrfROI2fqE10IzbVs5XprBS
	pe6Awn1pKnrtexiA0I5sEicecnFLjQmLGhnZ/0yupc43R10g7NwevrxzDcovDAjVKRVquZoG7Mm
	salS9Jyl5wHxmR3S1bcZtE9s1SKvzgob9nGIMMRUwo1UezmTwz2cKuK8CQ1jOB2mPg/o3sMhmw0
	aZomrI5zIG1oITRRitnDi0oYMSww=
X-Google-Smtp-Source: AGHT+IEKGae+x1//MqllIxd6Q2BzcLvtbwjCgvORa3feS3UX1nuNpoAwTy/UDYS1okbrIuGhgfeaDs9qWDkwQhkCZxY=
X-Received: by 2002:a05:690c:7409:b0:787:e9bc:fad5 with SMTP id
 00721157ae682-78fb40294e1mr129753977b3.33.1766550175568; Tue, 23 Dec 2025
 20:22:55 -0800 (PST)
MIME-Version: 1.0
References: <14ecad42-51fb-4abc-a493-c58cfadb9688@windriver.com>
 <CAMKF1so7Bm9QgASazA3WnF+4mRtQqfwwFpvMHbyNsNBdo1c7Bw@mail.gmail.com> <22d11bb9-0b18-4d72-b3a5-94d5b85037b7@windriver.com>
In-Reply-To: <22d11bb9-0b18-4d72-b3a5-94d5b85037b7@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Dec 2025 20:22:28 -0800
X-Gm-Features: AQt7F2qpHj5M3Y9yslicy9ogz1ABeddjNWgyvCJ-wCUw9xGKB8a1k3y8OiZFUw4
Message-ID: <CAMKF1srdg==D97eBcMqqjnZAr9YzsnE6PBd7obBOp7bfLPN29g@mail.gmail.com>
Subject: Re: [PATCH] binutils: Upgrade to 2.45.1 release
To: Yash Shinde <Yash.Shinde@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000b1589d0646ab0367"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 04:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228520

--000000000000b1589d0646ab0367
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sounds good

On Tue, Dec 23, 2025 at 7:40=E2=80=AFPM Yash Shinde <Yash.Shinde@windriver.=
com>
wrote:

>
> On 23-12-2025 20:25, Khem Raj wrote:
>
> What is the one that=E2=80=99s failing unexpectedly
>
> Previously, "replacing non-deterministic member()" test failed
> unexpectedly because it required "SOURCE_DATE_EPOCH"
> to be unset while test execution.
>
> Ross had sent a patch after the v2.45.1 upgrade which unsets this variabl=
e
> and the test case passes now.
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D7ea5d2c5aadb1=
852aff23616e973b382df44c8d0
>
> Regards,
> Yash
>
>
> On Mon, Dec 22, 2025 at 11:16=E2=80=AFPM Yash Shinde <Yash.Shinde@windriv=
er.com>
> wrote:
>
>> From: openembedded-core@lists.openembedded.org
>> <openembedded-core@lists.openembedded.org>
>> <openembedded-core@lists.openembedded.org> on behalf of Khem Raj via
>> lists.openembedded.org
>> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8E=
vQ!bSuADBQihRUKCPY6NcUSMxZKmUh5MGc2VnUPK5Qo5_PKn2nYUqzowTnjkErhZM_EDWH06QVX=
wUepNTneG3bJ$>
>> <raj.khem=3Dgmail.com@lists.openembedded.org>
>> <raj.khem=3Dgmail.com@lists.openembedded.org>
>> Sent: Wednesday, November 26, 2025 7:11 AM
>> To: openembedded-core@lists.openembedded.org
>> <openembedded-core@lists.openembedded.org>
>> <openembedded-core@lists.openembedded.org>
>> Cc: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>> Subject: [OE-core] [PATCH] binutils: Upgrade to 2.45.1 release
>>
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender
>> and know the content is safe.
>>
>> Regenerate ld/configure
>>
>> Brings following changes
>>
>> * e3a18893e1c LoongArch: Use more appropriate assertions for the
>> relocation of TLS LE
>> * b136efd10a7 Re: dlltool memory leaks
>> * b4bde11f310 ld: Don't use -mdirect-extern-access for LoongArch
>> * ab776bc8685 lto: Set plugin_format to bfd_plugin_no only if known_used
>> is set
>> * cec7ab85f24 aarch64: gas: Allow movprfx with fmmla and bfscale [PR
>> gas/33562]
>> * 0b040187894 aarch64, gas: Relax Armv9.6-A mandatory feature set
>> * 4df2be75910 i386: Add GLIBC_ABI_GNU_TLS version dependency
>> * 71c1de4b0c8 x86-64: Add GLIBC_ABI_DT_X86_64_PLT version dependency
>> * b0fe5c23780 x86: Add GLIBC_ABI_GNU2_TLS version dependency
>> * d5945a221ff x86: Copy non_got_ref_without_indirect_extern_access
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>> ---
>>  .../binutils/binutils-2.45.inc
>> <https://urldefense.com/v3/__http://binutils-2.45.inc__;!!AjveYdw8EvQ!bS=
uADBQihRUKCPY6NcUSMxZKmUh5MGc2VnUPK5Qo5_PKn2nYUqzowTnjkErhZM_EDWH06QVXwUepN=
d2s2e4L$>
>> |    6 +-
>>  ...-system-directories-when-cross-linki.patch |   48 +-
>>  .../binutils/0008-Use-libtool-2.4.patch       | 1827 ++++++++---------
>>  3 files changed, 832 insertions(+), 1049 deletions(-)
>> .
>> .
>> .
>>
>> Here's the binutils test results summary:
>>
>> Test Results:
>>                                                          Before
>> After      Diff
>> No. of expected passes                317            318         +1
>> No. of unexpected failures            1                 0           -1
>> No. of untested testcases              5                 5            0
>> No. of unsupported tests              8                 8             0
>>
>>
>> The additional passing test case is, "replacing non-deterministic member=
"
>> after Ross's fix:
>>
>> https://git.openembedded.org/openembedded-core/commit/?id=3D7ea5d2c5aadb=
1852aff23616e973b382df44c8d0
>> <https://urldefense.com/v3/__https://git.openembedded.org/openembedded-c=
ore/commit/?id=3D7ea5d2c5aadb1852aff23616e973b382df44c8d0__;!!AjveYdw8EvQ!b=
SuADBQihRUKCPY6NcUSMxZKmUh5MGc2VnUPK5Qo5_PKn2nYUqzowTnjkErhZM_EDWH06QVXwUep=
NReXU5OJ$>
>>
>>
>> Regards,
>> Yash
>>
>> --
> Regards,
> Yash Shinde
>
>

--000000000000b1589d0646ab0367
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">sounds good</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 23, 2025 at 7=
:40=E2=80=AFPM Yash Shinde &lt;<a href=3D"mailto:Yash.Shinde@windriver.com"=
>Yash.Shinde@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 23-12-2025 20:25, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div>
        <div dir=3D"auto">What is the one that=E2=80=99s failing unexpected=
ly=C2=A0</div>
      </div>
    </blockquote>
    <p>Previously, &quot;replacing non-deterministic member()&quot; test fa=
iled
      unexpectedly because it required &quot;SOURCE_DATE_EPOCH&quot;<br>
      to be unset while test execution.<br>
      <br>
      Ross had sent a patch after the v2.45.1 upgrade which unsets this
      variable and the test case passes now.<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D7ea5=
d2c5aadb1852aff23616e973b382df44c8d0" target=3D"_blank">https://git.openemb=
edded.org/openembedded-core/commit/?id=3D7ea5d2c5aadb1852aff23616e973b382df=
44c8d0</a><br>
      <br>
    </p>
    <p>Regards,<br>
      Yash</p>
    <blockquote type=3D"cite">
      <div>
        <div><br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 22, 2025 at
              11:16=E2=80=AFPM Yash Shinde &lt;<a href=3D"mailto:Yash.Shind=
e@windriver.com" target=3D"_blank">Yash.Shinde@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div>
                <div lang=3D"x-unicode">
                  <div lang=3D"x-unicode">From: <a href=3D"mailto:openembed=
ded-core@lists.openembedded.org" target=3D"_blank">
                      openembedded-core@lists.openembedded.org</a> <a href=
=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">
                      &lt;openembedded-core@lists.openembedded.org&gt;</a>
                    on behalf of Khem Raj via <a href=3D"https://urldefense=
.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!bSuADBQihRUKCPY6NcU=
SMxZKmUh5MGc2VnUPK5Qo5_PKn2nYUqzowTnjkErhZM_EDWH06QVXwUepNTneG3bJ$" target=
=3D"_blank">
                      lists.openembedded.org</a> <a href=3D"mailto:raj.khem=
=3Dgmail.com@lists.openembedded.org" target=3D"_blank">
                      &lt;raj.khem=3Dgmail.com@lists.openembedded.org&gt;</=
a><br>
                    Sent: Wednesday, November 26, 2025 7:11 AM<br>
                    To: <a href=3D"mailto:openembedded-core@lists.openembed=
ded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>
                    <a href=3D"mailto:openembedded-core@lists.openembedded.=
org" target=3D"_blank">&lt;openembedded-core@lists.openembedded.org&gt;</a>=
<br>
                    Cc: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">&lt;raj.khem@gmail.com&gt;</a><br>
                    Subject: [OE-core] [PATCH] binutils: Upgrade to
                    2.45.1 release</div>
                  <div lang=3D"x-unicode"><br>
                    <blockquote type=3D"cite">
                      <div id=3D"m_-6252150368856917555m_113256049397616002=
3divRplyFwdMsg" dir=3D"ltr">
                        <div>=C2=A0</div>
                      </div>
                      <div><font size=3D"2" style=3D"color:rgb(0,0,0)"><spa=
n style=3D"font-size:11pt">
                            <div>CAUTION: This email comes from a non
                              Wind River email account!<br>
                              Do not click links or open attachments
                              unless you recognize the sender and know
                              the content is safe.<br>
                              <br>
                              Regenerate ld/configure<br>
                              <br>
                              Brings following changes<br>
                              <br>
                              * e3a18893e1c LoongArch: Use more
                              appropriate assertions for the relocation
                              of TLS LE<br>
                              * b136efd10a7 Re: dlltool memory leaks<br>
                              * b4bde11f310 ld: Don&#39;t use
                              -mdirect-extern-access for LoongArch<br>
                              * ab776bc8685 lto: Set plugin_format to
                              bfd_plugin_no only if known_used is set<br>
                              * cec7ab85f24 aarch64: gas: Allow movprfx
                              with fmmla and bfscale [PR gas/33562]<br>
                              * 0b040187894 aarch64, gas: Relax
                              Armv9.6-A mandatory feature set<br>
                              * 4df2be75910 i386: Add GLIBC_ABI_GNU_TLS
                              version dependency<br>
                              * 71c1de4b0c8 x86-64: Add
                              GLIBC_ABI_DT_X86_64_PLT version dependency<br=
>
                              * b0fe5c23780 x86: Add GLIBC_ABI_GNU2_TLS
                              version dependency<br>
                              * d5945a221ff x86: Copy
                              non_got_ref_without_indirect_extern_access<br=
>
                              <br>
                              Signed-off-by: Khem Raj <a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">&lt;raj.khem@gmail.com&gt;</a><br>
                              ---<br>
                              =C2=A0.../binutils/<a href=3D"https://urldefe=
nse.com/v3/__http://binutils-2.45.inc__;!!AjveYdw8EvQ!bSuADBQihRUKCPY6NcUSM=
xZKmUh5MGc2VnUPK5Qo5_PKn2nYUqzowTnjkErhZM_EDWH06QVXwUepNd2s2e4L$" target=3D=
"_blank">binutils-2.45.inc</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
                              |=C2=A0=C2=A0=C2=A0 6 +-<br>
=C2=A0...-system-directories-when-cross-linki.patch |=C2=A0=C2=A0 48 +-<br>
=C2=A0.../binutils/0008-Use-libtool-2.4.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1827 ++++++++---------<br>
                              =C2=A03 files changed, 832 insertions(+), 104=
9
                              deletions(-)<br>
                              .<br>
                              .<br>
                              .<br>
                            </div>
                          </span></font></div>
                    </blockquote>
                    Here&#39;s the binutils test results summary:<br>
                    <br>
                    Test Results:<br>
                    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                    =C2=A0 =C2=A0 =C2=A0Before=C2=A0 =C2=A0 =C2=A0 After=C2=
=A0 =C2=A0 =C2=A0 Diff<br>
                    No. of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 317=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                    318=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1<br>
                    No. of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                    =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
-1<br>
                    No. of untested testcases=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                    =C2=A0 =C2=A0 =C2=A05=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0<br>
                    No. of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                    =C2=A0 =C2=A08=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00<br>
                    <br>
                    <br>
                    The additional passing test case is, &quot;replacing
                    non-deterministic member&quot; after Ross&#39;s fix:<br=
>
                    <a href=3D"https://urldefense.com/v3/__https://git.open=
embedded.org/openembedded-core/commit/?id=3D7ea5d2c5aadb1852aff23616e973b38=
2df44c8d0__;!!AjveYdw8EvQ!bSuADBQihRUKCPY6NcUSMxZKmUh5MGc2VnUPK5Qo5_PKn2nYU=
qzowTnjkErhZM_EDWH06QVXwUepNReXU5OJ$" target=3D"_blank">https://git.openemb=
edded.org/openembedded-core/commit/?id=3D7ea5d2c5aadb1852aff23616e973b382df=
44c8d0</a><br>
                    <br>
                    <br>
                    Regards,<br>
                    Yash=C2=A0 </div>
                  <br>
                </div>
              </div>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <pre cols=3D"72">--=20
Regards,
Yash Shinde</pre>
  </div>

</blockquote></div>

--000000000000b1589d0646ab0367--

