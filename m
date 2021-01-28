Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web09.730.1611868016889506318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 13:06:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kHE9K9YQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: dorindabassey@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id p15so5875243ilq.8
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 13:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=V9SAgovacHcQ6JgQ35WOn3rxMnsfgbmRIbvoABe/jFM=;
        b=kHE9K9YQo7LESC1WHZyo/AVeOH6rP5XprmKwxoy3h+xbZ8Hs+ClIu8RVNeiVxfiEmb
         E7ddDnjuF3s2yajqtD8E/BJDM/Rw1JO4fPiEF0W8pAwswaK23CzxwG1qOkF1POGxtk8f
         sY7EFylhSHrleKFUtqGU8L1aFmo8xhaORWUkK1845Ka/fLrCda6khvkJTHvGuhRoaqtp
         Mpd7LC6KhnttlEboVYyjBmIHbA7pV4Q7odwEQ3t4MSpoWZA1P16aPMK4tvKEGy9U2tR0
         w/uDrtoSv/wWE4Amhz2cqk6Oq4KfdNMbqhVoaLzb+DB8QcGxXVzVGTmvaouD0zYFrAnQ
         Hq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=V9SAgovacHcQ6JgQ35WOn3rxMnsfgbmRIbvoABe/jFM=;
        b=O/qwZD2vNgfEjIePRasaoWrSUM5ngNdqaIKa0rgy40wjvDkhtVj3/H6mozmr4+aveX
         3fkHO4qSzqEoJ7ftFU2e0ttZFfghnnxxyv6Fk9TSYgh8NJCSI0OSs1kqqRucT09dNF6o
         d+UwSSfdFPhsnmD5so4f7K95h6FBq5CdkeidHJpax3an6ZyRDzsdCJ0yAUweGFm+wmjH
         KHLD1rQrT/rYkA+u/y2Knn0U1OA/AEyKCJuG5Sulpu4jwbdxaqnibevQDgBhgWpvrP0W
         HYSMgWomdFgkbeeTXB6VC9rfhOE6xo6ZW9rjmumDp9DltatCevnc7c36ab42hgVs/bHM
         Oeyw==
X-Gm-Message-State: AOAM533zFxEO6NNYy4cch4yG7W4sooO9YMOcrB/z7qH47188Sft5wCdw
	HBUdDuLkZi1X+UhRf6MZfCl4qCoHqB3QhzF2hpBgWAbH5dM=
X-Google-Smtp-Source: ABdhPJw7gFL5MTxk3cY3gZKcayKn70anS09QniYrsImCJ+4K5DhhEwIbi1FajujlSlYoxgv0trY6jksfIU/YjT6nKPY=
X-Received: by 2002:a92:c150:: with SMTP id b16mr792784ilh.176.1611868016061;
 Thu, 28 Jan 2021 13:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20210128195108.5247-1-dorindabassey@gmail.com>
In-Reply-To: <20210128195108.5247-1-dorindabassey@gmail.com>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Thu, 28 Jan 2021 16:06:44 -0500
Message-ID: <CAJSnhzvyuYh9JNaug7A9Nw1FPp=b-7wANUQuVe6mTO1UK9NQFQ@mail.gmail.com>
Subject: Re: [PATCH v2] sanity.bbclass: check if PSEUDO_IGNORE_PATHS and ${S} overlap
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000085b16205b9fc4454"

--00000000000085b16205b9fc4454
Content-Type: text/plain; charset="UTF-8"

This patch won't be necessary as the previous patch here
https://listshanks.openembedded.org/g/openembedded-core/message/147238?p=,,,20,0,0,0::Created,,verify+that+user,20,2,0,80117826
would detect it.

Thanks,
Dorinda

On Jan 28, 2021 20:51, "dorindabassey" <dorindabassey@gmail.com> wrote:

> added a sanity check for when PSEUDO_IGNORE_PATHS and ${S} overlap to
> avoid random failures generated.
>
> [YOCTO #14193]
>
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
> v2:
> added a condition for when {WORKDIR}={S}
>
>  meta/classes/sanity.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index c6842ff549..63284b7917 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -710,6 +710,16 @@ def check_sanity_version_change(status, d):
>          if i and workdir.startswith(i):
>              status.addresult("You are building in a path included in
> PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this
> path.\n")
>
> +    # Check if PSEUDO_IGNORE_PATHS and ${S} overlap
> +    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS',
> expand=True).split(",")
> +    workdir = d.getVar('WORKDIR')
> +    sourcefile = d.getVar('S')
> +    if (workdir == sourcefile):
> +        for i in pseudoignorepaths:
> +            if i and sourcefile:
> +                if sourcefile.startswith(i) or i.startswith(sourcefile):
> +                    status.addresult("a path included in
> PSEUDO_IGNORE_PATHS " + str(i) + " and ${S} (source files) path " +
> str(sourcefile) + " are overlapping each other, please set ${S} in your
> recipe to point to a different directory. \n")
> +
>      # Some third-party software apparently relies on chmod etc. being
> suid root (!!)
>      import stat
>      suid_check_bins = "chown chmod mknod".split()
> --
> 2.17.1
>
>

--00000000000085b16205b9fc4454
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">This patch won&#39;t be necessary as the=
 previous patch here <a href=3D"https://listshanks.openembedded.org/g/opene=
mbedded-core/message/147238?p=3D,,,20,0,0,0::Created,,verify+that+user,20,2=
,0,80117826">https://listshanks.openembedded.org/g/openembedded-core/messag=
e/147238?p=3D,,,20,0,0,0::Created,,verify+that+user,20,2,0,80117826</a> wou=
ld detect it.</div><div dir=3D"auto"><br></div><div>Thanks,</div><div>Dorin=
da<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Jan 28, 2021 20:51, &quot;dorindabassey&quot; &lt;<a href=3D"mailto:dor=
indabassey@gmail.com" target=3D"_blank">dorindabassey@gmail.com</a>&gt; wro=
te:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">added a sanity check for when PSEUDO_IGNORE_PATHS and ${S} overlap to av=
oid random failures generated.<br>
<br>
[YOCTO #14193]<br>
<br>
Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dorindabassey@gmail.com=
" target=3D"_blank">dorindabassey@gmail.com</a>&gt;<br>
---<br>
v2:<br>
added a condition for when {WORKDIR}=3D{S}<br>
<br>
=C2=A0meta/classes/sanity.bbclass | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index c6842ff549..63284b7917 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -710,6 +710,16 @@ def check_sanity_version_change(status, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if i and workdir.startswith(i):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status.addresult(&quot;You =
are building in a path included in PSEUDO_IGNORE_PATHS &quot; + str(i) + &q=
uot; please locate the build outside this path.\n&quot;)<br>
<br>
+=C2=A0 =C2=A0 # Check if PSEUDO_IGNORE_PATHS and ${S} overlap<br>
+=C2=A0 =C2=A0 pseudoignorepaths =3D d.getVar(&#39;PSEUDO_IGNORE_PATHS&#39;=
, expand=3DTrue).split(&quot;,&quot;)<br>
+=C2=A0 =C2=A0 workdir =3D d.getVar(&#39;WORKDIR&#39;)<br>
+=C2=A0 =C2=A0 sourcefile =3D d.getVar(&#39;S&#39;)<br>
+=C2=A0 =C2=A0 if (workdir =3D=3D sourcefile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in pseudoignorepaths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i and sourcefile:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if sourcefile.star=
tswith(i) or i.startswith(sourcefile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stat=
us.addresult(&quot;a path included in PSEUDO_IGNORE_PATHS &quot; + str(i) +=
 &quot; and ${S} (source files) path &quot; + str(sourcefile) + &quot; are =
overlapping each other, please set ${S} in your recipe to point to a differ=
ent directory. \n&quot;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Some third-party software apparently relies on chmod =
etc. being suid root (!!)<br>
=C2=A0 =C2=A0 =C2=A0import stat<br>
=C2=A0 =C2=A0 =C2=A0suid_check_bins =3D &quot;chown chmod mknod&quot;.split=
()<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--00000000000085b16205b9fc4454--
