Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C425EC46CA2
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 13:36:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.14944.1702733808044046813
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 05:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=KBjUX+wi;
 spf=pass (domain: snapchat.com, ip: 209.85.221.44, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-336420a244dso1227294f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 05:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702733806; x=1703338606; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HdkrR7Xy1lsrjAw4tia/6YqQB9J/1XQa2MpFf9g3vf0=;
        b=KBjUX+wineagqwMaK+RP35upGZkMB6feB90HfEkjL2K4g1/ftKEOKwbvo4Vw4wiihq
         FZ7GE0RLTBDPZnZ9vMRe2dr0M/Codx0AQrzxQk+tXdpNaYxsig7/Z5Jont0F7jenkiDX
         9eMvcQHixNyQyqJ0iOX84Ud0uUaYiST0CsypE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702733806; x=1703338606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdkrR7Xy1lsrjAw4tia/6YqQB9J/1XQa2MpFf9g3vf0=;
        b=vwFU/EZkLgLUDUAOoY8eve1rrNBNzFp6NF4IIeTvLoKZdJ2ULbjQ1pnZxxNVWrb/Gi
         Adu97HNAx6MEAcu5rMRG7voCkOTAFTqrsDMKHQO/vSPS62KaV9uLWH52wn1s4yNd3C0B
         QtCxcqVXpNy1X1HGocWdYF3EQDyDJLcdRGxXk3MpbwvUaSt2isUSDE87Y4ig5HYX6Mrs
         Wimw5clBblBDNxuBwxLIUQiyb1n6VIufLtJbWJY6dn+OGPSlAlrM2sA+/cbX703e7Wmc
         xvr/Q5BBSxUZitldPPkIiJ7qBZ0nAg3uf0mIoVZcyBYyzo+GyaWko7EMDiyxwcN/KA+X
         d0YQ==
X-Gm-Message-State: AOJu0Yy7Tpir8ubsi/CEWXbyGT4PwMot+/QsuVConmosKUROEkNXQqxC
	sP92vHu3DpqSbvT7rCJ9A6Kv4/o1RFjWuh7NqZbsUQ==
X-Google-Smtp-Source: AGHT+IE7ikAwSrzUOJS+/i4zRxgbRDYIGiVFP+M8zOCtI1uVdZgEyyzyBUHOpZ2etB++uR/6nnDJoSH1bConkCkTsMI=
X-Received: by 2002:a05:600c:2e0c:b0:40c:2c73:a4f8 with SMTP id
 o12-20020a05600c2e0c00b0040c2c73a4f8mr6427385wmf.179.1702733806372; Sat, 16
 Dec 2023 05:36:46 -0800 (PST)
MIME-Version: 1.0
References: <17A152AE95485801.21267@lists.openembedded.org>
In-Reply-To: <17A152AE95485801.21267@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Sat, 16 Dec 2023 14:36:35 +0100
Message-ID: <CAHUKmYbCyaQX7A+1rWatOEa3J86Cr0j6VJdfvEsYXYFp16gC2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make do_symlink_kernelsrc reentrant when S is overriden
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ad7747060ca09be7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 13:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192563

--000000000000ad7747060ca09be7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe someone has a better idea for a cleaner fix. The regression was
introduced in 2019 by
https://github.com/openembedded/openembedded-core/commit/1ba4728f058b909577=
41fa016230ffa72e206ff3
which moved do_symlink_kernsrc to a separated task (and hence the
do_unpack[cleandirs] value does not apply to do_symlink_kernsrc any more).
The reason for moving do_symlink_kernsrc to a separated task was that
do_unpack is deleted when EXTERNALSRC is enabled.

Etienne

On Sat, Dec 16, 2023 at 2:24=E2=80=AFPM Etienne Cordonnier via
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
HvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DAjd=
k4NY7T_6MCYvTdJy8xaozyLd62tWw2RgcDnKF3P9UqWVnuU0Xjffudai_QkNp&s=3DeRsvoOQpE=
GvpV51FEvvKLBMPTyDPwytETHxf6kOb8dg&e=3D
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 9ff37f5c38..130bedd901 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -194,6 +194,11 @@ python do_symlink_kernsrc () {
>              os.symlink(s, kernsrc)
>          else:
>              import shutil
> +            if os.path.islink(s):
> +                # this happens for instance when a poky update forces
> symlink_kernsrc to run again
> +                # after s was already moved to kernsrc
> +                bb.warn("%s is already a symlink! Not symlinking kernel
> sources" % s)
> +                return 0
>              shutil.move(s, kernsrc)
>              os.symlink(kernsrc, s)
>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192561):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_192561&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DAjdk4NY7T_6MCYvTdJy8xaozyLd62tWw2RgcDnKF3P9UqWVnuU0Xjffudai_QkNp&s=3DmP5=
uWFgfxShkWkndcxPXjXhufEBcQZ1UhqiGIcRO-xc&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103208167_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DAjdk4NY7T_6MC=
YvTdJy8xaozyLd62tWw2RgcDnKF3P9UqWVnuU0Xjffudai_QkNp&s=3DG6hk_tmVlorFMcsrPHP=
gc9glxUNVtPi8jPMTlVdqhnE&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DAjdk4N=
Y7T_6MCYvTdJy8xaozyLd62tWw2RgcDnKF3P9UqWVnuU0Xjffudai_QkNp&s=3D9euKUWB--WIB=
2phAD28pr5wckGSn48Um--gfmNfvltw&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ad7747060ca09be7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Maybe someone has a better idea for a cleaner fix. The reg=
ression was introduced in 2019 by <a href=3D"https://github.com/openembedde=
d/openembedded-core/commit/1ba4728f058b90957741fa016230ffa72e206ff3" target=
=3D"_blank">https://github.com/openembedded/openembedded-core/commit/1ba472=
8f058b90957741fa016230ffa72e206ff3</a> which moved do_symlink_kernsrc to a =
separated=C2=A0task (and hence the do_unpack[cleandirs] value does not appl=
y to do_symlink_kernsrc any more). The reason for moving do_symlink_kernsrc=
 to a separated task was that do_unpack is deleted when EXTERNALSRC is enab=
led.<br><br>Etienne</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sat, Dec 16, 2023 at 2:24=E2=80=AFPM Etienne Cordonni=
er via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.op=
enembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.opene=
mbedded.org" target=3D"_blank">snap.com@lists.openembedded.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Etienne=
 Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">e=
cordonnier@snap.com</a>&gt;<br>
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
TsRih1DULJTKUkSGa66m67E&amp;m=3DAjdk4NY7T_6MCYvTdJy8xaozyLd62tWw2RgcDnKF3P9=
UqWVnuU0Xjffudai_QkNp&amp;s=3DeRsvoOQpEGvpV51FEvvKLBMPTyDPwytETHxf6kOb8dg&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D1=
5325&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DAjdk4NY7T_6MCYvTdJ=
y8xaozyLd62tWw2RgcDnKF3P9UqWVnuU0Xjffudai_QkNp&amp;s=3DeRsvoOQpEGvpV51FEvvK=
LBMPTyDPwytETHxf6kOb8dg&amp;e=3D</a> <br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 9ff37f5c38..130bedd901 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -194,6 +194,11 @@ python do_symlink_kernsrc () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(s, kernsrc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import shutil<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.islink(s):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # this happens for=
 instance when a poky update forces symlink_kernsrc to run again<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # after s was alre=
ady moved to kernsrc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;%s i=
s already a symlink! Not symlinking kernel sources&quot; % s)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.move(s, kernsrc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(kernsrc, s)<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192561): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
2561&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DAjdk4NY7T_6MCYvTdJ=
y8xaozyLd62tWw2RgcDnKF3P9UqWVnuU0Xjffudai_QkNp&amp;s=3DmP5uWFgfxShkWkndcxPX=
jXhufEBcQZ1UhqiGIcRO-xc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_192561&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DAjdk4NY7T_6MCYvTdJy8xaozyLd62tWw2RgcDnKF3P9UqWVnuU0Xjffudai_Qk=
Np&amp;s=3DmP5uWFgfxShkWkndcxPXjXhufEBcQZ1UhqiGIcRO-xc&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_103208167_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DAjdk4NY7T_6MCYvTdJy8xaozyLd62tWw2RgcDnKF3P9UqW=
VnuU0Xjffudai_QkNp&amp;s=3DG6hk_tmVlorFMcsrPHPgc9glxUNVtPi8jPMTlVdqhnE&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103208167_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DAjdk4NY7T_6MCYvTdJy8xaozyLd62tW=
w2RgcDnKF3P9UqWVnuU0Xjffudai_QkNp&amp;s=3DG6hk_tmVlorFMcsrPHPgc9glxUNVtPi8j=
PMTlVdqhnE&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DAjdk4NY7T_6MCYvTdJy8xaozyLd62tWw2RgcDnKF3P9=
UqWVnuU0Xjffudai_QkNp&amp;s=3D9euKUWB--WIB2phAD28pr5wckGSn48Um--gfmNfvltw&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DAjdk4NY7T_6MCYvTdJy8=
xaozyLd62tWw2RgcDnKF3P9UqWVnuU0Xjffudai_QkNp&amp;s=3D9euKUWB--WIB2phAD28pr5=
wckGSn48Um--gfmNfvltw&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ad7747060ca09be7--

