Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF169CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 12:40:48 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128562.1781527242055303732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 05:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XWzTX7v0;
 spf=pass (domain: mvista.com, ip: 209.85.218.54, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c029505b389so120967466b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 05:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781527240; cv=none;
        d=google.com; s=arc-20240605;
        b=huL/e+7/Re//5dfURXXce0ZaIbqkayuYacNa7IAuzTmottsZtcbfICGDlOdNDe22e8
         YbxGvpoa/0YnP1Fr6iskbGJRtJf85u97dY4bzMZ5Ad4PQ5vRserf70S1fHaEcstzKlzC
         IYg9dQdcGDIBVDce2DNFU9+gj8OxEWLKeZWi5uJIk7lfslp3gLZ4qLe6HcAgDaA1dBiZ
         v+qokFtROKLQnsyNe6iFtwdlarVWBNewe+xRTvcmP2x7YcqX7L2+dG289KapXSrPlbnS
         O29yok99d4pxjokYyaPdV5zf8bA6lHy0ifArT8clUIzBUZXs3up4c5tPjHjNZZBBy3R/
         a3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=19BXCB9CpprWf/95fIlNvwzlqlk96OYwgPg1sPGE3eI=;
        fh=Hc3KlpN5nTprwU7oimKbPGarY+IcUK7IpFUe9B6c4/4=;
        b=O4C3wBqbVmQqba0U5l1dDXjkPdn9n0qEY541IIeb2utpl6+JK/SzAh6wXWsIYayJPl
         /YJVXVoF/Nqd8s+uPWcV6h978ThUj+yHPUHjC8oGwBpE5prAKEx267ewg3lVWfcLP+FL
         K+OGGZOWjdCgCuIEn8Y2SOJdKfajRzH4YnFxT5HFhbM0/OCncSLWaKEEbhwcGSVl5XIx
         2/QcI/xPnc/ILMCJPiq0MlMzR+pq8ivjw05Esfa9ZO83w0g6kNAJPTyCzBSSLCOlqVgZ
         NdoIUsKgp66Xi2vX+A+7pCCDgGL79zcrQ+qKVCgPPv932hUKrwthJwdW+wr0Zt+nRlkL
         3YBg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781527240; x=1782132040; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=19BXCB9CpprWf/95fIlNvwzlqlk96OYwgPg1sPGE3eI=;
        b=XWzTX7v0mkQ/A1ZQjtHoU2WQBw2QfLkLc6jpQiT1LCto+e/eHhDdRRqPfHSQRqGY/e
         jgSwPX4A6xYRLUMkUTx6+9L1a9ZjugesE3nfGXukfTUJBFycEnaovZvdmeUZ2nK63m6r
         1mkeOXriVtDfWCljshKO+oRjNZdz+/WVCTzCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527240; x=1782132040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19BXCB9CpprWf/95fIlNvwzlqlk96OYwgPg1sPGE3eI=;
        b=nMpcdxwWBtp5/4UrNbHmwDZWcf7CNZmtccXRy5evx9sjsqWU/jKDYFuZ2lNiZh/6Wy
         eEjm5+i5hSwNr9F8yDitTMfWsO1hA6oxGZWwIvtrsK0xWSlmvb4kpkqHvmtIz5R7Mj1N
         vjqvtRyOklqUmKEgPPcYiq7ffAu8dz+1JER4VQDOzx0VFg47H/KbD+X3XKCF/SvUa20H
         HaLMgsj5lTevWa+30SG3J007Q6Z0S4Y3OXSrMwne0Hj6a21VMdUmTSaythEwwwXRsreA
         hMYCPgGVs09WlwCdp4sLrG3PmUGvk/drHQdI+2Z+BbZYSZmGzK1BOPjRCh/mzIz5iP7I
         vjKA==
X-Forwarded-Encrypted: i=1; AFNElJ9+D9scb1gnTf3u0A3MNDuzkUcGG5SikC03qQUlsnTbsguIg1vctEf+ob3rSVSZoK70iZMMVufor49DGmUZUzqiGQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyhquw8+g90kxprfOqQicKB0vclPGFhPlCIcOEIkbGDGDTszi6X
	64vgL+GzATCZWEsne+z63LPKByx2zh2Ar/GAgXZ61ULW2AoNlHkdfCBpjNmb5aSWIjlTOcN5gu+
	F+6gjevtarT0AhcmX919EkwW/jbst0RtbG8SZ+kezuA==
X-Gm-Gg: Acq92OGSRdr96rEP79LjOZejDusyE8qGX7CUu/eOaizXS0mVmRi+6YutWeWd7lW9ClX
	b5Fwp2BTtE5l0x1KOAaSpFreZKG1FbT27K7Lnr3Jlicz3eFGMG2HsRUzvKVq+QJsnnhB/Yk0z0S
	6NXpbeQSAPa2ouRp9zLF7aTVRSvbSzyv97WCreOjOPqni3GT49ztXhH8zCiWqUHcGt+1MUZqxQy
	TPox/Dgt0OrAG0soX/ui9nIgSC1/YEUUTN37zcLUIyGd2U2FKYSSMjBkCOqIVsRXcWbIl4WjBQr
	6k9X8eeEQgK57l7zpaySHRLcBPtp0FVueuSpvmWeJDSdXZ5+Rmdi
X-Received: by 2002:a17:906:8a41:b0:bfe:ed35:e855 with SMTP id
 a640c23a62f3a-bfeed35e994mr330228966b.26.1781527239916; Mon, 15 Jun 2026
 05:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260512085923.820545-1-vanusuri@mvista.com> <DIYKXGF7JHKH.33C4968AVKRK3@smile.fr>
 <18B588E806F51269.3712505@lists.openembedded.org>
In-Reply-To: <18B588E806F51269.3712505@lists.openembedded.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 15 Jun 2026 18:10:28 +0530
X-Gm-Features: AVVi8CcdjBJslsk8W1iR_ans15JGWXB3GbG2_FlrdMGMyI0ZAalZ-a8iXVFyWZc
Message-ID: <CANQUz1-TcipZSCEXwBSPt1FScjcqxZdyR305itxhGpOFDx+czg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch 1/5] xserver-xorg: Fix CVE-2026-33999
To: vanusuri@mvista.com
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004b16e606544a2279"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 12:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238848

--0000000000004b16e606544a2279
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any update on this?

Thanks & Regards,
Vijay

On Wed, Jun 3, 2026 at 3:12=E2=80=AFPM Vijay Anusuri via lists.openembedded=
.org
<vanusuri=3Dmvista.com@lists.openembedded.org> wrote:

> Hi Yoann,
>
> Thanks for reminding me.
>
> This series CVE's fixed in xserver-xorg 21.1.22.
>
> Release Notes:
> https://lists.x.org/archives/xorg-announce/2026-April/003678.html
>
> Already xserver-xorg upgraded to 21.1.22 in master branch.
>
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Dd4452b34849b4=
f06c979c394dc0c824958243861
>
> I've sent upgrade patch to wrynose branch.
>
> Thanks & Regards,
> Vijay
>
> On Tue, Jun 2, 2026 at 6:28=E2=80=AFPM Yoann Congal <yoann.congal@smile.f=
r> wrote:
>
>> On Tue May 12, 2026 at 10:59 AM CEST, Vijay Anusuri via
>> lists.openembedded.org wrote:
>> > Pick patch according to [1]
>> >
>> > [1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
>> > [2] https://security-tracker.debian.org/tracker/CVE-2026-33999
>> >
>> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>
>> As far as I can tell, this whole series should also be applied to
>> wrynose and master. Can you send this to theses branches and ping back
>> here?
>>
>> Thanks!
>>
>> > ---
>> >  .../xserver-xorg/CVE-2026-33999.patch         | 49 ++++++++++++++++++=
+
>> >  .../xorg-xserver/xserver-xorg_21.1.18.bb      |  1 +
>> >  2 files changed, 50 insertions(+)
>> >  create mode 100644
>> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
>> >
>> > diff --git
>> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
>> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
>> > new file mode 100644
>> > index 0000000000..cd3bf47397
>> > --- /dev/null
>> > +++
>> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
>> > @@ -0,0 +1,49 @@
>> > +From b024ae1749ee58c6fbf863b9a1f5dc440fee2e1b Mon Sep 17 00:00:00 200=
1
>> > +From: Peter Harris <pharris2@rocketsoftware.com>
>> > +Date: Thu, 15 Jan 2026 15:54:09 -0500
>> > +Subject: [PATCH] xkb: fix buffer re-use in _XkbSetCompatMap
>> > +
>> > +If the "compat" buffer has previously been truncated, there will be
>> > +unused space in the buffer. The code uses this space, but does not
>> > +update the number of valid entries in the buffer.
>> > +
>> > +In the best case, this leads to the new compat entries being ignored.
>> In the
>> > +worst case, if there are any "skipped" compat entries, the number of
>> > +valid entries will be corrupted, potentially leading to a buffer read
>> > +overrun when processing a future request.
>> > +
>> > +Set the number of used "compat" entries when re-using previously
>> > +allocated space in the buffer.
>> > +
>> > +CVE-2026-33999, ZDI-CAN-28593
>> > +
>> > +This vulnerability was discovered by:
>> > +Jan-Niklas Sohn working with TrendAI Zero Day Initiative
>> > +
>> > +Signed-off-by: Peter Harris <pharris2@rocketsoftware.com>
>> > +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
>> > +Part-of: <
>> https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2176>
>> > +
>> > +Upstream-Status: Backport [
>> https://gitlab.freedesktop.org/xorg/xserver/-/commit/b024ae1749ee58c6fbf=
863b9a1f5dc440fee2e1b
>> ]
>> > +CVE: CVE-2026-33999
>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > +---
>> > + xkb/xkb.c | 2 +-
>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> > +
>> > +diff --git a/xkb/xkb.c b/xkb/xkb.c
>> > +index 137d70d..2b9004a 100644
>> > +--- a/xkb/xkb.c
>> > ++++ b/xkb/xkb.c
>> > +@@ -3004,7 +3004,7 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr
>> dev,
>> > +                 return BadAlloc;
>> > +             }
>> > +         }
>> > +-        else if (req->truncateSI) {
>> > ++        else if (req->truncateSI || req->firstSI + req->nSI >
>> compat->num_si) {
>> > +             compat->num_si =3D req->firstSI + req->nSI;
>> > +         }
>> > +         sym =3D &compat->sym_interpret[req->firstSI];
>> > +--
>> > +2.43.0
>> > +
>> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.b=
b
>> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
>> > index 7f6197a0b4..ef7f5c5bdb 100644
>> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
>> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
>> > @@ -5,6 +5,7 @@ SRC_URI +=3D
>> "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
>> >
>> file://0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch \
>> >
>> file://0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch \
>> >              file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch=
 \
>> > +            file://CVE-2026-33999.patch \
>> >              "
>> >  SRC_URI[sha256sum] =3D
>> "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
>> >
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238089):
> https://lists.openembedded.org/g/openembedded-core/message/238089
> Mute This Topic: https://lists.openembedded.org/mt/119271485/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004b16e606544a2279
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Team,<br><br></div>Any update on this?<b=
r><br></div>Thanks &amp; Regards,<br></div>Vijay</div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, Jun 3, 2026 at 3:12=E2=80=AFPM Vijay Anusuri via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mai=
lto:mvista.com@lists.openembedded.org">mvista.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div><div>Hi=C2=A0Yoann,<br><br></div>Thanks for reminding me=
.=C2=A0<br><br></div><div>This series CVE&#39;s fixed in xserver-xorg 21.1.=
22.=C2=A0<br><br></div><div>Release Notes:=C2=A0<a href=3D"https://lists.x.=
org/archives/xorg-announce/2026-April/003678.html" target=3D"_blank">https:=
//lists.x.org/archives/xorg-announce/2026-April/003678.html</a><br><br></di=
v><div>Already xserver-xorg upgraded to 21.1.22 in master branch.<br><br><a=
 href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Dd4452b=
34849b4f06c979c394dc0c824958243861" target=3D"_blank">https://git.openembed=
ded.org/openembedded-core/commit/?id=3Dd4452b34849b4f06c979c394dc0c82495824=
3861</a><br><br></div><div>I&#39;ve sent upgrade patch to wrynose branch.<b=
r><br></div><div>Thanks &amp;=C2=A0Regards,<br></div><div>Vijay</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Jun 2, 2026 at 6:28=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.c=
ongal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue May 12, 2026 =
at 10:59 AM CEST, Vijay Anusuri via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<b=
r>
&gt; Pick patch according to [1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://lists.x.org/archives/xorg-announce/2026-April/0=
03677.html" rel=3D"noreferrer" target=3D"_blank">https://lists.x.org/archiv=
es/xorg-announce/2026-April/003677.html</a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-33=
999" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2026-33999</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
As far as I can tell, this whole series should also be applied to<br>
wrynose and master. Can you send this to theses branches and ping back<br>
here?<br>
<br>
Thanks!<br>
<br>
&gt; ---<br>
&gt;=C2=A0 .../xserver-xorg/CVE-2026-33999.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 49 +++++++++++++++++++<br>
&gt;=C2=A0 .../xorg-xserver/<a href=3D"http://xserver-xorg_21.1.18.bb" rel=
=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.18.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 50 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xo=
rg/CVE-2026-33999.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-=
33999.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-3399=
9.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..cd3bf47397<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.p=
atch<br>
&gt; @@ -0,0 +1,49 @@<br>
&gt; +From b024ae1749ee58c6fbf863b9a1f5dc440fee2e1b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Harris &lt;<a href=3D"mailto:pharris2@rocketsoftware.com"=
 target=3D"_blank">pharris2@rocketsoftware.com</a>&gt;<br>
&gt; +Date: Thu, 15 Jan 2026 15:54:09 -0500<br>
&gt; +Subject: [PATCH] xkb: fix buffer re-use in _XkbSetCompatMap<br>
&gt; +<br>
&gt; +If the &quot;compat&quot; buffer has previously been truncated, there=
 will be<br>
&gt; +unused space in the buffer. The code uses this space, but does not<br=
>
&gt; +update the number of valid entries in the buffer.<br>
&gt; +<br>
&gt; +In the best case, this leads to the new compat entries being ignored.=
 In the<br>
&gt; +worst case, if there are any &quot;skipped&quot; compat entries, the =
number of<br>
&gt; +valid entries will be corrupted, potentially leading to a buffer read=
<br>
&gt; +overrun when processing a future request.<br>
&gt; +<br>
&gt; +Set the number of used &quot;compat&quot; entries when re-using previ=
ously<br>
&gt; +allocated space in the buffer.<br>
&gt; +<br>
&gt; +CVE-2026-33999, ZDI-CAN-28593<br>
&gt; +<br>
&gt; +This vulnerability was discovered by:<br>
&gt; +Jan-Niklas Sohn working with TrendAI Zero Day Initiative<br>
&gt; +<br>
&gt; +Signed-off-by: Peter Harris &lt;<a href=3D"mailto:pharris2@rocketsoft=
ware.com" target=3D"_blank">pharris2@rocketsoftware.com</a>&gt;<br>
&gt; +Acked-by: Olivier Fourdan &lt;<a href=3D"mailto:ofourdan@redhat.com" =
target=3D"_blank">ofourdan@redhat.com</a>&gt;<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-=
/merge_requests/2176" rel=3D"noreferrer" target=3D"_blank">https://gitlab.f=
reedesktop.org/xorg/xserver/-/merge_requests/2176</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/b024ae1749ee58c6fbf863b9a1f5dc440fee2e1b" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/b024ae1749ee58c6fbf863b9a1f5dc440fee2e1b</a>]<br>
&gt; +CVE: CVE-2026-33999<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + xkb/xkb.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/xkb/xkb.c b/xkb/xkb.c<br>
&gt; +index 137d70d..2b9004a 100644<br>
&gt; +--- a/xkb/xkb.c<br>
&gt; ++++ b/xkb/xkb.c<br>
&gt; +@@ -3004,7 +3004,7 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr=
 dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
BadAlloc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (req-&gt;truncateSI) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (req-&gt;truncateSI || req-&gt;f=
irstSI + req-&gt;nSI &gt; compat-&gt;num_si) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compat-&gt;num_si =3D=
 req-&gt;firstSI + req-&gt;nSI;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sym =3D &amp;compat-&gt;sym_interpr=
et[req-&gt;firstSI];<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xser=
ver-xorg_21.1.18.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1=
.18.bb</a> b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-x=
org_21.1.18.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.18.b=
b</a><br>
&gt; index 7f6197a0b4..ef7f5c5bdb 100644<br>
&gt; --- a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xor=
g_21.1.18.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.18.bb<=
/a><br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xor=
g_21.1.18.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.18.bb<=
/a><br>
&gt; @@ -5,6 +5,7 @@ SRC_URI +=3D &quot;file://0001-xf86pciBus.c-use-Intel-=
ddx-only-for-pre-gen4-hardwar.pat<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-xkb-Make-t=
he-RT_XKBCLIENT-resource-private.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-xkb-Free-t=
he-XKB-resource-when-freeing-XkbInterest.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-xkb-Preven=
t-overflow-in-XkbSetCompatMap.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-33999.patch=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;c878d1930d87725d4a5bf498c24f4be8130=
d5b2646a9fd0f2994deff90116352&quot;<br>
&gt;=C2=A0 <br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#238089): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/238089" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/238089</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119271485/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119271485/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004b16e606544a2279--

