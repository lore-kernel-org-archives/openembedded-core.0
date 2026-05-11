Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DAECD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 12:31:40 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49121.1778502692398992300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 05:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Xuv8T39B;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44b052142e1so2354379f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 05:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778502691; cv=none;
        d=google.com; s=arc-20240605;
        b=JHEgmVo/U7LVZwRP3/HlBDHHQ+Ml8obOlGryBaIP6zxGU+60LG4g8Ys5C6p8GIp+8N
         0GuUvSr5gt4QTYjkslqH8oWigwuV/SBBSHtg3b7ApZflxC2P0dXG5yRJ2w3z4aVoOJ/Y
         xeZPaP6fNfQgFBHcRXJ2+fE4HkoIljPRF1gNM0Pw/uZ1oeHZKu7nGnxBIIVanLOo3MsL
         G/BueUQiVhNvHNrMWVjxgvyFVssE5x/9A5EfMULKFcMznQXN5vD2KyXoN9pKMHydFleg
         B5XgiOyjlGHGq3x+RN3NL0OPBrZMHgTKuVl+UE2gUoANWRkQlxkn6cCv3s8L8tbRXCqV
         XdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+odWc0Kc3PO5pVVHv7hrqsazK1gy+zhgk78hnC2B2Uo=;
        fh=0cR3N+JgKq+r9I8XU6Eri4zigLm2z7bSqwGt6pO5T3w=;
        b=WYOefS+p1kHneM+0rOY2bB4P1aBQIQvr2ss3UhVPRblN6cAFcYUsh3oD4DNAERZIr9
         J7/7uHb/5xgRCdEOae6JHwOlK7qfyggP/lwIvk2+1kaMyxBI5Va4mHhkCgbpFNb3fVLE
         eqXX6g49gx9InyCra6XDt44+x8aQFA1xjdvV+v81Nkfbnqm3LjB2BTo1L0PPrsDKdO87
         eurnu1gGomiFrPZuBfgdEiUrAnsgbzBenzPDfkgPMc8gAfCG4UJfo55MuzJ0ZtJFCyZd
         v37lWY95J0r+P9g/DBW6+f4E44m6tinNfNO3sDinGe/0zlQ8MskNQbn4UEGDgdgIvooC
         7AFQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778502691; x=1779107491; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+odWc0Kc3PO5pVVHv7hrqsazK1gy+zhgk78hnC2B2Uo=;
        b=Xuv8T39BmKg2IeSC1o6cEwtdEWlyhQ4o7ZAp8JDGheV+IczkoSoXtc5+nmzCtKaCka
         VJoBVr99Avps4cbEyjFdc/fja1Peu2v1PUD801HDmR72qB5mQlqm91JH0lZOt/neOxDp
         QcIPc6Xb15dN1qfY0zgxFxPt1AEWcujmhJo6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778502691; x=1779107491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+odWc0Kc3PO5pVVHv7hrqsazK1gy+zhgk78hnC2B2Uo=;
        b=a7kipTNShJ0y9qG0RyaHS55UqaxdnbmsKpn5l0VjGXA030DjV5x63g8U44vWxxiiHG
         rtJXI2KpLTYI3LPWkTYAzOYD3lPAFed8bgNyGjU6KC+xIqFHipTLxAIvaeAf97m5o2C3
         m0n4IzvCE+UqLAC/Z/sTJs3n1jaxZCq2VlI9qvw5RpXzA45R8iOftECissAPOPRXYOsH
         oVoXNM56wZU7fupwW4r3Qu/8M7F05WA6VmUirc1rryN0sVkyMplPODM5LGs75vCvivQP
         AM8wl0jjP5YnWFCx/A1p/ZDx8ozMVZpE/w+IrpqK5gV+Msu//d9ClOx0v9rAL25mjOiY
         Y9dA==
X-Forwarded-Encrypted: i=1; AFNElJ/jIwqOpeOISAqs9S0hhpHwGIjQKxO+D0DPwYpuicbAtdwVkboKWkuQ258FD7XGoV/ePyrp8CCKR/g5vIlBbTXahQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/SAo2/LipXBQOLWfa8JNnVeK6ALvUjvoOaTLElOwxUcphwy/3
	S/CdO1TiVALDHn7Kh33zrwgOZ/+KCbxT4NWNLjJrqRkqgIppFcaS9IpELi8ohwAOX1TaUvQTVHF
	0LWheHlCp3eSfakVMk1WVLcFjj158caNEzf5dKRgd0I5k/ba9IP4L2eLo8g==
X-Gm-Gg: Acq92OG8gGCnxpiYK8q9YFkrvQZrvuHIN3XtU0DZD7rUYcU5R2123xZlyhvYEbtugBM
	tuu3Vpc/50fyiarAFCqVquRmYOmlV1Ii7tzNxQeC/kcYVYS6cttKx9KU20X+GX+82SD21+tGzVm
	a/NzHoLLd1QVntCrm99+sxcbmMagOPL346pKHDy7iurMiD3hbjJr/mEh5fE3LW/yPFDvFaLhIXp
	IMAF8xxFPPrU0o98E7qvIKhbLSi4it1fdg5pA9Mlv7O9mGXSm4veeRaArPD914rdKjAQbYFbEqy
	6sar9lv5iA==
X-Received: by 2002:a05:6000:144b:b0:43c:f7e5:817b with SMTP id
 ffacd0b85a97d-4568ae17224mr14118331f8f.19.1778502690298; Mon, 11 May 2026
 05:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260421070646.1290375-1-xiao.zhang@windriver.com>
 <DHYO49JUR52Y.1OUCD7ZQJ693R@smile.fr> <d828c167-5671-4370-b122-b25f23003812@windriver.com>
In-Reply-To: <d828c167-5671-4370-b122-b25f23003812@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 11 May 2026 14:31:03 +0200
X-Gm-Features: AVHnY4LZAv51M00KHz4x_25yhET4quxOSpi3xjGqJyfKI42mcA52HyA4W9lGlTA
Message-ID: <CAMSfU+6fwoiPFXSFRU3MuDXizEbyjgu4gySeVx2gwdY9QDZJVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] oe-selftest: Add static postgres user/group
 for reproducible build test
To: "Chi, Zhixiong" <zhixiong.chi@windriver.com>
Cc: xiao.zhang@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000169c31065189ed75"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 12:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236811

--000000000000169c31065189ed75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 11 mai 2026 =C3=A0 05:11, Chi, Zhixiong <zhixiong.chi@windriver.com=
> a
=C3=A9crit :

> Hi Yoann,
>
> Given only static-group and static-passwd are added at
> meta/lib/oeqa/selftest/cases/reproducible.py in oe-core
>
> as the commit
> https://git.openembedded.org/openembedded-core/commit/meta/lib/oeqa/selft=
est/cases/reproducible.py?id=3D77397bace64dfd03e704400fea918d93f00d0bf7
> ,
>
> the static-{group,passwd} in meta-openembedded/meta-* layers are not
> included(eg: static-group-meta-oe/static-passwd-meta-oe).
>
> I encounter the same issue during reproducible testing
>
> So how to expand the USERADD_GID_TABLES and USERADD_UID_TABLES to add the
> static files in meta-openembedded to avoid the static id not defined issu=
e.
>
> Generally I run "oe-selftest -r
> reproducible.ReproducibleTests.test_reproducible_builds", export the env
> variable USERADD_GID_TABLES and USERADD_UID_TABLES or the other method we
> already have defined in yocto?
>

See my answer in another thread:
https://lore.kernel.org/openembedded-devel/DIFRRVJB4CS3.23NBKWDDVT9ZB@smile=
.fr/T/#m79d4e29f5b1b2651cd9382b85e9b5d09f5465b0c

But, basically, you can write (in your local.conf or equivalent):
USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-gnome'
USERADD_GID_TABLES:append =3D ' files/static-group-meta-networking'
USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-networking'
USERADD_GID_TABLES:append =3D ' files/static-group-meta-oe'
USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-oe'

Regards,

Thanks.
> On 4/21/26 15:52, Yoann Congal via lists.openembedded.org wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Tue Apr 21, 2026 at 9:06 AM CEST, ZhangXiao via lists.openembedded.org=
 wrote:
>
> This adds the static postgres UID/GID entries to static-passwd and
> static-group, fixing the "Nothing PROVIDES 'postgresql'" error when
> running reproducible test.
>
> The selftest environment requires static system user IDs to ensure
> build reproducibility, which was missing for the postgres user/group
> before this change.
>
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com> <xiao.zhang@windrive=
r.com>
>
> Since this is a meta-oe recipe, shouldn't those static IDs be defined inh=
ttps://git.openembedded.org/meta-openembedded/tree/meta-oe/files/static-pas=
swd-meta-oehttps://git.openembedded.org/meta-openembedded/tree/meta-oe/file=
s/static-group-meta-oe
> instead?
>
> Regards,
>
>
> ---
>  meta-selftest/files/static-group  | 1 +
>  meta-selftest/files/static-passwd | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/meta-selftest/files/static-group b/meta-selftest/files/stati=
c-group
> index 6a9ece20a8..a08795c4ea 100644
> --- a/meta-selftest/files/static-group
> +++ b/meta-selftest/files/static-group
> @@ -31,4 +31,5 @@ audio:x:532:
>  empower:x:533:
>  cmake-example:x:534:
>  meson-example:x:535:
> +postgres:x:536
>  nogroup:x:65534:
> diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/stat=
ic-passwd
> index 98017c8153..ba1dcd54d8 100644
> --- a/meta-selftest/files/static-passwd
> +++ b/meta-selftest/files/static-passwd
> @@ -21,3 +21,4 @@ ptest:x:529:529::/:/bin/nologin
>  xuser:x:530:530::/:/bin/nologin
>  cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
>  meson-example:x:535:535::/var/lib/meson-example:/bin/false
> +postgres:x:536:536::/:/bin/nologin
>
> --
> Yoann Congal
> Smile ECS
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235603): https://lists.openembedded.org/g/openembedde=
d-core/message/235603
> Mute This Topic: https://lists.openembedded.org/mt/118934221/3618679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zh=
ixiong.chi@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--=20
Yoann Congal
Smile ECS

--000000000000169c31065189ed75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0lun. 11 mai 2026 =C3=A0=C2=A005:1=
1, Chi, Zhixiong &lt;<a href=3D"mailto:zhixiong.chi@windriver.com">zhixiong=
.chi@windriver.com</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quo=
te gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><u></u>

 =20
  <div style=3D"padding-bottom:1px">
    <p>Hi Yoann,</p>
    <p>Given only static-group and static-passwd are added at
      meta/lib/oeqa/selftest/cases/reproducible.py in oe-core</p>
    <p>as the commit
<a href=3D"https://git.openembedded.org/openembedded-core/commit/meta/lib/o=
eqa/selftest/cases/reproducible.py?id=3D77397bace64dfd03e704400fea918d93f00=
d0bf7" target=3D"_blank">https://git.openembedded.org/openembedded-core/com=
mit/meta/lib/oeqa/selftest/cases/reproducible.py?id=3D77397bace64dfd03e7044=
00fea918d93f00d0bf7</a>,</p>
    <p>the static-{group,passwd} in meta-openembedded/meta-* layers are
      not included(eg: static-group-meta-oe/static-passwd-meta-oe).</p>
    <p>I encounter the same issue during reproducible testing</p>
    <p>So how to expand the USERADD_GID_TABLES and USERADD_UID_TABLES to
      add the static files in meta-openembedded to avoid the static id
      not defined issue.</p>
    <p>Generally I run &quot;oe-selftest -r
      reproducible.ReproducibleTests.test_reproducible_builds&quot;, export
      the env variable USERADD_GID_TABLES and USERADD_UID_TABLES or the
      other method we already have defined in yocto?</p></div></blockquote>=
<div><br></div><div>See my answer in another thread: <a href=3D"https://lor=
e.kernel.org/openembedded-devel/DIFRRVJB4CS3.23NBKWDDVT9ZB@smile.fr/T/#m79d=
4e29f5b1b2651cd9382b85e9b5d09f5465b0c">https://lore.kernel.org/openembedded=
-devel/DIFRRVJB4CS3.23NBKWDDVT9ZB@smile.fr/T/#m79d4e29f5b1b2651cd9382b85e9b=
5d09f5465b0c</a><br></div><div><br></div><div>But, basically, you can write=
 (in your local.conf or equivalent):</div><div>	USERADD_UID_TABLES:append =
=3D &#39; files/static-passwd-meta-gnome&#39;<br>	USERADD_GID_TABLES:append=
 =3D &#39; files/static-group-meta-networking&#39;<br>	USERADD_UID_TABLES:a=
ppend =3D &#39; files/static-passwd-meta-networking&#39;<br>	USERADD_GID_TA=
BLES:append =3D &#39; files/static-group-meta-oe&#39;<br>	USERADD_UID_TABLE=
S:append =3D &#39; files/static-passwd-meta-oe&#39;</div><div><br></div><di=
v>Regards,</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div style=3D"padding-bottom:1px">
    <p>Thanks.<br>
    </p>
    <div>On 4/21/26 15:52, Yoann Congal via
      <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Tue Apr 21, 2026 at 9:06 AM CEST, ZhangXiao via <a href=3D"http://lists.=
openembedded.org" target=3D"_blank">lists.openembedded.org</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>This adds the static postgres UID/GID entries to static-passwd=
 and
static-group, fixing the &quot;Nothing PROVIDES &#39;postgresql&#39;&quot; =
error when
running reproducible test.

The selftest environment requires static system user IDs to ensure
build reproducibility, which was missing for the postgres user/group
before this change.

Signed-off-by: Zhang Xiao <a href=3D"mailto:xiao.zhang@windriver.com" targe=
t=3D"_blank">&lt;xiao.zhang@windriver.com&gt;</a>
</pre>
      </blockquote>
      <pre>Since this is a meta-oe recipe, shouldn&#39;t those static IDs b=
e defined in
<a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-oe/file=
s/static-passwd-meta-oe" target=3D"_blank">https://git.openembedded.org/met=
a-openembedded/tree/meta-oe/files/static-passwd-meta-oe</a>
<a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-oe/file=
s/static-group-meta-oe" target=3D"_blank">https://git.openembedded.org/meta=
-openembedded/tree/meta-oe/files/static-group-meta-oe</a>
instead?

Regards,

</pre>
      <blockquote type=3D"cite">
        <pre>---
 meta-selftest/files/static-group  | 1 +
 meta-selftest/files/static-passwd | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-=
group
index 6a9ece20a8..a08795c4ea 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -31,4 +31,5 @@ audio:x:532:
 empower:x:533:
 cmake-example:x:534:
 meson-example:x:535:
+postgres:x:536
 nogroup:x:65534:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static=
-passwd
index 98017c8153..ba1dcd54d8 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -21,3 +21,4 @@ ptest:x:529:529::/:/bin/nologin
 xuser:x:530:530::/:/bin/nologin
 cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
 meson-example:x:535:535::/var/lib/meson-example:/bin/false
+postgres:x:536:536::/:/bin/nologin
</pre>
      </blockquote>
      <pre>--
Yoann Congal
Smile ECS

</pre>
      <br>
      <fieldset></fieldset>
      <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#235603): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/235603" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/235603</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118934221/361=
8679" target=3D"_blank">https://lists.openembedded.org/mt/118934221/3618679=
</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core=
/unsub</a> [<a href=3D"mailto:zhixiong.chi@windriver.com" target=3D"_blank"=
>zhixiong.chi@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </div>
  <u></u><u></u>

</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000169c31065189ed75--

