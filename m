Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EF2CD6E69
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 09:42:38 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16206.1780479757367984485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 02:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kJuLwTN4;
 spf=pass (domain: mvista.com, ip: 209.85.218.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bec405a6ea5so566702066b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 02:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780479756; cv=none;
        d=google.com; s=arc-20240605;
        b=ZEaHYhQVOUePiQoKNI80u7ftJowMI3HK28ytr0EgcDmvokW96N0pROwY5EIdkpFjIq
         Gv3Mbcql8VQFlSTkST3ENUv9nzaj837SdmUmZtYQWHArrba2sxQN71qgQd1cD9Q3ctzN
         M4ymabdyQlNgHAQhvOQu1mGecs5v1fBxCHVLqT6G/gOhDBzLIc7Ba8aqehPgbWvHkxjB
         JZpg7RGuYKrm+XPqc2HFSSD9Q5CvWwmkGFewNwJqkLK7Lg7bW/qG47c+3x+zu1bNITMS
         ijbj0PxgWsUP9Enw4RXkNW8lIZVt4fSC8d4NF6Cnt6F0kuDnw2TElCy6ECRYAnsmmoei
         ao6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5OCVRRMwBTGk/mwLWdIh17bEeL2MdNmW9NpJJUMYmkU=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=BAMZ5JnLJMmzW1ZLtYFyL+p5tUIdD2A3rlrK41okASTT9DFtJQQAekI2CLoGrCHkkO
         amLEzOvT5AHjJ+vkjBktHexyvFJ0W48P+VuExJZrNCRa0C4tyl8Mb8jrWwMdp8/awqzz
         AI4cfL34aIxCtIIjlup1zfZ9UKAftFutNXIXdNcKeRhbi1j2O5M9qBLDxG7sqJMaBZbN
         h4jXaZ9uEDCc4vnCp5SOmV+TcRmaQ0FvaPy2bxQrjkvWMoI+YJ+MnXqywf+l2vBBI/Ho
         MzLYhEl5dVEg1Hk2G01WBjhe4Adao3T4uSpBVqQEKAJc/YTHwt55LrDo2TsFRUW7xEQz
         oUlQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1780479756; x=1781084556; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5OCVRRMwBTGk/mwLWdIh17bEeL2MdNmW9NpJJUMYmkU=;
        b=kJuLwTN4J4JgNMjFkbnCB3CRBDcMLkjVHlXaXam32xrcDfkvgaYPjPZBuOYkYMgKRy
         7hWERRFANWhmOojdT9nl8unHiOxiYuvENrACcPcONKZlFTf7OuaHBvKz33hcAVZ05l4z
         r2mCrQ3xVDxQCZNlo4EuSiAtbKeI00HsM/aPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780479756; x=1781084556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OCVRRMwBTGk/mwLWdIh17bEeL2MdNmW9NpJJUMYmkU=;
        b=qUnLKb08aeEb253EkfqGoCRPchuj6ij/eqo1O5nt8bsGKfGtbBgvPJww4Ul0mNQymL
         klEZKGxSKthxK9EOkrxqr+BO0tHrTpjj/zz9j+KQFATu2UdLZKblVrwMQa/6b4TziCnB
         s2Z53TRi/dQ4vEl6owW0huwXnxzdgKP09dpZxISDPUtzAbaLynesU2mfwQyLKHpSXXF1
         S+oQSO0SLGjNO/GYYN7FGZdgELk6idD41LwNme9UtuVCCeyNTFmuDXuJsCRVzkDTpcyo
         MT7PX833p+JPAo2Rv9dNXhNYquw6nvMXt1j3Vtv+Ad5bbJOSrTuqOC+DXMurbnA34yKO
         1aoA==
X-Gm-Message-State: AOJu0YxE3sV4sVWHMQ/+5yJtixJweT3iJUVlNNtVpucMe76G8ENZHPEE
	6TlH/Dqcb9DF4JNsCNC0fDR1gC8sNgoiZiRoMGKIIk+wFwQGjc8Xji4ejJpcY14tk3Ra4HfBaMQ
	m2wGeHqnfNDPHmgjvB1y3wxmffPMCJhlZpXttnlPwlw==
X-Gm-Gg: Acq92OH6LLf8hKvfarPkOEK3iK59cwzLsqpuxRCasViZiY2NkHbvZOQR4Cn55jfhORM
	r0YSHkMis6yWk/JXl8StjwFfMfJaqzNHxqQG1CUeFKaKKebKNdSDC4Sg3VMtAXqTFtQ9V7sftzt
	J1pKr6BiokArtmuMv15bQXn3jM6LRg9I22t37tSP2ndhamK5pj+bs4eA83l+/wHg39XAMsV02Tj
	QqD4w7HL7Onm30NvOQwA982pqNfch/guhi9XcyYl4o1mq43w/Vp0l/BDYa9HPW6dlNy/OA6nZvl
	xXNqbckz0NUGs3wuukHdYgwv88dJyQ6bg9fQxMOc+fHBytix4Ll/+947dSMl3eM=
X-Received: by 2002:a17:907:1784:b0:bee:66ba:36b9 with SMTP id
 a640c23a62f3a-bf0af5083damr122812366b.44.1780479755516; Wed, 03 Jun 2026
 02:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260512085923.820545-1-vanusuri@mvista.com> <DIYKXGF7JHKH.33C4968AVKRK3@smile.fr>
In-Reply-To: <DIYKXGF7JHKH.33C4968AVKRK3@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 3 Jun 2026 15:12:23 +0530
X-Gm-Features: AVHnY4KRMpiIyzauIKVUKwTNF-s_goTkq-kide8QhiDCsLJBLAKe79K7iAxcfHE
Message-ID: <CANQUz180-OBaD8hGVzN64U+gCsr0p8ChJ=g5jSRgy7uL40Bzzw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch 1/5] xserver-xorg: Fix CVE-2026-33999
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005b8cd30653563fa4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 09:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238089

--0000000000005b8cd30653563fa4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for reminding me.

This series CVE's fixed in xserver-xorg 21.1.22.

Release Notes:
https://lists.x.org/archives/xorg-announce/2026-April/003678.html

Already xserver-xorg upgraded to 21.1.22 in master branch.

https://git.openembedded.org/openembedded-core/commit/?id=3Dd4452b34849b4f0=
6c979c394dc0c824958243861

I've sent upgrade patch to wrynose branch.

Thanks & Regards,
Vijay

On Tue, Jun 2, 2026 at 6:28=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:

> On Tue May 12, 2026 at 10:59 AM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Pick patch according to [1]
> >
> > [1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
> > [2] https://security-tracker.debian.org/tracker/CVE-2026-33999
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>
> As far as I can tell, this whole series should also be applied to
> wrynose and master. Can you send this to theses branches and ping back
> here?
>
> Thanks!
>
> > ---
> >  .../xserver-xorg/CVE-2026-33999.patch         | 49 +++++++++++++++++++
> >  .../xorg-xserver/xserver-xorg_21.1.18.bb      |  1 +
> >  2 files changed, 50 insertions(+)
> >  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
> >
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
> > new file mode 100644
> > index 0000000000..cd3bf47397
> > --- /dev/null
> > +++
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
> > @@ -0,0 +1,49 @@
> > +From b024ae1749ee58c6fbf863b9a1f5dc440fee2e1b Mon Sep 17 00:00:00 2001
> > +From: Peter Harris <pharris2@rocketsoftware.com>
> > +Date: Thu, 15 Jan 2026 15:54:09 -0500
> > +Subject: [PATCH] xkb: fix buffer re-use in _XkbSetCompatMap
> > +
> > +If the "compat" buffer has previously been truncated, there will be
> > +unused space in the buffer. The code uses this space, but does not
> > +update the number of valid entries in the buffer.
> > +
> > +In the best case, this leads to the new compat entries being ignored.
> In the
> > +worst case, if there are any "skipped" compat entries, the number of
> > +valid entries will be corrupted, potentially leading to a buffer read
> > +overrun when processing a future request.
> > +
> > +Set the number of used "compat" entries when re-using previously
> > +allocated space in the buffer.
> > +
> > +CVE-2026-33999, ZDI-CAN-28593
> > +
> > +This vulnerability was discovered by:
> > +Jan-Niklas Sohn working with TrendAI Zero Day Initiative
> > +
> > +Signed-off-by: Peter Harris <pharris2@rocketsoftware.com>
> > +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> > +Part-of: <
> https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2176>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/b024ae1749ee58c6fbf8=
63b9a1f5dc440fee2e1b
> ]
> > +CVE: CVE-2026-33999
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + xkb/xkb.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/xkb/xkb.c b/xkb/xkb.c
> > +index 137d70d..2b9004a 100644
> > +--- a/xkb/xkb.c
> > ++++ b/xkb/xkb.c
> > +@@ -3004,7 +3004,7 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr
> dev,
> > +                 return BadAlloc;
> > +             }
> > +         }
> > +-        else if (req->truncateSI) {
> > ++        else if (req->truncateSI || req->firstSI + req->nSI >
> compat->num_si) {
> > +             compat->num_si =3D req->firstSI + req->nSI;
> > +         }
> > +         sym =3D &compat->sym_interpret[req->firstSI];
> > +--
> > +2.43.0
> > +
> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
> > index 7f6197a0b4..ef7f5c5bdb 100644
> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
> > @@ -5,6 +5,7 @@ SRC_URI +=3D
> "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
> >
> file://0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch \
> >
> file://0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch \
> >              file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch =
\
> > +            file://CVE-2026-33999.patch \
> >              "
> >  SRC_URI[sha256sum] =3D
> "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
> >
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--0000000000005b8cd30653563fa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi=C2=A0Yoann,<br><br></div>Thanks for reminding=
 me.=C2=A0<br><br></div><div>This series CVE&#39;s fixed in xserver-xorg 21=
.1.22.=C2=A0<br><br></div><div>Release Notes:=C2=A0<a href=3D"https://lists=
.x.org/archives/xorg-announce/2026-April/003678.html">https://lists.x.org/a=
rchives/xorg-announce/2026-April/003678.html</a><br><br></div><div>Already =
xserver-xorg upgraded to 21.1.22 in master branch.<br><br><a href=3D"https:=
//git.openembedded.org/openembedded-core/commit/?id=3Dd4452b34849b4f06c979c=
394dc0c824958243861">https://git.openembedded.org/openembedded-core/commit/=
?id=3Dd4452b34849b4f06c979c394dc0c824958243861</a><br><br></div><div>I&#39;=
ve sent upgrade patch to wrynose branch.<br><br></div><div>Thanks &amp;=C2=
=A0Regards,<br></div><div>Vijay</div></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2, 2=
026 at 6:28=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smil=
e.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Tue May 12, 2026 at 10:59 AM CEST, Vijay Anus=
uri via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a> wrote:<br>
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

--0000000000005b8cd30653563fa4--

