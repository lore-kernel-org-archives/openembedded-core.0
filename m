Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC6AC71157
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 02:38:50 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.21790.1750041520226079398
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 19:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=N5tTIAhL;
 spf=pass (domain: mvista.com, ip: 209.85.208.46, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso6628442a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 19:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1750041518; x=1750646318; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fUGv12U7IygUtgv3P3qH4dubssrbhMjfzmDBUzsAdMs=;
        b=N5tTIAhL+MYBuGQ5IEt4sLB3jP6y0lls/iXDhzbRo+O5QZUyAn3POOtiVnJksy6g1h
         9zNbACnE4OjPWWtbz23ZbcLvsjKI5htwuGozGyTuJA2ZYaZqdT4lLyAijvYd0wU0nh2i
         lJtbrsq3XJHGyrPELzptYNopEcCNylBs2LIC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750041518; x=1750646318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUGv12U7IygUtgv3P3qH4dubssrbhMjfzmDBUzsAdMs=;
        b=nUzYHA5EIzSUVVNxvGDKbWnwNIgiVG/1HijS5iD66H73/gybxvnf0UDG5jlL5GNqRi
         xtwBFCgSjnSZ9paGgy83KzlR6CuPXqw0/0W6ihrf61ypKpXV+VX5ENoyJ2+AeEzE/GVE
         MjiQaV2WIpmeQiO54gN9kZ/wO139zIP3od4GtieVtkuTyy5Mu9zsfDLxv2k3sDWts+aW
         x718ora+N4nbzGuRMy2TSGBcr+nyQfrpGwVtk35fq6bMhNUdiWWMr/Og4L38v7mc3zpn
         7udwU89XdUEAMHNXfxde1OklkdV+zfsAG9u4aVD+6tDGZy8194pWxiOPBP07RsqBk29k
         Zntg==
X-Forwarded-Encrypted: i=1; AJvYcCXAeGRk0SS2Qnb9dZv0HXe0xXGtfjoSA2tPWB1UrrtFfxYSVx+6B1gyU1sKO4nXDSsZNsyCh8hweSJ2nv7GsVfnHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YztLg82+cLz49xZIwQWD7y9ZODRyoaMJ2rMah0olumUkdC0tY+y
	Kvz/KDH9QJrcp+WxZ5PnKe1gIiig5KzdRW74TJo5+mkvbhPgwZKF16ilcZ+nCcD2LQvY/xIX8r/
	aTAJmKazHqZJ3Jw2QwP+QA6CbVxh0kEGTGel/STTDEA==
X-Gm-Gg: ASbGncvevMfHcPUDhFiUngUNWM2l0GwAHtbe2Sy1EYxf8Z/ruqLvDMeMBLLL5IN4hp6
	nzSKyVasy74SJj23wkMJRdFCY8hxYIPhBYCXwTKbLmfC9cJ871/0c0OvmGQMT9KGXqwtox2GC18
	ZJCuu9szLlIkjcFwuLwRgdVj58NwtZlKTdCTkOhEBUC9U=
X-Google-Smtp-Source: AGHT+IFW1ANwLONuf+8B5+K9DxmLyPf2S4NGj87+S1+eJo2Z28C1Dw9TAEJEGds8WojXtRkRE9+O6CGJvU5brqxcSfw=
X-Received: by 2002:a17:907:94cc:b0:add:fd7c:ae9 with SMTP id
 a640c23a62f3a-adfad4a480dmr752291766b.45.1750041518426; Sun, 15 Jun 2025
 19:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250613034352.175878-1-changqing.li@windriver.com>
 <CAOSpxdZwOjkN+OaHEzhv6qngpS+aGTx8OcdCWR9ewb9U5PSvfQ@mail.gmail.com> <e8d9e1d0-ae8b-4172-bacb-2f9efb42bc71@windriver.com>
In-Reply-To: <e8d9e1d0-ae8b-4172-bacb-2f9efb42bc71@windriver.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 16 Jun 2025 08:08:26 +0530
X-Gm-Features: AX0GCFt4QTkZHqtIaEkmN1CYOQXQ4iYN66JIVJkd9lwI5HT6NsrKDO3x1JWj20w
Message-ID: <CANQUz1_kY1_Fc1dn-imi+m87HCkTfTiX+fQnfsMO3AdWa9s=TA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 00/20] *** libsoup/libsoup-2.4: fix
 CVEs ***
To: Changqing Li <changqing.li@windriver.com>
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000c5fbc0637a74bdb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218762

--0000000000000c5fbc0637a74bdb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Changqing,

I'm ok with your idea.

Steve,

Can you take my series of patches?
Once those patches get merged, Changqing will send another series with
other required patches.

Thanks & Regards,
Vijay


On Mon, Jun 16, 2025 at 5:49=E2=80=AFAM Changqing Li <changqing.li@windrive=
r.com>
wrote:

>
> On 6/14/25 00:23, Steve Sakoman wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> Hi Vijay and Changqing,
>
> Seems you sent similar patch series at just about the same time!
>
> There is a good deal of overlap, but each contains some that the other la=
cks.
>
> Also, Changqing's has a conflict in "libsoup-2.4: fix do_compile
> failure" with a patch currently in kirkstone: "libsoup-2.4: Backport
> auth tests for CVE-2025-32910"
>
> Could you please work together to decide which I should take and kirkston=
e-nut
> submit a new series?
>
> Thanks!
>
> Steve
>
> Hi, Vijay and Steve
>
> How about take Vijay's series of patches first,   after is is merged in
> branch kirkstone-nut
>
> ,  I can rework my patches bases on branch kirkstone-nut, send a V2 serie=
s
> with other needed patches.
>
> Regards
>
> Changqing
>
> On Thu, Jun 12, 2025 at 8:43=E2=80=AFPM Changqing Li vialists.openembedde=
d.org<changqing.li=3Dwindriver.com@lists.openembedded.org> <changqing.li=3D=
windriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com> <changqing.li@windriver.c=
om>
>
> Backport several CVE fixes from branch scarthgap, cherry picked from
> poky-contrib: stable/scarthgap-nut,  and do some changes accordingly.
>
> Ashish Sharma (1):
>   libsoup: patch CVE-2025-4476
>
> Changqing Li (17):
>   libsoup-2.4: fix CVE-2025-32907
>   libsoup-2.4: fix CVE-2025-32053
>   libsoup-2.4: fix CVE-2025-32052
>   libsoup-2.4: fix CVE-2025-32050
>   libsoup-2.4: fix CVE-2025-46421
>   libsoup-2.4: fix CVE-2025-4948
>   libsoup-2.4: fix CVE-2025-4476
>   libsoup-2.4: fix CVE-2025-2784
>   libsoup-2.4: fix do_compile failure
>   libsoup: fix CVE-2025-32907
>   libsoup: fix CVE-2025-32053
>   libsoup: fix CVE-2025-32052
>   libsoup: fix CVE-2025-32051
>   libsoup: fix CVE-2025-32050
>   libsoup: fix CVE-2025-46421
>   libsoup: fix CVE-2025-4948
>   libsoup: fix CVE-2025-2784
>
> Hitendra Prajapati (2):
>   libsoup-2.4: Fix CVE-2025-4969
>   libsoup: Fix CVE-2025-4969
>
>  .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++
>  .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 +++
>  .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 +++
>  .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++++
>  .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++++
>  .../libsoup-2.4/CVE-2025-32910-1.patch        |  79 +------
>  .../libsoup-2.4/CVE-2025-32910-2.patch        |  60 +-----
>  .../libsoup-2.4/CVE-2025-32912-1.patch        |  20 +-
>  .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++++
>  .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++
>  .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++++
>  .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  76 +++++++
>  .../libsoup/libsoup-2.4_2.74.2.bb             |   9 +
>  .../libsoup/libsoup/CVE-2025-2784.patch       | 137 ++++++++++++
>  .../libsoup/libsoup/CVE-2025-32050.patch      |  29 +++
>  .../libsoup/libsoup/CVE-2025-32051-1.patch    |  29 +++
>  .../libsoup/libsoup/CVE-2025-32051-2.patch    |  57 +++++
>  .../libsoup/libsoup/CVE-2025-32052.patch      |  31 +++
>  .../libsoup/libsoup/CVE-2025-32053.patch      |  40 ++++
>  .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 ++++++++++++++++++
>  .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++++
>  .../libsoup/libsoup/CVE-2025-4476.patch       |  38 ++++
>  .../libsoup/libsoup/CVE-2025-46421.patch      | 139 ++++++++++++
>  .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++++++
>  .../libsoup/libsoup/CVE-2025-4969.patch       |  76 +++++++
>  meta/recipes-support/libsoup/libsoup_3.0.7.bb |  12 ++
>  26 files changed, 1380 insertions(+), 135 deletions(-)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-278=
4.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
50.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
52.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
53.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-329=
07.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-447=
6.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-464=
21.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-494=
8.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-496=
9.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-2784.pa=
tch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32050.p=
atch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1=
.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2=
.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32052.p=
atch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32053.p=
atch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1=
.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2=
.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.pa=
tch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46421.p=
atch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.pa=
tch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.pa=
tch
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218553): https://lists.openembedded.org/g/openembedde=
d-core/message/218553
> Mute This Topic: https://lists.openembedded.org/mt/113619132/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--0000000000000c5fbc0637a74bdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi Changqing,<br><br></div>I&#39;=
m ok with your idea.<br><br></div>Steve,<br><br></div>Can you take my serie=
s of patches?<br></div>Once those patches get merged, Changqing will send a=
nother series with other required patches.<br><br></div><div>Thanks &amp; R=
egards,</div><div>Vijay</div><div><br></div></div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, J=
un 16, 2025 at 5:49=E2=80=AFAM Changqing Li &lt;<a href=3D"mailto:changqing=
.li@windriver.com">changqing.li@windriver.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div>On 6/14/25 00:23, Steve Sakoman wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hi Vijay and Changqing,

Seems you sent similar patch series at just about the same time!

There is a good deal of overlap, but each contains some that the other lack=
s.

Also, Changqing&#39;s has a conflict in &quot;libsoup-2.4: fix do_compile
failure&quot; with a patch currently in kirkstone: &quot;libsoup-2.4: Backp=
ort
auth tests for CVE-2025-32910&quot;

Could you please work together to decide which I should take and kirkstone-=
nut
submit a new series?

Thanks!

Steve</pre>
    </blockquote>
    <p>Hi, Vijay and Steve</p>
    <p>How about take Vijay&#39;s series of patches first,=C2=A0=C2=A0 afte=
r is is
      merged in branch <span style=3D"white-space:pre-wrap">kirkstone-nut<s=
pan style=3D"white-space:normal"></span></span></p>
    <p>,=C2=A0 I can rework my patches bases on branch <span style=3D"white=
-space:pre-wrap">kirkstone-nut,   send a V2 </span>series
      with <span style=3D"white-space:pre-wrap">other needed patches.</span=
></p>
    <p><span style=3D"white-space:pre-wrap">Regards</span></p>
    <p><span style=3D"white-space:pre-wrap">Changqing
</span></p>
    <blockquote type=3D"cite">
      <pre>On Thu, Jun 12, 2025 at 8:43=E2=80=AFPM Changqing Li via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a>
<a href=3D"mailto:changqing.li=3Dwindriver.com@lists.openembedded.org" targ=
et=3D"_blank">&lt;changqing.li=3Dwindriver.com@lists.openembedded.org&gt;</=
a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>From: Changqing Li <a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>

Backport several CVE fixes from branch scarthgap, cherry picked from
poky-contrib: stable/scarthgap-nut,  and do some changes accordingly.

Ashish Sharma (1):
  libsoup: patch CVE-2025-4476

Changqing Li (17):
  libsoup-2.4: fix CVE-2025-32907
  libsoup-2.4: fix CVE-2025-32053
  libsoup-2.4: fix CVE-2025-32052
  libsoup-2.4: fix CVE-2025-32050
  libsoup-2.4: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-4476
  libsoup-2.4: fix CVE-2025-2784
  libsoup-2.4: fix do_compile failure
  libsoup: fix CVE-2025-32907
  libsoup: fix CVE-2025-32053
  libsoup: fix CVE-2025-32052
  libsoup: fix CVE-2025-32051
  libsoup: fix CVE-2025-32050
  libsoup: fix CVE-2025-46421
  libsoup: fix CVE-2025-4948
  libsoup: fix CVE-2025-2784

Hitendra Prajapati (2):
  libsoup-2.4: Fix CVE-2025-4969
  libsoup: Fix CVE-2025-4969

 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 +++
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 +++
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++++
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  79 +------
 .../libsoup-2.4/CVE-2025-32910-2.patch        |  60 +-----
 .../libsoup-2.4/CVE-2025-32912-1.patch        |  20 +-
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  76 +++++++
 .../libsoup/<a href=3D"http://libsoup-2.4_2.74.2.bb" target=3D"_blank">lib=
soup-2.4_2.74.2.bb</a>             |   9 +
 .../libsoup/libsoup/CVE-2025-2784.patch       | 137 ++++++++++++
 .../libsoup/libsoup/CVE-2025-32050.patch      |  29 +++
 .../libsoup/libsoup/CVE-2025-32051-1.patch    |  29 +++
 .../libsoup/libsoup/CVE-2025-32051-2.patch    |  57 +++++
 .../libsoup/libsoup/CVE-2025-32052.patch      |  31 +++
 .../libsoup/libsoup/CVE-2025-32053.patch      |  40 ++++
 .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++++
 .../libsoup/libsoup/CVE-2025-4476.patch       |  38 ++++
 .../libsoup/libsoup/CVE-2025-46421.patch      | 139 ++++++++++++
 .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++++++
 .../libsoup/libsoup/CVE-2025-4969.patch       |  76 +++++++
 meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.0.7.bb" target=3D=
"_blank">libsoup_3.0.7.bb</a> |  12 ++
 26 files changed, 1380 insertions(+), 135 deletions(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.=
patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050=
.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052=
.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053=
.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907=
.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.=
patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421=
.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.=
patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.=
patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-2784.patc=
h
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32050.pat=
ch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.p=
atch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.p=
atch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32052.pat=
ch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32053.pat=
ch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.p=
atch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.p=
atch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patc=
h
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46421.pat=
ch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patc=
h
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patc=
h

--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#218553): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/218553" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/218553</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113619132/362=
0601" target=3D"_blank">https://lists.openembedded.org/mt/113619132/3620601=
</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core=
/unsub</a> [<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sa=
koman.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </div>

</blockquote></div>

--0000000000000c5fbc0637a74bdb--

