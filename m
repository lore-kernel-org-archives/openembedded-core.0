Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web12.15389.1622243765496099770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 16:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xp2YoS5P;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id n61so3041824uan.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 16:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0+VjyMIEEElEI2YD2FvftDfz8pLhvF7Q5wBr+Cwn4F0=;
        b=Xp2YoS5P4Ac46bqhS8uYGQwMrO2IzHLLjH2Wk3UlVIECK8IkkcLTyVT+GiOefNbDzx
         HeaPhY32FerGCOWAy6GZKpCZ8bS/OyzY6Lnv4vNesF805Sl9GAowOTGK1ISVqofnFb3P
         QkJtdJh3HP+T5Jn0e3ykk00r+RE+HHXY0kry+lOLKdpNvhUs54i2COLtBOW7gjJIm37Q
         9Rl8PBgcNqmaMUX+ll4Q6/rwhuLZrFJ6tt1+uYFxo12Bz8Gu1xffSEsXvhBpwjoJ1ywK
         n8/pxuMzKP+BL5IckBRxJUztXS0oG3NTKqTPerwwFFZSH9m/fn9ViZY4/sjJWJv3HtLo
         QEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+VjyMIEEElEI2YD2FvftDfz8pLhvF7Q5wBr+Cwn4F0=;
        b=hSp1aSEhi1DUyHqKiDMEFKHZcmEQKPLQyqS0e/dBwMCEyp++GBCtViHqoYRCTNM2yu
         7rFcmfOFaEdK4XnSDyolxuckbhJr2TNJjlFH+KC6RsRMUAX4ZhWiA0DCVHTEwKNqKydx
         iAua+5fsdMQtaodfWBQsXroSw6KnKlMqJgSoejGw1omeGkyt8VVYVzbQuEiXyrv8dyPQ
         4gSUVwjX/rF9Vl+rsytIC8klBvg8JE6ziNEGF01RScJY1o6CsYbuoyprWFnb0TtmQRzd
         sZ1gE1jBYhJIzjkOh+2nZTizW1L1e615KQ88UNE0Ke/Xq8vdK4NJ1vD89EsiJ/sKtPty
         L6uA==
X-Gm-Message-State: AOAM533zbVJVzMvwEw4a5D90+tcVejD7zGXmZE9iX/6MXo6yNnt0YChL
	HlJVpkqDzB3ycqpPyWjJXtD8tbWCKElbdpTKw3Q=
X-Google-Smtp-Source: ABdhPJzN4UVeKvtf92spbmgw/nrwS9hNH9rvrukx/z0snlxUEzo8tRLT5U3mZoKED79V8ATGUr4zU1iX8sTn2LZNZts=
X-Received: by 2002:ac5:c35a:: with SMTP id l26mr8839111vkk.7.1622243764609;
 Fri, 28 May 2021 16:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <MADEUP.1683373195080616.665@lists.openembedded.org>
In-Reply-To: <MADEUP.1683373195080616.665@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 29 May 2021 01:15:53 +0200
Message-ID: <CANNYZj8ABwfwh5uG7QNCDVBUawBk46A+WUfTLVdXEThw7z8FXQ@mail.gmail.com>
Subject: Re: [OE-core] [AUH] curl: upgrading to 7.77.0 FAILED
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000054279c05c36c0f27"

--00000000000054279c05c36c0f27
Content-Type: text/plain; charset="UTF-8"

Looking at bitbake output, seems like package_setscene is racing with
packagedata_setscene when buildhistory is enabled?

Specifically, packagedata_setscene is probing into packages-split/ at the
same time as that is being written to by package_setscene:

Exception: bb.process.ExecutionError: Execution of
'/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.2-r0/temp/run.buildhistory_list_pkg_files.2818746'
failed with exit code 1:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.2-r0/temp/run.buildhistory_list_pkg_files.2818746:
line 171: cd: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.2-r0/packages-split/glib-2.0-locale-gd:
No such file or directory
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.2-r0/temp/run.buildhistory_list_pkg_files.2818746:168
exit 1 from 'buildhistory_list_files $pkgdir $outfile fakeroot'


Alex

On Fri, 28 May 2021 at 13:24, <auh@auh.yoctoproject.org> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *curl* to *7.77.0* has
> Failed(do_compile).
>
> Detailed error information:
>
> do_compile failed
>
>
>
> Next steps:
>     - apply the patch: git am 0001-curl-upgrade-7.76.1-7.77.0.patch
>     - check the changes to upstream patches and summarize them in the
> commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --amend
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this
> time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> 
>
>

--00000000000054279c05c36c0f27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Looking at bitbake output, seems like package_setscen=
e is racing with packagedata_setscene when buildhistory is enabled? <br></d=
iv><div><br></div><div>Specifically, packagedata_setscene is probing into p=
ackages-split/ at the same time as that is being written to by package_sets=
cene:</div><div><pre class=3D"gmail-aLF-aPX-K0-aPE"><span style=3D"font-fam=
ily:arial,sans-serif">Exception: bb.process.ExecutionError: Execution of &#=
39;/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-pok=
y-linux/glib-2.0/1_2.68.2-r0/temp/run.buildhistory_list_pkg_files.2818746&#=
39; failed with exit code 1:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-=
linux/glib-2.0/1_2.68.2-r0/temp/run.buildhistory_list_pkg_files.2818746: li=
ne 171: cd: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-64-poky-linux/glib-2.0/1_2.68.2-r0/packages-split/glib-2.0-locale-gd: No=
 such file or directory
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2=
-64-poky-linux/glib-2.0/1_2.68.2-r0/temp/run.buildhistory_list_pkg_files.28=
18746:168 exit 1 from &#39;buildhistory_list_files $pkgdir $outfile fakeroo=
t&#39;</span></pre></div><div><br></div><div>Alex<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 28 May 2021=
 at 13:24, &lt;<a href=3D"mailto:auh@auh.yoctoproject.org">auh@auh.yoctopro=
ject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *curl* to *7.77.0* has Fa=
iled(do_compile).<br>
<br>
Detailed error information:<br>
<br>
do_compile failed<br>
<br>
<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-curl-upgrade-7.76.1-7.77.0.pa=
tch<br>
=C2=A0 =C2=A0 - check the changes to upstream patches and summarize them i=
n the commit message,<br>
=C2=A0 =C2=A0 - compile an image that contains the package<br>
=C2=A0 =C2=A0 - perform some basic sanity tests<br>
=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --reset-aut=
hor --amend<br>
=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
<br>
Alternatively, if you believe the recipe should not be upgraded at this ti=
me,<br>
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that<br>
automatic upgrades would no longer be attempted.<br>
<br>
Please review the attached files for further information and build/update =
failures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.=
org/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer=
" target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000054279c05c36c0f27--
