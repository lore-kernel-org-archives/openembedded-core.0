Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.20938.1593308175125795343
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 18:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kf4O/RVL;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id b185so1770915qkg.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 18:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OGufIPZMxrRkyyKW8WaTteURUNWhVlCu+/6xaKszsos=;
        b=Kf4O/RVLSWUM7vGyg1EfeyJPDTZCOkcL7gB9iaAXVT30YG3AQofM2jdvnN+NU793aP
         95INXdWD++4vO/MjSc+86pzaUZphDt+iSyO/wfokdkOz+zFXexqPJ6CR20qieePg2tjU
         H4lJD8NkQx3lIFDrPaGhoaSMMkLZRlkY8YWUuAA+A+d1yPtEDivvY4nqAJsqLRGAsYHj
         3YkdvbXF9UE2PYVZL/XH+K4ra4bkJ1wAAeDqWak9xAoBr+Rn2fGT8JDrEpsJmQLpTYyO
         lUX2BVCwgrQslPQLl1pZEGqEu3QXsvZWKAMgLlSn6sM3lJADafvsDNsYscfca1WD1m0K
         tkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OGufIPZMxrRkyyKW8WaTteURUNWhVlCu+/6xaKszsos=;
        b=Mc/J8SwF6IYOye1p1CurLxCffVY4BjLqVNiyqZJncbcQRDKlQ82RhJCen4YoHaUan2
         2tKP44/15dgzhko7yRBlpOk8yz8n2Vz6yEvuovgWb4Agif+9hqmIY57n9LK4QwAHZf5J
         HUyzZ4U0sYjjExnzphT77T8XuJyQMA9pOvJjk39gSRtKnJAdFF58H1/H8pbRJ6FCRCbU
         X9UEsM99blXaB+ML4TRhRRaX3efUPmKL8dVbAwfYCtMTQ2d+HUEH4YJqYWepgsSD6HyQ
         ZKz9YIcLQMQxGiE6yL1k5Dv5kDhjlBF5tATTJexX8rzxiEKI29ze7rA7bpHbwneVzLS+
         ik8A==
X-Gm-Message-State: AOAM5300Gjv8EI330idlUn5OpIQfaCFosljOxeWBwZ/pO9wOmgKO+QIv
	QU5tblhf+dhyM/ta5SUFuiisP47/QZ4zO0cB2uo=
X-Google-Smtp-Source: ABdhPJx/r2tVWxXTv3WJkb74DEVsT9k4exB0QJ87DlzzGAdPyX3xmA5h8dGGLoh5WtBs2XJCLezw/PlDP4KXxft0aGI=
X-Received: by 2002:a05:620a:2050:: with SMTP id d16mr9889441qka.215.1593308174142;
 Sat, 27 Jun 2020 18:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200627225100.719632-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200627225100.719632-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 27 Jun 2020 18:36:02 -0700
Message-ID: <CAMKF1spRApyPsXRJPdcVU-cZhYU0_Opi_SrJD9ATs9OtCrSZhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] populate_sdk_ext: Fix to use python3, not python
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bcd2ba05a91af7bb"

--000000000000bcd2ba05a91af7bb
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 27, 2020 at 3:51 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> We should be using python3 here, it was missed in the conversion. Spotted
> on
> autobuilder tests failing on systems with python missing.


I this this is good for dunfell too

>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass
> index 9f26cfc1316..fd0da16e7ea 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -676,7 +676,7 @@ sdk_ext_postinst() {
>                 # current working directory when first ran, nor will it
> set $1 when
>                 # sourcing a script. That is why this has to look so ugly.
>                 LOGFILE="$target_sdk_dir/preparing_build_system.log"
> -               sh -c ". buildtools/environment-setup* > $LOGFILE && cd
> $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir
> && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE
> && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE
> '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully
> installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
> +               sh -c ". buildtools/environment-setup* > $LOGFILE && cd
> $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir
> && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE
> && python3 $target_sdk_dir/ext-sdk-prepare.py $LOGFILE
> '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully
> installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
>         fi
>         if [ -e $target_sdk_dir/ext-sdk-prepare.py ]; then
>                 rm $target_sdk_dir/ext-sdk-prepare.py
> --
> 2.25.1
>
> 
>

--000000000000bcd2ba05a91af7bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jun 27, 2020 at 3:51 PM Richard Purdie &lt;<a href=
=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We should be=
 using python3 here, it was missed in the conversion. Spotted on<br>
autobuilder tests failing on systems with python missing.</blockquote><div=
 dir=3D"auto"><br></div><div dir=3D"auto">I this this is good for dunfell t=
oo=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/classes/populate_sdk_ext.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate=
_sdk_ext.bbclass<br>
index 9f26cfc1316..fd0da16e7ea 100644<br>
--- a/meta/classes/populate_sdk_ext.bbclass<br>
+++ b/meta/classes/populate_sdk_ext.bbclass<br>
@@ -676,7 +676,7 @@ sdk_ext_postinst() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # current working =
directory when first ran, nor will it set $1 when<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # sourcing a scrip=
t. That is why this has to look so ugly.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGFILE=3D&quot;$t=
arget_sdk_dir/preparing_build_system.log&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sh -c &quot;. buil=
dtools/environment-setup* &gt; $LOGFILE &amp;&amp; cd $target_sdk_dir/`dirn=
ame ${oe_init_build_env_path}` &amp;&amp; set $target_sdk_dir &amp;&amp; . =
$target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir &gt;&gt; $LOGFILE=
 &amp;&amp; python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE &#39;${SDK_I=
NSTALL_TARGETS}&#39;&quot; || { echo &quot;printf &#39;ERROR: this SDK was =
not fully installed and needs reinstalling\n&#39;&quot; &gt;&gt; $env_setup=
_script ; exit 1 ; }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sh -c &quot;. buil=
dtools/environment-setup* &gt; $LOGFILE &amp;&amp; cd $target_sdk_dir/`dirn=
ame ${oe_init_build_env_path}` &amp;&amp; set $target_sdk_dir &amp;&amp; . =
$target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir &gt;&gt; $LOGFILE=
 &amp;&amp; python3 $target_sdk_dir/ext-sdk-prepare.py $LOGFILE &#39;${SDK_=
INSTALL_TARGETS}&#39;&quot; || { echo &quot;printf &#39;ERROR: this SDK was=
 not fully installed and needs reinstalling\n&#39;&quot; &gt;&gt; $env_setu=
p_script ; exit 1 ; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e $target_sdk_dir/ext-sdk-prepare.py ]; =
then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm $target_sdk_dir=
/ext-sdk-prepare.py<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000bcd2ba05a91af7bb--
