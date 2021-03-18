Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.4523.1616039590541024856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 20:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c5H9MXEC;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id l4so796550qkl.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 20:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QB3rmPJ1g1DK0nBpE9N4CFvMG1Upp9S4ukSafT/To5A=;
        b=c5H9MXECwapqndLb3ub+ALXiXOOuZjAetTEmegaFxaRzay+d/j3vJLwUPnS8DSlGlb
         xpjnwuPjkt4N0rVby9hYcz0khHD7LkWqJrTXHthipF4pCEjk3NAiwpyEXmXlzy55/Mxu
         fsvxhVHGNB5crVL4LIZL0ug1Ruoj+idcjBOuMfoRnW0mtOMMe8PWc0JzG7m+SnbdF+4R
         lep/ZyyLRV8lmJiQGvJtA5LArA8WS035UKhMwMgHUaaE3LKUVekejm8ehHw8AlqDrt6j
         Jy6Ij0lm/Th4cZdea+s2tSXfRY6CMwPcegHmi4fTbTw7I5DrqsN7Fljl47FGFcbZNNlw
         KEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QB3rmPJ1g1DK0nBpE9N4CFvMG1Upp9S4ukSafT/To5A=;
        b=WbyNDBuu+dv0V8fRfa50hH1UiDwsFBR2zOvUaJpuykzZPLhnWfkAr7rRpTpzX4GcsQ
         zO0I6fB2JAoFhn8wv5zIkrqKkCGRX5oKe6ma5t/J5Cf5/wWQY91w8Xah2x/pxV8+tG8k
         RaJwCendr519CXjDhZHADsLVuP9x8UaC44gQ+1U46101Al87IHkNojcTuNrP1/N2bBVJ
         JuciU9swoyCeROX8FTB9QX+MJGY//hbzW841Ii3/RuGMqWAL/eAbQaJHShZ15UQW6O6K
         DmGEoD8jBo3pp7lHoRxp8fFiammMM1LUAcbf8D/85gvJbwSuZZCAKZM3ZsgQXotdVdSL
         N7FA==
X-Gm-Message-State: AOAM530CeUX2IsZMwAbiXRTVqtS6SehCCvxnAX1rUQJ9EncelaGkL1bk
	qaK6ywCAhVp3sjJ/u7JXy0jhfcE4vGTc22+ESDA=
X-Google-Smtp-Source: ABdhPJx17WLe304aeZaUGQCVyjLTzhQ0qyEhfABC6s8OfjjE6UfS5souQSg75qZY4zEYGoMtbcgvhQEWOF9tBdi98aY=
X-Received: by 2002:a05:620a:124f:: with SMTP id a15mr2544478qkl.125.1616039589442;
 Wed, 17 Mar 2021 20:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210318025605.48080-1-mingli.yu@windriver.com>
In-Reply-To: <20210318025605.48080-1-mingli.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Mar 2021 20:52:56 -0700
Message-ID: <CAMKF1srFg0FMryVXcEkQFuygGO0E_HRvpu5Bvgt8BDBREHW+gg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] autotools: don't wipe elfutils macros
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000abf97805bdc789c2"

--000000000000abf97805bdc789c2
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 17, 2021 at 7:56 PM Yu, Mingli <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> The below m4 macros files shipped with recipe will be removed if the
> recipe use AM_GNU_GETTEXT.
> gettext.m4
> iconv.m4
> lib-ld.m4
> lib-link.m4
> lib-prefix.m4
> nls.m4 po.m4
> progtest.m4
>
> After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as the
> commit (dd52d2ab Modernize gettext infrastructure) included, so the above
> m4 macros files such as iconv.m4 is removed and it's bad as we need to
> patch against iconv.m4 shippped with elfutils.
>
> So we skip elfutils to not let the elfutils m4 macros removed and also
> fix below issue:
>  $ bitbake elfutils -cconfigure && bitbake elfutils -cpatch
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/classes/autotools.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/autotools.bbclass
> b/meta/classes/autotools.bbclass
> index 9dc8ebdaa7..4b462c5aba 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -203,7 +203,7 @@ autotools_do_configure() {
>                                 bbnote Executing glib-gettextize --force
> --copy
>                                 echo "no" | glib-gettextize --force --copy
>                         fi
> -               elif [ "${BPN}" != "gettext" ] && grep -q
> "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
> +               elif [ "${BPN}" != "gettext" -a "${BPN}" != "elfutils" ]
> && grep -q "^[[:space:]]*AM_GNU_GETTEXT"



This looks a bit iffy to me where we are moving recipe specific knowledge
into a generic class

Please find a solution that works in recipe space
Perhaps move these macros to different folder before regenerating them and
then move back as desired or perhaps look at if the gettext change we did
for elfutils is too deep a cut then we might want to revert that

$CONFIGURE_AC; then
>                         # We'd call gettextize here if it wasn't so
> broken...
>                         cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath
> ${AUTOTOOLS_AUXDIR}/
>                         if [ -d ${S}/po/ ]; then
> --
> 2.17.1
>
>
> 
>
>

--000000000000abf97805bdc789c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 17, 2021 at 7:56 PM Yu, Mingli &lt;<a href=3D"=
mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)">From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windr=
iver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
<br>
The below m4 macros files shipped with recipe will be removed if the<br>
recipe use AM_GNU_GETTEXT.<br>
gettext.m4<br>
iconv.m4<br>
lib-ld.m4<br>
lib-link.m4<br>
lib-prefix.m4<br>
nls.m4 po.m4<br>
progtest.m4<br>
<br>
After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as the<b=
r>
commit (dd52d2ab Modernize gettext infrastructure) included, so the above<=
br>
m4 macros files such as iconv.m4 is removed and it&#39;s bad as we need to=
<br>
patch against iconv.m4 shippped with elfutils.<br>
<br>
So we skip elfutils to not let the elfutils m4 macros removed and also<br>
fix below issue:<br>
=C2=A0$ bitbake elfutils -cconfigure &amp;&amp; bitbake elfutils -cpatch<b=
r>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/autotools.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbcla=
ss<br>
index 9dc8ebdaa7..4b462c5aba 100644<br>
--- a/meta/classes/autotools.bbclass<br>
+++ b/meta/classes/autotools.bbclass<br>
@@ -203,7 +203,7 @@ autotools_do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote Executing glib-gettextize --=
force --copy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;no&quot; | glib-gettexti=
ze --force --copy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ &quot;${BPN=
}&quot; !=3D &quot;gettext&quot; ] &amp;&amp; grep -q &quot;^[[:space:]]*AM=
_GNU_GETTEXT&quot; $CONFIGURE_AC; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ &quot;${BPN=
}&quot; !=3D &quot;gettext&quot; -a &quot;${BPN}&quot; !=3D &quot;elfutils&=
quot; ] &amp;&amp; grep -q &quot;^[[:space:]]*AM_GNU_GETTEXT&quot; </blockq=
uote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">This looks a bit iffy to me where we are moving recipe specific knowled=
ge into a generic class</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Please find a solution that works in recipe space</div><div dir=3D"auto">Pe=
rhaps move these macros to different folder before regenerating them and th=
en move back as desired or perhaps look at if the gettext change we did for=
 elfutils is too deep a cut then we might want to revert that=C2=A0</div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto">$CONFIGURE_AC; then=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # We&#39;d call gettextize here if it wasn&#39;t so broken...<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_A=
UXDIR}/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ -d ${S}/po/ ]; then<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000abf97805bdc789c2--
