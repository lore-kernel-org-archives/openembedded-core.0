Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E8BCC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:03:19 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3481.1791885778482127337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Lrt3ERum;
 spf=pass (domain: snapchat.com, ip: 209.85.221.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-486e8faff03so1167915f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 03:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791885776; cv=none;
        d=google.com; s=arc-20260327;
        b=SvIMzvasxbMwbpjfsI+9aOyXDlanN6bTBA8ptWTHuV3+9HpZbMxb4wvD3Jscd/6RBd
         dZb7YlbJpwFpA3w1dtEhJpu8e4Y+HFv4+H6aawdvMdsjB3ZXeqPpvo7q5aynCGzR73L1
         3foad/KuXzaHgNDkW0VNFfd8ZuwJdEKR4/H+qZF20/7dnAeZo1bzi0cSzzJq8W0b8W0k
         RFQQWwhv71FXEYscx8D08/gop+JSztbIfviqS+4axhzliku+vcA1ztWK+YP0bpYL1OC3
         dXfh8mNUoTjjw5t3irQ0s3clzcaShAmc8F0mSZa6q50bo5+bpQKFAStP3pAQXBCJsoBo
         EJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i02TV1JgfJnf4sDwEsHaLCMrALnsZAnCopx7MPg8IKg=;
        fh=RXcbh/D9WbCmavEojPicfggR19SS2WXVrVJb3Yw4r9Y=;
        b=ASuMVE4Zx2D7F3hqGd0QWQgnA/eh1eF4Pt54WVviE94yGDBNIZs9h26MXDWCK5xY9Z
         3q8ZiAkvzjK8ZelhrolrjbhBrgamCWZfqf9tCkPwYyw1bRHHinTvGuLg2u4rRrvI1Cay
         LSij90gbSlB3fDNJDBjCO9MtrqxJ5ZFiRSC5vTJCLPqDlSoGVpTZk7xb2cGhtLtqeXbY
         IeHyFbNLtvfbLvtyiq5AhFMQ1ySEoTbdxPfEYpRaqcjEcGUGHKSWDgWme/LDbK6lqTLE
         +91SSpBZVYbWb7vsuLD8wAaBFar27YAbZpRGiSqQHgR9LEM5Ya7XdwTX2w/wOBGVYHTD
         nPUQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1791885776; x=1792490576; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i02TV1JgfJnf4sDwEsHaLCMrALnsZAnCopx7MPg8IKg=;
        b=Lrt3ERump523memk8Z32FAQIwFDOJYZLP5vRqbfH5+Zm0Vn/YEU3sf3NHBW1DmPi3e
         n9V1dN/p0S0OWzk1nKy8KBk11SBzH6ckhDIXnl83fixBOq3cLlY9oJa1gCjakSGxs5bN
         63jRfUAcR6tQPMtEoWqexy63//1kugvykGLkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885776; x=1792490576;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i02TV1JgfJnf4sDwEsHaLCMrALnsZAnCopx7MPg8IKg=;
        b=doEQr7MyGgXHICZes2/ktpt3qxYyue69WQMKx7G8s/KK+PjZpT3cu4bEhusvZ3wM6D
         pEa67Llb2ARECunEjk0wgQOL54bjNC/Se+pbXUvoXfyLMqtoQDH1nLNcI9QiJ9kO+4E1
         XUmnUIum0Acyvs/nlBYjyQF2ydNn8EzJq6MWg91ZQu7G+PX1Z6Vv0AuhwihHI7JwApKH
         pYAx/ORFJWxhfvxZbduYIGmk8qiZvmHYxJuqJDqlX3/e3ezRBfwlsujUjInOGvw+xEoc
         G745lSDqMClnve5jWlW8bxeSwMA4Wtdu/noDJUcKjRlCHTRdOjiPdHFbn4s3qsTbIsOm
         qGKQ==
X-Gm-Message-State: AFq9FYJWp7MtamNz+iIQ5y8nq2AxBoAwwn53IenIWGyKXSRjzV9d2LuI
	y+c/JNINLeuHZTu7O8/3WkpYfPD/PbnfNAT1AFLtChwX9tNB3fr5H7AEZoFbQHN1iZJIt/ztG9b
	i/l8aGxCJt4VVnNZAaufdelmT8CcyXVkzpsG/uwfIlQ==
X-Gm-Gg: AYBFou3a/Izx6yBwGfK6eWrFQqzxtW/LaMrj25T+SBbH7aYuZXs2fU36Gz0hgGjAflE
	EQmGnQ13u50zqobaCMuWds9c/rXlvUeOzLNjMOJsxALdbEt899KwNHXuithpxkL18yeRpW9Xqds
	iH8nwdNKNwp75oCDoIpQIkGXe2UA0I3al29SYt4e27VSm3gNGWVwAby4faeFXRQTXAIolRTO1nf
	i5mMzLPThfl/IweY+OBYmGGWSDyPGTXeYzZczYOWW0urISq7KWPGOdKr4KZLfr/ZLI/UfUhvn/A
	wAXR2JZgRkNbWf+7z2uPeJyJNQBAi4DF57WBkngl8mRl7lp+Ybar/No0OxvCOXEcugr2DrL50WI
	sFxs5+vbS8iG0CWLhHmyvbbaD
X-Received: by 2002:a05:6000:2992:10b0:488:654b:ccd8 with SMTP id
 ffacd0b85a97d-48dba7819famr15810214f8f.6.1791885775966; Tue, 13 Oct 2026
 03:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20261010113029.2347847-1-ecordonnier@snap.com>
 <CANNYZj9kcJ+_Q8gEtmLYqKjwLsHogY1o4b8MeZQf6jTgDp3gtg@mail.gmail.com>
 <CAHUKmYZOUvohA9psyEiJ251a9mCnTteUDkdAVU1LEAAFC_PdZw@mail.gmail.com> <CANNYZj9y8xONSSQAAjov-5QSeTEkjD_iahpu-bUpn5kzGnbOQQ@mail.gmail.com>
In-Reply-To: <CANNYZj9y8xONSSQAAjov-5QSeTEkjD_iahpu-bUpn5kzGnbOQQ@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 13 Oct 2026 12:02:44 +0200
X-Gm-Features: AclHuK9nu1Fv3teXnmm1Vciy5mEQyO7yE6ysCUlfexcnQEeoIemnerqOxvBUCf8
Message-ID: <CAHUKmYbEwbbsx+DeAvw+wf9AggQws0G4nGbjWe=Wp4ESxe5kaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uutils-coreutils: move from meta-openembedded
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, collin.funk1@gmail.com
Content-Type: multipart/alternative; boundary="00000000000028137c065db5eb7a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 10:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247713

--00000000000028137c065db5eb7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - add ptest support to the recipe. It must have feature parity with the
GNU recipe.

OK, I'll do that in meta-openembedded, since I don't want to mix this
change with a move between two repos

> - investigate and propose a plan for pseudo compatibility. It's not easy:
pseudo relies on substituting libc API, and rust binaries issue kernel
syscalls directly.

It is doable, since uutils-coreutils already uses the libc crate for many
things, and the rustix crate can be configured at build-time to use the
libc crate instead of using kernel syscalls directly.
On the other hand, PREFERRED_PROVIDER_coreutils is independent of
PREFERRED_PROVIDER_coreutils-native, and very few recipes depend on
coreutils-native, so I suggest decoupling a potential merge of
uutils-coreutils with pseudo support. The target version delivers almost
all the value, and pseudo compatibility can follow separately. Or am I
missing something?

> - propose a test plan for Yocto. Merely sticking it into poky-altcfg is
actually a regression in testing, because then sysvinit images will be
tested only with GNU, and systemd images will be tested only with uutils.

OK, then I'm not sure what's best in terms of testing matrix. I'll need to
investigate.

> - last, but not least. Actually this is the most important one: fix your
relationship with GNU coreutils. It's painful to watch you two bicker, and
I do not want the Yocto project to be dragged into this.

On the last point: I can see Collin feels strongly about this, and I take
the licensing concern seriously. But I haven't been in conflict with him or
with GNU coreutils. If there's a specific exchange you'd like me to look
at, please point me to it.

=C3=89tienne

On Tue, Oct 13, 2026 at 9:42=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> Alright. Here's a suggested plan for you:
>
> - add ptest support to the recipe. It must have feature parity with the
> GNU recipe.
>
> - investigate and propose a plan for pseudo compatibility. It's not easy:
> pseudo relies on substituting libc API, and rust binaries issue kernel
> syscalls directly.
>
> - address concerns of 'license-washing'. A few of us are deeply
> uncomfortable with this recent wave of component rewrites (especially AI
> assisted which causes dubious copyrights) where the primary goal is not
> technical improvement but simply getting rid of the GPL. The purpose of
> open source is not serving commercial interests, it's making computing
> better for everyone.
>
> - get the core community distributions (which is, Fedora and Debian) to
> have a plan and timeline of adoping uutils as the default. This is the
> ultimate test of maturity.
>
> - propose a test plan for Yocto. Merely sticking it into poky-altcfg is
> actually a regression in testing, because then sysvinit images will be
> tested only with GNU, and systemd images will be tested only with uutils.
>
> - last, but not least. Actually this is the most important one: fix your
> relationship with GNU coreutils. It's painful to watch you two bicker, an=
d
> I do not want the Yocto project to be dragged into this.
>
> Alex
>
>
> On Mon, 12 Oct 2026 at 23:13, Etienne Cordonnier <ecordonnier@snap.com>
> wrote:
>
>> Hi Alex,
>> - what is achieved by moving it to core is improving no-gplv3.inc for
>> users who are not using gplv3 and still want full coreutils syntax suppo=
rt.
>> It will also make it possible to add it to poky-altcfg.conf, and general=
ly
>> make it easier to consume without needing meta-openembedded.
>>
>> - what specifically makes this component mature enough is:
>>   - I've added the recipe to meta-openembedded in July 2022 and it has
>> been continuously tested and improved since (e.g. I fixed the musl suppo=
rt
>> upstream, the cross-compilation of stdbuf upstream, some buildpath issue=
)
>>   - its adoption in Ubuntu 26.04 as default coreutils implementation and
>> the resulting large-scale usage and bug-fixing
>>   - its availability in Windows as "Coreutils for Windows" starting in
>> June 2026 as a package maintained by Microsoft, and the resulting
>> large-scale usage and bug-fixing
>>   - its massive adoption in various distros and package-managers (see
>> https://uutils.org/users/
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__uutils.org_users=
_&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuM=
IGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DTQmofvWjML0rStkG9aORknAn231FNShwwQFbV=
xuoEpFoFov2hNAHI82gZaXe_Ji-&s=3DCBQ3d8b8uYSdxwNhKRN4m1Bv7jOIX0EwE2ZOXtUfDj0=
&e=3D>
>> )
>>   - its >95% pass-rate of the GNU testing suite in release 0.0.12 (some
>> tests are still skipped)
>>   - anecdotally, my own usage in production on embedded devices for
>> several years without issues (on arm and qemu-arm64)
>>
>> - "should we make uutils-coreutils the default choice, or maybe the only
>> choice?"
>>   -> maybe in several years when uutils-coreutils has matured even more
>> and has 100% test coverage of the GNU test suite? At the moment I think =
the
>> safest choice on critical devices is still GNU coreutils, so I wouldn't
>> remove or make rust coreutils the default or only choice. Also rust
>> binaries are bigger than C binaries so there is some tradeoff involved. =
GNU
>> coreutils 9.12 main package is 10.3MB big in my test build, compared to
>> 13.6MB for the uutils-coreutils 0.0.12 main package (uutils-coreutils us=
es
>> a multi-binary executable to save space, GNU coreutils doesn't).
>>
>> - "Does it work as a provider of coreutils-native and is it compatible
>> with pseudo?"
>>   - the recipe uutils-coreutils-native compiles, but it's not compatible
>> with pseudo because of differences in syscalls, and it's not suitable as=
 a
>> replacement for coreutils-native at the moment. I'll try to make it work
>> with pseudo in the future, but I think almost all users consume it as a
>> target recipe and that's where it provides most value.
>>
>> - "Does it pass the full autobuilder matrix when selected as coreutils
>> provider? Should we add that test to the autobuilder?"
>>   -> it should, but I've not tested the full matrix of the autobuilder. =
I
>> would like to add the recipe to poky-altcfg.conf, and as far as I
>> understand this would add it to the autobuilder as side-effect.
>> I am also working on adding ptest support for the recipe and can send
>> this if necessary for the acceptance to oe-core.
>>
>> =C3=89tienne
>>
>> On Mon, Oct 12, 2026 at 3:04=E2=80=AFPM Alexander Kanavin <alex.kanavin@=
gmail.com>
>> wrote:
>>
>>> On Sat, 10 Oct 2026 at 13:30, Etienne Cordonnier via
>>> lists.openembedded.org
>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedd=
ed.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DPf9ypvX_MT4dU4cYC3brv9jpglRcRrrz=
1luHXObxYfW6J0oO8XAW6KnUoiQHzUES&s=3DQSmPEv1BkubeZVNksJqkHkppRkyy-Bac7QdkZu=
oYqaA&e=3D>
>>> <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
>>>
>>>>
>>>> uutils-coreutils, the Rust reimplementation of GNU coreutils, is matur=
e
>>>> enough for production use, so move the recipe from meta-oe to oe-core.
>>>> It provides and rprovides coreutils, and is excluded from world unless
>>>> selected as the coreutils provider.
>>>>
>>>
>>> This needs a bit more justification. What is achieved by moving it to
>>> core? What specifically makes this component mature enough? What tests =
were
>>> performed with it? Does it pass the full autobuilder matrix when select=
ed
>>> as coreutiuls provider? Should we add that test to the autobuilder? Sho=
uld
>>> we make uutils-coreutils the default choice, or maybe the only choice? =
Does
>>> it work as a provider of coreutils-native, and is it compatible with ps=
eudo?
>>>
>>> Adding things to core has a pretty high bar, and the above commit
>>> message does not meet it.
>>>
>>> Alex
>>>
>>

--00000000000028137c065db5eb7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; - add ptest support to the recipe. It must have featu=
re parity with the GNU recipe.<br><br>OK, I&#39;ll do that in meta-openembe=
dded, since I don&#39;t want to mix this change with a move between two rep=
os<br><br>&gt; - investigate and propose a plan for pseudo compatibility. I=
t&#39;s not easy: pseudo relies on substituting libc API, and rust binaries=
 issue kernel syscalls directly.<br><br>It is doable, since uutils-coreutil=
s already uses the libc crate for many things, and the rustix crate can be =
configured at build-time to use the libc crate instead of using kernel sysc=
alls directly.<br>On the other hand, PREFERRED_PROVIDER_coreutils is indepe=
ndent of PREFERRED_PROVIDER_coreutils-native, and very few recipes depend o=
n coreutils-native, so I suggest decoupling a potential merge of uutils-cor=
eutils with pseudo support. The target version delivers almost all the valu=
e, and pseudo compatibility can follow separately. Or am I missing somethin=
g?<br><br>&gt; - propose a test plan for Yocto. Merely sticking it into pok=
y-altcfg is actually a regression in testing, because then sysvinit images =
will be tested only with GNU, and systemd images will be tested only with u=
utils.<br><br>OK, then I&#39;m not sure what&#39;s best in terms of testing=
 matrix. I&#39;ll need to investigate.<br><br>&gt; - last, but not least. A=
ctually this is the most important one: fix your relationship with GNU core=
utils. It&#39;s painful to watch you two bicker, and I do not want the Yoct=
o project to be dragged into this.<br><br>On the last point: I can see Coll=
in feels strongly about this, and I take the licensing concern seriously. B=
ut I haven&#39;t been in conflict with him or with GNU coreutils. If there&=
#39;s a specific exchange you&#39;d like me to look at, please point me to =
it.<br><br>=C3=89tienne</div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 13, 2026 at 9:42=
=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div>Alright. Here&#39;s a suggeste=
d plan for you:</div><div></div><div><br></div><div>- add ptest support to =
the recipe. It must have feature parity with the GNU recipe.</div><div><br>=
</div><div>- investigate and propose a plan for pseudo compatibility. It&#3=
9;s not easy: pseudo relies on substituting libc API, and rust binaries iss=
ue kernel syscalls directly.</div><div><br></div><div>- address concerns of=
 &#39;license-washing&#39;. A few of us are deeply uncomfortable with this =
recent wave of component rewrites (especially AI assisted which causes dubi=
ous copyrights) where the primary goal is not technical improvement but sim=
ply getting rid of the GPL. The purpose of open source is not serving comme=
rcial interests, it&#39;s making computing better for everyone.</div><div><=
br></div><div>- get the core community distributions (which is, Fedora and =
Debian) to have a plan and timeline of adoping uutils as the default. This =
is the ultimate test of maturity.</div><div><br></div><div>- propose a test=
 plan for Yocto. Merely sticking it into poky-altcfg is actually a regressi=
on in testing, because then sysvinit images will be tested only with GNU, a=
nd systemd images will be tested only with uutils.</div><div><br></div><div=
>- last, but not least. Actually this is the most important one: fix your r=
elationship with GNU coreutils. It&#39;s painful to watch you two bicker, a=
nd I do not want the Yocto project to be dragged into this.</div><div><br><=
/div><div></div><div>Alex</div><div><br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 12 Oct 2026 at 23:13,=
 Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_=
blank">ecordonnier@snap.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr">Hi Alex,<br>- what is achieved =
by moving it to core is=C2=A0improving no-gplv3.inc for users who are not u=
sing gplv3 and still want full coreutils syntax support. It will also make =
it possible to add it to poky-altcfg.conf, and generally make it easier to =
consume without needing meta-openembedded.<br><br>- what specifically makes=
 this component mature enough is:<br>=C2=A0 - I&#39;ve added the recipe to =
meta-openembedded in July 2022 and it has been continuously tested and impr=
oved since (e.g. I fixed the musl support upstream, the cross-compilation o=
f stdbuf upstream, some buildpath issue)<br>=C2=A0 - its adoption in Ubuntu=
 26.04 as default coreutils implementation and the resulting large-scale us=
age and bug-fixing<br>=C2=A0 - its availability in Windows as &quot;Coreuti=
ls for Windows&quot; starting in June 2026 as a package maintained by Micro=
soft, and the resulting large-scale usage and bug-fixing<br>=C2=A0 - its ma=
ssive adoption in various distros and package-managers (see=C2=A0<a href=3D=
"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__uutils.org_users_&a=
mp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DA=
hkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DTQmofvWjML0rStkG9aORknAn=
231FNShwwQFbVxuoEpFoFov2hNAHI82gZaXe_Ji-&amp;s=3DCBQ3d8b8uYSdxwNhKRN4m1Bv7j=
OIX0EwE2ZOXtUfDj0&amp;e=3D" target=3D"_blank">https://uutils.org/users/</a>=
 )=C2=A0<br>=C2=A0 - its &gt;95% pass-rate of the GNU testing suite in rele=
ase 0.0.12 (some tests are still skipped)<br>=C2=A0 - anecdotally, my own u=
sage in production on embedded devices for several years without issues (on=
 arm and qemu-arm64)<br><br>- &quot;should we make uutils-coreutils the def=
ault choice, or maybe the only choice?&quot;<br>=C2=A0 -&gt; maybe in sever=
al years when uutils-coreutils has matured even more and has 100% test cove=
rage of the GNU test suite? At the moment I think the safest choice on crit=
ical devices is still GNU coreutils, so I wouldn&#39;t remove or make rust =
coreutils the default or only choice. Also rust binaries are bigger than C =
binaries so there is some tradeoff involved. GNU coreutils 9.12 main packag=
e is 10.3MB big in my test build, compared to 13.6MB for the uutils-coreuti=
ls 0.0.12 main package (uutils-coreutils uses a multi-binary executable to =
save space, GNU coreutils doesn&#39;t).<br><br>- &quot;Does it work as a pr=
ovider of coreutils-native and is it compatible with pseudo?&quot;<br>=C2=
=A0 - the recipe uutils-coreutils-native compiles, but it&#39;s not compati=
ble with pseudo because of differences in syscalls, and it&#39;s not suitab=
le as a replacement for coreutils-native at the moment. I&#39;ll try to mak=
e it work with pseudo in the future, but I think almost all users consume i=
t as a target recipe and that&#39;s where it provides most value.<br><br>- =
&quot;Does it pass the full autobuilder matrix when selected as coreutils p=
rovider? Should we add that test to the autobuilder?&quot;<br>=C2=A0 -&gt; =
it should, but I&#39;ve not tested the full matrix of the autobuilder. I wo=
uld like to add the recipe to poky-altcfg.conf, and as far as I understand =
this would add it to the autobuilder as side-effect.<br>I am also working o=
n adding ptest support for the recipe and can send this if necessary for th=
e acceptance to oe-core.<br><br>=C3=89tienne</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 12, 2026 at 3:04=E2=
=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 10 Oct 2026 at 13:30, =
Etienne Cordonnier via <a href=3D"https://urldefense.proofpoint.com/v2/url?=
u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DPf9ypvX_MT4dU4cYC3brv9jpglRcRrrz1luHXObxYfW6J0oO8XAW6KnUoiQHzU=
ES&amp;s=3DQSmPEv1BkubeZVNksJqkHkppRkyy-Bac7QdkZuoYqaA&amp;e=3D" target=3D"=
_blank">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap=
.com@lists.openembedded.org" target=3D"_blank">snap.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
uutils-coreutils, the Rust reimplementation of GNU coreutils, is mature<br>
enough for production use, so move the recipe from meta-oe to oe-core.<br>
It provides and rprovides coreutils, and is excluded from world unless<br>
selected as the coreutils provider.<br></blockquote><div><br></div><div>Thi=
s needs a bit more justification. What is achieved by moving it to core? Wh=
at specifically makes this component mature enough? What tests were perform=
ed with it? Does it pass the full autobuilder matrix when selected as coreu=
tiuls provider? Should we add that test to the autobuilder? Should we make =
uutils-coreutils the default choice, or maybe the only choice? Does it work=
 as a provider of coreutils-native, and is it compatible with pseudo?</div>=
<div><br></div><div>Adding things to core has a pretty high bar, and the ab=
ove commit message does not meet it.</div><div><br></div><div>Alex</div></d=
iv></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--00000000000028137c065db5eb7a--

