Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38CCC52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 04:36:56 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.26105.1723005406207782336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 21:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aE+Y5EVv;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efd855adbso1989042e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 21:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723005404; x=1723610204; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OM+ZPPQMKtIe9SeX2VcGk21Gz6/PM4VtZSWO4ILhVZk=;
        b=aE+Y5EVvjA7BUGgWVF60PWJ/9O7XR4bgtCwI66ym4oWraaAZuaCgSqzoSG6c1Q9qQY
         MZfuWmHgo7UD121EklIOA1wAg4JawXiZtaFXpN5iu+BNytrsEhmGl1tduoFSx6S/nn+M
         JVHRLPL/UBlGQalriHL6YHBFx/Z4KaCa9xm4pbodX5K2JyaCke2cvq+Ib/LRXX3x+UNb
         3jgqEI7t4O8L/ivAUXy+NOzSRSoyK4gwZiSGtWTcSbaGgGOfeWLb6F8wPXBsKNt92Fvq
         28RKgegXk9haUq0rmvaecz+vT1BF+5FGPsO3z8BpTco8SSLCw2zc/8NANyJMpmdYkLIt
         wUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723005404; x=1723610204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OM+ZPPQMKtIe9SeX2VcGk21Gz6/PM4VtZSWO4ILhVZk=;
        b=sjgytQKHLVZzwcitpACP2w8U5ygL3ILt81iAi7JOZAJZ6cSX2zcdKEc/+gkTof2vc9
         HkamNErpWY5Tz3MCuAEYIJby9qGkxHhBlhZ3PwDA3f+qsfgXM1uxwPQ4JtubYzSs2Y0E
         4h5i+Vunqs2ydVpT91DyiOqcHd0XbmxBnHaDZHSOA/QB7cOw9QErbS7bsmY+kpPYNYvE
         R9OtmXclX7BgcbADQTrjO/zpNGVHj3d0I2dFd+dFf8ADsTXhuaPJAWUaOHKL/Zc76Cps
         LRFvUDaetShXlcD+4751tNKDWW2K2tgwx+SGPruGwTNVU2fxtCjYJOVqOoTsKpQ0hwnd
         Fsug==
X-Gm-Message-State: AOJu0Yy9AscqKaHyK4hTWmWhMGazgm7UWeiu43DB+4BKsVUy3ETYIX/N
	ImEHPRjBFX5lwmq197P2NJG4M2q/rMD3FV24Mr3zpph6CN46oWs9xdiFIWcmB+uiPgOs1bh9BYg
	SYJV2CTWgc+Ic/060ZdLZFZcWD3VRlQBs
X-Google-Smtp-Source: AGHT+IEgQfWkBVjXLzJ8SL27HsW+yY+zCOpMMhnu4frM4K9Lbjg4PMg4na7mqloo/TBQ0Hur73aGTjshSDhLlUmgBUo=
X-Received: by 2002:a05:6512:234a:b0:530:ba42:8439 with SMTP id
 2adb3069b0e04-530bb388532mr10641909e87.34.1723005403524; Tue, 06 Aug 2024
 21:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240807033404.1513069-1-Qi.Chen@windriver.com>
 <CANNYZj_v9crw5x=dgBrrWHGiAgDCm4Up_5kVaAo9-D5LSnkiwQ@mail.gmail.com>
 <3cf9278f-bed2-aa2a-cee0-7d9684e94b51@windriver.com> <CANNYZj89sr+0LNKB-_LxXf-x66ZNMQa3A+SsZ=DYbTqoRUrh_A@mail.gmail.com>
 <9f991d4a-6a39-17ea-6bda-fe118b1e2ffa@windriver.com>
In-Reply-To: <9f991d4a-6a39-17ea-6bda-fe118b1e2ffa@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Aug 2024 07:36:32 +0300
Message-ID: <CANNYZj9OZfCjmH+thjyCyLiN3=OtzE83zKfZy853nRWEiR7Cag@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kexec-tools: avoid kernel warning
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000005f3e8061f107567"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 04:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203058

--00000000000005f3e8061f107567
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, this is what I tried to get at.

It=E2=80=99s also ok to have a less than perfect patch too, but then it sho=
uld
still include a link to upstream ticket that makes them aware of the issue.


Alex

On Wed 7. Aug 2024 at 7.33, ChenQi <Qi.Chen@windriver.com> wrote:

> On 8/7/24 12:25, Alexander Kanavin wrote:
>
> Yes and I don=E2=80=99t understand why it=E2=80=99s not appropriate for u=
pstream
> submission. The patch is fixing a kernel warning which is not specific to
> oe. So why can=E2=80=99t it be sent upstream?
>
> Alex
>
> Because an ideal solution should consider old kernels. I think when kexec
> fixes the warning (they haven't in their latest 2.0.29 release), they'll
> consider both old and new kernels. My patch only works on new kernels. As
> OE master/scarthgap's kernels are new, so this patch should work for us.
> But it's not good for upstream.
>
> Now, given it a second thought, I've decided to write a new patch and sen=
d
> it to upstream. I'll send out V2.
>
> Regards,
>
> Qi
>
>
> On Wed 7. Aug 2024 at 7.22, ChenQi <Qi.Chen@windriver.com> wrote:
>
>> On 8/7/24 12:17, Alexander Kanavin wrote:
>>
>> What is oe specific in this patch and why that makes it inappropriate fo=
r
>> upstream? Please do explain.
>>
>> I think it should be sent upstream.
>>
>> Alex
>>
>> I've explained in the patch right above the Upstream-Status line.
>>
>>
>>
>> On Wed 7. Aug 2024 at 6.34, Chen Qi via lists.openembedded.org
>> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8E=
vQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8=
CTxzNf-nvWp306Q$>
>> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Running command 'kexec -p /path/to/crash-kernel --reuse-cmdline' will
>>> give out the following warning:
>>>
>>>   kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEAL
>>> set
>>>
>>> Add MFD_NOEXEC_SEAL explicitly to avoid such warning.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>  ...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 36 +++++++++++++++++++
>>>  .../kexec/kexec-tools_2.0.28.bb
>>> <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8E=
vQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8=
CTxzNf-nqfERVjA$>
>>>              |  1 +
>>>  2 files changed, 37 insertions(+)
>>>  create mode 100644
>>> meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-=
flag-explicitly.patch
>>>
>>> diff --git
>>> a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEA=
L-flag-explicitly.patch
>>> b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEA=
L-flag-explicitly.patch
>>> new file mode 100644
>>> index 0000000000..3b11555a1b
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEA=
L-flag-explicitly.patch
>>> @@ -0,0 +1,36 @@
>>> +From 6436da0b58b59e1b4cd3924bd007108b8ddf73dc Mon Sep 17 00:00:00 2001
>>> +From: Chen Qi <Qi.Chen@windriver.com>
>>> +Date: Tue, 6 Aug 2024 19:41:30 -0700
>>> +Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly
>>> +
>>> +Add MFD_NOEXEC_SEAL to avoid kernel warning like below:
>>> +
>>> +  kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEA=
L
>>> set
>>> +
>>> +As the above two flags are only available in newer kernels, ideally
>>> +we need to do some fallback. But we know for sure that OE
>>> scarthgap/master
>>> +is using >6.6 kernel, so we don't need to do such fallback.
>>> +
>>> +Upstream-Status: Inappropriate [OE Specific]
>>> +
>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> +---
>>> + kexec/kexec.c | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/kexec/kexec.c b/kexec/kexec.c
>>> +index 08edfca..c5f52d4 100644
>>> +--- a/kexec/kexec.c
>>> ++++ b/kexec/kexec.c
>>> +@@ -655,7 +655,7 @@ static int copybuf_memfd(const char *kernel_buf,
>>> size_t size)
>>> + {
>>> +       int fd, count;
>>> +
>>> +-      fd =3D memfd_create("kernel", MFD_ALLOW_SEALING);
>>> ++      fd =3D memfd_create("kernel", MFD_ALLOW_SEALING | MFD_NOEXEC_SE=
AL);
>>> +       if (fd =3D=3D -1)
>>> +               return fd;
>>> +
>>> +--
>>> +2.25.1
>>> +
>>> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>>> <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8E=
vQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8=
CTxzNf-nqfERVjA$>
>>> b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>>> <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8E=
vQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8=
CTxzNf-nqfERVjA$>
>>> index f0a484f884..830d9ce585 100644
>>> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>>> <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8E=
vQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8=
CTxzNf-nqfERVjA$>
>>> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>>> <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8E=
vQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8=
CTxzNf-nqfERVjA$>
>>> @@ -19,6 +19,7 @@ SRC_URI =3D
>>> "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
>>>
>>> file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch =
\
>>>             file://Fix-building-on-x86_64-with-binutils-2.41.patch \
>>>             file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch =
\
>>> +
>>> file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
>>>             "
>>>
>>>  SRC_URI[sha256sum] =3D
>>> "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
>>> --
>>> 2.25.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#203052):
>>> https://lists.openembedded.org/g/openembedded-core/message/203052
>>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembed=
ded-core/message/203052__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkP=
eTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nw7d5_F4$>
>>> Mute This Topic: https://lists.openembedded.org/mt/107763946/1686489
>>> <https://urldefense.com/v3/__https://lists.openembedded.org/mt/10776394=
6/1686489__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFU=
pgqNW76DDtGXPgGWMp7bYr8CTxzNf-n3bGPnZ0$>
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembed=
ded-core/unsub__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm=
02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nL7JAvTQ$>
>>> [alex.kanavin@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>
>

--00000000000005f3e8061f107567
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, this is what I tried to get at.=C2=A0</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s also ok to have a less=
 than perfect patch too, but then it should still include a link to upstrea=
m ticket that makes them aware of the issue.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 7. Aug 202=
4 at 7.33, ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@wind=
river.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">

 =20
  <div>
    <div>On 8/7/24 12:25, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"auto">Yes and I don=E2=80=99t understand why it=E2=80=99s=
 not
        appropriate for upstream submission. The patch is fixing a
        kernel warning which is not specific to oe. So why can=E2=80=99t it=
 be
        sent upstream?</div>
      <div dir=3D"auto"><br>
      </div>
      <div dir=3D"auto">Alex</div>
    </blockquote>
    <p>Because an ideal solution should consider old kernels. I think
      when kexec fixes the warning (they haven&#39;t in their latest 2.0.29
      release), they&#39;ll consider both old and new kernels. My patch onl=
y
      works on new kernels. As OE master/scarthgap&#39;s kernels are new, s=
o
      this patch should work for us. But it&#39;s not good for upstream.</p=
>
    <p>Now, given it a second thought, I&#39;ve decided to write a new patc=
h
      and send it to upstream. I&#39;ll send out V2.<br>
    </p>
    <p>Regards,</p>
    <p>Qi<br>
    </p></div><div>
    <blockquote type=3D"cite">
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed 7. Aug 2024 at 7.22,
            ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_=
blank">Qi.Chen@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)">
            <div>
              <div>On 8/7/24 12:17, Alexander Kanavin wrote:<br>
              </div>
              <blockquote type=3D"cite">
                <div dir=3D"auto">What is oe specific in this patch and
                  why that makes it inappropriate for upstream? Please
                  do explain.=C2=A0</div>
                <div dir=3D"auto"><br>
                </div>
                <div dir=3D"auto">I think it should be sent upstream.</div>
                <div dir=3D"auto"><br>
                </div>
                <div dir=3D"auto">Alex</div>
              </blockquote>
              <p>I&#39;ve explained in the patch right above the
                Upstream-Status line.</p>
            </div>
            <div>
              <p><br>
              </p>
              <blockquote type=3D"cite">
                <div><br>
                  <div class=3D"gmail_quote">
                    <div dir=3D"ltr" class=3D"gmail_attr">On Wed 7. Aug 202=
4
                      at 6.34, Chen Qi via <a href=3D"https://urldefense.co=
m/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85m=
LWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nvWp306Q$" target=
=3D"_blank">lists.openembedded.org</a>
                      &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.o=
penembedded.org" target=3D"_blank">windriver.com@lists.openembedded.org</a>=
&gt;
                      wrote:<br>
                    </div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)">From:
                      Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" =
target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
                      <br>
                      Running command &#39;kexec -p /path/to/crash-kernel
                      --reuse-cmdline&#39; will<br>
                      give out the following warning:<br>
                      <br>
                      =C2=A0 kexec[970]: memfd_create() called without
                      MFD_EXEC or MFD_NOEXEC_SEAL set<br>
                      <br>
                      Add MFD_NOEXEC_SEAL explicitly to avoid such
                      warning.<br>
                      <br>
                      Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@=
windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
                      ---<br>
                      =C2=A0...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch |
                      36 +++++++++++++++++++<br>
                      =C2=A0.../kexec/<a href=3D"https://urldefense.com/v3/=
__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhR=
HEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" rel=3D"norefe=
rrer" target=3D"_blank">kexec-tools_2.0.28.bb</a>=C2=A0
                      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 1 +<br>
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
                      +From 6436da0b58b59e1b4cd3924bd007108b8ddf73dc Mon
                      Sep 17 00:00:00 2001<br>
                      +From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windrive=
r.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
                      +Date: Tue, 6 Aug 2024 19:41:30 -0700<br>
                      +Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL
                      flag explicitly<br>
                      +<br>
                      +Add MFD_NOEXEC_SEAL to avoid kernel warning like
                      below:<br>
                      +<br>
                      +=C2=A0 kexec[970]: memfd_create() called without
                      MFD_EXEC or MFD_NOEXEC_SEAL set<br>
                      +<br>
                      +As the above two flags are only available in
                      newer kernels, ideally<br>
                      +we need to do some fallback. But we know for sure
                      that OE scarthgap/master<br>
                      +is using &gt;6.6 kernel, so we don&#39;t need to do
                      such fallback.<br>
                      +<br>
                      +Upstream-Status: Inappropriate [OE Specific]<br>
                      +<br>
                      +Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen=
@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
                      +---<br>
                      + kexec/kexec.c | 2 +-<br>
                      + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
                      +<br>
                      +diff --git a/kexec/kexec.c b/kexec/kexec.c<br>
                      +index 08edfca..c5f52d4 100644<br>
                      +--- a/kexec/kexec.c<br>
                      ++++ b/kexec/kexec.c<br>
                      +@@ -655,7 +655,7 @@ static int
                      copybuf_memfd(const char *kernel_buf, size_t size)<br=
>
                      + {<br>
                      +=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, count;<br>
                      + <br>
                      +-=C2=A0 =C2=A0 =C2=A0 fd =3D memfd_create(&quot;kern=
el&quot;,
                      MFD_ALLOW_SEALING);<br>
                      ++=C2=A0 =C2=A0 =C2=A0 fd =3D memfd_create(&quot;kern=
el&quot;,
                      MFD_ALLOW_SEALING | MFD_NOEXEC_SEAL);<br>
                      +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1)<br>
                      +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return fd;<br>
                      + <br>
                      +-- <br>
                      +2.25.1<br>
                      +<br>
                      diff --git a/meta/recipes-kernel/kexec/<a href=3D"htt=
ps://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgs=
DclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-n=
qfERVjA$" rel=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.28.bb</a>
                      b/meta/recipes-kernel/kexec/<a href=3D"https://urldef=
ense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFv=
KeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" r=
el=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.28.bb</a><br>
                      index f0a484f884..830d9ce585 100644<br>
                      --- a/meta/recipes-kernel/kexec/<a href=3D"https://ur=
ldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDnt=
owFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA=
$" rel=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.28.bb</a><br>
                      +++ b/meta/recipes-kernel/kexec/<a href=3D"https://ur=
ldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDnt=
owFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA=
$" rel=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.28.bb</a><br>
                      @@ -19,6 +19,7 @@ SRC_URI =3D
                      &quot;${KERNELORG_MIRROR}/linux/utils/kernel/kexec/ke=
xec-tools-${PV}.tar.gz<br>
                      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://0=
001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch</a>
                      \<br>
                      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://F=
ix-building-on-x86_64-with-binutils-2.41.patch</a>
                      \<br>
                      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://0=
001-x86-linux-setup.c-Use-POSIX-basename-API.patch</a>
                      \<br>
                      +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://0=
001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch</a>
                      \<br>
                      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
                      <br>
                      =C2=A0SRC_URI[sha256sum] =3D
                      &quot;f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29=
eb80974d169ff6a29&quot;<br>
                      -- <br>
                      2.25.1<br>
                      <br>
                      <br>
                      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                      Links: You receive all messages sent to this
                      group.<br>
                      View/Reply Online (#203052): <a href=3D"https://urlde=
fense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/2=
03052__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqN=
W76DDtGXPgGWMp7bYr8CTxzNf-nw7d5_F4$" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/203052</a><br>
                      Mute This Topic: <a href=3D"https://urldefense.com/v3=
/__https://lists.openembedded.org/mt/107763946/1686489__;!!AjveYdw8EvQ!dhPg=
sDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-=
n3bGPnZ0$" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107763946/1686489</a><br>
                      Group Owner: <a href=3D"mailto:openembedded-core%2Bow=
ner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lists=
.openembedded.org</a><br>
                      Unsubscribe: <a href=3D"https://urldefense.com/v3/__h=
ttps://lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!dhP=
gsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf=
-nL7JAvTQ$" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a>
                      [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"=
_blank">alex.kanavin@gmail.com</a>]<br>
                      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                      <br>
                    </blockquote>
                  </div>
                </div>
              </blockquote>
              <p><br>
              </p>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div></div>

--00000000000005f3e8061f107567--

