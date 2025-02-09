Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9A6C0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:27:52 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.39833.1739143669742025731
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 15:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JaBKCXZj;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f6d2642faso31037855ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 15:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739143669; x=1739748469; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=raC8dBiRfnH+uSa1r+TfEm3YcA7YpepaSpHD757Pl20=;
        b=JaBKCXZjJSLddRmQG6JroZEgSQBdX8aSQXRtqS1htcCcWhnUE1MY6sWQML4tCbdIFU
         sHpEbB++qAEgdYO3viffseQzCNvpeLqNG87ximBkGr0aJ2F5wt+cAWWBj1r2WgF/+2bQ
         7dwd65GnhZl2atSZHujJj7yCQs7ON3EgSngg3MDfQNGxFJpSmoo2dU6WbS40vaD5apv8
         R1mDnbK+GiTog8kz83uL4rr61PSrgMX3V6iZJfX6mSV1ZLnvlI7RmQWbH8DkCiGcbT5a
         EcxZu6U0C4cvp98fZ+KKgmB+hOYsQwMjnUTe77ZiMppZ4P+Q13ge+YbutOwAm4fxhAzW
         Zddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739143669; x=1739748469;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raC8dBiRfnH+uSa1r+TfEm3YcA7YpepaSpHD757Pl20=;
        b=iF26xlKCOZFcT0ieLGE52fgv3Ke2/Dm3idyXxCsjsqs+bu+vTqBmEm6XfZtqftx/7z
         THsAAeAnlTfUviHUTrnUKYJyvaSmjp8fUdKkVGYLpYcTvSFloDVEH++uAVWDShDkczdS
         M3tt2rBQr4P3vWuK8gvQNNfUdXDIKbD76uh8lb2FIYWOfNGIz3uO8xzYNEPc3n4Ez2qu
         bnF7MohqJY3MqdtogfuA+HCUpFIl+pY4ouyMf7DW36q3CVj0rZAbTHr8nXL4s91Gd8md
         VnlUkhBsGiOKiAP4UCoEeq1jmF9YK89k4WjWEcybynY8d0gm+x2fKZ7MQ1s2hTRPbxpE
         OFVg==
X-Forwarded-Encrypted: i=1; AJvYcCXBGqRbJgnF6G+dkVhfTi9E0lRKJwhAwVjgOksVx/C+vu+qZDwNa6AZOkLA9D6WOb1mJ6DFqnW0Pr1hXqH6IpBJOw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5vCgAZlS1h95DGx/GQAlGzV5KQkmCu3QqOho9CYm/wniDA8+q
	VRFPfL4gii66jtgYDwnzW9IkKtG2rMxc73AsR2WQl+81y/RNyNuykCYU+fQtPrmtRgufjoiRtYF
	0PZBlaDVL+5RPBjMS8tzisEHxwHE=
X-Gm-Gg: ASbGncvThyjSlGd6ju7qFak4Iq1yQcFqklZeRaF7jkx+k+V7lpY0o27edke1sL9Hcbn
	ozEHCsl5ulyMQgXWugM+IhgSFJ6Lj/sXwrOE6SoB7e4L5YmYidTYCt9M5qKMcBuVNcCCZb9TX
X-Google-Smtp-Source: AGHT+IG50X9vTXMiyBYLpbNw07vWWhu0wnDM4EyPYx2rUtI8HCpgykJZo67Ff/K9fIJEBUhI7Dp2mB3Lz5vGGRV1wFI=
X-Received: by 2002:a17:902:e946:b0:216:5af7:5a6a with SMTP id
 d9443c01a7336-21f4e75e66bmr213149675ad.32.1739143668891; Sun, 09 Feb 2025
 15:27:48 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxdbC-=6htz0g8i8NpcrmTsTpDXM0AkxtAO334KHEmKgu5Q@mail.gmail.com>
 <CADkTA4MDZb+_MBBNvKCMKm6xT_V_z_+C-pVj=xG8Ua-zSA3aZQ@mail.gmail.com> <CAB3asfgTmXaE9a=wC7wnT09ZbcwHeiVGNtadkYH9rZVi_pZjoQ@mail.gmail.com>
In-Reply-To: <CAB3asfgTmXaE9a=wC7wnT09ZbcwHeiVGNtadkYH9rZVi_pZjoQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 9 Feb 2025 18:27:42 -0500
X-Gm-Features: AWEUYZkAiU9FkqqLoNUSujsFFB_Do4GcIOyqp04OxhReshUPQcyhL30-4ifF7iA
Message-ID: <CADkTA4OHKxnGwHTmMpnVQRoEaN5Ly-7ygCr1Vn2UkgsOdAra7g@mail.gmail.com>
Subject: Re: [OE-core] Request for discussion: Kernel version for LTS releases
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: steve@sakoman.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000990c33062dbdf03a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 23:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211055

--000000000000990c33062dbdf03a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 5:58=E2=80=AFPM Adrian Freihofer <adrian.freihofer@g=
mail.com>
wrote:

> Hi Bruce
>
> Am Do., 30. Jan. 2025 um 15:48 Uhr schrieb Bruce Ashfield via
> lists.openembedded.org <bruce.ashfield=3Dgmail.com@lists.openembedded.org=
>:
>
>>
>>
>> On Thu, Jan 30, 2025 at 9:31=E2=80=AFAM Steve Sakoman via lists.openembe=
dded.org
>> <steve=3Dsakoman.com@lists.openembedded.org> wrote:
>>
>>> As you may be aware, the support period for Linux kernel LTS releases
>>> has changed to two years. This presents a challenge for our Yocto LTS
>>> releases, which have 4 year support periods.
>>>
>>> In light of this, Richard sent an email to the Yocto architecture list
>>> in January of 2024 outlining the project's plans for kernel support in
>>> future LTS releases (copied below)
>>>
>>> TLDR: Around the midpoint of the Yocto Scarthgap LTS lifecycle we will
>>> backport the then current LTS kernel version and make it the default
>>> kernel version. The linux-libc-headers version would remain at the
>>> released version.
>>>
>>> At a recent Yocto Project Technical Team Meeting there was some
>>> discussion around the growing kernel CVE counts in the stable
>>> branches:
>>>
>>> kirkstone: 552
>>> scarthgap: 225
>>>
>>>
>> I hope these aren't based on the fact that I haven't sent the -stable
>> updates to the list yet. I do the older branches on a monthly
>> cadence, but can increase it. I have all active upstream kernels
>> on their latest -stable in linux-yocto already.
>>
>
> Given the increasing importance of timely security updates and the rising
> frequency of new CVEs, staying as close as possible to the latest upstrea=
m
> kernels from kernel.org is becoming more essential than it was a few
> years ago.
> Additionally, patchsets such as preempt-RT, which were conveniently
> offered by
> the linux-yocto kernel, are now mainline.
>

We are creeping away from the question that Steve was asking,
not that these aren't valid things to ponder, but they have been
thought about many times and are revisited periodically .. that
being said, I'll offer some context below.

If you take an extremely narrow view of what we do with linux-yocto,
then sure (I won't repeat things here, since I've done no less than
three presentations on this in the past).

Not to mention there are still parts of -rt that are not mainline, and
early access BSPs, as well as SDKs that are part of linux-yocto,
kept on their own branches so as to not inflict themselves on all users.

linux-yocto has almost no delta from upstream timing wise when it is
available, and it isn't like we'd be doing a rolling release, the only lag
is our own embedded specific testing and validation. So there's nothing
to be gained on that front. I only asked that question to be sure that it
wasn't related to that (and it wasn't).


>
> This raises the question: Is a downstream linux-yocto kernel git
> repository still
> needed? From my naive user's perspective, it would be simpler and more
> transparent
> if the kernel were handled like any other recipe. Instead of a linux-yoct=
o
> recipe
> referring to a downstream git repository, there should be a linux and/or =
a
> linux-stable
> recipe referring to the corresponding git repositories from kernel.org.
>

Again, I'd refer to the various previous works on what we do with
linux-yocto, and we want fewer, not more reference kernels so we
can have the momentum around specific versions. (i.e. there would
be no advantage to splitting out -stable)

linux-yocto is bit for bit the same as upstream in the /base branches
exactly where it is fetched is the only difference.


> Ideally also the workflows for updating the kernel and testing the kernel
> would
> be possible with the Yocto standard workflows like devtool update and
> running
> oe-selftest.
>

That's already possible now, but how we use linux-yocto as a collection
point for contributions, BSPs, managing the versions, the workflow, etc
don't scale to slinging around directories full of patches (again, covered
in the various presentations).

We heavily test linux-yocto, so obviously oe-*test works, and you don't
chuck out a workflow that has scaled and worked for 15 years (and
predates devtool significantly if  devtool doesn't work (I have no idea, I
 don't use it and probably never will, but if it is important to folks, I
can
dive in and fix what is broken (I just need to know what is broken).

Back to Steve's question, and one of the other follow ups. We use
linux-yocto
as a point of momentum for versions, fixes, releases, etc. It always has
been
and always will be opt-in for people's distros and projects, so they are
free
to ignore it, or use it.

Bruce



>
> Thank you and regards,
> Adrian
>
>>
>>
>>> For comparison the master branch CVE count for the kernel is 18
>>>
>>> The suggestion was made that we do this kernel version update sooner
>>> rather than later, and also include the Kirkstone LTS branch in order
>>> to deal with its large number of CVEs.  The original plan was to only
>>> do this version bump for Scarthgap, so this would be a change to the
>>> plan of record.
>>>
>>
>> I don't think we should be updating kirstone to a new kernel while the
>> upstream kernel's are active. Both 5.15 and 5.10 are still active on
>> kernel.org and I'm still updating them, or am I missing something ?
>>
>> That was the primary trigger around the updates: EOL on k.org
>>
>> If we are now questioning the -stable process on k.org that it can't
>> keep up on these still active LTS kernels, that is a different question.
>>
>> If we are questioning it, I have other suggestions around the
>> reference kernel versions.
>>
>> But in the end, as long as the kernel we jump to is actively maintained
>> in our newer releases, there's not a lot of extra work so it is fine
>> with me. I just want to understand why we'd move kirkstone as well.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>>
>>> Please consider the above and respond to this email with any thoughts
>>> or concerns you may have about implementing this version bump in both
>>> LTS branches in the coming weeks.
>>>
>>> Thanks!
>>>
>>> Steve
>>>
>>>
>>> Full text of Richard's email:
>>>
>>> The project is aware that the kernel versions that ship in our next LTS
>>> in April will likely not have support for the full lifetime of our LTS
>>> (four years). We've been asked a few questions about this so we wanted
>>> to write down what our plan is.
>>>
>>> Our intent is to support the versions we ship with for as long as is
>>> practical. If they become end of life around the mid point of the LTS
>>> as expected, our plan is to backport a current LTS kernel at that time
>>> into the release and make it the default, leaving the older recipes
>>> there for anyone who still needs to use them. It would be based on the
>>> kernel in one of our future releases, as appropriate.
>>>
>>> The linux-libc-headers version would remain at the released version.
>>> This is used to control the features in the toolchain/userspace and
>>> there is no need to upgrade this to work with a newer kernel version.
>>> Upgrading it would potentially change the toolchain and userspace
>>> functionality and this is not desirable in the LTS. To be clear, this
>>> does mean bleeding edge features in the newer kernel may not be
>>> available but that is desirable in the context of the purpose of the
>>> LTS.
>>>
>>> The only reason the headers version would change would be to address a
>>> security issue in the toolchain or kernel/userspace interface.
>>>
>>> Since we don't know what the upstream kernel will do, or when exactly,
>>> it is hard to make a definitive plan beyond this.
>>>
>>> We appreciate this isn't our usual policy of "no upgrades", however if
>>> everyone knows this is the plan from the start, we believe that is
>>> different and everyone can plan accordingly, hence wanting to make this
>>> clear now.
>>>
>>> Since the project is planning to execute the full QA process against
>>> this new version, it is putting a plan in place to switch from the
>>> start and it plans not to test against any other version beyond that
>>> point, it makes most sense to directly integrate the changes rather
>>> than the mix in layer approach which is there for unplanned changes.
>>>
>>> To be clear, we may also update this plan if/as things develop in the
>>> other dependent ecosystems such as kernel as we can't know what will
>>> happen in these on the timescales involved.
>>>
>>> Cheers,
>>>
>>> Richard
>>> (on behalf of the Yocto Project TSC, LTS and kernel maintainers)
>>>
>>>
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#210448):
>> https://lists.openembedded.org/g/openembedded-core/message/210448
>> Mute This Topic: https://lists.openembedded.org/mt/110897884/4454582
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> adrian.freihofer@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000990c33062dbdf03a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 9, 2025 at 5:58=
=E2=80=AFPM Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@gmail.c=
om">adrian.freihofer@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Bruce<br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Do., 30.=
 Jan. 2025 um 15:48=C2=A0Uhr schrieb Bruce Ashfield via <a href=3D"http://l=
ists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;bru=
ce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D=
"_blank">gmail.com@lists.openembedded.org</a>&gt;:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div s=
tyle=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 30, 2025 at 9:31=E2=80=AFAM =
Steve Sakoman via <a href=3D"http://lists.openembedded.org" target=3D"_blan=
k">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com@lis=
ts.openembedded.org" target=3D"_blank">sakoman.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">As=
 you may be aware, the support period for Linux kernel LTS releases<br>
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
=3D"http://kernel.org" target=3D"_blank">kernel.org</a> is becoming more es=
sential than it was a few years ago.</div><div>Additionally, patchsets such=
 as preempt-RT, which were conveniently offered by</div><div>the linux-yoct=
o kernel, are now mainline.<br></div></div></div></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">We are creepi=
ng away from the question that Steve was asking,</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">not that these aren&#39;t valid things to=
 ponder, but they have been</div><div class=3D"gmail_default" style=3D"font=
-size:small">thought about many times and are revisited periodically .. tha=
t</div><div class=3D"gmail_default" style=3D"font-size:small">being said, I=
&#39;ll offer some context below.</div></div><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">If you take an extremely narro=
w view of what we do with linux-yocto,</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">then sure (I won&#39;t repeat things here, since I&=
#39;ve done no less than<br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">three presentations on this in the past).</div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">Not to mention ther=
e are still parts of -rt that are not mainline, and</div><div class=3D"gmai=
l_default" style=3D"font-size:small">early access BSPs, as well as SDKs tha=
t are part of linux-yocto,</div></div><div class=3D"gmail_default" style=3D=
"font-size:small">kept on their own branches so as to not inflict themselve=
s on all users.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">linux-yoc=
to has almost no delta from upstream timing wise when it is</div><div class=
=3D"gmail_default" style=3D"font-size:small">available, and it isn&#39;t li=
ke we&#39;d be doing a rolling release, the only lag</div><div class=3D"gma=
il_default" style=3D"font-size:small">is our own embedded specific testing =
and validation. So there&#39;s nothing=C2=A0</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">to be gained on that front. I only asked that=
 question to be sure that it</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">wasn&#39;t related to that (and it wasn&#39;t).</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_quote"><div><br>This raises the question: Is a downstr=
eam linux-yocto kernel git repository still</div><div>needed? From my naive=
 user&#39;s perspective, it would be simpler and more transparent</div><div=
>if the kernel were handled like any other recipe. Instead of a linux-yocto=
 recipe</div><div>referring to a downstream git repository, there should be=
 a linux and/or a linux-stable</div><div>recipe referring to the correspond=
ing git repositories from <a href=3D"http://kernel.org" target=3D"_blank">k=
ernel.org</a>.</div></div></div></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Again, I&#39;d refer to the va=
rious previous works on what we do with</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">linux-yocto, and we want fewer, not more reference=
 kernels so we</div><div class=3D"gmail_default" style=3D"font-size:small">=
can have the momentum around specific versions. (i.e. there would</div><div=
 class=3D"gmail_default" style=3D"font-size:small">be no advantage to split=
ting out -stable)</div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">linux-yocto is bit for bit the same as upstream in the /b=
ase branches</div><div class=3D"gmail_default" style=3D"font-size:small">ex=
actly where it is fetched is the only difference.</div></div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div></div></div><div class=3D"gmail_quote"><br></div><=
div class=3D"gmail_quote">Ideally also the workflows for updating the kerne=
l and testing the kernel would</div><div class=3D"gmail_quote">be possible =
with the Yocto standard workflows like devtool update and running</div><div=
 class=3D"gmail_quote">oe-selftest.<br></div></div></blockquote><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">That&#39;s =
already possible now, but how we use linux-yocto as a collection</div><div =
class=3D"gmail_default" style=3D"font-size:small">point for contributions, =
BSPs, managing the versions, the workflow, etc</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">don&#39;t scale to slinging around director=
ies full of patches (again, covered</div><div class=3D"gmail_default" style=
=3D"font-size:small">in the various presentations).</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">We heavily test linux-yocto, so obviously oe-*te=
st works, and you don&#39;t</div><div class=3D"gmail_default" style=3D"font=
-size:small">chuck out a workflow that has scaled and worked for 15 years (=
and</div><div class=3D"gmail_default" style=3D"font-size:small">predates de=
vtool significantly if=C2=A0 devtool doesn&#39;t work (I have no idea, I</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0don&#39;t u=
se it and probably never will, but if it is important to folks, I can</div>=
<div class=3D"gmail_default" style=3D"font-size:small">dive in and fix what=
 is broken (I just need to know what is broken).</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Back to Steve&#39;s question, and one of the other =
follow ups. We use linux-yocto</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">as a point of momentum for versions, fixes, releases, etc. =
It always has been</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">and always will be opt-in for people&#39;s distros and projects, so the=
y are free</div><div class=3D"gmail_default" style=3D"font-size:small">to i=
gnore it, or use it.=C2=A0</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"></div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Thank you and regards=
,</div><div class=3D"gmail_quote">Adrian<br></div><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
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
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000990c33062dbdf03a--

