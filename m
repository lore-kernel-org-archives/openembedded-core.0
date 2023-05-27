Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0F2C77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 20:52:13 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.17706.1685220731731674105
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 13:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qS82Urd4;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-96f7377c86aso355814466b.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 13:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685220730; x=1687812730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D/UQhz1smyrFWlzXP8ITYhq+dU1yPrX27KL4C0zMUVs=;
        b=qS82Urd4YgQPCfANViqiTPGAA3GxtJOwnQCImD/bnQpwTAgnDeG3XYbj3GDPsg0j+F
         ZAVEqbzV5UyIiEkIpPXJleKlsgLyRvp8+zwbQGp539siU3luF8V/Z/BeY5kWv+k70ZD+
         ZAo4rtShZzePs/y2G6RXZeheIidi8kJM3a37AbcOPXhqV0SEVZegjoZnySqEy2KuNl+w
         kCumV7jd07FGoreBanCbFR+caQPOyR3EDXJAJ4j3RqtUdbvXgKRt8/x3lObEqhYW6n4E
         Y8MgEj1sqX2ZkohtF18oj6gsIAYUiBOCiBVltGunAlEzy8aq5a8/IfmGDTb8EzD6V11Z
         YEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685220730; x=1687812730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/UQhz1smyrFWlzXP8ITYhq+dU1yPrX27KL4C0zMUVs=;
        b=TdM8HADahNaazGimg+iHul6D4zMyQpTuw0Zz58Ka3doiHEfYb/KPRcGF9uNj/iH/nV
         1MSkkeDnVaiCQijGHTM7oEPPw7U5K/kWSP8F4/NNI6qchCKEN5i4EBhBckBixUkKOYGK
         c7DlYNox/EET1tsf+w3cmqlHOMU6ggR8j7k9ovVnTAJNE6mr2B+QTKRPYV8RdzJIXIZ0
         H5f+g1hGjNgX1iGuXbZUNEVZim3rrPLAQTonA6s/bmV098dVaRhEPbKwKiyuQkQpb9+J
         nEttamiKkWL2BYvgmfrPHNZydEwv6bevBbAeT0kpzo0QwOOz4ZJwaCtvKhemdnziHJLu
         hJ0w==
X-Gm-Message-State: AC+VfDyvyfDhNJhVyQLC0b0FGWSjJKAEKyYwro3QE0yd7lny02Qlf6xk
	+/ouBQpxDxEcT7m4WB/Fht+N6fmPFvxaYJXdFVg=
X-Google-Smtp-Source: ACHHUZ6J5b0Tx2r21FfBM2uQo56aW8iSRE3mypNRiT8XTnIVIXWpAN1VoK8XLwOG/raVm3LLvjDnhN0VkON8oQdDYy4=
X-Received: by 2002:a17:907:96a1:b0:94f:2d5f:6949 with SMTP id
 hd33-20020a17090796a100b0094f2d5f6949mr7228248ejc.42.1685220729932; Sat, 27
 May 2023 13:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <f7d8cdc485e3d75304bd41931292f0cb76083e14.camel@linuxfoundation.org>
 <CA+chaQcE-qbPZ3yDcTRY1rPgoX5+baf73R=V0cVEb6ry3_yjzw@mail.gmail.com>
In-Reply-To: <CA+chaQcE-qbPZ3yDcTRY1rPgoX5+baf73R=V0cVEb6ry3_yjzw@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sat, 27 May 2023 13:51:57 -0700
Message-ID: <CACMJ4Gah+Oc71479siQdS1EMmqPA6JZZvQ4F0MGWYjD4XT6B1Q@mail.gmail.com>
Subject: Re: [OE-core] gcc 13 merged, meta-arm, meta-intel and meta-virt issues
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000f9ccd805fcb3067d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 20:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181809

--000000000000f9ccd805fcb3067d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 10:30=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.c=
om>
wrote:

> On Fri, May 26, 2023 at 6:28=E2=80=AFPM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> I just wanted to let people know I merged gcc 13 since I think we'd got
>> as far as we were going to without the patches landing. I dropped the
>> 5.15 kernel and found ways to fix lttng-tools and glib-2.0 ptest
>> issues.
>>
>> This leaves a few failures on the autobuilder in other layers:
>>
>> meta-arm 5.15 kernel bbappend:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4038/=
steps/12/logs/stdio
>>
>> meta-intel intel-mediasdk do_compile:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/4488/=
steps/13/logs/stdio
>>
>> meta-virt xen-tools do_compile:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1691/=
steps/12/logs/stdio
>
>
Have just posted updates to each of the current Xen version recipes to
update the revision to include the upstream fixes for gcc 13 compatibility.
Compile tested for x86 and Arm.


>
> and 5.15 kernel bbappend as well (only for rpi builds)
>
>  ./dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbapp=
end
>

and have posted an update to add a bbappend for the 6.1 kernel to replace
that one.

thanks

Christopher


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181777):
> https://lists.openembedded.org/g/openembedded-core/message/181777
> Mute This Topic: https://lists.openembedded.org/mt/99153341/3619037
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> christopher.w.clark@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f9ccd805fcb3067d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 26, 2023 at 10:30=E2=80=
=AFAM Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jan=
sa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Fri, May 26, 2023 at 6:28=
=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">I just wanted to let people know I merged gcc 13 since I thin=
k we&#39;d got<br>
as far as we were going to without the patches landing. I dropped the<br>
5.15 kernel and found ways to fix lttng-tools and glib-2.0 ptest<br>
issues.<br>
<br>
This leaves a few failures on the autobuilder in other layers:<br>
<br>
meta-arm 5.15 kernel bbappend:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/113/buil=
ds/4038/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4038/steps/12/log=
s/stdio</a><br>
<br>
meta-intel intel-mediasdk do_compile:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/100/buil=
ds/4488/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/100/builds/4488/steps/13/log=
s/stdio</a><br>
<br>
meta-virt xen-tools do_compile:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/128/buil=
ds/1691/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1691/steps/12/log=
s/stdio</a></blockquote></div></div></blockquote><div><br></div><div>Have j=
ust posted updates to each of the current Xen version recipes to update the=
 revision to include the upstream fixes for gcc 13 compatibility. Compile t=
ested for x86 and Arm.</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></=
div><div>and 5.15 kernel bbappend as well (only for rpi builds)</div><div>=
=C2=A0./dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bb=
append</div></div></div></blockquote><div><br></div><div>and have posted an=
 update to add a bbappend for the 6.1 kernel to=C2=A0replace that one.</div=
><div><br></div><div>thanks</div><div><br></div><div>Christopher</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181777): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181777" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/181777</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99153341/3619=
037" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99153341/3619037</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:christopher.w.clark@gmail.=
com" target=3D"_blank">christopher.w.clark@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f9ccd805fcb3067d--

