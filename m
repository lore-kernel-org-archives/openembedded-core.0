Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FD5C05023
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 14:19:53 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.22453.1713536384930351418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 07:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/VTuTzt;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de45e5c3c84so2097167276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 07:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713536384; x=1714141184; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VuiyPbtdIkA05JC/uYYJYooxkRUVFytGBBUkBH36lGs=;
        b=Y/VTuTztaZDHqp7EluWwjYIyaXyGoryzxS0EAZ5hgg3FkFjs0YVvyr189VCDJv6Twz
         w0h6aLHJoh+haA5Rt5wlBS3crlQNrodyviNj8bAi39D1g+/709Sa2/u4W9O3pJSs0Yi4
         GIsYDGWkmVSgMMO4KDm+sBS1HYjefrKx009O3/dcKWo3WfBQrgY+Q+qYDCNlivYghVrn
         olpVJcUcOBu/RxA0DhmHjYcHwQnZDaoROdZM4xPGUnTAEDtnprZ/3ZIWHTEowzyLuubN
         9FT13joj2ktpA7v1InEN66OvSzQf3F2G3DKBhLDR+ZAgg5mTh+1C3FtlWc8TrrysSerS
         2K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713536384; x=1714141184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuiyPbtdIkA05JC/uYYJYooxkRUVFytGBBUkBH36lGs=;
        b=GnP+bMiLEaWcKYthVdss6vxmzKOQtPY8Xc9J9uw/zlSGZOdYqeIb1jk13hATOpqcZG
         UoVKjfWUNj2GAQTXIo8W3ew9egK4XSAHcHydPZmouyO+pN0RkxLDAfL5dp9Y+GOinHPl
         Y35rynrHOZrsq9z/aQ0sHSi7wNvWz5trVJc9mOGdjU8eBqewJkXFD61++INCS4T/9HPb
         rQXFox7IZ+SnC4eY/wKLG6K5GFUtgv9LwMaSOHdCl3fqd2JU9eCgwirySyJl0t6TUtuq
         lgxi/jimd2/QqxCO1W7X9q9GPmMLl3OJ1L+qlpHfgyAuAx8tk75hVYqnesW8D1lDGupq
         HygA==
X-Gm-Message-State: AOJu0YxR08peZHGKluVvfXqcmwB3OXeygv20tBDqFU81mEiHqTvSWku7
	Okrw2/izrAL3gNi7oJd/9krFZ3rSmt555u13CyvcpCgUUFkTKOn4OrUP/9KaSS1UdaBOQSZdviD
	QusjluTiqlpppdNmw0Ml4HBEi9Xk=
X-Google-Smtp-Source: AGHT+IEhlaKXMVSCfFcgBqL8hr16pQ8nCjOJhGcMbi73Hfj3IaH/iKm6ImIEYXezEgcoqK4fM/o7wyGKdbu37RLxc+s=
X-Received: by 2002:a25:8548:0:b0:dc7:423c:b8aa with SMTP id
 f8-20020a258548000000b00dc7423cb8aamr1940583ybn.12.1713536383846; Fri, 19 Apr
 2024 07:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <PH7PR17MB61307CB6690EC00DEB4ED9B39C0F2@PH7PR17MB6130.namprd17.prod.outlook.com>
In-Reply-To: <PH7PR17MB61307CB6690EC00DEB4ED9B39C0F2@PH7PR17MB6130.namprd17.prod.outlook.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 19 Apr 2024 07:19:32 -0700
Message-ID: <CANx9H-AXJKQ+LxJdaYH5iVUbOa6iAKMg8G=GAhHkWwtKZ-eJww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs.py: Fix logger error message format
To: john.ripple@keysight.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000781342061673c751"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 14:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198553

--000000000000781342061673c751
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 12:56=E2=80=AFPM John Ripple via lists.openembedded=
.org
<john.ripple=3Dkeysight.com@lists.openembedded.org> wrote:

> This patch adds a missing "%s" format in a logger.error call. Without
> this addition the logger itself would error out and not print a useful
> message.
>
> Signed-off-by: John Ripple <john.ripple@keysight.com>
> ---
>  scripts/lib/wic/plugins/source/rootfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/plugins/source/rootfs.py
> b/scripts/lib/wic/plugins/source/rootfs.py
> index e29f3a4c2f..c990143c0d 100644
> --- a/scripts/lib/wic/plugins/source/rootfs.py
> +++ b/scripts/lib/wic/plugins/source/rootfs.py
> @@ -43,7 +43,7 @@ class RootfsPlugin(SourcePlugin):
>          # directory, or modify a directory outside OpenEmbedded).
>          full_path =3D os.path.realpath(os.path.join(rootfs_dir, path))
>          if not full_path.startswith(os.path.realpath(rootfs_dir)):
> -            logger.error("%s: Must point inside the rootfs:" % (cmd,
> path))
> +            logger.error("%s: Must point inside the rootfs: %s" % (cmd,
> path))
>

Nice catch. Thank you.
Reviewed-by: Tim Orling <tim.orling@konsulko.com>

             sys.exit(1)
>
>          return full_path
> --
> 2.34.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198476):
> https://lists.openembedded.org/g/openembedded-core/message/198476
> Mute This Topic: https://lists.openembedded.org/mt/105585009/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000781342061673c751
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Apr 17, 2024 at 12:56=E2=80=AFPM John Ripple via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;john=
.ripple=3D<a href=3D"mailto:keysight.com@lists.openembedded.org">keysight.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">




<div dir=3D"ltr">
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
This patch adds a missing &quot;%s&quot; format in a logger.error call. Wit=
hout</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
this addition the logger itself would error out and not print a useful</div=
>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
message.</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
Signed-off-by: John Ripple &lt;<a href=3D"mailto:john.ripple@keysight.com" =
target=3D"_blank" style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFon=
tService,Calibri,Helvetica,sans-serif">john.ripple@keysight.com</a>&gt;</di=
v>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
---</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
=C2=A0scripts/lib/wic/plugins/source/rootfs.py | 2 +-</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plu=
gins/source/rootfs.py</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
index e29f3a4c2f..c990143c0d 100644</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
--- a/scripts/lib/wic/plugins/source/rootfs.py</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
+++ b/scripts/lib/wic/plugins/source/rootfs.py</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
@@ -43,7 +43,7 @@ class RootfsPlugin(SourcePlugin):</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# directory, or modify a directory outsid=
e OpenEmbedded).</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0full_path =3D os.path.realpath(os.path.jo=
in(rootfs_dir, path))</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not full_path.startswith(os.path.realp=
ath(rootfs_dir)):</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(&quot;%s: Must poin=
t inside the rootfs:&quot; % (cmd, path))</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(&quot;%s: Must poin=
t inside the rootfs: %s&quot; % (cmd, path))</div></div></blockquote><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Nice catch. Thank you.</div><div di=
r=3D"auto">Reviewed-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulk=
o.com">tim.orling@konsulko.com</a>&gt;</div><div dir=3D"auto"><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)"><div dir=3D"ltr"><div style=3D"text-align:left;text-indent:0p=
x;margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calib=
ri,Helvetica,sans-serif;font-size:11pt;background-color:rgb(255,255,255);co=
lor:rgb(0,0,0)" dir=3D"auto"></div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(1)</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return full_path</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
--</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:11pt;background-color:rgb(255,255,255);color:rgb(0,0,0)">
2.34.1</div>
<div style=3D"background-color:inherit;color:inherit" id=3D"m_-826079005587=
6136619Signature"></div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198476): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198476" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198476</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105585009/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105585009/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000781342061673c751--

