Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6BEC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 12:43:38 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149877.1783340906851713194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 05:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WI31JGZu;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: jakubszczudlo40@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so1650129a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 05:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783340906; cv=none;
        d=google.com; s=arc-20260327;
        b=iUPFQDPnNai2tJRY2RloqS1G2WZccldHxKLqYcykbC2ow2jZd8XvVSYCzG3KV4rbtW
         yVd5JsRuaL8x2iW2reQsr74xYmEVOy3wNf6IT0ypqzkDiEWvHiKXcUcIFBRFngqz6CoY
         lMLR6LVxfR+R6KjCVlBCtXQQhZ2wZhJlUwRnuQywzElTPKZqxniM+rnF8qu4469S+nMD
         ws+J+ncJnsy4XqX0szFLd76V5AYsYRXwaKYqXXQv9SUyzvjSGVXo2sIZOJaXokodSW5q
         y7Nj0HX/fskxMFWp+meRrjQ0xcMi0NEDO9hQOeAstVLrHe4lzv+jQ1vE520NX9BGfLzW
         blcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vOCbueQAJC2/0Pt4XCrAGyyAHmybgRuWJrJg3M8Aa2g=;
        fh=fatBUKgUxvMANN6YmcGaMx2Oa4RSAb7gLxL0txDlo18=;
        b=cXwhC5ASTbQEuppn26TSsifg7rBi6y1YizSkw8F7F7Le886xLE+ztS6lgLzbDZPns/
         KAJ1fptkVftvcb6nldjuy197YOHm9Sp03PwqDF5AmPU0bEnACQc4vVhSN3xORPpJ5wvm
         NWBQ2HYa5nZXmog8PbH0s8dbju/Zp3OJ3SDJsK/KQ+d/AGoqJu/A1c0wOIbYVBLTn+9A
         8JQpeYyLPI1+FAv5kGtbuXuKS686DcoFuBWKOd3V9SP9ZBF88Bjwv0QGdlkD9cZaL7+R
         WmVcC4AX6p9tRlC9eSodgSDwMxTEEojaD5IbS+bYXfuAbo0Y2PNmUks/6n6VhR8DyNBp
         icCg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783340906; x=1783945706; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vOCbueQAJC2/0Pt4XCrAGyyAHmybgRuWJrJg3M8Aa2g=;
        b=WI31JGZuxuC8h9XlHhU9JvheYWm98ABhI8X0uoBQNwzkkm+AQhKtmY78VIUJe6UfvA
         r8gW1oHddao2BlHg8SHguxKlQC+XeDFlaZZ/ZcJkU01j8NAt0ONb1oItuD8izOG2uvJn
         DtBzE8EpFXVX0S070RZp+vOh4KbKLCTsCQnHDBQYI5S8tzk+Gy1pK99xTUyD6/a8ZFlb
         Ywb/xIs09CbAjDlOshFyhBteVRkZ5gbHwuAqxfXGIpbGKoRGj9scqU7qh773to4RdM4T
         MLeR+ijT2v8ZzcfJanE/fth0hiRdFurM4r5Z9Eugd52iy94MUe6+/dNIGtTTXMKab1ow
         Tc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340906; x=1783945706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOCbueQAJC2/0Pt4XCrAGyyAHmybgRuWJrJg3M8Aa2g=;
        b=DxtepTL0WgpxpxsnoFHWrfVaV20fF6V2RgGZo6GwT9eFyjvZAj6JKNeznQ5WzXHPDu
         HaktaejGz3ZvisqQ8yZqcvNZCxm/xGcEV8dPSrL9AOWQyjizsqq2Q1L33xwBn7law4OV
         i93mf9JMqBei5v4Lzp4ZQCrozis4Bev6871GCHf2N6qexfu9WkBe7JHgMkpcL6eBVcIG
         msArDIurlKFeLmViJYqyhC7H2mdn9sYt7MawZLMr+WFHlQFh/O6D8q72W1OXYJBp2wqi
         qR5ne78ImDQAA2aqMgtcNMbr0oFheoP9V8Q3ujhzPhx0h1dCF+ZSZCy1rW0FVo8GqAPm
         G7Cw==
X-Gm-Message-State: AOJu0Yzo0xQQcx6dSN6f9mSIj8kAJa3YDwx37vrqn6RpvqSUUqCgPT1R
	xtnMK9SgRVY3zycUxPQBfXJVWl5E67P6UxRbS741LSUfphkx4MLrUK6GheQ1DTpOu0yiz7beGcG
	7y+2ShD+lkNsDnEpSI947fqjSC6b9ObA=
X-Gm-Gg: AfdE7clwwN1XC8iHeN+ecCdX0PBCPDUzwSZBosJFlXPUprZGK3AotqRWE5U7oWgru5Q
	6J+fuHUFjAztSsiToyPc+QHZszpW+yR4otlOjW/BedBY4yd3jDtpy4/GnnK/Eptlnl5bHqjAKcK
	z/IfqWW+0Cop6hVe8k1eL5MwB68dDkakZwhnLZTC54Od6xVPhnIxSVTTXuYErLp3iFptbz46XAD
	cv8oCUKJjke7pOLOLKfzkrYQ86D8TaZr+tH6tVXGnKG2v7Cog1ytZAqmDKTnXkVYWE7udUfOyjB
	sM9U1ZwtPYNdkisR63RXJ3ACVcx5A1cQE+0jVmDf
X-Received: by 2002:a05:6a21:1f81:b0:3bf:6c27:38b with SMTP id
 adf61e73a8af0-3c08e8fc8a9mr367133637.29.1783340905924; Mon, 06 Jul 2026
 05:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260704105523.3264-1-jakubszczudlo40@gmail.com> <DJRHIV2A1KBW.39DBI21KNQ6X5@smile.fr>
In-Reply-To: <DJRHIV2A1KBW.39DBI21KNQ6X5@smile.fr>
From: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Date: Mon, 6 Jul 2026 14:28:13 +0200
X-Gm-Features: AVVi8Ce_uXUufrqIletssiwUL1Grfs4scFRXS-xlsEw4LhlT3-PXSikjlSZ_LNQ
Message-ID: <CA+gq5JjEdpq5ynQUJg8w2AL6001Q7BsKSxRJWAE6iLzd5ipniQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] libgcrypt: upgrade 1.10.3 -> 1.10.4
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Hongxu Jia <hongxu.jia@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000360b830655f069bb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 12:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240266

--000000000000360b830655f069bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 6 lip 2026, 14:25 u=C5=BCytkownik Yoann Congal <yoann.congal@smile.fr=
>
napisa=C5=82:

> On Sat Jul 4, 2026 at 12:55 PM CEST, Jakub Szczudlo via
> lists.openembedded.org wrote:
> > Release notes are here:
> > https://dev.gnupg.org/T8233.html
> > Version cointains fix for CVE-2026-41989
> >
> > Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
>
> Hello,
>
> I just remembered but this upgrade was attempted before but failed:
> https://lore.kernel.org/all/20260514133022.56169-1-gudni.m.g@gmail.com/
>
> I tried your but same issue:
>
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/93/builds/4071/=
steps/12/logs/stdio
> | | libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dcore2
> -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O0
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.10.4/random -I.. -I../src
> -I../../libgcrypt-1.10.4/src -O2 -pipe -g -feliminate-unused-debug-types
> [...] -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wall -c
> ../../libgcrypt-1.10.4/random/rndjent.c  -fPIC -DPIC -o .libs/rndjent.o
> | | In file included from ../../libgcrypt-1.10.4/random/rndjent.c:99:
> | | ../../libgcrypt-1.10.4/random/jitterentropy-base.c:58:3: error: #erro=
r
> "The CPU Jitter random number generator must not be compiled with
> optimizations. See documentation. Use the compiler switch -O0 for compili=
ng
> jitterentropy.c."
> | |    58 |  #error "The CPU Jitter random number generator must not be
> compiled with optimizations. See documentation. Use the compiler switch -=
O0
> for compiling jitterentropy.c."
> | |       |   ^~~~~
> | | make[2]: *** [Makefile:775: rndjent.lo] Error 1
> | | make[2]: *** Waiting for unfinished jobs....
> | | make[2]: Leaving directory
> '/srv/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/core2=
-64-poky-linux/libgcrypt/1.10.4/build/random'
> | | make[1]: *** [Makefile:500: all-recursive] Error 1
> | | make[1]: Leaving directory
> '/srv/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/core2=
-64-poky-linux/libgcrypt/1.10.4/build'
> | | make: *** [Makefile:432: all] Error 2
> | | ERROR: oe_runmake failed
> | | WARNING: exit code 1 from a shell command.
> | NOTE: recipe libgcrypt-1.10.4-r0: task do_compile: Failed
> | ERROR: Task
> (/srv/pokybuild/yocto-worker/genericx86-64-alt/build/meta/recipes-support=
/libgcrypt/libgcrypt_1.10.4.bb:do_compile)
> failed with exit code '1'
>
> Can you look into this please?
>
> Note: you can find the config for this particular build here:
>
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/93/builds/4071/=
steps/11/logs/stdio
>
> Regards,
>
> --
> Yoann Congal
> Smile ECS
>

I will check the logs and fix the issue.
Thanks for running builder.
Best regards,
Jakub Szczudlo

--000000000000360b830655f069bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">pon., 6 lip 2026, 14:25 u=C5=BCytkownik =
Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smil=
e.fr</a>&gt; napisa=C5=82:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat J=
ul 4, 2026 at 12:55 PM CEST, Jakub Szczudlo via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt; Release notes are here:<br>
&gt; <a href=3D"https://dev.gnupg.org/T8233.html" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://dev.gnupg.org/T8233.html</a><br>
&gt; Version cointains fix for CVE-2026-41989<br>
&gt;<br>
&gt; Signed-off-by: Jakub Szczudlo &lt;<a href=3D"mailto:jakubszczudlo40@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">jakubszczudlo40@gmail.com</a>=
&gt;<br>
<br>
Hello,<br>
<br>
I just remembered but this upgrade was attempted before but failed:<br>
<a href=3D"https://lore.kernel.org/all/20260514133022.56169-1-gudni.m.g@gma=
il.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore.kerne=
l.org/all/20260514133022.56169-1-gudni.m.g@gmail.com/</a><br>
<br>
I tried your but same issue:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/93/bui=
lds/4071/steps/12/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://autobuilder.yoctoproject.org/valkyrie/?#/builders/93/builds/4071=
/steps/12/logs/stdio</a><br>
| | libtool: compile:=C2=A0 x86_64-poky-linux-gcc -m64 -march=3Dcore2 -mtun=
e=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O0 -D_FORTIFY_SOU=
RCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security=C2=A0 -DHAVE_C=
ONFIG_H -I. -I../../libgcrypt-1.10.4/random -I.. -I../src -I../../libgcrypt=
-1.10.4/src -O2 -pipe -g -feliminate-unused-debug-types [...] -fvisibility=
=3Dhidden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.10.4/r=
andom/rndjent.c=C2=A0 -fPIC -DPIC -o .libs/rndjent.o<br>
| | In file included from ../../libgcrypt-1.10.4/random/rndjent.c:99:<br>
| | ../../libgcrypt-1.10.4/random/jitterentropy-base.c:58:3: error: #error =
&quot;The CPU Jitter random number generator must not be compiled with opti=
mizations. See documentation. Use the compiler switch -O0 for compiling jit=
terentropy.c.&quot;<br>
| |=C2=A0 =C2=A0 58 |=C2=A0 #error &quot;The CPU Jitter random number gener=
ator must not be compiled with optimizations. See documentation. Use the co=
mpiler switch -O0 for compiling jitterentropy.c.&quot;<br>
| |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0^~~~~<br>
| | make[2]: *** [Makefile:775: rndjent.lo] Error 1<br>
| | make[2]: *** Waiting for unfinished jobs....<br>
| | make[2]: Leaving directory &#39;/srv/pokybuild/yocto-worker/genericx86-=
64-alt/build/build/tmp/work/core2-64-poky-linux/libgcrypt/1.10.4/build/rand=
om&#39;<br>
| | make[1]: *** [Makefile:500: all-recursive] Error 1<br>
| | make[1]: Leaving directory &#39;/srv/pokybuild/yocto-worker/genericx86-=
64-alt/build/build/tmp/work/core2-64-poky-linux/libgcrypt/1.10.4/build&#39;=
<br>
| | make: *** [Makefile:432: all] Error 2<br>
| | ERROR: oe_runmake failed<br>
| | WARNING: exit code 1 from a shell command.<br>
| NOTE: recipe libgcrypt-1.10.4-r0: task do_compile: Failed<br>
| ERROR: Task (/srv/pokybuild/yocto-worker/genericx86-64-alt/build/meta/rec=
ipes-support/libgcrypt/libgcrypt_1.10.4.bb:do_compile) failed with exit cod=
e &#39;1&#39;<br>
<br>
Can you look into this please?<br>
<br>
Note: you can find the config for this particular build here:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/93/bui=
lds/4071/steps/11/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://autobuilder.yoctoproject.org/valkyrie/?#/builders/93/builds/4071=
/steps/11/logs/stdio</a><br>
<br>
Regards,<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I will check the logs and fix the issue.=C2=A0</div><div dir=3D"a=
uto">Thanks for running builder.</div><div dir=3D"auto">Best regards,</div>=
<div dir=3D"auto">Jakub Szczudlo</div></div>

--000000000000360b830655f069bb--

