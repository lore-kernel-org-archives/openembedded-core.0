Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BBAC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:47:03 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9493.1678355211534641205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bwj8vYAC;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id bx12so1206975wrb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 01:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678355210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cB1GDXswEMxCO/Q1/7XmcuDo5LB2XzT+LqRZnkS+x9I=;
        b=bwj8vYACcbI6AetDyMx+pztXyS+JzW9mvGXRjv6FFotZwv7hOzU1k1mPJrMuanPSIx
         /ICM+iZOau/O3x1WAhIuzngMBucNRBT/Bz+4sUfxqZhNjFSAW0plDZSTayejQRINfZu1
         RFdEdCkz2LpH4PCxzL74Lnb+o+8uxxV1AC+uJRMftHuvpKqETy1h0f+xH3Niss9EJ6Cy
         ens8FLf7kO/fnkpiUwtLG1hBJ7d62vVKOYnTa7X78OxYAfutqGkV2HvuYtPLbpBhxiye
         d1OWeaUu+rRCQlOVxH3zj/fCvYDiUVNds5Rae3lGj45MQ2+HVU5HRUfHbJ7u6ZIKGE+y
         Q+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678355210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cB1GDXswEMxCO/Q1/7XmcuDo5LB2XzT+LqRZnkS+x9I=;
        b=xBxMYPVyV+bJf+E35hjqYhSveC9v1wwBeYfxb9qgiY96gKY2EXOxI5wUTd93HTtoCW
         tfG9x8zIz+5mNIg8R9S9oJasZ2SuEJQcyIuJduPOOWF46sUYIy/joPwVbzzP/crsWeJ4
         w6fEwkeyFIbNi7h7ymVmyvcQ88E6XRqclyqYYpt19yyFS78GpiSusRwGYwVqHfsSLjvG
         N1qpxNzdsfE5Xt6KiyaokisTb9SkKoG5IUqCxe3ttDrNEhTMLhlJq1hxK8BD/+mXPPQJ
         8Vxahh0AVtdmb8wb4s+s1agwNyL7Nm6v+zvHzpv4Lf7ElJXmYLpanRYwvQLcEvpJjOXq
         AkPw==
X-Gm-Message-State: AO0yUKUrWxVIr4VoNWfya4MWSYpt2xvNTHzvjnYlVimMGXLMRuham6Rl
	+rmUAXzIQHHlq8jE3ndu5tYmFFUW+wS7jyX2s4U=
X-Google-Smtp-Source: AK7set86ns9+YXI3sPiKiEvpJGqayOWYOvx4iI5akTXLKNAwuz6X2sb47/GkgfYo3hQpQWGSx7bRTJkT+OK/OR839H8=
X-Received: by 2002:a5d:4805:0:b0:2c7:1a97:ef91 with SMTP id
 l5-20020a5d4805000000b002c71a97ef91mr4720382wrq.1.1678355209913; Thu, 09 Mar
 2023 01:46:49 -0800 (PST)
MIME-Version: 1.0
References: <20230309075452.6463-1-romuald.jeanne@st.com> <CA+chaQcX6BmW-j9GZpk2jR2_Pw7Ag2tx1g=tOnWJoy9Y__muVA@mail.gmail.com>
 <DBAPR10MB4266C53076D408133FEE6C54FBB59@DBAPR10MB4266.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DBAPR10MB4266C53076D408133FEE6C54FBB59@DBAPR10MB4266.EURPRD10.PROD.OUTLOOK.COM>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Mar 2023 10:46:34 +0100
Message-ID: <CA+chaQdGsnFKD1LRs0Pi27nsVMz5ktm5j0TUKyGAZkGnY1mx2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] image_types: fix vname var init in
 multiubi_mkfs() function
To: Romuald JEANNE <romuald.jeanne@st.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000018076e05f67486a1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 09:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178215

--00000000000018076e05f67486a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

-               local vname=3D"_$1"
-       fi
+       local vname=3D"$1"

        cat <<EOF > ubinize${vname}-${IMAGE_NAME}.cfg

_ surely got removed from this ubinize filename, right?

On Thu, Mar 9, 2023 at 10:28=E2=80=AFAM Romuald JEANNE <romuald.jeanne@st.c=
om>
wrote:

> Hello,
>
>
>
> The =E2=80=98write_ubi_config()=E2=80=99 is called through =E2=80=98multi=
ubi_mkfs()=E2=80=99 where the _
> separator is managed with proper init of =E2=80=98vname=E2=80=99 var.
>
> So I didn=E2=80=99t dropped the _ separator, it is managed on calling fun=
ction
> side.
>
>
>
> Best regards,
>
>
>
> Romuald JEANNE
>
>
>
> *From:* Martin Jansa <martin.jansa@gmail.com>
> *Sent:* jeudi 9 mars 2023 09:31
> *To:* Romuald JEANNE <romuald.jeanne@st.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH] image_types: fix vname var init in
> multiubi_mkfs() function
>
>
>
> On Thu, Mar 9, 2023 at 8:55=E2=80=AFAM Romuald Jeanne via lists.openembed=
ded.org
> <romuald.jeanne=3Dst.com@lists.openembedded.org> wrote:
>
> From: Romuald JEANNE <romuald.jeanne@st.com>
>
> As vname var is needed in multiubi_mkfs() function, we need to keep it
> defined and use it as parameter to the new write_ubi_config() function.
>
> See [YOCTO #15027]
>
> Signed-off-by: Romuald JEANNE <romuald.jeanne@st.com>
> ---
>  meta/classes-recipe/image_types.bbclass | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes-recipe/image_types.bbclass
> b/meta/classes-recipe/image_types.bbclass
> index 764e6a5574..c6cb8f5336 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -157,11 +157,7 @@ UBI_VOLTYPE ?=3D "dynamic"
>  UBI_IMGTYPE ?=3D "ubifs"
>
>  write_ubi_config() {
> -       if [ -z "$1" ]; then
> -               local vname=3D""
> -       else
> -               local vname=3D"_$1"
> -       fi
> +       local vname=3D"$1"
>
>
>
> Did you drop the _ separator intentionally?
>
>
>
> ST Restricted
>

--00000000000018076e05f67486a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local v=
name=3D&quot;_$1&quot;<br>- =C2=A0 =C2=A0 =C2=A0 fi<br>+ =C2=A0 =C2=A0 =C2=
=A0 local vname=3D&quot;$1&quot;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt=
;&lt;EOF &gt; ubinize${vname}-${IMAGE_NAME}.cfg<br><div><br></div><div>_ su=
rely got removed from this ubinize filename, right?</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 9, 202=
3 at 10:28=E2=80=AFAM Romuald JEANNE &lt;<a href=3D"mailto:romuald.jeanne@s=
t.com">romuald.jeanne@st.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div class=3D"msg4884583716436005129">





<div lang=3D"FR" style=3D"overflow-wrap: break-word;">
<div class=3D"m_4884583716436005129WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:rgb(0,32,82)">Hello,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:rgb(0,32,82)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,32,82)">The =E2=80=98write_ubi_config()=
=E2=80=99 is called through =E2=80=98multiubi_mkfs()=E2=80=99 where the _ s=
eparator is managed with proper init of =E2=80=98vname=E2=80=99
 var.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,32,82)">So I didn=E2=80=99t dropped the _=
 separator, it is managed on calling function side.<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,32,82)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,32,82)">Best regards,<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,32,82)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,32,82)">Romuald JEANNE<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,32,82)"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" targ=
et=3D"_blank">martin.jansa@gmail.com</a>&gt;
<br>
<b>Sent:</b> jeudi 9 mars 2023 09:31<br>
<b>To:</b> Romuald JEANNE &lt;<a href=3D"mailto:romuald.jeanne@st.com" targ=
et=3D"_blank">romuald.jeanne@st.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH] image_types: fix vname var init in mu=
ltiubi_mkfs() function<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Mar 9, 2023 at 8:55=E2=80=AFAM Romuald Jeann=
e via <a href=3D"http://lists.openembedded.org" target=3D"_blank">
lists.openembedded.org</a> &lt;romuald.jeanne=3D<a href=3D"mailto:st.com@li=
sts.openembedded.org" target=3D"_blank">st.com@lists.openembedded.org</a>&g=
t; wrote:<u></u><u></u></p>
</div>
<div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<p class=3D"MsoNormal">From: Romuald JEANNE &lt;<a href=3D"mailto:romuald.j=
eanne@st.com" target=3D"_blank">romuald.jeanne@st.com</a>&gt;<br>
<br>
As vname var is needed in multiubi_mkfs() function, we need to keep it<br>
defined and use it as parameter to the new write_ubi_config() function.<br>
<br>
See [YOCTO #15027]<br>
<br>
Signed-off-by: Romuald JEANNE &lt;<a href=3D"mailto:romuald.jeanne@st.com" =
target=3D"_blank">romuald.jeanne@st.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/image_types.bbclass | 13 +++++++------<br>
=C2=A01 file changed, 7 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass<br>
index 764e6a5574..c6cb8f5336 100644<br>
--- a/meta/classes-recipe/image_types.bbclass<br>
+++ b/meta/classes-recipe/image_types.bbclass<br>
@@ -157,11 +157,7 @@ UBI_VOLTYPE ?=3D &quot;dynamic&quot;<br>
=C2=A0UBI_IMGTYPE ?=3D &quot;ubifs&quot;<br>
<br>
=C2=A0write_ubi_config() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$1&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local vname=3D&quot=
;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local vname=3D&quot=
;_$1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local vname=3D&quot;$1&quot;<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Did you drop the _ separator intentionally?<u></u><u=
></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"m_4884583716436005129msipfooter64eda7a5" align=3D"right" style=
=3D"margin:0cm;text-align:right"><span style=3D"font-size:12pt;font-family:=
Arial,sans-serif;color:red">ST Restricted</span><u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div>

--00000000000018076e05f67486a1--

