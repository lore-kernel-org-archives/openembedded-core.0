Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84B4C9EC6B
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 11:08:52 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30880.1768216131270003466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 03:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YATmPXrN;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso3204343f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 03:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768216130; x=1768820930; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WNdxAspIo4IE5P6qB/JveR/Dt/ksWgjq94EG1TM8+ec=;
        b=YATmPXrNSnC8RjT8FHQbTMhkRkloMm/hobiUCgBw/irAx+ZLytj8YigedtoQWepuNq
         egtZap4cbssfMP78gECBCst0kZ28IVFV/Y6eIDgBTzFSxZZjTyw4D6CJlzIxsBDf4XEi
         M++pXAPaV0jrgqPdmOK0a7y3ibX7BsHK/LaBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216130; x=1768820930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNdxAspIo4IE5P6qB/JveR/Dt/ksWgjq94EG1TM8+ec=;
        b=VATXqYs+xyLOE+1neGYIINX9XFu0L821bitmApCD/hBgFiLpUfRD+8LImp7Vdu82KD
         pCSP1+UEvmy/3041v8FK7cuuMPDpP1sNzIT1xJYX6v/UINObLgh0Eb5AbDiELI8tuBwD
         6/8PmUVkN+RFY92LEWJY52E/I2M3nXfalgdouin0TehUFumt8FucK4FYgO0PEV2fRSHt
         XF2Mu7M/qiC3Z4m7xogVdQed9YJYqtC1M24PLJHd4VHXl0mjJOceuke9f3ojtidOF5OM
         rUyhoeUcqW0R6qH608PaXe5rYn6SPt7o1zzWY/fgcMxDm9waGKz+8oi9v1QjFSxPkBiD
         JIOg==
X-Gm-Message-State: AOJu0YwiERZEzCuXYdr8AVOjVDU3JdoQbh4dDci5J0PPHj1GN9ufnhyc
	/xCVIDSpo+XNG5oq6LJkhFH/ZeeWvAnme5OFbuqtlPOIGRra8AXn/VYZEpGY850OHEoxIbsTTL0
	h+sfY64GW2hb4t1xON8qRi1kn5BYMWhLav2rB7NEd6w==
X-Gm-Gg: AY/fxX4ZAn7Dfj+7dwfLfLSjPnNnocjykylDmeIo5CI/Wnj669OrJuuRTaT9tJLUfpq
	92Ztt9LR91oCGKQ3nZl8/jW8/JWGGZ/V/+ZskQxZZ1F5R3f45Y27IFU13ZTqFsLSg+BMEsmMPLt
	U6710iV9u2LkOr3vBNbn5AigPaBP8hDmNdcAh8uiWSyvNHEB+BLcRplAQGm5RndR3ma75syXgti
	gGnfez/AfnbbnV55gsl9lmeD697CvfQVdbsIruW3r+MFDpOsSrGKKkbaaRlKwzifZCGpjCVug==
X-Google-Smtp-Source: AGHT+IHAvNreiS8eS0tI2Maqao91P5LPhtMpra0Ye4pVIWUCZ91KPp1aVAckMxr/DTbyNhLw1BLjC2L/vorvgHWY0GQ=
X-Received: by 2002:a05:6000:1865:b0:430:fc63:8d3 with SMTP id
 ffacd0b85a97d-432c379dc33mr20287465f8f.30.1768216129629; Mon, 12 Jan 2026
 03:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20260101121459.7191-1-peter.marko@siemens.com>
 <20260101121459.7191-3-peter.marko@siemens.com> <CAMSfU+47RP_P+aobc1Dt57X5Q8w7HFqK6QRUU-ter=WzQOzT4g@mail.gmail.com>
 <AS1PR10MB56977533DA4745706265F4C9FD81A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56977533DA4745706265F4C9FD81A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 12 Jan 2026 12:08:21 +0100
X-Gm-Features: AZwV_Qhjf3Lb6E0E0UwQhfn8cz9d5s58gIYsm5go_3iYetpaXF_AvjFv4dmAWkA
Message-ID: <CAMSfU+5VNzvU5f0p-rg7GeKTz5zFpQhn1Mi4MMLqZC5JkFDx1g@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 3/3] cups: allow unknown directives in
 conf files
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004b02ac06482ee678"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 11:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229208

--0000000000004b02ac06482ee678
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 12 janv. 2026 =C3=A0 12:04, Marko, Peter <Peter.Marko@siemens.com> =
a
=C3=A9crit :

> Hello Yoann,
>
>
>
> This patch is included in v2.4.16 which is the version in oe-core master.
>
> That can be verified by clicking on the patch link and seeing v2.4.16 tag=
.
>
> Therefore this patch cannot be applied (second time) there.
>

Oh right, I missed that.
All good.
Thanks!


>
>
> Best Regards,
>
>   Peter
>
>
>
> *From:* Yoann Congal <yoann.congal@smile.fr>
> *Sent:* Monday, January 12, 2026 11:56
> *To:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][kirkstone][PATCH 3/3] cups: allow unknown
> directives in conf files
>
>
>
> Le jeu. 1 janv. 2026 =C3=A0 13:15, Peter Marko via lists.openembedded.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Patch for CVE-2025-61915 by mistake causes fatal error on unknown
> directives in configuration files.
> The default configuration already contains unknown directive in
> non-systemd setups:
> Unknown directive IdleExitTimeout on line 32 of /etc/cups/cupsd.conf
>
> Backport fix for this from 2.4.x branch which reverts this behavior.
>
>
>
> Hello Peter,
>
>
>
> It looks like master needs the same patch.
>
> Can you send this there as well?
>
>
>
> Thanks!
>
>
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-extended/cups/cups.inc           |  1 +
>  ...pping-scheduler-on-unknown-directive.patch | 43 +++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644
> meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unk=
nown-directive.patch
>
> diff --git a/meta/recipes-extended/cups/cups.inc
> b/meta/recipes-extended/cups/cups.inc
> index ce55a8ef6fa..f70c4e7026a 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -29,6 +29,7 @@ SRC_URI =3D "
> https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
>            file://CVE-2025-58364.patch \
>             file://CVE-2025-58436.patch \
>             file://CVE-2025-61915.patch \
> +
>  file://0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch \
>             "
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/OpenPrinting/cups/releases"
> diff --git
> a/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-u=
nknown-directive.patch
> b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-u=
nknown-directive.patch
> new file mode 100644
> index 00000000000..572a8941f40
> --- /dev/null
> +++
> b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-u=
nknown-directive.patch
> @@ -0,0 +1,43 @@
> +From 277d3b1c49895f070bbf4b73cada011d71fbf9f3 Mon Sep 17 00:00:00 2001
> +From: Zdenek Dohnal <zdohnal@redhat.com>
> +Date: Thu, 4 Dec 2025 09:04:37 +0100
> +Subject: [PATCH] conf.c: Fix stopping scheduler on unknown directive
> +
> +Change the return value to do not trigger stopping the scheduler in case
> +of unknown directive, because stopping the scheduler on config errors
> +should only happen in case of syntax errors.
> +
> +Upstream-Status: Backport [
> https://github.com/OpenPrinting/cups/commit/277d3b1c49895f070bbf4b73cada0=
11d71fbf9f3
> ]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + scheduler/conf.c | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/scheduler/conf.c b/scheduler/conf.c
> +index 7d6da0252..0e7be0ef4 100644
> +--- a/scheduler/conf.c
> ++++ b/scheduler/conf.c
> +@@ -2695,16 +2695,16 @@ parse_variable(
> +   {
> +    /*
> +     * Unknown directive!  Output an error message and continue...
> ++    *
> ++    * Return value 1 is on purpose - we ignore unknown directives to lo=
g
> ++    * error, but do not stop the scheduler in case error in configurati=
on
> ++    * is set to be fatal.
> +     */
> +
> +-    if (!value)
> +-      cupsdLogMessage(CUPSD_LOG_ERROR, "Missing value for %s on line %d
> of %s.",
> +-                    line, linenum, filename);
> +-    else
> +-      cupsdLogMessage(CUPSD_LOG_ERROR, "Unknown directive %s on line %d
> of %s.",
> +-                    line, linenum, filename);
> ++    cupsdLogMessage(CUPSD_LOG_ERROR, "Unknown directive %s on line %d o=
f
> %s.",
> ++                  line, linenum, filename);
> +
> +-    return (0);
> ++    return (1);
> +   }
> +
> +   switch (var->type)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228819):
> https://lists.openembedded.org/g/openembedded-core/message/228819
> Mute This Topic: https://lists.openembedded.org/mt/117024509/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --
>
> Yoann Congal
>
> Smile ECS
>


--=20
Yoann Congal
Smile ECS

--0000000000004b02ac06482ee678
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 12=
 janv. 2026 =C3=A0=C2=A012:04, Marko, Peter &lt;<a href=3D"mailto:Peter.Mar=
ko@siemens.com">Peter.Marko@siemens.com</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-64139=
03962831871413">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-6413903962831871413WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Hello Yoann,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">This patch is included in v2.4.16 which is the version =
in oe-core master.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">That can be verified by clicking on the patch link and =
seeing v2.4.16 tag.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Therefore this patch cannot be applied (second time) th=
ere.</span></p></div></div></div></blockquote><div><br></div><div>Oh right,=
 I missed that.</div><div>All good.</div><div>Thanks!</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-641390=
3962831871413"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><di=
v class=3D"m_-6413903962831871413WordSection1"><p class=3D"MsoNormal"><span=
 style=3D"font-size:10pt;font-family:&quot;Arial&quot;,sans-serif"><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Best Regards,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">=C2=A0 Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;border-color:currentcolor currentcolor currentcolor blue;paddi=
ng:0in 0in 0in 4pt">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;C=
alibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif"> Yoann Congal &lt;<a href=3D"mailto=
:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;
<br>
<b>Sent:</b> Monday, January 12, 2026 11:56<br>
<b>To:</b> Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core][kirkstone][PATCH 3/3] cups: allow unknown dir=
ectives in conf files<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Le=C2=A0jeu. 1 janv. 2026 =C3=A0=C2=A013:15, Peter M=
arko via <a href=3D"http://lists.openembedded.org" target=3D"_blank">
lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@=
lists.openembedded.org" target=3D"_blank">siemens.com@lists.openembedded.or=
g</a>&gt; a =C3=A9crit=C2=A0:<u></u><u></u></p>
</div>
<div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">From: Peter Marko &lt;<a href=3D"mailto:peter.marko@=
siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
Patch for CVE-2025-61915 by mistake causes fatal error on unknown<br>
directives in configuration files.<br>
The default configuration already contains unknown directive in<br>
non-systemd setups:<br>
Unknown directive IdleExitTimeout on line 32 of /etc/cups/cupsd.conf<br>
<br>
Backport fix for this from 2.4.x branch which reverts this behavior.<u></u>=
<u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Hello Peter,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">It looks like master needs the same patch.<u></u><u>=
</u></p>
</div>
<div>
<p class=3D"MsoNormal">Can you send this there as well?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks!<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Signed-off-by: Peter Ma=
rko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=3D"_blank">peter.=
marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/cups/cups.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 +<br>
=C2=A0...pping-scheduler-on-unknown-directive.patch | 43 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 44 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/cups/cups/0001-conf.c-Fix-st=
opping-scheduler-on-unknown-directive.patch<br>
<br>
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cu=
ps/cups.inc<br>
index ce55a8ef6fa..f70c4e7026a 100644<br>
--- a/meta/recipes-extended/cups/cups.inc<br>
+++ b/meta/recipes-extended/cups/cups.inc<br>
@@ -29,6 +29,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/OpenPrint=
ing/cups/releases/download/v$%7BPV%7D/cups-$%7B" target=3D"_blank">https://=
github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-58364.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-58436.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-61915.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-conf.c-Fix-stopping-s=
cheduler-on-unknown-directive.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/OpenPrinti=
ng/cups/releases" target=3D"_blank">https://github.com/OpenPrinting/cups/re=
leases</a>&quot;<br>
diff --git a/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-sched=
uler-on-unknown-directive.patch b/meta/recipes-extended/cups/cups/0001-conf=
.c-Fix-stopping-scheduler-on-unknown-directive.patch<br>
new file mode 100644<br>
index 00000000000..572a8941f40<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on=
-unknown-directive.patch<br>
@@ -0,0 +1,43 @@<br>
+From 277d3b1c49895f070bbf4b73cada011d71fbf9f3 Mon Sep 17 00:00:00 2001<br>
+From: Zdenek Dohnal &lt;<a href=3D"mailto:zdohnal@redhat.com" target=3D"_b=
lank">zdohnal@redhat.com</a>&gt;<br>
+Date: Thu, 4 Dec 2025 09:04:37 +0100<br>
+Subject: [PATCH] conf.c: Fix stopping scheduler on unknown directive<br>
+<br>
+Change the return value to do not trigger stopping the scheduler in case<b=
r>
+of unknown directive, because stopping the scheduler on config errors<br>
+should only happen in case of syntax errors.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/OpenPrinting/cups=
/commit/277d3b1c49895f070bbf4b73cada011d71fbf9f3" target=3D"_blank">https:/=
/github.com/OpenPrinting/cups/commit/277d3b1c49895f070bbf4b73cada011d71fbf9=
f3</a>]<br>
+Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
+---<br>
+ scheduler/conf.c | 14 +++++++-------<br>
+ 1 file changed, 7 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/scheduler/conf.c b/scheduler/conf.c<br>
+index 7d6da0252..0e7be0ef4 100644<br>
+--- a/scheduler/conf.c<br>
++++ b/scheduler/conf.c<br>
+@@ -2695,16 +2695,16 @@ parse_variable(<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Unknown directive!=C2=A0 Output an error message and=
 continue...<br>
++=C2=A0 =C2=A0 *<br>
++=C2=A0 =C2=A0 * Return value 1 is on purpose - we ignore unknown directiv=
es to log<br>
++=C2=A0 =C2=A0 * error, but do not stop the scheduler in case error in con=
figuration<br>
++=C2=A0 =C2=A0 * is set to be fatal.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+ <br>
+-=C2=A0 =C2=A0 if (!value)<br>
+-=C2=A0 =C2=A0 =C2=A0 cupsdLogMessage(CUPSD_LOG_ERROR, &quot;Missing value=
 for %s on line %d of %s.&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lin=
e, linenum, filename);<br>
+-=C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 cupsdLogMessage(CUPSD_LOG_ERROR, &quot;Unknown direc=
tive %s on line %d of %s.&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lin=
e, linenum, filename);<br>
++=C2=A0 =C2=A0 cupsdLogMessage(CUPSD_LOG_ERROR, &quot;Unknown directive %s=
 on line %d of %s.&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line, line=
num, filename);<br>
+ <br>
+-=C2=A0 =C2=A0 return (0);<br>
++=C2=A0 =C2=A0 return (1);<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0switch (var-&gt;type)<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228819): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228819" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/228819</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117024509/431=
6185" target=3D"_blank">
https://lists.openembedded.org/mt/117024509/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>]<br=
>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><br>
<span class=3D"m_-6413903962831871413gmailsignatureprefix">-- </span><u></u=
><u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Raleway">Yoann Congal</sp=
an><u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Raleway">Smile ECS</span>=
<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><di=
v><font face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000004b02ac06482ee678--

