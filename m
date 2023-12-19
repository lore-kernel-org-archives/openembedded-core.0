Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC47DC46CCD
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 13:40:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.13782.1702993251240391035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 05:40:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=LGMSHDT9;
 spf=pass (domain: snapchat.com, ip: 209.85.128.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c31f18274so57749325e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 05:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702993249; x=1703598049; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zvAYO8SRc4dknpS3iNeAEHzsCYIwjhMdylDFcwCc04c=;
        b=LGMSHDT9GR0WwUlH6mk12NHKsE4U02o4gwtAQ9j6EAzbyqF6qXqgrV3Aoz0gZZWZ9P
         APPubrmqX8RhK821PtOFZ1zmuJajQRs8jn6fPhf7/AT6cewTXLZfMzlbRPU9l1d3z521
         cY1TlciS247juecmzXJsumdK4eUTijJym5Y5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993249; x=1703598049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvAYO8SRc4dknpS3iNeAEHzsCYIwjhMdylDFcwCc04c=;
        b=ixPW+Ut7wwmZtdXIL5gV3NZYJBAHbwSKbCa0533rtBJDUqyVSsSvXbOlDlS1mFBIKD
         QhsOZY5u5gqkFvpJYQgFT1RZGInCHnL6x5G0Vyxh4s8PFnN+/owgjHjX06+8uZsKnbL9
         1ek6rQNQ8VDydzzDKTzRLjdvvMIKGdwV1uFJUHrU5GQ1YXv2j0v5A1qE2qAjdESW0p8E
         zdNVcdYbA722G0DzBBnldcHlNPBwhYUtynHSXlF4jUdI7H/cRidkbO24UwtWrwxfbUCK
         B7gRQJYvo39TC/xpHJVMid1J38xzyz4FXjkxIGX04I0SaondK0qGZrbmBtYCKk12XHAM
         DeiQ==
X-Gm-Message-State: AOJu0Yx5+Dfo4xXPEXfOPGg05xMcMJJpJyTsRhpIROZiLRUjzWxrrq3C
	ctxndbP4pX8r6f9ESuRGNTGYaMM2CN91fjJGdbXBQQ==
X-Google-Smtp-Source: AGHT+IGMjXUC9U/O4Gb5T1qDLTCW8V8y4mgMMvuBx87r2MX01okXN2bkP/jRl9k0dkUBDUkhVRcYEBQga9kbKjGgKio=
X-Received: by 2002:a05:600c:1d19:b0:40b:5e21:bdc0 with SMTP id
 l25-20020a05600c1d1900b0040b5e21bdc0mr8820124wms.79.1702993249392; Tue, 19
 Dec 2023 05:40:49 -0800 (PST)
MIME-Version: 1.0
References: <17A23F37CD7211A7.10836@lists.openembedded.org>
In-Reply-To: <17A23F37CD7211A7.10836@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 19 Dec 2023 14:40:38 +0100
Message-ID: <CAHUKmYZ_czf-Zg=Mr5fN9nREnq3iE8VAiLSRS7hOAN7qRcTX5w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000afb007060cdd03be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 13:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192731

--000000000000afb007060cdd03be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patch v4: use idempotent copy of the files instead of simply skipping the
code (see discussion under v2 of the patch).

On Tue, Dec 19, 2023 at 2:38=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> The function do_symlink_kernsrc is not reentrant in the case where S is
> defined
> to a non-default value. This causes build-failures e.g. when building
> linux-yocto, then updating
> poky to a commit which modifies kernel.bbclass, and then building
> linux-yocto again.
>
> Bugzilla:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproj=
ect.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DVB1=
zXAiE9q_CqM9DgoA0BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSuIk&s=3D9Cr8vwWgU=
wwGM5oCO07DB4sO9sQpMCdweS1u8CmZ0Qw&e=3D
>
> Tested with a recipe "my-custom-linux" which unpacks sources to a custom
> ${S} directory
> and ran symlink_kernsrc several times:
> $ bitbake -f -c symlink_kernsrc my-custom-linux
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 9ff37f5c38..42c5519f81 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -189,11 +189,17 @@ python do_symlink_kernsrc () {
>              # drop trailing slash, so that os.symlink(kernsrc, s) doesn'=
t
> use s as
>              # directory name and fail
>              s =3D s[:-1]
> -        if d.getVar("EXTERNALSRC"):
> +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
>              # With EXTERNALSRC S will not be wiped so we can symlink to =
it
>              os.symlink(s, kernsrc)
>          else:
>              import shutil
> +            # perform idempotent/reentrant copy
> +            s_copy =3D s + ".orig"
> +            if not os.path.isdir(s_copy):
> +                shutil.copytree(s, s_copy)
> +            bb.utils.remove(s, recurse=3DTrue)
> +            shutil.copytree(s_copy, s)
>              shutil.move(s, kernsrc)
>              os.symlink(kernsrc, s)
>  }
> --
> 2.36.1.vfs.0.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192730):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_192730&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DVB1zXAiE9q_CqM9DgoA0BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSuIk&s=3DHC8=
D2EMiR_G_qbq-osmSiZT2ydpAE87MF9ylA3VnOiU&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103262114_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DVB1zXAiE9q_Cq=
M9DgoA0BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSuIk&s=3DkJzafl7EdrE7kH-hS7V=
1tMze-xICCnm60bSF50NZ4iA&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DVB1zXA=
iE9q_CqM9DgoA0BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSuIk&s=3Dc066PNgPnuyQ=
_O7rM_bVFBC8MVWbYwd5DcSrRCmIcJ4&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000afb007060cdd03be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patch v4: use idempotent copy of the files instead of simp=
ly skipping the code (see discussion under v2 of the patch).</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 19,=
 2023 at 2:38=E2=80=AFPM Etienne Cordonnier via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mail=
to:snap.com@lists.openembedded.org">snap.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Et=
ienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_bla=
nk">ecordonnier@snap.com</a>&gt;<br>
<br>
The function do_symlink_kernsrc is not reentrant in the case where S is def=
ined<br>
to a non-default value. This causes build-failures e.g. when building linux=
-yocto, then updating<br>
poky to a commit which modifies kernel.bbclass, and then building linux-yoc=
to again.<br>
<br>
Bugzilla: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A_=
_bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&amp;d=3DDwIDAg&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DVB1zXAiE9q_CqM9DgoA0BbtloUxpQE_rQ7eqk7HGzBW=
9KzFu44K9hS1iahsqSuIk&amp;s=3D9Cr8vwWgUwwGM5oCO07DB4sO9sQpMCdweS1u8CmZ0Qw&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D1=
5325&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVB1zXAiE9q_CqM9Dgo=
A0BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSuIk&amp;s=3D9Cr8vwWgUwwGM5oCO07D=
B4sO9sQpMCdweS1u8CmZ0Qw&amp;e=3D</a> <br>
<br>
Tested with a recipe &quot;my-custom-linux&quot; which unpacks sources to a=
 custom ${S} directory<br>
and ran symlink_kernsrc several times:<br>
$ bitbake -f -c symlink_kernsrc my-custom-linux<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 9ff37f5c38..42c5519f81 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -189,11 +189,17 @@ python do_symlink_kernsrc () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# drop trailing slash, so t=
hat os.symlink(kernsrc, s) doesn&#39;t use s as<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# directory name and fail<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D s[:-1]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;EXTERNALSRC&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;EXTERNALSRC&quot;) and not o=
s.path.islink(s):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# With EXTERNALSRC S will n=
ot be wiped so we can symlink to it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(s, kernsrc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import shutil<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # perform idempotent/reentrant c=
opy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s_copy =3D s + &quot;.orig&quot;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isdir(s_copy):<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copytree(s,=
 s_copy)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(s, recurse=3DTru=
e)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copytree(s_copy, s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.move(s, kernsrc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(kernsrc, s)<br>
=C2=A0}<br>
-- <br>
2.36.1.vfs.0.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192730): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
2730&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVB1zXAiE9q_CqM9Dgo=
A0BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSuIk&amp;s=3DHC8D2EMiR_G_qbq-osmS=
iZT2ydpAE87MF9ylA3VnOiU&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_192730&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DVB1zXAiE9q_CqM9DgoA0BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSu=
Ik&amp;s=3DHC8D2EMiR_G_qbq-osmSiZT2ydpAE87MF9ylA3VnOiU&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_103262114_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DVB1zXAiE9q_CqM9DgoA0BbtloUxpQE_rQ7eqk7HGzBW9Kz=
Fu44K9hS1iahsqSuIk&amp;s=3DkJzafl7EdrE7kH-hS7V1tMze-xICCnm60bSF50NZ4iA&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103262114_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVB1zXAiE9q_CqM9DgoA0BbtloUxpQE_=
rQ7eqk7HGzBW9KzFu44K9hS1iahsqSuIk&amp;s=3DkJzafl7EdrE7kH-hS7V1tMze-xICCnm60=
bSF50NZ4iA&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DVB1zXAiE9q_CqM9DgoA0BbtloUxpQE_rQ7eqk7HGzBW=
9KzFu44K9hS1iahsqSuIk&amp;s=3Dc066PNgPnuyQ_O7rM_bVFBC8MVWbYwd5DcSrRCmIcJ4&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DVB1zXAiE9q_CqM9DgoA0=
BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSuIk&amp;s=3Dc066PNgPnuyQ_O7rM_bVFB=
C8MVWbYwd5DcSrRCmIcJ4&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000afb007060cdd03be--

