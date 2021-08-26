Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.34156.1629999915431781525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 10:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EaQwhAQ0;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id e21so7972271ejz.12
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 10:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uwTRe0zv1NPoAvcFXHELwER4IT4zqJQ+Qfj0IgZ3X3A=;
        b=EaQwhAQ0mw+zxlPFIPn+Mj7wgCJKWwSct8A9Cc5KpBCaaXJbDpO24xvHNw1JuKLBs2
         wXaH+mFBhi8X+j/2HpjmxGA2YP6/54rk1VRSbIDE9FjizleKCUu76/URxAhX9pzpvDm9
         EFVqZTaHDFUu3fIwAqLfpuKvJszlzLEcK8WDC6Px1mNutv1Dvsn6xzpBb+zAdh8UMBLE
         TqJuYEIc82A/cGeKIgHmKEubAFWP81fpy5A/OxBAY5++7ukXkqHqnZN529MLm2KOLnOi
         8r5WiP1+YMDTl2Wk4FuNxj0U0HYUT6xXD06G9HkfhNW6Surv00c9seYjcd8zXiu6jfSD
         i7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uwTRe0zv1NPoAvcFXHELwER4IT4zqJQ+Qfj0IgZ3X3A=;
        b=fEJ+aULNliCWfbuRbBckDc+YAhsp1nCsfOUDzFIEomHErdIU7be7RpLddQdaUY1Vk1
         M4WS16uLFyvahUgLbnN9edz8n/nGRHVMtRLIb0JPLwiqMdhE3vfVAp9ER4kInJMCMebt
         +67qQ6bUcFzUzK1WsG2WxQJAhELVFeLUi5rsde5c/CAWCosGSe85v57mzIQ0dceFyyQB
         w5cLWAuKrAANPO4Wk1TwkEmGwZJoNQaWqI0txr2qW7U/RzZ1u8Zhk3ZSNsf6MKMqazT2
         ukyg4B5iQpg5I45XRXKI2x4gBQcrTySwrsUWfueBffrmh3x4QbHrSd5yvnwSQ3Pg3Kv3
         9/hw==
X-Gm-Message-State: AOAM533rivp6GsM+/EhjKqJQdUte/GuV81hbWK7IhUXKiHrhseffGmIs
	yAoj50FXeHJSwmAEWu8Jvud0hwddfV7mGoqbdJs=
X-Google-Smtp-Source: ABdhPJx66zfCMq/QjE/vEQDlvtGtmQRTUsPHXXHyqLoXOEbd8+CTx+5mn1QS5ldANUTle3aJnizBGc3jgjGRJGjhBkY=
X-Received: by 2002:a17:906:34ca:: with SMTP id h10mr5499069ejb.137.1629999913425;
 Thu, 26 Aug 2021 10:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210826172844.32608-1-pkj@axis.com> <20210826172844.32608-2-pkj@axis.com>
In-Reply-To: <20210826172844.32608-2-pkj@axis.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 26 Aug 2021 19:45:02 +0200
Message-ID: <CA+chaQdRQVF5X86t7ghv2vNrLH+oyL_fHiSL-sq8YPWPm=4SPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] buildhistory-collect-srcrevs: Adapt to the new variable override syntax
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d2dcc805ca79ed12"

--000000000000d2dcc805ca79ed12
Content-Type: text/plain; charset="UTF-8"

Is this one correct? The '_' in SRCREV_%s should IMHO stay and only the '_'
in _pn should be replaced with ':'.

As the first case in the SRC_URI element name, not an override.

On Thu, Aug 26, 2021 at 7:28 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  scripts/buildhistory-collect-srcrevs | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/buildhistory-collect-srcrevs
> b/scripts/buildhistory-collect-srcrevs
> index bca01a922b..6c919299a6 100755
> --- a/scripts/buildhistory-collect-srcrevs
> +++ b/scripts/buildhistory-collect-srcrevs
> @@ -53,7 +53,7 @@ def main():
>          sys.exit(1)
>
>      if options.forcevariable:
> -        forcevariable = '_forcevariable'
> +        forcevariable = ':forcevariable'
>      else:
>          forcevariable = ''
>
> @@ -78,14 +78,14 @@ def main():
>                              value = splitval[1].strip('" \t\n\r')
>                          if line.startswith('# SRCREV = '):
>                              orig_srcrev = value
> -                        elif line.startswith('# SRCREV_'):
> +                        elif line.startswith('# SRCREV:'):
>                              splitval = line.split('=')
> -                            name = splitval[0].split('_')[1].strip()
> +                            name = splitval[0].split(':')[1].strip()
>                              orig_srcrevs[name] = value
>                          elif line.startswith('SRCREV ='):
>                              srcrev = value
> -                        elif line.startswith('SRCREV_'):
> -                            name = splitval[0].split('_')[1].strip()
> +                        elif line.startswith('SRCREV:'):
> +                            name = splitval[0].split(':')[1].strip()
>                              srcrevs[name] = value
>                  if srcrev and (options.reportall or srcrev !=
> orig_srcrev):
>                      all_srcrevs[curdir].append((pn, None, srcrev))
> @@ -99,7 +99,7 @@ def main():
>              print('# %s' % curdir)
>              for pn, name, srcrev in srcrevs:
>                  if name:
> -                    print('SRCREV_%s_pn-%s%s = "%s"' % (name, pn,
> forcevariable, srcrev))
> +                    print('SRCREV:%s:pn-%s%s = "%s"' % (name, pn,
> forcevariable, srcrev))
>                  else:
>                      print('SRCREV:pn-%s%s = "%s"' % (pn, forcevariable,
> srcrev))
>
>
> 
>
>

--000000000000d2dcc805ca79ed12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is this one correct? The &#39;_&#39; in SRCREV_%s should I=
MHO stay and only the &#39;_&#39; in _pn should be replaced with &#39;:&#39=
;.<div><br></div><div>As the first case in the SRC_URI element name, not an=
 override.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 26, 2021 at 7:28 PM Peter Kjellerstedt &lt;<a h=
ref=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signe=
d-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.=
com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0scripts/buildhistory-collect-srcrevs | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-co=
llect-srcrevs<br>
index bca01a922b..6c919299a6 100755<br>
--- a/scripts/buildhistory-collect-srcrevs<br>
+++ b/scripts/buildhistory-collect-srcrevs<br>
@@ -53,7 +53,7 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(1)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if options.forcevariable:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 forcevariable =3D &#39;_forcevariable&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 forcevariable =3D &#39;:forcevariable&#39;<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0forcevariable =3D &#39;&#39;<br>
<br>
@@ -78,14 +78,14 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D splitval[1].strip(&#39;&quot; \t\n=
\r&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if line.startswith(&#39;# SRCREV =3D &#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orig_srcrev =3D value<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 elif line.startswith(&#39;# SRCREV_&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 elif line.startswith(&#39;# SRCREV:&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0splitval =3D line.split(&#39;=3D&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 name =3D splitval[0].split(&#39;_&#39;)[1].strip()=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 name =3D splitval[0].split(&#39;:&#39;)[1].strip()=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orig_srcrevs[name] =3D value<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0elif line.startswith(&#39;SRCREV =3D&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcrev =3D value<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 elif line.startswith(&#39;SRCREV_&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 name =3D splitval[0].split(&#39;_&#39;)[1].strip()=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 elif line.startswith(&#39;SRCREV:&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 name =3D splitval[0].split(&#39;:&#39;)[1].strip()=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcrevs[name] =3D value<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if srcrev and=
 (options.reportall or srcrev !=3D orig_srcrev):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0all_srcrevs[curdir].append((pn, None, srcrev))<br>
@@ -99,7 +99,7 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;# %s&#39; % curd=
ir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for pn, name, srcrev in src=
revs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if name:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prin=
t(&#39;SRCREV_%s_pn-%s%s =3D &quot;%s&quot;&#39; % (name, pn, forcevariable=
, srcrev))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prin=
t(&#39;SRCREV:%s:pn-%s%s =3D &quot;%s&quot;&#39; % (name, pn, forcevariable=
, srcrev))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0print(&#39;SRCREV:pn-%s%s =3D &quot;%s&quot;&#39; % (pn, forcevariable, =
srcrev))<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d2dcc805ca79ed12--
