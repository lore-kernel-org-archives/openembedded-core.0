Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C7CC0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 14:48:40 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.16824.1738248513061098048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 06:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f08QGTbO;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2161eb95317so15811365ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 06:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738248512; x=1738853312; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yWoMBP+SX3vZeOGBlr86Ygd7PTa3cOpjVQVF/5q9+58=;
        b=f08QGTbOE05ruvuoFdTrHs8ln+qZj1fba1xIo/ZaOhZPB+jkt8epxLZ1GY/J7gl1nS
         fyeGlguI+wmwQqSB6dRtXTHecsL9gXlCAYIZx/h3l1DXVkKbOV7y5AU3HFzKXN5Xk5ii
         Wwf+UYbXf7trG7DgtB8GGHmwFPiJtgin5sdUw44ypRwi6a56Cw3yUXiL8B9sXfQxn5Aa
         80TCsQia6NX6tkjP/ZTCf+roErM+OD1lFOiowKlqz0qgQGcpO5VvaOGdmE2QikPYikEg
         oIji07XUQ3QZe2JXMl+IRnnffI/YxX8aN8HQdooBrzTjxr6592AJ9BIBYWD+P1JHH2WO
         Uiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248512; x=1738853312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWoMBP+SX3vZeOGBlr86Ygd7PTa3cOpjVQVF/5q9+58=;
        b=kBhGdZ29Hk47VXA9tU/Ty/n3teigOlWpfvzRiFTVU6jcqpCkdjRV3+0C4eblkrE9xS
         RWoV9WwYu0OgFPooF5w+ZB/oemlfk1OLk5cwNCwl2puU7DMmRomqOi6xC2AAZ6MRPLMk
         4KF5aPmyu0oxAYCVS8DrNABcqYxoIJl420Nbtwq6IIhs6KoHXskN+snBy9AI1BKd0G0G
         HPigDXSKn0CWcxir0fCwsO/Jx00iShO5oFtWONBujgNV53XTyfCW3Hnc/aiXPX/tcMcX
         Va1Il50LYBXfDAJwtGy7ZyA+Ci+rrjHzKU/dRKqiPQbzZzPhSkAjV/KQCNP7/ihdapfE
         M1DA==
X-Gm-Message-State: AOJu0YwPL5pQCV7Q8o2bKS7KwaZtnli+kV7OlUjj2QaX45wYvBxqs0qE
	zHFLCpuxcE+Ssv2jcYo4smajwC0mxEKJovkn0i3skovRH8oKmiDruzDca+Wi8WN/oM1njE1uaTb
	yf3E3MaZvhN+nWtPrxLVlkdKtMwU=
X-Gm-Gg: ASbGnct6vK10ailfDL9DUQ1+T6wL5dUnNkb4xSZEldtbJ4EUI0wTYaBe3osiZT4olIz
	WdVNCyQ9Bzgu3CmkHTUoRkKR2IdyR85/rxI29/UaWk+ziSU29CtOBPwkgRRpuMdA+OprqEivYXw
	==
X-Google-Smtp-Source: AGHT+IGsvAClrG0XfTQA4l4XK0zl9+XUer5092kxl9KqIL233qlORO15lc0uUh80nXzuj5OpwvxOLqXxlhn+gXg0Wp0=
X-Received: by 2002:a17:902:f691:b0:21d:dba1:dd5e with SMTP id
 d9443c01a7336-21ddba1e30dmr93304515ad.25.1738248512172; Thu, 30 Jan 2025
 06:48:32 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxdbC-=6htz0g8i8NpcrmTsTpDXM0AkxtAO334KHEmKgu5Q@mail.gmail.com>
In-Reply-To: <CAOSpxdbC-=6htz0g8i8NpcrmTsTpDXM0AkxtAO334KHEmKgu5Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 30 Jan 2025 09:48:20 -0500
X-Gm-Features: AWEUYZkqGfPuSI_-4J2MBY_999Pia-Ad7UB2X_Nd33wjk5FZ6WmWv9sNmxpUTOk
Message-ID: <CADkTA4MDZb+_MBBNvKCMKm6xT_V_z_+C-pVj=xG8Ua-zSA3aZQ@mail.gmail.com>
Subject: Re: [OE-core] Request for discussion: Kernel version for LTS releases
To: steve@sakoman.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000197a55062ced857a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 14:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210448

--000000000000197a55062ced857a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 9:31=E2=80=AFAM Steve Sakoman via lists.openembedde=
d.org
<steve=3Dsakoman.com@lists.openembedded.org> wrote:

> As you may be aware, the support period for Linux kernel LTS releases
> has changed to two years. This presents a challenge for our Yocto LTS
> releases, which have 4 year support periods.
>
> In light of this, Richard sent an email to the Yocto architecture list
> in January of 2024 outlining the project's plans for kernel support in
> future LTS releases (copied below)
>
> TLDR: Around the midpoint of the Yocto Scarthgap LTS lifecycle we will
> backport the then current LTS kernel version and make it the default
> kernel version. The linux-libc-headers version would remain at the
> released version.
>
> At a recent Yocto Project Technical Team Meeting there was some
> discussion around the growing kernel CVE counts in the stable
> branches:
>
> kirkstone: 552
> scarthgap: 225
>
>
I hope these aren't based on the fact that I haven't sent the -stable
updates to the list yet. I do the older branches on a monthly
cadence, but can increase it. I have all active upstream kernels
on their latest -stable in linux-yocto already.



> For comparison the master branch CVE count for the kernel is 18
>
> The suggestion was made that we do this kernel version update sooner
> rather than later, and also include the Kirkstone LTS branch in order
> to deal with its large number of CVEs.  The original plan was to only
> do this version bump for Scarthgap, so this would be a change to the
> plan of record.
>

I don't think we should be updating kirstone to a new kernel while the
upstream kernel's are active. Both 5.15 and 5.10 are still active on
kernel.org and I'm still updating them, or am I missing something ?

That was the primary trigger around the updates: EOL on k.org

If we are now questioning the -stable process on k.org that it can't
keep up on these still active LTS kernels, that is a different question.

If we are questioning it, I have other suggestions around the
reference kernel versions.

But in the end, as long as the kernel we jump to is actively maintained
in our newer releases, there's not a lot of extra work so it is fine
with me. I just want to understand why we'd move kirkstone as well.

Cheers,

Bruce


>
> Please consider the above and respond to this email with any thoughts
> or concerns you may have about implementing this version bump in both
> LTS branches in the coming weeks.
>
> Thanks!
>
> Steve
>
>
> Full text of Richard's email:
>
> The project is aware that the kernel versions that ship in our next LTS
> in April will likely not have support for the full lifetime of our LTS
> (four years). We've been asked a few questions about this so we wanted
> to write down what our plan is.
>
> Our intent is to support the versions we ship with for as long as is
> practical. If they become end of life around the mid point of the LTS
> as expected, our plan is to backport a current LTS kernel at that time
> into the release and make it the default, leaving the older recipes
> there for anyone who still needs to use them. It would be based on the
> kernel in one of our future releases, as appropriate.
>
> The linux-libc-headers version would remain at the released version.
> This is used to control the features in the toolchain/userspace and
> there is no need to upgrade this to work with a newer kernel version.
> Upgrading it would potentially change the toolchain and userspace
> functionality and this is not desirable in the LTS. To be clear, this
> does mean bleeding edge features in the newer kernel may not be
> available but that is desirable in the context of the purpose of the
> LTS.
>
> The only reason the headers version would change would be to address a
> security issue in the toolchain or kernel/userspace interface.
>
> Since we don't know what the upstream kernel will do, or when exactly,
> it is hard to make a definitive plan beyond this.
>
> We appreciate this isn't our usual policy of "no upgrades", however if
> everyone knows this is the plan from the start, we believe that is
> different and everyone can plan accordingly, hence wanting to make this
> clear now.
>
> Since the project is planning to execute the full QA process against
> this new version, it is putting a plan in place to switch from the
> start and it plans not to test against any other version beyond that
> point, it makes most sense to directly integrate the changes rather
> than the mix in layer approach which is there for unplanned changes.
>
> To be clear, we may also update this plan if/as things develop in the
> other dependent ecosystems such as kernel as we can't know what will
> happen in these on the timescales involved.
>
> Cheers,
>
> Richard
> (on behalf of the Yocto Project TSC, LTS and kernel maintainers)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210447):
> https://lists.openembedded.org/g/openembedded-core/message/210447
> Mute This Topic: https://lists.openembedded.org/mt/110897884/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000197a55062ced857a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 30, 2025 at 9:31=
=E2=80=AFAM Steve Sakoman via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com@lists.ope=
nembedded.org">sakoman.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">As you may be aware, the s=
upport period for Linux kernel LTS releases<br>
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
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I hope these aren&#39;t based on the fact that I haven&#39=
;t sent the -stable</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">updates to the list yet. I do the older branches on a monthly</div><di=
v class=3D"gmail_default" style=3D"font-size:small">cadence, but can increa=
se it. I have all active upstream kernels</div><div class=3D"gmail_default"=
 style=3D"font-size:small">on their latest -stable in linux-yocto already.<=
/div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
For comparison the master branch CVE count for the kernel is 18<br>
<br>
The suggestion was made that we do this kernel version update sooner<br>
rather than later, and also include the Kirkstone LTS branch in order<br>
to deal with its large number of CVEs.=C2=A0 The original plan was to only<=
br>
do this version bump for Scarthgap, so this would be a change to the<br>
plan of record.<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">I don&#39;t think we should be updating kir=
stone to a new kernel while the</div></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">upstream kernel&#39;s are active. Both 5.15 and 5.10=
 are still active on=C2=A0</div><div class=3D"gmail_default" style=3D"font-=
size:small"><a href=3D"http://kernel.org">kernel.org</a> and I&#39;m still =
updating them, or am I missing something ?</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">That was the primary trigger around the updates: EOL on <=
a href=3D"http://k.org">k.org</a></div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">If we are now questioning the -stable process=C2=A0on <a href=3D=
"http://k.org">k.org</a> that it can&#39;t</div><div class=3D"gmail_default=
" style=3D"font-size:small">keep up on these still active LTS kernels, that=
 is a different question.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>If we are questioning it, I have other suggestions around the</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">reference kernel versions.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">But in the end, as long a=
s the kernel we jump to is actively maintained</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">in our newer releases, there&#39;s not a lo=
t of extra work so it is fine</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">with me. I just want to understand why we&#39;d move kirksto=
ne as well.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Cheers,</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div><div class=3D"gmail=
_default" style=3D"font-size:small">=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210447): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210447" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/210447</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110897884/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110897884/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000197a55062ced857a--

