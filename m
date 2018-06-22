Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id F0E8F74D3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 15:32:23 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id f79-v6so6484180oib.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 08:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ptwJ2mS7yiAi7h3GEonXI3CIpciDnV5SNC1hZ2bgLRU=;
	b=F+86HB/x1mkgRPL0DFahO3+CNMUMmYInzTQkqROnfIuOAbfFxxGgdRhFOPecf5KR1J
	XQ+CxP/IeMS1PBxT/PF4fhJPs3bLA+zBH6Ibj8NAg/aGHLk6EZgA/rymjX5h/hwxt1Du
	LMryTy7KK1RujA+phawvcnk9bNlvs8ja+CrFhUhlB6QhbtplQE64GkTQbFYM4AGoUerk
	hUENnjHq0VvOMw8taPlJ5uROBUY9GjpOTJWoh6rjbT+USCF7sQlHukmF2LLzSY6V5rGh
	imOin6yjMiLgkWm2W2tS6qKPxtpFgePqf406ftg5IgctOvKMM+BGmraAo/PkhztLE8ko
	faYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ptwJ2mS7yiAi7h3GEonXI3CIpciDnV5SNC1hZ2bgLRU=;
	b=HMdIUkaSMBBOG1rCw64Yb9XQO2vXrtfmFPi0kRY5zDTifXLKtngaOBNWdn0S4i1w7D
	0gWaBdWjrPBRGR1xR8cV/HXLQuCjdAEOAEvHaNV4x6rBDSNlukzx9s7Yo1ywTnt81sUA
	nkZofEmRtbnf4pZqtT1iNb2EWjDQ5o+KUP01FqitU/ptWt2bMrmDyHoNlXcK0LOwZOd/
	/0/7QznGheK7jtiJuhmY8UcYsQo3C8XjDNiD8O1fbc+cUt74xCQMeowLNwZkhCPhAeHI
	98MrLRjt2HHKKp+3+FYCoiS2PLSTOUcPeHftno5glXKk8sW8c4hc++JUdkHAuVGCFeNn
	p5Nw==
X-Gm-Message-State: APt69E3uOAl66UF0JwsZWt4xf3EflT3ZvmgYU0d1D+Gip1+dJyWWk41T
	lh6WPFApZ3oP+2Rp02/AWxVFCkTALxkBxhD2OvfuXg==
X-Google-Smtp-Source: ADUXVKIX+5b9SQyBE4ehxG7qJ+UbWGKDLK99so8iBcuBid9I3mUz34AS0+cywtXK8HjIlyxF9DVSDnRNwQn0E5mYE3I=
X-Received: by 2002:aca:eb0f:: with SMTP id
	j15-v6mr1056517oih.85.1529681544859; 
	Fri, 22 Jun 2018 08:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180621203549.6187-1-damien.riegel@savoirfairelinux.com>
In-Reply-To: <20180621203549.6187-1-damien.riegel@savoirfairelinux.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 22 Jun 2018 08:32:14 -0700
Message-ID: <CABcZANm1c9Ydbn3eQMErpkd3LmmOvVkQqh7AHkRcLqnHPmH1Kw@mail.gmail.com>
To: damien.riegel@savoirfairelinux.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: quote SYSTEMD_SERVICE in prerm and postinst
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2018 15:32:24 -0000
Content-Type: multipart/alternative; boundary="00000000000019d582056f3cbdb3"

--00000000000019d582056f3cbdb3
Content-Type: text/plain; charset="UTF-8"

Have you tried something like this? Might need to shift it to a def'd
python function to ensure shlex gets imported, though.

systemctl $OPTS disable ${@' '.join(shlex.quote(s) for s in
d.getVar('SYSTEMD_SERVICE').split()}

On Thu, Jun 21, 2018 at 1:36 PM Damien Riegel <
damien.riegel@savoirfairelinux.com> wrote:

> Systemd mount configuration file must have a name that match the mount
> point directory they control. So for instance, if a mount file contains
>
>     [Mount]
>     ...
>     Where=/mnt/my-data
>
> The file must be named `mnt-my\x2ddata.mount`, or systemd will refuse to
> honour it.
>
> If this config file contains an [Install] section, it will silently fail
> because the unit file is not quoted when systemctl is called. To fix
> that, quote `${SYSTEMD_SERVICE}` in prerm and postinst hooks.
>
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> ---
>  meta/classes/systemd.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index 1b134322fb..589e73c855 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -34,10 +34,10 @@ if type systemctl >/dev/null 2>/dev/null; then
>                 systemctl daemon-reload
>         fi
>
> -       systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
> +       systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} "${SYSTEMD_SERVICE}"
>
>         if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
> -               systemctl --no-block restart ${SYSTEMD_SERVICE}
> +               systemctl --no-block restart "${SYSTEMD_SERVICE}"
>         fi
>  fi
>  }
> @@ -51,10 +51,10 @@ fi
>
>  if type systemctl >/dev/null 2>/dev/null; then
>         if [ -z "$D" ]; then
> -               systemctl stop ${SYSTEMD_SERVICE}
> +               systemctl stop "${SYSTEMD_SERVICE}"
>         fi
>
> -       systemctl $OPTS disable ${SYSTEMD_SERVICE}
> +       systemctl $OPTS disable "${SYSTEMD_SERVICE}"
>  fi
>  }
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--00000000000019d582056f3cbdb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Have you tried something like this? Might need to shi=
ft it to a def&#39;d python function to ensure shlex gets imported, though.=
<br></div><div><br></div><div>systemctl $OPTS disable ${@&#39; &#39;.join(s=
hlex.quote(s) for s in d.getVar(&#39;SYSTEMD_SERVICE&#39;).split()}</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jun 21, 2018 at=
 1:36 PM Damien Riegel &lt;<a href=3D"mailto:damien.riegel@savoirfairelinux=
.com">damien.riegel@savoirfairelinux.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Systemd mount configuration file must have a name that=
 match the mount<br>
point directory they control. So for instance, if a mount file contains<br>
<br>
=C2=A0 =C2=A0 [Mount]<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 Where=3D/mnt/my-data<br>
<br>
The file must be named `mnt-my\x2ddata.mount`, or systemd will refuse to<br=
>
honour it.<br>
<br>
If this config file contains an [Install] section, it will silently fail<br=
>
because the unit file is not quoted when systemctl is called. To fix<br>
that, quote `${SYSTEMD_SERVICE}` in prerm and postinst hooks.<br>
<br>
Signed-off-by: Damien Riegel &lt;<a href=3D"mailto:damien.riegel@savoirfair=
elinux.com" target=3D"_blank">damien.riegel@savoirfairelinux.com</a>&gt;<br=
>
---<br>
=C2=A0meta/classes/systemd.bbclass | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass<br=
>
index 1b134322fb..589e73c855 100644<br>
--- a/meta/classes/systemd.bbclass<br>
+++ b/meta/classes/systemd.bbclass<br>
@@ -34,10 +34,10 @@ if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemctl daemon-re=
load<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEM=
D_SERVICE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} &quot;${=
SYSTEMD_SERVICE}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$D&quot; -a &quot;${SYSTEMD_AUTO_=
ENABLE}&quot; =3D &quot;enable&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl --no-bloc=
k restart ${SYSTEMD_SERVICE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl --no-bloc=
k restart &quot;${SYSTEMD_SERVICE}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0fi<br>
=C2=A0}<br>
@@ -51,10 +51,10 @@ fi<br>
<br>
=C2=A0if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$D&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl stop ${SY=
STEMD_SERVICE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl stop &quo=
t;${SYSTEMD_SERVICE}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OPTS disable ${SYSTEMD_SERVICE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OPTS disable &quot;${SYSTEMD_SERVICE=
}&quot;<br>
=C2=A0fi<br>
=C2=A0}<br>
<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graph=
ics</div></div></div></div>

--00000000000019d582056f3cbdb3--
