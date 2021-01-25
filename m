Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.4226.1611615649153980892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 15:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bGtLQ3jh;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: dorindabassey@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id u17so30118515iow.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 15:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=Lmw322LMkJjxSVoUlQBJo4HvTmAWZdYxzHaGKcGXjsA=;
        b=bGtLQ3jhM3ZyYDCEnph1nKpSDm4C4JqTMKFfI3tUgHI0+Dip23MHJ+tjHuv6cQAOoV
         cEguZfeVwK1LqAgds3xoKSfn5kE1hZ6olSGoGwVrhEzCWov8tCwIKVLf9Yk+txMT0Uiz
         NBYSBPIB72wcUQS1+977AbCzmAQGE7BmKFTWUtOkt7gxysxz7jpamXG3pV7ckqUB50MO
         N/RokK4EacwC2O0ShvLeCR2iPA0zsKkALlzHwffFqH9G6wFtBSfHl5bjyy/g6BIP05fk
         3s4C6b4vvLdvmmpAXYXctF4zZXkNKxlCzcv6TCqXyoo7ZQQShkCD+O7FSvNF8hRZJtEk
         uPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to;
        bh=Lmw322LMkJjxSVoUlQBJo4HvTmAWZdYxzHaGKcGXjsA=;
        b=EpeIEES2ZvPpLcKiHgWruyVbrnzmEvqjnKTKCaXKj6MSRAjadYM1wA93xiYfBZJPOY
         9o4i0qdsINKYqx9vRN4hvQxSZleXZgTOm6Nu3p42LijvTl3QgIOFtJxSBTNqzZf0Vpcg
         jr3Pq6HYlGgvtbrb+TSiOSs+mzpNgDOCxVmy9D1rJffIFU35gSGIKV84QZNb41K02iam
         LS8DhPHIRVtvEz8YbwTOOGX3AsU8PolOglS21Qb95stMJ2tDmA1qPbMFpebWk9YEouYS
         t2qzHOC45oXvHrfVfupTCFCkQ3/ecat0w7obQxFWCmHJcdCXLs9tAe+bDP1aJZVTeHmC
         f8+A==
X-Gm-Message-State: AOAM532Dq/vQN+a8VmgOudL3+cjYIVr2ZzffKT2KRlupSbumNs9SFuxR
	yWpNKQbk9gMqSxyaQuTKlgUkQiBRxXK/wROf37e1vJcn4G0=
X-Google-Smtp-Source: ABdhPJzyZz36AnchTQbjjdIdGbscdpZQLOvtMD27N6kkYeRT24L+OBEd4t4ngiQr7oAoIbcWFtqOmRYsCwrkv/J/TPU=
X-Received: by 2002:a02:b38f:: with SMTP id p15mr2576246jan.83.1611615648395;
 Mon, 25 Jan 2021 15:00:48 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a92:ce09:0:0:0:0:0 with HTTP; Mon, 25 Jan 2021 15:00:48
 -0800 (PST)
Received: by 2002:a92:ce09:0:0:0:0:0 with HTTP; Mon, 25 Jan 2021 15:00:48
 -0800 (PST)
In-Reply-To: <20210125224808.20434-1-dorindabassey@gmail.com>
References: <20210125224808.20434-1-dorindabassey@gmail.com>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Tue, 26 Jan 2021 00:00:48 +0100
Message-ID: <CAJSnhzvCCAO+Km+Gr91s8wXBxeoP0axUE3Y0+66VESTRPq79+g@mail.gmail.com>
Subject: Re: [PATCH] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003cb79205b9c182e9"

--0000000000003cb79205b9c182e9
Content-Type: text/plain; charset="UTF-8"

Apologies please disregard this code, the update I made against this patch
didn't reflect.

On Jan 25, 2021 23:48, "dorindabassey" <dorindabassey@gmail.com> wrote:

> added a check to ensure that a user isn't building in PSEUDO_IGNORE_PATHS
>
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>  meta/classes/sanity.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 2040b48595..78c0343f0d 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
>      if (tmpdirmode & stat.S_ISUID):
>          status.addresult("TMPDIR is setuid, please don't build in a
> setuid directory")
>
> +    # Check that user isn't building in PSEUDO_IGNORE_PATHS
> +    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS',
> expand=True).split(",")
> +    workdir = d.getVar('WORKDIR', expand=True)
> +    for i in pseudoignorepaths:
> +        if workdir.startswith(i):
> +            status.addresult("you are building in a path under
> PSEUDO_IGNORE_PATHS, please remove this" + str(i) + "directory in \nParsed
> WORKDIR: " + str(workdir) + "\n")
> +
>      # Some third-party software apparently relies on chmod etc. being
> suid root (!!)
>      import stat
>      suid_check_bins = "chown chmod mknod".split()
> --
> 2.17.1
>
>

--0000000000003cb79205b9c182e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Apologies please disregard this code, the update I made a=
gainst this patch didn&#39;t reflect.</div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Jan 25, 2021 23:48, &quot;dorindabassey&quot; =
&lt;<a href=3D"mailto:dorindabassey@gmail.com">dorindabassey@gmail.com</a>&=
gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">added a =
check to ensure that a user isn&#39;t building in PSEUDO_IGNORE_PATHS<br>
<br>
Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dorindabassey@gmail.com=
">dorindabassey@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sanity.bbclass | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index 2040b48595..78c0343f0d 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -703,6 +703,13 @@ def check_sanity_version_change(<wbr>status, d):<br>
=C2=A0 =C2=A0 =C2=A0if (tmpdirmode &amp; stat.S_ISUID):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status.addresult(&quot;TMPDIR is setuid, =
please don&#39;t build in a setuid directory&quot;)<br>
<br>
+=C2=A0 =C2=A0 # Check that user isn&#39;t building in PSEUDO_IGNORE_PATHS<=
br>
+=C2=A0 =C2=A0 pseudoignorepaths =3D d.getVar(&#39;PSEUDO_IGNORE_PATHS&#39;=
<wbr>, expand=3DTrue).split(&quot;,&quot;)<br>
+=C2=A0 =C2=A0 workdir =3D d.getVar(&#39;WORKDIR&#39;, expand=3DTrue)<br>
+=C2=A0 =C2=A0 for i in pseudoignorepaths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if workdir.startswith(i):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresult(&quot;you are b=
uilding in a path under PSEUDO_IGNORE_PATHS, please remove this&quot; + str=
(i) + &quot;directory in \nParsed WORKDIR: &quot; + str(workdir) + &quot;\n=
&quot;)<br>
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

--0000000000003cb79205b9c182e9--
