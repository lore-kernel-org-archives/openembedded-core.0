Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0239D2594B
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:13:14 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4136.1769494387097398571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B5LfeYNK;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6498401cfb4so773341d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 22:13:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769494386; cv=none;
        d=google.com; s=arc-20240605;
        b=lXqHWzFnFnlroK2SCP6mB4xaXRCWjR8eCoHBQlhodCrD6mEQdy+7PnkEMIRHNJq7Ui
         GCGcl80NaKufh9syw/8lP7o3IjTG8EJ7U6nYFALQs7E+DGvcpC2wTVxkHOnmM9GOjWpB
         GmM7nqxZKVFnn6SpjtCX7oAyjJmBp3tT8e28v8s+5XJVkLhc2yF4Z9ah6lA0as80wiQD
         Y85yvkk/Z5eJwCU3/usvYj9NCLSwI4mrR8py/BR+9i1pJgD1go5cjJr96r6nncNdlKsF
         8D4mbUXeUd9SK0i1ka4JIMkA1jzQ8cH7GVQVmdmmfHWBfM8UgVuY7Z80HKNALAUH85Qr
         FBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1e/5FAsX1W0C7ZhxZGf1zkvZetMknOqFnbVBQVJSPLU=;
        fh=yRup0gQd4Qk9N6eUNj8kXkuKvdCTwWcKSeXZ5+LSHis=;
        b=lcMXdgEkhJPEBJsTcYWxHgVh2qHZwF4co2GR+tWUrpFY3vKGPM9cnJo3RRxpu81TwD
         UTzi7xdOs8BHMUkZnyNqI2a5W47ZdN6ZldUZfGqu0VaTJ/glLt3JwSE0HIFaka/uTsAB
         aafIst9nrfvLtxvRsBSYmCuVDUZlRf08ubIQv6Dr3jCByUdcF01HnDilQTsWraKqCQFB
         zVNMKq86qpShXzlrVvy4WDua3uUxtsaO4mSqXJYIIiTnSXB/0AeELvw2v7IWX5K6ZBeI
         /fdlJSp7/ZuStJefJ2DaERAdAnOKVmqF7O59YV7TSoO+SlNTGoS4fqoOWU3zzMerTy/m
         TMZw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769494386; x=1770099186; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1e/5FAsX1W0C7ZhxZGf1zkvZetMknOqFnbVBQVJSPLU=;
        b=B5LfeYNK1qclccyXzJmn2spSRGHkEguA7zc0pZllpdrK19mu8WrYa8u2Ci2ZvTuhYd
         sDq4z2m5W4hh6DPnVZri/9G0OhN8Ep5u8ejl3udDdtfnl9gdLOvy3u4qCpt9fHEWDQ+n
         Ha5bISVjPBwLJfv+o+zYUx2ThRgRxf93wGudr6CyGzW4SRqRW+8NBXnDf3oiDaDTCLuF
         2FO5x2LH43R6Sgo3xf72OJGHSowsOEgRt181f4U/tiHE+D3L0kWdJeSE1+tmQKycCLl5
         mdEab8qQsCbai7ouZYvcwUT9cSCFZBPCqTZOdUwas+asWZEFxfT3j0M1iavRguZMN6ot
         xe4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769494386; x=1770099186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1e/5FAsX1W0C7ZhxZGf1zkvZetMknOqFnbVBQVJSPLU=;
        b=uvKycGsr8Er99dNNG6O+0Xn7LcE9+alTLRLqNhQTk+sZGi+oIgf4rj1B1zw5xaATAE
         lyrHYIRCti7AuLWQ1eRFnp91R/aMozW1FcDCh1YOEvzoOJ0dmCGePd3hUVmhxNkzupbk
         lKGTZzrRJ0WghTv5rLmDPiMUhFVzaD3BSXHEZPo4660prqFs3/RkOblZsajBqHlnitHU
         Cz/BwK3Vd2lVpD4rS8cRDuCOaZLxz1w0+fW0Q+7IKQu3EuYAFUnkNh+oR7xFrMiiwalo
         +y3iTf0u8vuau7i8+5rG5rNTY0A5Oy6q99KbH5VIOn3fMoW/di2xaMLIBEVc44FP3hXr
         viDQ==
X-Gm-Message-State: AOJu0Ywf0id+RzVhmK/qhV0E3LprfiprhQJmDr6a1LRo5fZdYYI/TxJ/
	VuQQkse8figAv6r112DuS7XUwevQzE8SNVdU/Hx0M+qtB0C503wunCVWMfykmvmbZGR6ySFhqox
	+T0IiNVrtODdfU0uXJqt/plr9YYXKqRZN0T7IyDE=
X-Gm-Gg: AZuq6aLfY+0nudjor0EMjp1Ib/BfPKdFpF4fiB/i4hjsDBQcOwXhkvd/BXsQssmmm8u
	7Npn0yhXVFE32uFicG131QUV8FwuYlRmu+I1lDrsTwJkBAvnycc79A95Bou5J248S2dZBof6u/a
	mBBIoi8OLMkgLMB5CDQWw3lMa/o7pOL6ywNX1tUWKia9UCQi/Tc7vdDhGo+dItPhQ7S2y+zueKT
	e3zdrlUhl1B9Y/UfSGA0Mb8OQzVv5i7zEbYrG/uHdYc6VSkSh93qdzOaHlwrMGY0OwL2nxUw7Cd
	caqTZt4mBJVxIewd4edzlDWQsGpjV3LOO+IpQU1QDcfNUJ0j7gwJV9EOHwOvCJKDq3YAxeiPsWb
	B6CaFKZNi2g0q2eqBslfykUC1RI9gDZ1jcwWiFGOdCPPM
X-Received: by 2002:a05:690c:312:b0:78f:a615:2724 with SMTP id
 00721157ae682-7947ac3fdefmr9103187b3.48.1769494386003; Mon, 26 Jan 2026
 22:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20260122194959.13457-2-rs@ti.com> <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
 <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com> <DFYTFOYS891P.2A5CKLOKP5KGI@ti.com>
 <117668c8-bc3b-46ea-9d2e-b205e3f2f827@windriver.com>
In-Reply-To: <117668c8-bc3b-46ea-9d2e-b205e3f2f827@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jan 2026 22:12:40 -0800
X-Gm-Features: AZwV_QjDE4QkJ4_AfuT7PU7gqcjIwuX8upC3Cm4WkfbdotNhRNXo7wu5l9OEwgM
Message-ID: <CAMKF1srfwp+o0FC5r+Y+NfmWV3hFCJr7ifO5rH1C0+Gos-HejQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from TARGET_LDFLAGS
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004f52d30649588450"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 06:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230030

--0000000000004f52d30649588450
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am seeing some additional diagnostics see

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5119153/raw_inlin=
e

I wonder if this is related.


On Mon, Jan 26, 2026 at 6:50=E2=80=AFPM Changqing Li via lists.openembedded=
.org <
changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:

>
> On 1/27/26 04:50, Randolph Sapp via lists.openembedded.org wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Mon Jan 26, 2026 at 9:04 AM CST, Tony Battersby wrote:
>
> On 1/26/26 03:39, Changqing Li wrote:
>
> On 1/23/26 03:50, Randolph Sapp via lists.openembedded.org wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> From: Randolph Sapp <rs@ti.com> <rs@ti.com>
>
> Now that the previous bug affecting binary reproducibility has been
> addressed [1], we can revert this patch. This will resolve issues with
> cgo applications becoming unreprodcible.
>
> Currently go considers link arguments to be sacred, meaning any change
> should produce a different binary output. They ensure this by baking
> link arguments into the intermediary output, changing the content ID of
> that step. As such, the marco prefixes inadvertently end up adding build
> paths to the output binary instead of removing them if they are passed
> as link arguments to cgo applications.
>
> These paths are later stripped out again, but at this point the content
> ID of the dependency has changed and thus the build ID of the end
> application will be affected by the cascade of hash changes. See the
> upstream bug for more information [2].
>
> This reverts commit fddaecc88979967d0e00e2fafdbaaabec030da9f.
>
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473
> [2] https://github.com/golang/go/issues/77218
>
> Signed-off-by: Randolph Sapp <rs@ti.com> <rs@ti.com>
> ---
>
> This resolves the previously reported emptty issues:https://lists.openemb=
edded.org/g/openembedded-core/message/228549
>
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 88f4d0df69..da873c3f4e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?=3D "${@['-Wl,--hash-style=3D=
gnu',''][d.getVar('LINKER_HASH_ ASNEEDED ?=3D " <$%7B@['-Wl,--hash-style=3D=
gnu',''][d.getVar('LINKER_HASH_ASNEEDED?=3D>-Wl,--as-needed"
>
>  export LDFLAGS =3D "${TARGET_LDFLAGS}"
> -TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEBU=
G_PREFIX_MAP}"
> +TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
>
> Hi,
>
> After check the related gcc bug and yocto bug,  gcc bug comments 21
> ([1])  and yocto bug comments 13 ([2]),
>
> my understanding is that,  when lto is enabled,  even with gcc fix
> [3],  we still need DEBUG_PREFIX_MAP in LDFLAGS
>
> to make bin reproducible. Also seems Tony's commit [4] is after gcc
> fix [3].
>
> [1]  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473#c21
>
> [2]  https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481#c13
>
> [3]  https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad500ae619c
>
> [4] https://git.openembedded.org/openembedded-core/commit/?id=3Dfddaecc88=
979967d0e00e2fafdbaaabec030da9f
>
>
> @Tony, @Randolph, Could please correct me if my understanding is not
> right, Thanks.
>
>
>
> Yes, LDFLAGS needs DEBUG_PREFIX_MAP to make LTO builds reproducible,
> unless something else has changed since 2021 to make it unnecessary. I
> have not kept up with the issue.
>
> Tony
>
> I think there has been some change because I tested this locally with the=
 normal
> reproducible builds selftest and no new packages were added to the failin=
g list.
> This included oe-core and some layers from meta-openembedded as well.
>
> Got it,  if DEBUG_PREFIX_MAP is not needed any more,  I think remove DEBU=
G_PREFIX_MAP
> from LDFLAGS
>
> is a good way to fix the issue.
>
> The example code given in the report is fairly rudimentary, we should hav=
e hit
> the bug if it was still in effect across a majority of packages if my
> understanding is correct.
>
> I'm also curious to see what golang want's to do about this though. Bakin=
g build
> options into a binary seems a little silly, but I'm sure there was some u=
nusual
> behavior that led them to that point.
>
> +1
>
> //Changqing
>
> As indicated on another thread, we could also just remove this string fro=
m Go
> packages LDFLAGS if that puts everyone at ease.
>
> - Randolph
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230027):
> https://lists.openembedded.org/g/openembedded-core/message/230027
> Mute This Topic: https://lists.openembedded.org/mt/117408334/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004f52d30649588450
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am seeing some additional diagnostics see</div><div=
><br></div><div><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/ap=
i/v2/logs/5119153/raw_inline">https://autobuilder.yoctoproject.org/valkyrie=
/api/v2/logs/5119153/raw_inline</a></div><div><br></div><div>I wonder if th=
is is related.</div><div><br></div></div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 26, 20=
26 at 6:50=E2=80=AFPM Changqing Li via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;<a href=3D"http://changqing.li">changq=
ing.li</a>=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windri=
ver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><u></u>

 =20
  <div bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div>On 1/27/26 04:50, Randolph Sapp via
      <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Mon Jan 26, 2026 at 9:04 AM CST, Tony Battersby wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>On 1/26/26 03:39, Changqing Li wrote:
</pre>
        <blockquote type=3D"cite">
          <pre>On 1/23/26 03:50, Randolph Sapp via <a href=3D"http://lists.=
openembedded.org" target=3D"_blank">lists.openembedded.org</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre>CAUTION: This email comes from a non Wind River email acco=
unt!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

From: Randolph Sapp <a href=3D"mailto:rs@ti.com" target=3D"_blank">&lt;rs@t=
i.com&gt;</a>

Now that the previous bug affecting binary reproducibility has been
addressed [1], we can revert this patch. This will resolve issues with
cgo applications becoming unreprodcible.

Currently go considers link arguments to be sacred, meaning any change
should produce a different binary output. They ensure this by baking
link arguments into the intermediary output, changing the content ID of
that step. As such, the marco prefixes inadvertently end up adding build
paths to the output binary instead of removing them if they are passed
as link arguments to cgo applications.

These paths are later stripped out again, but at this point the content
ID of the dependency has changed and thus the build ID of the end
application will be affected by the cascade of hash changes. See the
upstream bug for more information [2].

This reverts commit fddaecc88979967d0e00e2fafdbaaabec030da9f.

[1] <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473" targe=
t=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473</a>
[2] <a href=3D"https://github.com/golang/go/issues/77218" target=3D"_blank"=
>https://github.com/golang/go/issues/77218</a>

Signed-off-by: Randolph Sapp <a href=3D"mailto:rs@ti.com" target=3D"_blank"=
>&lt;rs@ti.com&gt;</a>
---

This resolves the previously reported emptty issues:
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/22854=
9" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/mes=
sage/228549</a>

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 88f4d0df69..da873c3f4e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?=3D <a href=3D"mailto:$%7B@[&#3=
9;-Wl,--hash-style=3Dgnu&#39;,&#39;&#39;][d.getVar(&#39;LINKER_HASH_ASNEEDE=
D?=3D" target=3D"_blank">&quot;${@[&#39;-Wl,--hash-style=3Dgnu&#39;,&#39;&#=
39;][d.getVar(&#39;LINKER_HASH_ ASNEEDED ?=3D &quot;</a>-Wl,--as-needed&quo=
t;

 export LDFLAGS =3D &quot;${TARGET_LDFLAGS}&quot;
-TARGET_LDFLAGS =3D &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${D=
EBUG_PREFIX_MAP}&quot;
+TARGET_LDFLAGS =3D &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}&quo=
t;
</pre>
          </blockquote>
          <pre>Hi,

After check the related gcc bug and yocto bug,  gcc bug comments 21
([1])  and yocto bug comments 13 ([2]),

my understanding is that,  when lto is enabled,  even with gcc fix
[3],  we still need DEBUG_PREFIX_MAP in LDFLAGS

to make bin reproducible. Also seems Tony&#39;s commit [4] is after gcc
fix [3].

[1]=C2=A0 <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473#=
c21" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D10147=
3#c21</a>

[2]=C2=A0 <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14=
481#c13" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D14481#c13</a>

[3]=C2=A0 <a href=3D"https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad5=
00ae619c" target=3D"_blank">https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc=
34a9ad500ae619c</a>

[4]=C2=A0
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Dfdda=
ecc88979967d0e00e2fafdbaaabec030da9f" target=3D"_blank">https://git.openemb=
edded.org/openembedded-core/commit/?id=3Dfddaecc88979967d0e00e2fafdbaaabec0=
30da9f</a>


@Tony, @Randolph, Could please correct me if my understanding is not
right, Thanks.


</pre>
        </blockquote>
        <pre>Yes, LDFLAGS needs DEBUG_PREFIX_MAP to make LTO builds reprodu=
cible,
unless something else has changed since 2021 to make it unnecessary. I
have not kept up with the issue.

Tony
</pre>
      </blockquote>
      <pre>I think there has been some change because I tested this locally=
 with the normal
reproducible builds selftest and no new packages were added to the failing =
list.
This included oe-core and some layers from meta-openembedded as well.</pre>
    </blockquote>
    <pre></pre>
    <p>Got it,=C2=A0 if <span style=3D"white-space:pre-wrap">DEBUG_PREFIX_M=
AP</span>
      is not needed any more,=C2=A0 I think remove <span style=3D"white-spa=
ce:pre-wrap">DEBUG_PREFIX_MAP from </span><span style=3D"white-space:pre-wr=
ap">LDFLAGS </span></p>
    <p><span style=3D"white-space:pre-wrap">is a good way to fix the issue.=
  </span></p>
    <blockquote type=3D"cite">
      <pre>The example code given in the report is fairly rudimentary, we s=
hould have hit
the bug if it was still in effect across a majority of packages if my
understanding is correct.

I&#39;m also curious to see what golang want&#39;s to do about this though.=
 Baking build
options into a binary seems a little silly, but I&#39;m sure there was some=
 unusual
behavior that led them to that point.</pre>
    </blockquote>
    <p>+1</p>
    <p>//Changqing<br>
    </p>
    <blockquote type=3D"cite">
      <pre>As indicated on another thread, we could also just remove this s=
tring from Go
packages LDFLAGS if that puts everyone at ease.

- Randolph
</pre>
    </blockquote>
    <blockquote type=3D"cite"><br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230027): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230027" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230027</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117408334/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117408334/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004f52d30649588450--

