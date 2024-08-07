Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA32C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 04:25:46 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.25695.1723004742483481137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 21:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C78ZPVRm;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efba36802so2096757e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 21:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723004740; x=1723609540; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=88bXQUef2VlutbZ1GuQdt6zJWJjpgXYFS5jByeM1YNQ=;
        b=C78ZPVRmGORHEQq9mqJB+9QaoMn7tDUoz7bFlFwzE9IbOt4D1x1q/+5C+4ch/gULWk
         ytm3g1clmz1TXNkl4+1h2yX3QvQyqw/OjqjasUyziLSuYhPskYpjqqg0AaQSoFje5I31
         qpX7n+dI5huP5y4KdBPz9IW7M0IveZoycLVImavHqp7s4fpehSBTfHAsU3hJ9d8p9O5C
         RYm6vR4eR7rJeQgy4V789NzFJLi6cQRNFr6OgJJ4wWB/H+asPv9hWNgDpqidYFXXzKWK
         yVj/P/bi9bSLlxYeNwEfBDLsoj3X0sgWzRmsynYd1oCkU+CKKF35CiF/P2dN8WMPfF7u
         qz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723004740; x=1723609540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88bXQUef2VlutbZ1GuQdt6zJWJjpgXYFS5jByeM1YNQ=;
        b=KYorBJhxooEvJ5cZ+1fWkUFZSaoO4zrX5urtE1TN1k+jp3HFKkx/eKWgt2OY9CC0NS
         ICsOeKl3NlFs3JpRCSL1+aBnYvRHu5Sv8M9oV2WqR72VC6rjZqbx5NSdNfJl2KjxqKli
         N79228/WRprfRlAIFRCSMJcabdocHVHYMYykFYWC6Xsb7Bmdi9N6pKesJLaWRNylrcES
         3NsXTMl14H/X57gO2i8AfvT/fqpNPt3WUAVYapaL1dyfXTPIwgaoU0Nin48K0vWOwg8B
         CcHwxLhWeBIjrKYCtpWWi8jPKGN1//AWb4/kMRRW6ACf20opn/v7LGpwo9RgBmCqw9++
         fKPg==
X-Gm-Message-State: AOJu0YyOK1tgOYj7E5NZ2Be7WSnvbTDo5JvMMRU8BCXH0NtHp8KW+yJR
	WPvxMfim96ycUY8jGGSmGyh+OxFReUlb5p8at8+7HyrR6knLX25Cj8FTwe7FOT7TKPJ9vosfREB
	52GpUSZl99l2ZeX3CbQZ98Ai0q4R1Z/el
X-Google-Smtp-Source: AGHT+IF6G6h/c6F05Kxq286BnQ4M20cyVcknpk8yyErBkRVyNg3lZRxTFp+f75jEkKxgc13J6FflZeiDTVXu1kpVEVk=
X-Received: by 2002:a05:6512:ac6:b0:52e:9951:7881 with SMTP id
 2adb3069b0e04-530bb3a2eebmr12876179e87.52.1723004739976; Tue, 06 Aug 2024
 21:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240807033404.1513069-1-Qi.Chen@windriver.com>
 <CANNYZj_v9crw5x=dgBrrWHGiAgDCm4Up_5kVaAo9-D5LSnkiwQ@mail.gmail.com> <3cf9278f-bed2-aa2a-cee0-7d9684e94b51@windriver.com>
In-Reply-To: <3cf9278f-bed2-aa2a-cee0-7d9684e94b51@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Aug 2024 07:25:29 +0300
Message-ID: <CANNYZj89sr+0LNKB-_LxXf-x66ZNMQa3A+SsZ=DYbTqoRUrh_A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kexec-tools: avoid kernel warning
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007905f0061f104d92"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 04:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203055

--0000000000007905f0061f104d92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes and I don=E2=80=99t understand why it=E2=80=99s not appropriate for ups=
tream
submission. The patch is fixing a kernel warning which is not specific to
oe. So why can=E2=80=99t it be sent upstream?

Alex

On Wed 7. Aug 2024 at 7.22, ChenQi <Qi.Chen@windriver.com> wrote:

> On 8/7/24 12:17, Alexander Kanavin wrote:
>
> What is oe specific in this patch and why that makes it inappropriate for
> upstream? Please do explain.
>
> I think it should be sent upstream.
>
> Alex
>
> I've explained in the patch right above the Upstream-Status line.
>
>
>
> On Wed 7. Aug 2024 at 6.34, Chen Qi via lists.openembedded.org
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8Ev=
Q!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8C=
TxzNf-nvWp306Q$>
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Running command 'kexec -p /path/to/crash-kernel --reuse-cmdline' will
>> give out the following warning:
>>
>>   kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEAL
>> set
>>
>> Add MFD_NOEXEC_SEAL explicitly to avoid such warning.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  ...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 36 +++++++++++++++++++
>>  .../kexec/kexec-tools_2.0.28.bb
>> <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8Ev=
Q!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8C=
TxzNf-nqfERVjA$>
>>              |  1 +
>>  2 files changed, 37 insertions(+)
>>  create mode 100644
>> meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-f=
lag-explicitly.patch
>>
>> diff --git
>> a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL=
-flag-explicitly.patch
>> b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL=
-flag-explicitly.patch
>> new file mode 100644
>> index 0000000000..3b11555a1b
>> --- /dev/null
>> +++
>> b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL=
-flag-explicitly.patch
>> @@ -0,0 +1,36 @@
>> +From 6436da0b58b59e1b4cd3924bd007108b8ddf73dc Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Tue, 6 Aug 2024 19:41:30 -0700
>> +Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly
>> +
>> +Add MFD_NOEXEC_SEAL to avoid kernel warning like below:
>> +
>> +  kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEAL
>> set
>> +
>> +As the above two flags are only available in newer kernels, ideally
>> +we need to do some fallback. But we know for sure that OE
>> scarthgap/master
>> +is using >6.6 kernel, so we don't need to do such fallback.
>> +
>> +Upstream-Status: Inappropriate [OE Specific]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + kexec/kexec.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/kexec/kexec.c b/kexec/kexec.c
>> +index 08edfca..c5f52d4 100644
>> +--- a/kexec/kexec.c
>> ++++ b/kexec/kexec.c
>> +@@ -655,7 +655,7 @@ static int copybuf_memfd(const char *kernel_buf,
>> size_t size)
>> + {
>> +       int fd, count;
>> +
>> +-      fd =3D memfd_create("kernel", MFD_ALLOW_SEALING);
>> ++      fd =3D memfd_create("kernel", MFD_ALLOW_SEALING | MFD_NOEXEC_SEA=
L);
>> +       if (fd =3D=3D -1)
>> +               return fd;
>> +
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>> <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8Ev=
Q!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8C=
TxzNf-nqfERVjA$>
>> b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>> <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8Ev=
Q!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8C=
TxzNf-nqfERVjA$>
>> index f0a484f884..830d9ce585 100644
>> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>> <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8Ev=
Q!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8C=
TxzNf-nqfERVjA$>
>> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>> <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8Ev=
Q!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8C=
TxzNf-nqfERVjA$>
>> @@ -19,6 +19,7 @@ SRC_URI =3D
>> "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
>>
>> file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
>>             file://Fix-building-on-x86_64-with-binutils-2.41.patch \
>>             file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch \
>> +           file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patc=
h
>> \
>>             "
>>
>>  SRC_URI[sha256sum] =3D
>> "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#203052):
>> https://lists.openembedded.org/g/openembedded-core/message/203052
>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedd=
ed-core/message/203052__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPe=
TrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nw7d5_F4$>
>> Mute This Topic: https://lists.openembedded.org/mt/107763946/1686489
>> <https://urldefense.com/v3/__https://lists.openembedded.org/mt/107763946=
/1686489__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUp=
gqNW76DDtGXPgGWMp7bYr8CTxzNf-n3bGPnZ0$>
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedd=
ed-core/unsub__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm0=
2VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nL7JAvTQ$>
>> [alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>

--0000000000007905f0061f104d92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes and I don=E2=80=99t understand why it=E2=80=99s not a=
ppropriate for upstream submission. The patch is fixing a kernel warning wh=
ich is not specific to oe. So why can=E2=80=99t it be sent upstream?</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 7. Aug 2024 a=
t 7.22, ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriv=
er.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddi=
ng-left:1ex;border-left-color:rgb(204,204,204)">

 =20
  <div>
    <div>On 8/7/24 12:17, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"auto">What is oe specific in this patch and why that
        makes it inappropriate for upstream? Please do explain.=C2=A0</div>
      <div dir=3D"auto"><br>
      </div>
      <div dir=3D"auto">I think it should be sent upstream.</div>
      <div dir=3D"auto"><br>
      </div>
      <div dir=3D"auto">Alex</div>
    </blockquote>
    <p>I&#39;ve explained in the patch right above the Upstream-Status line=
.</p></div><div>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed 7. Aug 2024 at 6.34,
            Chen Qi via <a href=3D"https://urldefense.com/v3/__http://lists=
.openembedded.org__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYR=
xBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nvWp306Q$" target=3D"_blank">lists.op=
enembedded.org</a>
            &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.openembedde=
d.org" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)">From:
            Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a>&gt;<br>
            <br>
            Running command &#39;kexec -p /path/to/crash-kernel
            --reuse-cmdline&#39; will<br>
            give out the following warning:<br>
            <br>
            =C2=A0 kexec[970]: memfd_create() called without MFD_EXEC or
            MFD_NOEXEC_SEAL set<br>
            <br>
            Add MFD_NOEXEC_SEAL explicitly to avoid such warning.<br>
            <br>
            Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.=
com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
            ---<br>
            =C2=A0...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 36
            +++++++++++++++++++<br>
            =C2=A0.../kexec/<a href=3D"https://urldefense.com/v3/__http://k=
exec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTr=
qYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" rel=3D"noreferrer" targ=
et=3D"_blank">kexec-tools_2.0.28.bb</a>=C2=A0
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
            =C2=A02 files changed, 37 insertions(+)<br>
            =C2=A0create mode 100644
meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag=
-explicitly.patch<br>
            <br>
            diff --git
a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-fl=
ag-explicitly.patch
b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-fl=
ag-explicitly.patch<br>
            new file mode 100644<br>
            index 0000000000..3b11555a1b<br>
            --- /dev/null<br>
            +++
b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-fl=
ag-explicitly.patch<br>
            @@ -0,0 +1,36 @@<br>
            +From 6436da0b58b59e1b4cd3924bd007108b8ddf73dc Mon Sep 17
            00:00:00 2001<br>
            +From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" tar=
get=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Tue, 6 Aug 2024 19:41:30 -0700<br>
            +Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag
            explicitly<br>
            +<br>
            +Add MFD_NOEXEC_SEAL to avoid kernel warning like below:<br>
            +<br>
            +=C2=A0 kexec[970]: memfd_create() called without MFD_EXEC or
            MFD_NOEXEC_SEAL set<br>
            +<br>
            +As the above two flags are only available in newer kernels,
            ideally<br>
            +we need to do some fallback. But we know for sure that OE
            scarthgap/master<br>
            +is using &gt;6.6 kernel, so we don&#39;t need to do such
            fallback.<br>
            +<br>
            +Upstream-Status: Inappropriate [OE Specific]<br>
            +<br>
            +Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver=
.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
            +---<br>
            + kexec/kexec.c | 2 +-<br>
            + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
            +<br>
            +diff --git a/kexec/kexec.c b/kexec/kexec.c<br>
            +index 08edfca..c5f52d4 100644<br>
            +--- a/kexec/kexec.c<br>
            ++++ b/kexec/kexec.c<br>
            +@@ -655,7 +655,7 @@ static int copybuf_memfd(const char
            *kernel_buf, size_t size)<br>
            + {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, count;<br>
            + <br>
            +-=C2=A0 =C2=A0 =C2=A0 fd =3D memfd_create(&quot;kernel&quot;, =
MFD_ALLOW_SEALING);<br>
            ++=C2=A0 =C2=A0 =C2=A0 fd =3D memfd_create(&quot;kernel&quot;, =
MFD_ALLOW_SEALING |
            MFD_NOEXEC_SEAL);<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
fd;<br>
            + <br>
            +-- <br>
            +2.25.1<br>
            +<br>
            diff --git a/meta/recipes-kernel/kexec/<a href=3D"https://urlde=
fense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowF=
vKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" =
rel=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.28.bb</a>
            b/meta/recipes-kernel/kexec/<a href=3D"https://urldefense.com/v=
3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqO=
hRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" rel=3D"nore=
ferrer" target=3D"_blank">kexec-tools_2.0.28.bb</a><br>
            index f0a484f884..830d9ce585 100644<br>
            --- a/meta/recipes-kernel/kexec/<a href=3D"https://urldefense.c=
om/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85m=
LWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" rel=3D"=
noreferrer" target=3D"_blank">kexec-tools_2.0.28.bb</a><br>
            +++ b/meta/recipes-kernel/kexec/<a href=3D"https://urldefense.c=
om/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85m=
LWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" rel=3D"=
noreferrer" target=3D"_blank">kexec-tools_2.0.28.bb</a><br>
            @@ -19,6 +19,7 @@ SRC_URI =3D
            &quot;${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-=
${PV}.tar.gz<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
            <a>file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-pro=
pert.patch</a>
            \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
            <a>file://Fix-building-on-x86_64-with-binutils-2.41.patch</a> \=
<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
            <a>file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch</=
a> \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
            =C2=A0<a>file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitl=
y.patch</a>
            \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
            <br>
            =C2=A0SRC_URI[sha256sum] =3D
            &quot;f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d16=
9ff6a29&quot;<br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#203052): <a href=3D"https://urldefense.com/=
v3/__https://lists.openembedded.org/g/openembedded-core/message/203052__;!!=
AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPg=
GWMp7bYr8CTxzNf-nw7d5_F4$" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/203052</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/mt/107763946/1686489__;!!AjveYdw8EvQ!dhPgsDclJDntow=
FvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-n3bGPnZ0$"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/107=
763946/1686489</a><br>
            Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.=
openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembed=
ded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lis=
ts.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!dhPgsDclJDnto=
wFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nL7JAvTQ$=
" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/ope=
nembedded-core/unsub</a>
            [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div></div>

--0000000000007905f0061f104d92--

