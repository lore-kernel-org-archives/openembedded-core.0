Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.5735.1596718146716535634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 05:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JkX8GVmn;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id qc22so35372922ejb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2020 05:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nbsyMT/QEIYrbyU0RL+pMwaWLUmagW50kwOt0nuruFg=;
        b=JkX8GVmnRB4nROFW318rictc5mXzSM68bUH7TMc8c+YZR2bgr0uHx2rlUSt1EL0BRl
         wNU/BErg8yAC0bz+ZurWVlWHcsywezr7zs/SsyLlJRx2d+T2S/FKV8/EYH6aaDViLXxX
         x4yCg8bAJY1yuBR+t7jVPdUgkFxtynSwwI+myTXD2XWgHmrM8RpTBRValsz2L0Q82DsU
         I2x9wd5nAAvk9QzAwF4Eb+dDhX+KU9vIffA1Ze/+CLk+6Tt/dyaolSE0nZBJmfTeh7eW
         xuNrhnjbbIJ693ssoezo7AMN8QSz73uLMjnxnK+6eqVWQSNQL1+25hCagUM/YcURWzHO
         SkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nbsyMT/QEIYrbyU0RL+pMwaWLUmagW50kwOt0nuruFg=;
        b=cqu4UJBPGRJEl9apZ/8oooX8WwaeBhhOa2R/8RUlAd8ULtwzaXfHDfgnxpXaltoECW
         jBbwrBTlz6dnNSaW/OGs6BO8W1f0xPgYNOjG/RpRlSooMPh7wyY4LasOMaFhdkSQugsv
         I6jTN1bYr7VD3EBwHt4/99L7sbLzalylgnItCl1R0OKgSXpVMlo/PY93QGGpOTBl46SL
         sxOSULKSuNPjGukf5TqdbGKXbgGtBJXp8nTzySj71Eyq8EWxoAQKL/+ZZxb01eCCcZLf
         B0CgTS6P+EFoGrmAbD2dbGA2srQUARTgAP9mycgW6bWsR2yt+5dpnqF+WtjVgrCSyQN4
         2RhA==
X-Gm-Message-State: AOAM531EAsXo9ecez6bR/kZ1XZSDj3hAAqUfs2BERPrXglYXypJKVV3f
	SV3jVj8siS7KqrC1kudflq3LlbxORt7suV0o2Ho=
X-Google-Smtp-Source: ABdhPJys+brTQ0B3Vat/iwXoSsNHpRzOftGrlsq/71atcmlzinaCXSkIicFnL9iPm1O/3nnNScZXftrgGJmHRpmdESM=
X-Received: by 2002:a17:906:b815:: with SMTP id dv21mr4065627ejb.517.1596718145182;
 Thu, 06 Aug 2020 05:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200806091512.691613-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200806091512.691613-1-richard.purdie@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 6 Aug 2020 08:48:53 -0400
Message-ID: <CADkTA4NTwN-jQs=QQmrC+X2Rcr6L5M4GFyMg7hsu9ji4Ohqz+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: Fix bb.debug to add missing log level
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d99f9305ac34e9a3"

--000000000000d99f9305ac34e9a3
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 6, 2020 at 5:15 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Fixes warnings like:
>
> WARNING: linux-intel-5.4.50+gitAUTOINC+caafbdfe38_89e6c056f3-r0
> do_kernel_configcheck: Passed invalid debug level 'outfile size is:
> /home/pokybuild/yocto-worker/meta-intel/build/build/tmp/work-shared/intel-corei7-64/kernel-source/.kernel-meta/cfg/mismatch.txt
> 767' to bb.debug
>
>
Argh.

Apparently I didn't hit any mismatches after putting that debug statement
in. I was getting a file with a single \n and it was breaking the size
test, hence the debug addition.

Thanks for the fixup on this one.

Cheers,

Bruce



> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 3c428c0782e..7f870a6cc61 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -515,7 +515,7 @@ python do_kernel_configcheck() {
>          with open(outfile, 'w+') as f:
>              f.write( analysis )
>
> -        bb.debug( "outfile size is: %s %s" %
> (outfile,os.stat(outfile).st_size))
> +        bb.debug(1, "outfile size is: %s %s" %
> (outfile,os.stat(outfile).st_size))
>          if config_check_visibility and os.stat(outfile).st_size > 0:
>              with open (outfile, "r") as myfile:
>                  results = myfile.read()
> --
> 2.25.1
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d99f9305ac34e9a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Aug 6, 2020 at 5:15 AM Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Fixes warnings like:<br>
<br>
WARNING: linux-intel-5.4.50+gitAUTOINC+caafbdfe38_89e6c056f3-r0 do_kernel_=
configcheck: Passed invalid debug level &#39;outfile size is: /home/pokybui=
ld/yocto-worker/meta-intel/build/build/tmp/work-shared/intel-corei7-64/kern=
el-source/.kernel-meta/cfg/mismatch.txt 767&#39; to bb.debug<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">Argh.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">A=
pparently I didn&#39;t hit any mismatches after putting that debug statemen=
t in. I was getting a file with a single \n and it was breaking the size te=
st, hence the debug addition.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Thanks for the fixup on this one.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Cheers,</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bru=
ce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/classes/kernel-yocto.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto=
.bbclass<br>
index 3c428c0782e..7f870a6cc61 100644<br>
--- a/meta/classes/kernel-yocto.bbclass<br>
+++ b/meta/classes/kernel-yocto.bbclass<br>
@@ -515,7 +515,7 @@ python do_kernel_configcheck() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(outfile, &#39;w+&#39;) as f:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write( analysis )<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug( &quot;outfile size is: %s %s&quot; =
% (outfile,os.stat(outfile).st_size))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;outfile size is: %s %s&quot=
; % (outfile,os.stat(outfile).st_size))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if config_check_visibility and os.stat(o=
utfile).st_size &gt; 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open (outfile, &quot;=
r&quot;) as myfile:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0results =3D =
myfile.read()<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000d99f9305ac34e9a3--
