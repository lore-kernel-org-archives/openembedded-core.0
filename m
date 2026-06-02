Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5398BCD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 11:44:16 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23222.1780400648774087241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 04:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sCidsxgO;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9157d3f2098so64637185a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 04:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780400648; cv=none;
        d=google.com; s=arc-20240605;
        b=KVvBlJObdQr0dIW9uQTt14Wc/f5wDhufpSbuD3NrgKsy2UpdQJSOTmHrAvQU1iaQ5J
         keRm1CcJmNjTaGQE39xuZPrUfOG1yXWF0QN9q0nouijfjwub/1dFWqLGqekxINqyOm55
         8fhPRQp+Yf9r7qi8sMZVoj9XovB+BwnDkH7hH/sSnmwWikUTjsB/7YtWOlhIyLGt8eTK
         EtrjxGvCkCyyUkEwpy4RG8UhrPC9mKc19mZhAh6Biqc58vXVx7f+hY/J6t/ZE0COGh4Q
         c5km5uzfjQFp0IoqhFErw5W6d7wMUb/2I/Lb6pjUoSPmptFv7ZWk5fXxlyhMAPZmlGnt
         yUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aH93m3kMwuWqyuGzNgWl1kUQjcgSucpxDfhAbzhxbBw=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=WCu5c+5yxeckzJI2wsHlIbZheSgmksMbO+BsHlhdUD73ryYuMDNS/6uPsTiBvaJhED
         pL1l9fUA3LQD6cXba/TFExVRNZAP9X8XE19lcxVQUKqKlUHDc0j+dbOMduNQY41ULnB1
         f+p4pocGM6+oohFD/LolcD9IAaIQ5u5VSumj7Ko49/XJDS6qFV8mAe23PEX5n8tWeY5n
         WdKoIkoU/g7vy9iTUld4rI4Xz2Kej+9IoeT476Lp5iWdEyhCmCBq4OqAZJKcv6WecscJ
         BE/XcUJzoTE8AH39kbusUCcGRQOFK18FCxpSi6dubGoHrHWl5fRSCzAY362VjbpDl8a/
         QsqA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400648; x=1781005448; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aH93m3kMwuWqyuGzNgWl1kUQjcgSucpxDfhAbzhxbBw=;
        b=sCidsxgO28XIRJsHiJ03wX5W8RUBNKNStndgQx6eX+mmQ8jzFrCMSaWcfM4oKD5Lt8
         aLLUq4zC//wsBcklDbI/P0R+vLxzFD7wMj5rujJIymX+kZDIomdpQWMzixS51baRvGuO
         CNZP6F9fc+ZtBO7pko4REzMtc4XIx7aU/7TNQh3Vta36QAdOglymW3P/vwuTsg8CK2XG
         zKMEWRtDwTx9weqy0fLEeS3U5/jW844BeOPzaaQRiUIKYrDqXui0v53+7LsFe9qRdaoO
         xNUZMA65GCj98tRcWzWqJhf9psNVDkbKVgJqmmPZM+jW/Gyqoff3C+36+TD5eY0LX5jg
         ZJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400648; x=1781005448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aH93m3kMwuWqyuGzNgWl1kUQjcgSucpxDfhAbzhxbBw=;
        b=S1vUsPsfCUeqvEH5rpXLZf3D40i3AMCll4kz8BlglME+6HFcuT/QinXCKw6/l5QmVE
         DKVVhZtOkEDtwveBKpt4z9bg+3pjLfuCkkOqPI1zdYUu/gBM/vUResWD/wEmrODF+8jt
         158bzwiQxlPq7b0ZiFFMoMAZ/AqPg/QpxftxFIiLL+qM0qD3r+2BUnGYT20CxgDuVXr8
         OP+jLDiKfxlcKZ3FaiKhcSEIzN0V8npwZgWyynQdnM0r56alxJ2/esw+7joExFHiqsGl
         oqbcPKO90Tomj0lm0HjZy5Bxgdim+36PETtSuAFKi+V+RqMz9CAtd2TTY5lxCoVY2Sjt
         7/Pg==
X-Gm-Message-State: AOJu0YxNcpveQUB6PltG2THv44YUzzqeDpSCSbv6bd2LKV46s8Vb+Cut
	npSHFifUHwbCuFTdrgTgOq7/xvRHnGQX3J6Gzi8vYPfDvQ7pACik8MdjB5H5c+gl5GfR+yGRft9
	nIONDZNsSQ4dzFzegnjvJRuAaiZm3u+Q7nlmMTvmN8g==
X-Gm-Gg: Acq92OFHyR4gMJhxPQZx9yDa0yUrSJeCdss82YNZxOfjZ1yt/jKX0tk7Itq2lLyOncw
	fuOl1VnEY7e68PLMKQOAWAL7AtV0rvxUjLAS5UurC1DNuoJWAdHDOtrhRvBCCDYdl/sW0XOBG1m
	O/T2X9nXORY8DOvt+mnaOl23ArzXrF7C0I/GodXE2431QpRA5C7MLzcMNRoQdO8iF0/inZaNNQu
	w26t+H4BowwMosNUpV6b2IL+NGI0DRJSRFF2kuFzlcORuH6ZUlWapkcXie9Ff8+lnrglXEP/GIR
	8JS9BZezp3bl+z3BATvtQtMYl6Cd4KSgDQ7EutYIPdtj8stJ1Q==
X-Received: by 2002:a05:620a:4441:b0:915:7ecf:86e3 with SMTP id
 af79cd13be357-9157ecf8c29mr211083485a.29.1780400647589; Tue, 02 Jun 2026
 04:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260601165912.533636-1-sivakumar.bs@gmail.com>
 <DIYFVYFWGIGJ.1GE117T1IOCR9@bootlin.com> <CACFV95LZwuSSnt38Qpwpu9KbESyJCoLW2NA6kOfOR+v6WqiU5w@mail.gmail.com>
In-Reply-To: <CACFV95LZwuSSnt38Qpwpu9KbESyJCoLW2NA6kOfOR+v6WqiU5w@mail.gmail.com>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Tue, 2 Jun 2026 17:13:41 +0530
X-Gm-Features: AVHnY4KgcPCSkwLDNTd4xDv5a0xTWrprHJCetVJRQO33jUFIBb6GNAgnR18EAdA
Message-ID: <CACFV95JoJVd4AGckEFCP++tAg23qD4YOMjpfqeUxaNZXqOwNYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] qemuboot.bbclass: add missing task
 dependency on kernel deploy
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002854a9065343d4af"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 11:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238032

--0000000000002854a9065343d4af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v3 fixes the autobuilder failure. baremetal images inherit qemuboot
via baremetal-image.bbclass but do not set KERNEL_DEPLOY_DEPEND,
causing a parse error when empty string was passed to [depends].

Fixed by guarding with a Python expression:
  do_write_qemuboot_conf[depends] +=3D "${@d.getVar('KERNEL_DEPLOY_DEPEND')
or ''}"

Tested: 949 recipes parse cleanly with MACHINE=3Dqemuarm, no errors.
do_write_qemuboot_conf reruns correctly after kernel rebuild on qemux86-64.

https://lists.openembedded.org/g/openembedded-core/topic/patch_v3_qemuboot_=
bbclass/119609347

On Tue, Jun 2, 2026 at 3:00=E2=80=AFPM Siva Kumar Balasubramanian <
sivakumar.bs@gmail.com> wrote:

> Hi Mathieu,
>
> KERNEL_DEPLOY_DEPEND is only defined in image.bbclass,
> so in baremetal recipes that don't inherit it, the variable is unset and
> [depends] +=3D gets an empty string, causing the unpack failure.
> Fix is to add KERNEL_DEPLOY_DEPEND ?=3D "virtual/kernel:do_deploy" in
> qemuboot.bbclass itself, mirroring the same pattern in image.bbclass. Wil=
l
> send v3 shortly.
> Thanks for catching this.
>
> Siva
>
> On Tue, Jun 2, 2026 at 2:31=E2=80=AFPM Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>
>> On Mon Jun 1, 2026 at 6:59 PM CEST, Siva Balasubramanian via
>> lists.openembedded.org wrote:
>> > do_write_qemuboot_conf had no dependency on the kernel deploy task,
>> > so if the kernel was rebuilt without invalidating the rootfs sstate,
>> > the task was skipped and .qemuboot.conf was left stale while new
>> > image artifacts were deployed with a new timestamp suffix.
>> >
>> > Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND, which
>> > is the same variable used by do_build[depends] in image.bbclass for
>> > the same reason. Since KERNEL_DEPLOY_DEPEND is defined with ?=3D it
>> > correctly handles firmware and baremetal images that override it to
>> > their own deploy target.
>> >
>> > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14520
>> > Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
>> > ---
>> >  meta/classes-recipe/qemuboot.bbclass | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/meta/classes-recipe/qemuboot.bbclass
>> b/meta/classes-recipe/qemuboot.bbclass
>> > index 56106b1958..db971d50bd 100644
>> > --- a/meta/classes-recipe/qemuboot.bbclass
>> > +++ b/meta/classes-recipe/qemuboot.bbclass
>> > @@ -128,6 +128,7 @@ inherit image-artifact-names
>> >
>> >  # Create qemuboot.conf
>> >  addtask do_write_qemuboot_conf after do_rootfs before do_image
>> > +do_write_qemuboot_conf[depends] +=3D "${KERNEL_DEPLOY_DEPEND}"
>> >
>> >  def qemuboot_vars(d):
>> >      build_vars =3D ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
>>
>> So I struggle to understand why, but it looks lie this patch is
>> responsible of this error on the autobuilder:
>>
>> Parsing recipes...ERROR: Unable to parse
>> /srv/pokybuild/yocto-worker/a-full/build/layers/openembedded-core/meta/r=
ecipes-extended/baremetal-example/
>> baremetal-helloworld_git.bb
>> Traceback (most recent call last):
>>   File
>> "/srv/pokybuild/yocto-worker/a-full/build/layers/bitbake/lib/bb/cooker.p=
y",
>> line 2334, in parse_next
>>     raise result
>> ValueError: not enough values to unpack (expected 2, got 1)
>>
>> ERROR: Parsing halted due to errors, see error messages above
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3909
>>
>> Any clue about what might be wrong is welcome.
>>
>> Thanks,
>> Mathieu
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
>
> --
>
> Sivakumar B
>


--=20

Sivakumar B

--0000000000002854a9065343d4af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">v3 fixes the autobuilder failure. baremetal images inhe=
rit qemuboot<br>via baremetal-image.bbclass but do not set KERNEL_DEPLOY_DE=
PEND,<br>causing a parse error when empty string was passed to [depends].<b=
r><br>Fixed by guarding with a Python expression:<br>=C2=A0 do_write_qemubo=
ot_conf[depends] +=3D &quot;${@d.getVar(&#39;KERNEL_DEPLOY_DEPEND&#39;) or =
&#39;&#39;}&quot;<br><br>Tested: 949 recipes parse cleanly with MACHINE=3Dq=
emuarm, no errors.<br>do_write_qemuboot_conf reruns correctly after kernel =
rebuild on qemux86-64.<br><br><a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/topic/patch_v3_qemuboot_bbclass/119609347">https://lists.o=
penembedded.org/g/openembedded-core/topic/patch_v3_qemuboot_bbclass/1196093=
47</a></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2, 2026 at 3:00=E2=80=AFPM Si=
va Kumar Balasubramanian &lt;<a href=3D"mailto:sivakumar.bs@gmail.com">siva=
kumar.bs@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif">Hi Mathieu,</div><div class=3D"gmail_=
default" style=3D"font-family:arial,helvetica,sans-serif"><br>KERNEL_DEPLOY=
_DEPEND is only defined in image.bbclass,=C2=A0</div><div class=3D"gmail_de=
fault" style=3D"font-family:arial,helvetica,sans-serif">so in baremetal rec=
ipes that don&#39;t inherit it, the variable is unset and [depends] +=3D ge=
ts an empty string, causing the unpack failure.<br>Fix is to add KERNEL_DEP=
LOY_DEPEND ?=3D &quot;virtual/kernel:do_deploy&quot; in qemuboot.bbclass it=
self, mirroring the same pattern in image.bbclass. Will send v3 shortly.<br=
>Thanks for catching this.</div><div class=3D"gmail_default" style=3D"font-=
family:arial,helvetica,sans-serif"><br>Siva</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2, 2026 at 2:3=
1=E2=80=AFPM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-bri=
and@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon =
Jun 1, 2026 at 6:59 PM CEST, Siva Balasubramanian via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a> wrote:<br>
&gt; do_write_qemuboot_conf had no dependency on the kernel deploy task,<br=
>
&gt; so if the kernel was rebuilt without invalidating the rootfs sstate,<b=
r>
&gt; the task was skipped and .qemuboot.conf was left stale while new<br>
&gt; image artifacts were deployed with a new timestamp suffix.<br>
&gt;<br>
&gt; Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND, which<br>
&gt; is the same variable used by do_build[depends] in image.bbclass for<br=
>
&gt; the same reason. Since KERNEL_DEPLOY_DEPEND is defined with ?=3D it<br=
>
&gt; correctly handles firmware and baremetal images that override it to<br=
>
&gt; their own deploy target.<br>
&gt;<br>
&gt; Fixes: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
14520" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D14520</a><br>
&gt; Signed-off-by: Siva Balasubramanian &lt;<a href=3D"mailto:sivakumar.bs=
@gmail.com" target=3D"_blank">sivakumar.bs@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/qemuboot.bbclass | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recip=
e/qemuboot.bbclass<br>
&gt; index 56106b1958..db971d50bd 100644<br>
&gt; --- a/meta/classes-recipe/qemuboot.bbclass<br>
&gt; +++ b/meta/classes-recipe/qemuboot.bbclass<br>
&gt; @@ -128,6 +128,7 @@ inherit image-artifact-names<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Create qemuboot.conf<br>
&gt;=C2=A0 addtask do_write_qemuboot_conf after do_rootfs before do_image<b=
r>
&gt; +do_write_qemuboot_conf[depends] +=3D &quot;${KERNEL_DEPLOY_DEPEND}&qu=
ot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def qemuboot_vars(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 build_vars =3D [&#39;MACHINE&#39;, &#39;TUNE_ARCH&=
#39;, &#39;DEPLOY_DIR_IMAGE&#39;,<br>
<br>
So I struggle to understand why, but it looks lie this patch is<br>
responsible of this error on the autobuilder:<br>
<br>
Parsing recipes...ERROR: Unable to parse /srv/pokybuild/yocto-worker/a-full=
/build/layers/openembedded-core/meta/recipes-extended/baremetal-example/<a =
href=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">baremetal-helloworld_git.bb</a><br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/a-full/build/layers/bitbake/l=
ib/bb/cooker.py&quot;, line 2334, in parse_next<br>
=C2=A0 =C2=A0 raise result<br>
ValueError: not enough values to unpack (expected 2, got 1)<br>
<br>
ERROR: Parsing halted due to errors, see error messages above<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3909" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/29/builds/3909</a><br>
<br>
Any clue about what might be wrong is welcome.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><br></div>Sivakumar B=
<span></span><span></span></div></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><br></div>Sivakumar B=
<span></span><span></span></div></div></div></div>

--0000000000002854a9065343d4af--

