Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.10931.1602541502411362712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 15:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tTm//L3i;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id ce10so25411513ejc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 15:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LTXcEfb4d74yD4dBCmbr8p4aE+ZjexZo2i3bzVxyNYs=;
        b=tTm//L3iKlZBi/Hf4+w7a9wJyTDzQMOEZoeI4KsbewfFiGSsZuIjFQZk2C1omvzGUM
         ml6K/Ub+sm6Aq9ErQ+jcQyS5IpWlJRXRtHP038a3h9AN/H2fJY/FrDw9cu/zqFqB9JXk
         zkQcUQ4Uto0P/oq8bA7mSEJLRa3Mr4BukRiLvoceetRy/GhkZnZra8lcKXYIi3rLnWCF
         dsaW2DNJSYfz+65DOboIRLouaLKzfC7+7MQAlOd1FYzm0SFN8oYDDnv90SbYvA85iFEx
         GnbcrzwazSy8CzreHs9ZHX2VmUC2MZCuboT6skU7RZdVyH++ukZXRAXAuX+LnMO0iiYj
         d90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LTXcEfb4d74yD4dBCmbr8p4aE+ZjexZo2i3bzVxyNYs=;
        b=mcq0pC0M96WRa7bmNVJeonnH1ZXWlrGexCaC5QSE6mjqs45zyr3cgG39i91fAkB8K2
         TzKdHeoWG44h5v+qfL2xsii+EmsFkd6sIhaD0H1VjZ6M+Kd6qaWRniZmUDw2ME8IQw6a
         OTRzhcdWN53XyaXnruifGnoBMvY+zlEfymK4LUs2m0th6xl6XkLUrAMQ3vsq/Xm03PkR
         LMNXprid/ymX1JnkK+NyNKGVoJy6KK7nugujVnsMTMqpmCBuInJ43bxUlDQfVrwPgOzH
         So0Dk78RGjwqezbOcpz4HSr9/GeN5PNL6hLIrrZJxfUb06UWmt/QHGEOq/C72dTNxLfG
         RRzA==
X-Gm-Message-State: AOAM532GJYxymmhRtL3EF4Xt3u6TiDg4AN8WUTiRwUDsRYT5peXCNH+g
	BABrPpOWnK1rYu8a34WBnb+NbsmxvsY8vKrVbFA=
X-Google-Smtp-Source: ABdhPJyIJ77S/T1ijxKM7s3n70x9tIaD2mOOpBcLhunJUV16MfyttPUqKOjfRkJMJEt3f0ka/lu88e/FHINTcryxMMQ=
X-Received: by 2002:a17:906:4a4c:: with SMTP id a12mr29703439ejv.392.1602541500671;
 Mon, 12 Oct 2020 15:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201012213137.15179-1-pkj@axis.com>
In-Reply-To: <20201012213137.15179-1-pkj@axis.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 13 Oct 2020 00:24:49 +0200
Message-ID: <CA+chaQf-4692XTUAiguks3ZmGg7mLXDeFbPsn-mjLRRCMcEfQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune-cortexa65.inc: Correct TUNE_FEATURES_tune-cortexa65
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jon Mason <jdmason@kudzu.us>
Content-Type: multipart/alternative; boundary="000000000000e2acf605b180c487"

--000000000000e2acf605b180c487
Content-Type: text/plain; charset="UTF-8"

Good catch, maybe we should require tune-test.sh test for all tune
modifying changes, it catches the issue as the very first tested case:

Testing fake MACHINE fake-cortexa65 for include
conf/machine/include/arm/armv8-2a/tune-cortexa65.inc (1/76)
ERROR: something wrong in openembedded-core/scripts/tune/log.fake-cortexa65

martin@jama:/OE/build/oe-core$ cat
openembedded-core/scripts/tune/log.fake-cortexa65
NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/prserv.sqlite3,
IP: 127.0.0.1, PORT: 44979, PID: 158972
ERROR:  OE-core's config sanity checker detected a potential
misconfiguration.
    Either fix the cause of this error or at your own risk disable the
checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Toolchain tunings invalid:
Tuning 'cortexa65' has the following errors:
Feature 'cortexa55' is not defined.


Summary: There was 1 ERROR message shown, returning a non-zero exit code.

I'll let it finish in master branch and update
https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune-test
tomorrow.

On Mon, Oct 12, 2020 at 11:31 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> It incorrectly specified "cortexa55" instead of "cortexa65".
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
> b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
> index ecf17fbbe7..427e58947f 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
> @@ -11,6 +11,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES                                         += "cortexa65"
>  ARMPKGARCH_tune-cortexa65                           = "cortexa65"
> -TUNE_FEATURES_tune-cortexa65                        =
> "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa55"
> +TUNE_FEATURES_tune-cortexa65                        =
> "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa65"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa65                  =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa65"
>  BASE_LIB_tune-cortexa65                             = "lib64"
>
> 
>
>

--000000000000e2acf605b180c487
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good catch, maybe we should require tune-test.sh test for =
all tune modifying changes, it catches the issue as the very first tested c=
ase:<div><br></div><div>Testing fake MACHINE fake-cortexa65 for include con=
f/machine/include/arm/armv8-2a/tune-cortexa65.inc (1/76)<br>ERROR: somethin=
g wrong in openembedded-core/scripts/tune/log.fake-cortexa65<br></div><div>=
<br></div><div>martin@jama:/OE/build/oe-core$ cat openembedded-core/scripts=
/tune/log.fake-cortexa65 <br>NOTE: Started PRServer with DBfile: /OE/build/=
oe-core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 44979, PID: 158972<br>ER=
ROR: =C2=A0OE-core&#39;s config sanity checker detected a potential misconf=
iguration.<br>=C2=A0 =C2=A0 Either fix the cause of this error or at your o=
wn risk disable the checker (see sanity.conf).<br>=C2=A0 =C2=A0 Following i=
s the list of potential problems / advisories:<br><br>=C2=A0 =C2=A0 Toolcha=
in tunings invalid:<br>Tuning &#39;cortexa65&#39; has the following errors:=
<br>Feature &#39;cortexa55&#39; is not defined.<br><br><br>Summary: There w=
as 1 ERROR message shown, returning a non-zero exit code.<br></div><div><br=
></div><div>I&#39;ll let it finish in master branch and update</div><div><a=
 href=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dja=
nsa/tune-test">https://git.openembedded.org/openembedded-core-contrib/log/?=
h=3Djansa/tune-test</a><br></div><div>tomorrow.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 12, 202=
0 at 11:31 PM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@a=
xis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">It incorrectly specified &quot;cortexa5=
5&quot; instead of &quot;cortexa65&quot;.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt=
@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc b/m=
eta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc<br>
index ecf17fbbe7..427e58947f 100644<br>
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc<br>
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc<br>
@@ -11,6 +11,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc<br>
=C2=A0# Little Endian base configs<br>
=C2=A0AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0+=3D &quot;cortexa65&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa65=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;cortexa65=
&quot;<br>
-TUNE_FEATURES_tune-cortexa65=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${TUNE_FEATURES_tune-armv=
8-2a-crypto} cortexa55&quot;<br>
+TUNE_FEATURES_tune-cortexa65=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${TUNE_FEATURES_tune-armv=
8-2a-crypto} cortexa65&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa65=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-=
crypto} cortexa65&quot;<br>
=C2=A0BASE_LIB_tune-cortexa65=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64=
&quot;<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e2acf605b180c487--
