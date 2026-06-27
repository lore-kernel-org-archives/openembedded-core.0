Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F777C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 17:15:47 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4753.1782580539268840189
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 10:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WAGF9nXU;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664c1406f91so311958d50.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 10:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782580538; cv=none;
        d=google.com; s=arc-20260327;
        b=fOoa6pvjfqyagkA+8Brar4XIUikJALXZYopGFDHPA3NZHFnbd9LrSpc5dGImzh1sEJ
         VmbpVTRcLop4aNtDnAVFoqEt7w7WQqgVtn0W5/RLxBdERZ+V5dsx3LoXbpjk38OJNABf
         0mo+kX5N/61nPWgKSZ5mn/aCacw925jDXdWziGfy+7pLxvPwBo30OpNkSnFwrIKblaM2
         89e5QGbnr6Mee1/cN143YqkeV0RrqO17uRaNq1tb8pKWtlv+GHgV0SkxkXU6/bD669my
         C9LbdI2wJwKEvP3awnagN6misra06vWe08BlhiHdeNhO/WYE2qr+zS/QbrUwrvT7Il9G
         PEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KV9FULfxUSliQLoLBuqc5OnsQKcY6Nuw2InhmerTUms=;
        fh=8P6pgecEmxdRAMFrp7Ocjxw3uqQw4F9IqG5YpNgZhvM=;
        b=BIFba/SeWdzI1WJlGU33oQOqFEvEkCGL2tSML0OErNQjgTb7fjhUYqMyizsD2fWB8C
         WnZCYQbLkb1dvAQWi/VcAnIhGd1gOKsYQslXWI6PlfXdenRFzZ7uI/bWgKnh9pXsudPf
         6JyHnDVPM070Uk/QfsbARuVW1G3s74GxVIl++itgFofnGh38etxKVy1Nkax2kVxmQ5x2
         qbfVYTPKIP+fKG7AsEf/2lIv/YJBlZ9FwoCDtkkO87UcGNRMFTu8r3kG6tzhqrSRCtZ4
         CJ4onsOLoK0CmQR7Q7g9pRcp188mEQCBw9CN5Sgexmv0YwHHZrGE+Dn56s3D19vx792b
         5HvA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782580538; x=1783185338; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KV9FULfxUSliQLoLBuqc5OnsQKcY6Nuw2InhmerTUms=;
        b=WAGF9nXUFGyOpjjv8z3/69S41i24nYOfczR55JB2WaDCeBbyvujPT8YRGyoVOAaDlj
         TtJaIlc5nj+ZFGa2ChUxS/00+FwIpglnoSe8hobGHk6MTRdeH04P3Tb5F/tcGPtOf8F/
         wDHmzP1aA/oojB6L5QPymzBqZC/q4Qas2agL4V9LpgnD8HRKU4HM6tJbmG+YPxnKG7/d
         dkY8iNrs6trPgRHNcruxNJKfpn1w4N30VDT2eoG6EXjGOxm6dCPECIFUib1uP/w/Lfxn
         531Xs7xsGJaucUO7f91Q+vanM26gzUcnJUnLP+yYdoi5WEOMZqNcMDBupiZFiJNxfSrA
         JLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782580538; x=1783185338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV9FULfxUSliQLoLBuqc5OnsQKcY6Nuw2InhmerTUms=;
        b=UE9KdDiyfw2QKOPQ1cDouEoldR2kpIA9h0SrKa6hVQFhljdYm/4cfd75TBxiSO4pJd
         KsQ2N/jouNiUyaC636NMQwxxA+vNH/Gc1wYO6yeobYyW2nZBF/rifEDBcNd4Qt4JR8CX
         2D1IRz50on1Dlp6SGuPMeP94c4cdvBVQYucvleyssP5AYQ3viNx8ZFQbN6RDxLK9y73E
         VgTkZkdpPfsP9VVGAIt0xqoAUtF3rNFNAittZN6ccIshGokGEUD2GWeJsMT8XrxNc1Gn
         MiFK5p/12XY0vQ5aBHz6dVKe8A+3mkLyzrEpT6o3IuWeB/kXdh6xJqOLnpG0490WDmIJ
         5xVQ==
X-Gm-Message-State: AOJu0Ywczj13oyv/Upixn7vYbBvqtSf2pF9h394dNWsNYbJSf8VKQnAF
	KiVBOwKgx5U3T5EtOnyzUz36odNs0FvSA0LVqu/r0zP4sWjRhI7NsPWF0OTTdQdcr3z1WHjockE
	AHWUmK4+LE93QJwK30PEzkwDvmn4XKrPYELbTjXnVbA==
X-Gm-Gg: AfdE7clxUokfMjMSDwyCQjGXRxeAd+QAgVGzOMnAewAzSk1SCbFLiCK669KONMRVZ5z
	w0CO7CdMraFbBzEjkKthmXvCxHmupYfYEuKHDU5ssErR1hp1EBqtudeC7FNLkeJHRIPhItFo7yI
	cHEJDNc65nAiPvMgpNSyGTbhec509JHLzAulYyITm8LonWua0AppX5zkHnHrY6ppiiwfWYzJpzq
	/M1jFd3/yRx8eeDUct1emWzea/Ozoywcvh+/br8SKsp+fS2CXLwNj8H5ss35XxecSMYnlhhz1Y3
	SDR/80E+KqGfK6m6CkWQ7V017YALBsdH0liEb6zsZ1iuveoz31IkA3VUs8oBE4maE+WHr3WaYzC
	AOdxWOqeNyAXejuv4TnHdu2ZohkNlUvsnE0sdHw7CvXYXwsJntb6MCq2oFILLhDKiM8Lfpw==
X-Received: by 2002:a05:690e:c44:b0:662:b6bf:f3a8 with SMTP id
 956f58d0204a3-66487f2974amr9936514d50.41.1782580537900; Sat, 27 Jun 2026
 10:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260627075532.3153679-1-alex.kanavin@gmail.com> <20260627075532.3153679-8-alex.kanavin@gmail.com>
In-Reply-To: <20260627075532.3153679-8-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Jun 2026 10:15:10 -0700
X-Gm-Features: AVVi8CdkiYb40vahI2Q0Ik2OD8HsO68W8zu221Q0JJrDRwsWUO3kB2EqhQ5VzKQ
Message-ID: <CAMKF1sqs+FxNQdx4KL8YqH5n50TsQnVNJFonBNpy1BdSimRB7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/8] oeqa: allow exceptions in buildpath HOME checks
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000bec24906553f5fb5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 17:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239699

--000000000000bec24906553f5fb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 12:55=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:

> From: Alexander Kanavin <alex@linutronix.de>
>
> Sometimes upstreams hardcode directories that match
> users' own home directories, which triggers a false
> positive in the test:
>
> https://lists.yoctoproject.org/g/yocto/message/66612
>
> It's very hard to programmatically establish what is
> hardcoded in the original source, and what is a genuine
> build contamination, so this adds a way to specify such
> occurences in recipes.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/insane.bbclass                   | 4 ++--
>  meta/recipes-devtools/perl/perl_5.42.2.bb            | 2 ++
>  meta/recipes-devtools/python/python3-numpy_2.4.6.bb  | 2 ++
>  meta/recipes-devtools/python/python3-pytest_9.1.0.bb | 2 ++
>  4 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/insane.bbclass
> b/meta/classes-global/insane.bbclass
> index 4250331af1..a788817c89 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -445,9 +445,9 @@ def package_qa_check_buildpaths(path, name, d, elf):
>          if tmpdir in file_content:
>              path =3D package_qa_clean_path(path, d, name)
>              oe.qa.handle_error("buildpaths", "File %s in package %s
> contains reference to TMPDIR" % (path, name), d)
> -        if homedir and homedir in file_content:
> +        if homedir and homedir in file_content and not homedir.decode()
> in (d.getVar("OEQA_BUILDPATHS_SKIP") or "").split():
>


It works for the specific false-positive case, but it disables the HOME
buildpath QA for the whole recipe whenever the builder=E2=80=99s HOME exact=
ly
matches that path, which could hide a real contamination in those recipes.
Perhaps a narrowed down scope if possible maybe better.



>              path =3D package_qa_clean_path(path, d, name)
> -            oe.qa.handle_error("buildpaths", "File %s in package %s
> contains reference to the build host HOME directory" % (path, name), d)
> +            oe.qa.handle_error("buildpaths", "File %s in package %s
> contains a reference to the build host HOME directory. If upstream
> hardcodes a directory path that matches your home, you can set
> OEQA_BUILDPATHS_SKIP =3D \"%s\" in the recipe." % (path, name,
> homedir.decode()), d)
>
>
>  QAPATHTEST[xorg-driver-abi] =3D "package_qa_check_xorg_driver_abi"
> diff --git a/meta/recipes-devtools/perl/perl_5.42.2.bb
> b/meta/recipes-devtools/perl/perl_5.42.2.bb
> index f076431aff..f1f026579b 100644
> --- a/meta/recipes-devtools/perl/perl_5.42.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.42.2.bb
> @@ -448,3 +448,5 @@ SSTATE_HASHEQUIV_FILEMAP =3D " \
>      populate_sysroot:*/lib*/perl5/config.sh:${TMPDIR} \
>      populate_sysroot:*/lib*/perl5/config.sh:${COREBASE} \
>      "
> +
> +OEQA_BUILDPATHS_SKIP =3D "/home/alex"
>

does this need to be hardcoded for every user ?


> diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
> b/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
> index 2c892e9756..278e838820 100644
> --- a/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
> +++ b/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
> @@ -84,3 +84,5 @@ RDEPENDS:${PN}-ptest +=3D "\
>  "
>
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +OEQA_BUILDPATHS_SKIP =3D "/home/alex"
> diff --git a/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
> b/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
> index 9180e7bf1f..b61e86cd00 100644
> --- a/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
> +++ b/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
> @@ -33,3 +33,5 @@ ALTERNATIVE_LINK_NAME[py.test] =3D "${bindir}/py.test"
>  ALTERNATIVE_TARGET[py.test] =3D "${bindir}/py.test"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +OEQA_BUILDPATHS_SKIP =3D "/home/user"
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239692):
> https://lists.openembedded.org/g/openembedded-core/message/239692
> Mute This Topic: https://lists.openembedded.org/mt/120001458/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bec24906553f5fb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 27,=
 2026 at 12:55=E2=80=AFAM Alexander Kanavin via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=3D"_bla=
nk">alex@linutronix.de</a>&gt;<br>
<br>
Sometimes upstreams hardcode directories that match<br>
users&#39; own home directories, which triggers a false<br>
positive in the test:<br>
<br>
<a href=3D"https://lists.yoctoproject.org/g/yocto/message/66612" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/message/6=
6612</a><br>
<br>
It&#39;s very hard to programmatically establish what is<br>
hardcoded in the original source, and what is a genuine<br>
build contamination, so this adds a way to specify such<br>
occurences in recipes.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/insane.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.42.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.42.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-numpy_2.4.6.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-numpy_2.4.6.bb</a>=C2=A0 | 2=
 ++<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pytest_9.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pytest_9.1.0.bb</a> | 2 ++<=
br>
=C2=A04 files changed, 8 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass<br>
index 4250331af1..a788817c89 100644<br>
--- a/meta/classes-global/insane.bbclass<br>
+++ b/meta/classes-global/insane.bbclass<br>
@@ -445,9 +445,9 @@ def package_qa_check_buildpaths(path, name, d, elf):<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if tmpdir in file_content:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D package_qa_clean_p=
ath(path, d, name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.qa.handle_error(&quot;bu=
ildpaths&quot;, &quot;File %s in package %s contains reference to TMPDIR&qu=
ot; % (path, name), d)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if homedir and homedir in file_content:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if homedir and homedir in file_content and not=
 homedir.decode() in (d.getVar(&quot;OEQA_BUILDPATHS_SKIP&quot;) or &quot;&=
quot;).split():<br></blockquote><div><br></div><div><br></div><div>It works=
 for the specific false-positive case, but it disables the HOME buildpath Q=
A for the whole recipe whenever the builder=E2=80=99s HOME exactly</div><di=
v>matches that path, which could hide a real contamination in those recipes=
. Perhaps a narrowed down scope if possible maybe better.</div><div><br></d=
iv><div><span style=3D"background-color:transparent">=C2=A0</span></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D package_qa_clean_p=
ath(path, d, name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&quot;buildpa=
ths&quot;, &quot;File %s in package %s contains reference to the build host=
 HOME directory&quot; % (path, name), d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&quot;buildpa=
ths&quot;, &quot;File %s in package %s contains a reference to the build ho=
st HOME directory. If upstream hardcodes a directory path that matches your=
 home, you can set OEQA_BUILDPATHS_SKIP =3D \&quot;%s\&quot; in the recipe.=
&quot; % (path, name, homedir.decode()), d)<br>
<br>
<br>
=C2=A0QAPATHTEST[xorg-driver-abi] =3D &quot;package_qa_check_xorg_driver_ab=
i&quot;<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.42.2.bb" r=
el=3D"noreferrer" target=3D"_blank">perl_5.42.2.bb</a> b/meta/recipes-devto=
ols/perl/<a href=3D"http://perl_5.42.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">perl_5.42.2.bb</a><br>
index f076431aff..f1f026579b 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.42.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.42.2.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.42.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.42.2.bb</a><br>
@@ -448,3 +448,5 @@ SSTATE_HASHEQUIV_FILEMAP =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0populate_sysroot:*/lib*/perl5/config.sh:${TMPDIR} \<br>
=C2=A0 =C2=A0 =C2=A0populate_sysroot:*/lib*/perl5/config.sh:${COREBASE} \<b=
r>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+OEQA_BUILDPATHS_SKIP =3D &quot;/home/alex&quot;<br></blockquote><div><br><=
/div><div>does this need to be hardcoded for every user ?</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-numpy_2=
.4.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_2.4.6.bb</a> b/=
meta/recipes-devtools/python/<a href=3D"http://python3-numpy_2.4.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-numpy_2.4.6.bb</a><br>
index 2c892e9756..278e838820 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-numpy_2.4.6.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-numpy_2.4.6.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-numpy_2.4.6.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-numpy_2.4.6.bb</a><br>
@@ -84,3 +84,5 @@ RDEPENDS:${PN}-ptest +=3D &quot;\<br>
=C2=A0&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+OEQA_BUILDPATHS_SKIP =3D &quot;/home/alex&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_=
9.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest_9.1.0.bb</a> =
b/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_9.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pytest_9.1.0.bb</a><br>
index 9180e7bf1f..b61e86cd00 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_9.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pytest_9.1.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pytest_9.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pytest_9.1.0.bb</a><br>
@@ -33,3 +33,5 @@ ALTERNATIVE_LINK_NAME[py.test] =3D &quot;${bindir}/py.tes=
t&quot;<br>
=C2=A0ALTERNATIVE_TARGET[py.test] =3D &quot;${bindir}/py.test&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+OEQA_BUILDPATHS_SKIP =3D &quot;/home/user&quot;<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239692): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239692" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239692</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120001458/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120001458/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000bec24906553f5fb5--

