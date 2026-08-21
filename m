Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62404C5DF89
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:33:01 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6313.1787315572360350933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 05:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HbIOGcf+;
 spf=pass (domain: mvista.com, ip: 209.85.218.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c16794450aeso141125166b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 05:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787315570; cv=none;
        d=google.com; s=arc-20260327;
        b=XzH8h9NGPMYpt58xD+1glAOgLzw54zaeEJDF2Py7C0uGkcpihWWm1QXpKy7iYQUG8f
         pDkW3lVsSko9tNI+4Z0J/P/fA1iKXi/1iPFGfSy3RqSCYE6bLkVkDhKp9Cmj12Dh4oCA
         iAVUDTNEX577be/6KmdPDT9xoFZ2FJzz+AvGyjiWNmS+0QQC5QriqZsI6ciQ4ceR72uY
         h9g4eP0QgXIfNpSRMoWCkT349Wzb0/1G1vWYWgTPiQjRRhNNpu0fd0jOIh8hEkmAHfqi
         N85Nl9dVLATQo9Y2Ucpm6lb3A7+Q8TyHy9bcX872OM39tVMJCPXo5k9n2Qq8sv3W/UQ5
         amXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bfO8KMkcgCezzJXB5I4fUDIBWFihvcQPoSfxavdDM0s=;
        fh=naxir2af8lNW8n/3QABqYbi08yCXtb6kzmxI+9wcufY=;
        b=O1B0jQCyngzL9coE1t7TYAtGCkZBpYR1oqrLawvCWXEZf9C7kYbO1NuqxLVY+xoeZf
         LZ7PDr2Ur7LBgyPBWBQiCGMaPBLgYR83XqpZk3vPEhUdi4FAcKythtz8mEt9TAacIKyd
         L4FXiIQcwp58pOk3o/kUVVpzNEZ9VQHarPeFWKCXyn4VN305WGEsxnOKz9J2LUp4Xnlc
         MyBvmcH1/L6J+bvcB4StPhZBbCiToKpwaDT0rBtDkis1yQTichnxmjfXmUwi3J5or8bJ
         q1YlnnI7mH5tjaa5tmGIEbkAS3wNOICA24XY9Yh6nfjvEIeMVJCJaKlEInQ1eGwOe/VS
         lPaw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787315570; x=1787920370; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfO8KMkcgCezzJXB5I4fUDIBWFihvcQPoSfxavdDM0s=;
        b=HbIOGcf+5KpTQSk+g5KAwDipKtEcmLee1OPj2Cc28zgkuDCmo+DxjNhdDJNQEd8lcC
         Xq3tMdD2/d8a3DQDe1k67rlX5UeH0iWhdv2jH2i6uVlehjD03DgPBAJYl7S1MyDqUanE
         j0FJWILTWpNUeZeKlDdSJioT/d9Mv0fFF4XlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315570; x=1787920370;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bfO8KMkcgCezzJXB5I4fUDIBWFihvcQPoSfxavdDM0s=;
        b=V8AW4U67pNEpHq6bKK6hlmLxysTFWzQ2AJXlDuEyxW81yKx0vdrNpBXll4t6tEjPkZ
         jUwCUAf2l72AFbH3NSunfT04P5gi+A0GsUY6OpTupVnz3mBbT/cqHVl/fCPOdXzM+IlU
         ABXUPPcr+IjFUc9swFBnlKGPKeTt59bhMbK3tH5/8BBEw++dSY9jpmtDAUHPLWtFFbZ7
         hej1/HvbP2OdDItmCGQZOkHI/WOPb5Qp/IiZs8QD+/8Yb14SebcLxs6AKN6QWnmzVWnZ
         5Ri+CA4jb23qJMAYpSjAR0fMywGn/wpJ/ublqMP7+GsYpOR2b6bOxacKmrIdwB4jU+bW
         CKfw==
X-Gm-Message-State: AFuF++mXmuYpMW+aC8qaPG6VJyEQ/zWW3lrfN2cvTBPRtAk3SPK9dMMf
	Kmtj0O4tMP0gZiuhoG/iWMnqz+kMnjczm+L2F/zkANyhOo1SaQgPs9ggJ4xOv19s8Xnl9unnhri
	CnuaMufdUaRSEm3xEvyCRAulv8vSRNsMZLmHdnzQR7Q==
X-Gm-Gg: AR+sD12eKGRNthHg9gDUPc+ALI8pU0WMllZPjfHdEqtEdl4Cs4w/D+5RLAFrS204yd9
	3aRL8RyHuXTPKfrIL8hpKGqO/osLjbKtii6JsdASHwBnfBhsQBZQZTNG4wHpunrZhUBiumVly3a
	p1IYtHTdTZ1aLMgOgDZeJO4l0XsyKyLKcsKueoGmbfXfHolNCfUfxYKZrio7M3VHWNVNmFJi6ah
	jRkfYHchZOdrPn2WHamJ3ADEhLzplCWBxtYyfZ/WJ3S30UqWLQ+0EyX2KhDVVYbSeRY7FoSErbT
	R2H2FFPmIACwvYLusMlGRa8QHR6uH7tRUW9O9YqM1DIS6WRk/LzcUatiLQZsfhL+RBxbJrZiwcp
	YJAPweEvMOSW7v0TOSH0=
X-Received: by 2002:a17:907:1c8d:b0:c15:ee0d:9a32 with SMTP id
 a640c23a62f3a-c246a6aba8fmr647221066b.21.1787315570472; Fri, 21 Aug 2026
 05:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260814113323.1033135-1-vanusuri@mvista.com> <DKUKLAGINTTR.1W5IKJ5PRG8R7@smile.fr>
In-Reply-To: <DKUKLAGINTTR.1W5IKJ5PRG8R7@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 21 Aug 2026 18:02:38 +0530
X-Gm-Features: AcwNN1Ur9ox3fFcpJY73B9Q-yxhsN0hAhK7OKUiBDsLW9n6mWSKIltFia4QDeQ4
Message-ID: <CANQUz192EZKJPWknMq_HYW5AXPAv_Rc3_20yLQ7Bi+4d59Gong@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch] rpcbind: Fix CVE-2026-16277
To: fabien.thomas@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ae0bc506598dd5c7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243938

--000000000000ae0bc506598dd5c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabien,

Thanks for the reminder.

I've already submitted patches for the wrynose branch.

https://patchwork.yoctoproject.org/project/oe-core/patch/20260814095356.775=
418-1-vanusuri@mvista.com/
https://patchwork.yoctoproject.org/project/oe-core/patch/20260814095356.775=
418-2-vanusuri@mvista.com/

Thanks & Regards,
Vijay

On Fri, Aug 21, 2026 at 4:33=E2=80=AFPM Fabien Thomas via lists.openembedde=
d.org
<fabien.thomas=3Dsmile.fr@lists.openembedded.org> wrote:

> On Fri Aug 14, 2026 at 1:33 PM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Pick patch according to [2]
> >
> > [1] https://nvd.nist.gov/vuln/detail/CVE-2026-16277
> > [2] https://security-tracker.debian.org/tracker/CVE-2026-16277
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../rpcbind/rpcbind/CVE-2026-16277.patch      | 34 +++++++++++++++++++
> >  .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  1 +
> >  2 files changed, 35 insertions(+)
> >  create mode 100644
> meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
> >
> > diff --git a/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
> b/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
> > new file mode 100644
> > index 0000000000..868e5c3f01
> > --- /dev/null
> > +++ b/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
> > @@ -0,0 +1,34 @@
> > +From bb9bb7286a4c345442946dc2ce3c9e7f67e96d4d Mon Sep 17 00:00:00 2001
> > +From: Steve Dickson <steved@redhat.com>
> > +Date: Wed, 27 May 2026 11:42:11 -0400
> > +Subject: [PATCH] rpcinfo: stack buffer overflow in rpcinfo
> rpcbaddrlist()
> > +
> > +rpcinfo's rpcbaddrlist() formats two server-controlled, unbounded XDR
> strings into a fixed 128-byte stack buffer with sprintf(). A malicious or
> on-path rpcbind server overflows it when a user runs:
> > +rpcinfo -l <host> <prognum> <versnum>
> > +
> > +Reported-by: Michalis Vasileiadis <vmihalis.tmd@gmail.com>
> > +Signed-off-by: Steve Dickson <steved@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://git.linux-nfs.org/?p=3Dsteved/rpcbind.git;a=3Dcommitdiff;h=3Dbb9b=
b7286a4c345442946dc2ce3c9e7f67e96d4d
> ]
> > +CVE: CVE-2026-16277
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + src/rpcinfo.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/rpcinfo.c b/src/rpcinfo.c
> > +index 0e14f78..43e8115 100644
> > +--- a/src/rpcinfo.c
> > ++++ b/src/rpcinfo.c
> > +@@ -1120,7 +1120,7 @@ rpcbaddrlist (netid, argc, argv)
> > +
> > +       re =3D &head->rpcb_entry_map;
> > +       printf ("%10u%3u    ", parms.r_prog, parms.r_vers);
> > +-      sprintf (buf, "%s/%s/%s ",
> > ++      snprintf (buf, sizeof(buf), "%s/%s/%s ",
> > +                re->r_nc_protofmly, re->r_nc_proto,
> > +                re->r_nc_semantics =3D=3D NC_TPI_CLTS ? "clts" :
> > +                re->r_nc_semantics =3D=3D NC_TPI_COTS ? "cots" :
> "cots_ord");
> > +--
> > +2.43.0
> > +
> > diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> > index dbd4d32e0a..07e2f10c98 100644
> > --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> > +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> > @@ -15,6 +15,7 @@ SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
> >             file://rpcbind.conf \
> >             file://rpcbind_add_option_to_fix_port_number.patch \
> >             file://0001-systemd-use-EnvironmentFile.patch \
> > +           file://CVE-2026-16277.patch \
> >            "
> >  SRC_URI[sha256sum] =3D
> "5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de"
> >
> Hello Vijay,
>
> Thanks for this patch, but the issue affects wrynose (1.2.8) as well.
> This fix was merged upstream from 1.2.9 (yocto's master version).
>
> Could you please submit a patch for the wrynose branch first?
>
> Regards,
> --
> Fabien Thomas
> Smile ECS
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243922):
> https://lists.openembedded.org/g/openembedded-core/message/243922
> Mute This Topic: https://lists.openembedded.org/mt/120747221/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ae0bc506598dd5c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Fabien,<br><br>Thanks for the reminder.<=
br><br></div>I&#39;ve already submitted patches for the wrynose branch.<br>=
<br><a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/202=
60814095356.775418-1-vanusuri@mvista.com/">https://patchwork.yoctoproject.o=
rg/project/oe-core/patch/20260814095356.775418-1-vanusuri@mvista.com/</a><b=
r><a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/20260=
814095356.775418-2-vanusuri@mvista.com/">https://patchwork.yoctoproject.org=
/project/oe-core/patch/20260814095356.775418-2-vanusuri@mvista.com/</a><br>=
<br></div>Thanks &amp;=C2=A0Regards,<br></div>Vijay</div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri, Aug 21, 2026 at 4:33=E2=80=AFPM Fabien Thomas via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;fabien.thomas=3D<a hr=
ef=3D"mailto:smile.fr@lists.openembedded.org">smile.fr@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Fri Aug 14, 2026 at 1:33 PM CEST, Vijay Anusuri via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> wrote:<br>
&gt; Pick patch according to [2]<br>
&gt;<br>
&gt; [1] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-16277" rel=3D=
"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026-16=
277</a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-16=
277" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2026-16277</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../rpcbind/rpcbind/CVE-2026-16277.patch=C2=A0 =C2=A0 =C2=A0 | 3=
4 +++++++++++++++++++<br>
&gt;=C2=A0 .../recipes-extended/rpcbind/<a href=3D"http://rpcbind_1.2.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">rpcbind_1.2.6.bb</a> |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 35 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/CVE-202=
6-16277.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patc=
h b/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..868e5c3f01<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch<br>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +From bb9bb7286a4c345442946dc2ce3c9e7f67e96d4d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Steve Dickson &lt;<a href=3D"mailto:steved@redhat.com" target=
=3D"_blank">steved@redhat.com</a>&gt;<br>
&gt; +Date: Wed, 27 May 2026 11:42:11 -0400<br>
&gt; +Subject: [PATCH] rpcinfo: stack buffer overflow in rpcinfo rpcbaddrli=
st()<br>
&gt; +<br>
&gt; +rpcinfo&#39;s rpcbaddrlist() formats two server-controlled, unbounded=
 XDR strings into a fixed 128-byte stack buffer with sprintf(). A malicious=
 or on-path rpcbind server overflows it when a user runs:<br>
&gt; +rpcinfo -l &lt;host&gt; &lt;prognum&gt; &lt;versnum&gt;<br>
&gt; +<br>
&gt; +Reported-by: Michalis Vasileiadis &lt;<a href=3D"mailto:vmihalis.tmd@=
gmail.com" target=3D"_blank">vmihalis.tmd@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Steve Dickson &lt;<a href=3D"mailto:steved@redhat.com"=
 target=3D"_blank">steved@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://git.linux-nfs.org/?p=3D=
steved/rpcbind.git;a=3Dcommitdiff;h=3Dbb9bb7286a4c345442946dc2ce3c9e7f67e96=
d4d" rel=3D"noreferrer" target=3D"_blank">https://git.linux-nfs.org/?p=3Dst=
eved/rpcbind.git;a=3Dcommitdiff;h=3Dbb9bb7286a4c345442946dc2ce3c9e7f67e96d4=
d</a>]<br>
&gt; +CVE: CVE-2026-16277<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/rpcinfo.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/rpcinfo.c b/src/rpcinfo.c<br>
&gt; +index 0e14f78..43e8115 100644<br>
&gt; +--- a/src/rpcinfo.c<br>
&gt; ++++ b/src/rpcinfo.c<br>
&gt; +@@ -1120,7 +1120,7 @@ rpcbaddrlist (netid, argc, argv)<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0re =3D &amp;head-&gt;rpcb_entry_map;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0printf (&quot;%10u%3u=C2=A0 =C2=A0 &quot;,=
 parms.r_prog, parms.r_vers);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 sprintf (buf, &quot;%s/%s/%s &quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 snprintf (buf, sizeof(buf), &quot;%s/%s/%s &quo=
t;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re-&gt;r_nc_p=
rotofmly, re-&gt;r_nc_proto,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re-&gt;r_nc_s=
emantics =3D=3D NC_TPI_CLTS ? &quot;clts&quot; :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re-&gt;r_nc_s=
emantics =3D=3D NC_TPI_COTS ? &quot;cots&quot; : &quot;cots_ord&quot;);<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-extended/rpcbind/<a href=3D"http://rpcbind_1=
.2.6.bb" rel=3D"noreferrer" target=3D"_blank">rpcbind_1.2.6.bb</a> b/meta/r=
ecipes-extended/rpcbind/<a href=3D"http://rpcbind_1.2.6.bb" rel=3D"noreferr=
er" target=3D"_blank">rpcbind_1.2.6.bb</a><br>
&gt; index dbd4d32e0a..07e2f10c98 100644<br>
&gt; --- a/meta/recipes-extended/rpcbind/<a href=3D"http://rpcbind_1.2.6.bb=
" rel=3D"noreferrer" target=3D"_blank">rpcbind_1.2.6.bb</a><br>
&gt; +++ b/meta/recipes-extended/rpcbind/<a href=3D"http://rpcbind_1.2.6.bb=
" rel=3D"noreferrer" target=3D"_blank">rpcbind_1.2.6.bb</a><br>
&gt; @@ -15,6 +15,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/rpcbind/rpcb=
ind-${PV}.tar.bz2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rpcbind.conf \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rpcbind_add_opti=
on_to_fix_port_number.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-systemd-use=
-EnvironmentFile.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-16277.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;5613746489cae5ae23a443bb85c05a11741=
a5f12c8f55d2bb5e83b9defeee8de&quot;<br>
&gt;=C2=A0 <br>
Hello Vijay,<br>
<br>
Thanks for this patch, but the issue affects wrynose (1.2.8) as well.<br>
This fix was merged upstream from 1.2.9 (yocto&#39;s master version).<br>
<br>
Could you please submit a patch for the wrynose branch first?<br>
<br>
Regards,<br>
-- <br>
Fabien Thomas<br>
Smile ECS<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#243922): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/243922" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/243922</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120747221/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120747221/7301997</a><br>
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

--000000000000ae0bc506598dd5c7--

