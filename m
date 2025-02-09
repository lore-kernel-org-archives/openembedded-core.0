Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1919C0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 22:58:42 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.39282.1739141916916170958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 14:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iARJgg5V;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f3ac0c8053so417279b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 14:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739141916; x=1739746716; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=szdtlHkqwlSvY+9z6hmMGg/202HJj5BSUSuDutPqZxA=;
        b=iARJgg5V1qYU4kjsswgLgySUnOKaoUsAk9js8zymB8tpthJsVXl+E9ywnavzZ+6gXK
         fQdiy8fRtLmHNFC9Gva4W8Wanx+gy4woNtW/twQit12U0/KKHyLpjZX7eTxJin6eziIG
         WhaQubLQZZq5n0jtoft9e67dddb67FiG4zfgLgvqetCkdapjei3gSpKHJgS2QbWNBfEP
         uhOaPv0Qbrz1FYNyPeNmyYGD5rGOclsoRaL2znAI1v4yQ7x9mhGkIJCV/phDzcdh4deh
         +FqQ8O5x9UKXuKqOHtaxQ9ddpP/Et7BMXS/kpiLAvcTAwTpz6Ap9Ljc+yU3qtRLq0NUo
         cWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739141916; x=1739746716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szdtlHkqwlSvY+9z6hmMGg/202HJj5BSUSuDutPqZxA=;
        b=HjuSLLSHrkN987ryZ61CtwFwFQA635RBfqwEGH5o6eCTAtlrCK0HoB3QfPkovYshBT
         GGJmr3HFRdcQTFiPR5G0rsAoJ1EZHGRpui01sN764QDT7bC49tjbKUQ7b+RpWbP7zMaW
         qQANg0FkzftKLY0XKtfg21FoVrJ5Zf0DSGNFpdWQx/axeEgOay8wW+py3cFBDzI0Vrg1
         FrvC4xGmlzOceSV09CLLOxNBbbExE7pHMAlNSJ1HHAOlaoLzE8YSgCWkzG5drFGDvQOc
         mZYlEmQogVZ0hB7B3CyKpf845Z1rdopzymerep8hFLl162j4ym2PkSYIhKIeN51cHjrr
         YREg==
X-Forwarded-Encrypted: i=1; AJvYcCXrFcMoQNmk0xOFUl/BH8HMr0/LgQWxlAJQsIP7gpke7nvABYSLHvjYBQC85oQwaobf7ehJB4Eyeeb9IdkLPwYkyg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4zDAYUg6+ywVUsXmts+fTl2Fyn/tz3kpe37mLAP5XMxT2PwEA
	2yiue3wbvpLfMz9go4u9N8jfRITeHvg4OVhsOq6F6HZCB0wXFFiCJstkI8IR1FRWgD6yH97yqL1
	6F1biQHOuQRTttmlICDJpF/qLvsg=
X-Gm-Gg: ASbGncvviQMbDn70m+RNcQyemp/ZANjgQmBboErbtiExiopVQjw7K3jIijvRz450VY0
	7nDwFFlDAqjNHUeFzPBAgxoC0+MbHoiMDjxWRToqhrMpZ2iVoxnJmygag4L3q+9Qo9fto7ptAYA
	==
X-Google-Smtp-Source: AGHT+IE8sGrykQSJJRva4pU5zoRJW3XuyyrejmVdQH07/E8gNC2oOJqWr9v0jta7mUFmNTOsG49xohxO9PLJXWd+qvI=
X-Received: by 2002:a05:6808:1995:b0:3ea:5161:f71 with SMTP id
 5614622812f47-3f392299511mr7373303b6e.20.1739141916090; Sun, 09 Feb 2025
 14:58:36 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxdbC-=6htz0g8i8NpcrmTsTpDXM0AkxtAO334KHEmKgu5Q@mail.gmail.com>
 <CADkTA4MDZb+_MBBNvKCMKm6xT_V_z_+C-pVj=xG8Ua-zSA3aZQ@mail.gmail.com>
In-Reply-To: <CADkTA4MDZb+_MBBNvKCMKm6xT_V_z_+C-pVj=xG8Ua-zSA3aZQ@mail.gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Sun, 9 Feb 2025 23:58:24 +0100
X-Gm-Features: AWEUYZnqOOUPAQkqLoQuBZfVaHOPF-qsh--xNXh6P0_R3fUmyLK_rkLcKd1DYEk
Message-ID: <CAB3asfgTmXaE9a=wC7wnT09ZbcwHeiVGNtadkYH9rZVi_pZjoQ@mail.gmail.com>
Subject: Re: [OE-core] Request for discussion: Kernel version for LTS releases
To: bruce.ashfield@gmail.com
Cc: steve@sakoman.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001f6e80062dbd88fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 22:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211054

--0000000000001f6e80062dbd88fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce

Am Do., 30. Jan. 2025 um 15:48 Uhr schrieb Bruce Ashfield via
lists.openembedded.org <bruce.ashfield=3Dgmail.com@lists.openembedded.org>:

>
>
> On Thu, Jan 30, 2025 at 9:31=E2=80=AFAM Steve Sakoman via lists.openembed=
ded.org
> <steve=3Dsakoman.com@lists.openembedded.org> wrote:
>
>> As you may be aware, the support period for Linux kernel LTS releases
>> has changed to two years. This presents a challenge for our Yocto LTS
>> releases, which have 4 year support periods.
>>
>> In light of this, Richard sent an email to the Yocto architecture list
>> in January of 2024 outlining the project's plans for kernel support in
>> future LTS releases (copied below)
>>
>> TLDR: Around the midpoint of the Yocto Scarthgap LTS lifecycle we will
>> backport the then current LTS kernel version and make it the default
>> kernel version. The linux-libc-headers version would remain at the
>> released version.
>>
>> At a recent Yocto Project Technical Team Meeting there was some
>> discussion around the growing kernel CVE counts in the stable
>> branches:
>>
>> kirkstone: 552
>> scarthgap: 225
>>
>>
> I hope these aren't based on the fact that I haven't sent the -stable
> updates to the list yet. I do the older branches on a monthly
> cadence, but can increase it. I have all active upstream kernels
> on their latest -stable in linux-yocto already.
>

Given the increasing importance of timely security updates and the rising
frequency of new CVEs, staying as close as possible to the latest upstream
kernels from kernel.org is becoming more essential than it was a few years
ago.
Additionally, patchsets such as preempt-RT, which were conveniently offered
by
the linux-yocto kernel, are now mainline.

This raises the question: Is a downstream linux-yocto kernel git repository
still
needed? From my naive user's perspective, it would be simpler and more
transparent
if the kernel were handled like any other recipe. Instead of a linux-yocto
recipe
referring to a downstream git repository, there should be a linux and/or a
linux-stable
recipe referring to the corresponding git repositories from kernel.org.

Ideally also the workflows for updating the kernel and testing the kernel
would
be possible with the Yocto standard workflows like devtool update and
running
oe-selftest.

Thank you and regards,
Adrian

>
>
>> For comparison the master branch CVE count for the kernel is 18
>>
>> The suggestion was made that we do this kernel version update sooner
>> rather than later, and also include the Kirkstone LTS branch in order
>> to deal with its large number of CVEs.  The original plan was to only
>> do this version bump for Scarthgap, so this would be a change to the
>> plan of record.
>>
>
> I don't think we should be updating kirstone to a new kernel while the
> upstream kernel's are active. Both 5.15 and 5.10 are still active on
> kernel.org and I'm still updating them, or am I missing something ?
>
> That was the primary trigger around the updates: EOL on k.org
>
> If we are now questioning the -stable process on k.org that it can't
> keep up on these still active LTS kernels, that is a different question.
>
> If we are questioning it, I have other suggestions around the
> reference kernel versions.
>
> But in the end, as long as the kernel we jump to is actively maintained
> in our newer releases, there's not a lot of extra work so it is fine
> with me. I just want to understand why we'd move kirkstone as well.
>
> Cheers,
>
> Bruce
>
>
>>
>> Please consider the above and respond to this email with any thoughts
>> or concerns you may have about implementing this version bump in both
>> LTS branches in the coming weeks.
>>
>> Thanks!
>>
>> Steve
>>
>>
>> Full text of Richard's email:
>>
>> The project is aware that the kernel versions that ship in our next LTS
>> in April will likely not have support for the full lifetime of our LTS
>> (four years). We've been asked a few questions about this so we wanted
>> to write down what our plan is.
>>
>> Our intent is to support the versions we ship with for as long as is
>> practical. If they become end of life around the mid point of the LTS
>> as expected, our plan is to backport a current LTS kernel at that time
>> into the release and make it the default, leaving the older recipes
>> there for anyone who still needs to use them. It would be based on the
>> kernel in one of our future releases, as appropriate.
>>
>> The linux-libc-headers version would remain at the released version.
>> This is used to control the features in the toolchain/userspace and
>> there is no need to upgrade this to work with a newer kernel version.
>> Upgrading it would potentially change the toolchain and userspace
>> functionality and this is not desirable in the LTS. To be clear, this
>> does mean bleeding edge features in the newer kernel may not be
>> available but that is desirable in the context of the purpose of the
>> LTS.
>>
>> The only reason the headers version would change would be to address a
>> security issue in the toolchain or kernel/userspace interface.
>>
>> Since we don't know what the upstream kernel will do, or when exactly,
>> it is hard to make a definitive plan beyond this.
>>
>> We appreciate this isn't our usual policy of "no upgrades", however if
>> everyone knows this is the plan from the start, we believe that is
>> different and everyone can plan accordingly, hence wanting to make this
>> clear now.
>>
>> Since the project is planning to execute the full QA process against
>> this new version, it is putting a plan in place to switch from the
>> start and it plans not to test against any other version beyond that
>> point, it makes most sense to directly integrate the changes rather
>> than the mix in layer approach which is there for unplanned changes.
>>
>> To be clear, we may also update this plan if/as things develop in the
>> other dependent ecosystems such as kernel as we can't know what will
>> happen in these on the timescales involved.
>>
>> Cheers,
>>
>> Richard
>> (on behalf of the Yocto Project TSC, LTS and kernel maintainers)
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210448):
> https://lists.openembedded.org/g/openembedded-core/message/210448
> Mute This Topic: https://lists.openembedded.org/mt/110897884/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001f6e80062dbd88fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bruce<br></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Do., 30. Jan. 20=
25 um 15:48=C2=A0Uhr schrieb Bruce Ashfield via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;bruce.ashfield=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Jan 30, 2025 at 9:31=E2=80=AFAM Steve Sakoman via <a href=3D"http://lists.o=
penembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;steve=3D<=
a href=3D"mailto:sakoman.com@lists.openembedded.org" target=3D"_blank">sako=
man.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">As you may be aware, the support period for L=
inux kernel LTS releases<br>
has changed to two years. This presents a challenge for our Yocto LTS<br>
releases, which have 4 year support periods.<br>
<br>
In light of this, Richard sent an email to the Yocto architecture list<br>
in January of 2024 outlining the project&#39;s plans for kernel support in<=
br>
future LTS releases (copied below)<br>
<br>
TLDR: Around the midpoint of the Yocto Scarthgap LTS lifecycle we will<br>
backport the then current LTS kernel version and make it the default<br>
kernel version. The linux-libc-headers version would remain at the<br>
released version.<br>
<br>
At a recent Yocto Project Technical Team Meeting there was some<br>
discussion around the growing kernel CVE counts in the stable<br>
branches:<br>
<br>
kirkstone: 552<br>
scarthgap: 225<br>
<br></blockquote><div><br></div><div><div style=3D"font-size:small">I hope =
these aren&#39;t based on the fact that I haven&#39;t sent the -stable</div=
><div style=3D"font-size:small">updates to the list yet. I do the older bra=
nches on a monthly</div><div style=3D"font-size:small">cadence, but can inc=
rease it. I have all active upstream kernels</div><div style=3D"font-size:s=
mall">on their latest -stable in linux-yocto already.</div></div></div></di=
v></blockquote><div><br></div><div>Given the increasing importance of timel=
y security updates and the rising</div><div>frequency of new CVEs, staying =
as close as possible to the latest upstream</div><div>kernels from <a href=
=3D"http://kernel.org">kernel.org</a> is becoming more essential than it wa=
s a few years ago.</div><div>Additionally, patchsets such as preempt-RT, wh=
ich were conveniently offered by</div><div>the linux-yocto kernel, are now =
mainline.<br><br>This raises the question: Is a downstream linux-yocto kern=
el git repository still</div><div>needed? From my naive user&#39;s perspect=
ive, it would be simpler and more transparent</div><div>if the kernel were =
handled like any other recipe. Instead of a linux-yocto recipe</div><div>re=
ferring to a downstream git repository, there should be a linux and/or a li=
nux-stable</div><div>recipe referring to the corresponding git repositories=
 from <a href=3D"http://kernel.org">kernel.org</a>.</div><div></div></div><=
div class=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gma=
il_quote gmail_quote_container">Ideally also the workflows for updating the=
 kernel and testing the kernel would</div><div class=3D"gmail_quote gmail_q=
uote_container">be possible with the Yocto standard workflows like devtool =
update and running</div><div class=3D"gmail_quote gmail_quote_container">oe=
-selftest.<br></div><div class=3D"gmail_quote gmail_quote_container"><br></=
div><div class=3D"gmail_quote gmail_quote_container">Thank you and regards,=
</div><div class=3D"gmail_quote gmail_quote_container">Adrian<br></div><div=
 class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
For comparison the master branch CVE count for the kernel is 18<br>
<br>
The suggestion was made that we do this kernel version update sooner<br>
rather than later, and also include the Kirkstone LTS branch in order<br>
to deal with its large number of CVEs.=C2=A0 The original plan was to only<=
br>
do this version bump for Scarthgap, so this would be a change to the<br>
plan of record.<br></blockquote><div><br></div><div><div style=3D"font-size=
:small">I don&#39;t think we should be updating kirstone to a new kernel wh=
ile the</div></div><div style=3D"font-size:small">upstream kernel&#39;s are=
 active. Both 5.15 and 5.10 are still active on=C2=A0</div><div style=3D"fo=
nt-size:small"><a href=3D"http://kernel.org" target=3D"_blank">kernel.org</=
a> and I&#39;m still updating them, or am I missing something ?</div><div s=
tyle=3D"font-size:small"><br></div><div style=3D"font-size:small">That was =
the primary trigger around the updates: EOL on <a href=3D"http://k.org" tar=
get=3D"_blank">k.org</a></div><div style=3D"font-size:small"><br></div><div=
 style=3D"font-size:small">If we are now questioning the -stable process=C2=
=A0on <a href=3D"http://k.org" target=3D"_blank">k.org</a> that it can&#39;=
t</div><div style=3D"font-size:small">keep up on these still active LTS ker=
nels, that is a different question.</div><div style=3D"font-size:small"><br=
></div><div style=3D"font-size:small">If we are questioning it, I have othe=
r suggestions around the</div><div style=3D"font-size:small">reference kern=
el versions.</div><div style=3D"font-size:small"><br></div><div style=3D"fo=
nt-size:small">But in the end, as long as the kernel we jump to is actively=
 maintained</div><div style=3D"font-size:small">in our newer releases, ther=
e&#39;s not a lot of extra work so it is fine</div><div style=3D"font-size:=
small">with me. I just want to understand why we&#39;d move kirkstone as we=
ll.</div><div style=3D"font-size:small"><br></div><div style=3D"font-size:s=
mall">Cheers,</div><div style=3D"font-size:small"><br></div><div style=3D"f=
ont-size:small">Bruce</div><div style=3D"font-size:small">=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Please consider the above and respond to this email with any thoughts<br>
or concerns you may have about implementing this version bump in both<br>
LTS branches in the coming weeks.<br>
<br>
Thanks!<br>
<br>
Steve<br>
<br>
<br>
Full text of Richard&#39;s email:<br>
<br>
The project is aware that the kernel versions that ship in our next LTS<br>
in April will likely not have support for the full lifetime of our LTS<br>
(four years). We&#39;ve been asked a few questions about this so we wanted<=
br>
to write down what our plan is.<br>
<br>
Our intent is to support the versions we ship with for as long as is<br>
practical. If they become end of life around the mid point of the LTS<br>
as expected, our plan is to backport a current LTS kernel at that time<br>
into the release and make it the default, leaving the older recipes<br>
there for anyone who still needs to use them. It would be based on the<br>
kernel in one of our future releases, as appropriate.<br>
<br>
The linux-libc-headers version would remain at the released version.<br>
This is used to control the features in the toolchain/userspace and<br>
there is no need to upgrade this to work with a newer kernel version.<br>
Upgrading it would potentially change the toolchain and userspace<br>
functionality and this is not desirable in the LTS. To be clear, this<br>
does mean bleeding edge features in the newer kernel may not be<br>
available but that is desirable in the context of the purpose of the<br>
LTS.<br>
<br>
The only reason the headers version would change would be to address a<br>
security issue in the toolchain or kernel/userspace interface.<br>
<br>
Since we don&#39;t know what the upstream kernel will do, or when exactly,<=
br>
it is hard to make a definitive plan beyond this.<br>
<br>
We appreciate this isn&#39;t our usual policy of &quot;no upgrades&quot;, h=
owever if<br>
everyone knows this is the plan from the start, we believe that is<br>
different and everyone can plan accordingly, hence wanting to make this<br>
clear now.<br>
<br>
Since the project is planning to execute the full QA process against<br>
this new version, it is putting a plan in place to switch from the<br>
start and it plans not to test against any other version beyond that<br>
point, it makes most sense to directly integrate the changes rather<br>
than the mix in layer approach which is there for unplanned changes.<br>
<br>
To be clear, we may also update this plan if/as things develop in the<br>
other dependent ecosystems such as kernel as we can&#39;t know what will<br=
>
happen in these on the timescales involved.<br>
<br>
Cheers,<br>
<br>
Richard<br>
(on behalf of the Yocto Project TSC, LTS and kernel maintainers)<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210448): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210448" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/210448</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110897884/445=
4582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110897884/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:adrian.freihofer@gmail.com=
" target=3D"_blank">adrian.freihofer@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001f6e80062dbd88fa--

