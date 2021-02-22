Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web11.32231.1613984410695332305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 01:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=azxG2VhT;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id a62so6109336vsa.10
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 01:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZEBuAhvVSBkhAPOY0qCYtcZK1TvQQ2FpsZ+Uwi2yzt8=;
        b=azxG2VhTBHfvAQ66jizBG1mSh1S5UNgDAfBYsjbM0qx9MiCeGiWJLh9KDPC6R4O/Jx
         Voc551ca5ZywtkUuK8dpqmSy9dWi1Os86QdJealDuPI/YdEtex44SgKQRx6G1mGd0s2X
         sx/fMejI0lBneqtgKth1Ykn6TUiLkKOvDGgAt7c9FqFhhFApyZr21f9UjiuC5SWrPpg9
         EejQOUwwoYD6RludG/MJytb3H5E9hHV6SKlHjRkhnN7ebcKrH9vQ+eWoFqENAxkG+V29
         oSWLiX521JlPMpvq3PZGJrKKnQaxyYgWw6WlO4DxHkCl6J1LZ7UjGH///pidefckZ/J2
         wOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZEBuAhvVSBkhAPOY0qCYtcZK1TvQQ2FpsZ+Uwi2yzt8=;
        b=TQfE9c0HyWnFy1JQ+2YNNdYvRrc/KzSdK3XEp39xFfk1GyH+z5LWSL2MpRGXCRQ9xL
         x92GpJKAzGGuk9/X3jhk0If2EkT+SVm8f4ojs8N7YfiUplbkQyfYUFimZ5pGg0NPouW4
         hkoy6Yoq0l2b8sI3S5IRW8L5pVqG0RL6DOf6XJlIBCLTogtgc3qxluNA/hmBNcqQWazo
         +N74H3s8CYGOgAo3W6mDrLkymUtWIP5CXfvNU+5rcZ4o/Jrc1LCqqx6lqPg+KVuVCt0m
         eEhLVg9U6tKJYA4jq/cFIu39IHWxe3QUBSP+UOzo8+bIMo3Zwf2DudBf/HPJydUvb6V5
         e59A==
X-Gm-Message-State: AOAM531dkfMLA36P2m02tnh6ivxOVu2eBrlTDuH2E/EhkCY+xM+njaL9
	oXCGpXzOmYvLjI/jQVTt9r2f/G1UwEU77yNrqP4=
X-Google-Smtp-Source: ABdhPJyHiaesUYU7YFyyDQZMIpGXErVTXoGCCOWDrVj9ggoHgIl+oDzOGxsyJHUgTV/KytoW4JYfvErcdjg2lZ3KMJ4=
X-Received: by 2002:a67:f656:: with SMTP id u22mr3888028vso.51.1613984409793;
 Mon, 22 Feb 2021 01:00:09 -0800 (PST)
MIME-Version: 1.0
References: <20210222012131.45061-1-mingli.yu@windriver.com>
In-Reply-To: <20210222012131.45061-1-mingli.yu@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 22 Feb 2021 09:59:58 +0100
Message-ID: <CANNYZj_j-00L6RxAC_JhNN-NxnvxODb_2qpcbFo3fBSLsfe6Xg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: customize the python interpreter for nativesdk
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006b365305bbe9075d"

--0000000000006b365305bbe9075d
Content-Type: text/plain; charset="UTF-8"

Is it possible to avoid the use of sed, and fix the problem at the source?
Why is it specific to nativesdk and doesn't show up in target?

Alex

On Mon, 22 Feb 2021 at 02:22, Yu, Mingli <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> Make sure the python interpreter is "#!/usr/bin/env python3" for
> nativesdk to avoid the shebang path exceeding the limit when install
> the sdk under the directory with long path.
>
> Before:
>  $ cd ${target_sdk_dir}
>  $ vi ./sysroots/x86_64-oesdk-linux/usr/bin/2to3
>  #!${target_sdk_dir}/sysroots/${SDK_SYS}/usr/bin/python3.9
>  [snip]
>
> After:
>  $ cd ${target_sdk_dir}
>  $ vi ./sysroots/x86_64-oesdk-linux/usr/bin/2to3
>  #!/usr/bin/env python3
>  [snip]
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/python/python3_3.9.2.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.9.2.bb
> b/meta/recipes-devtools/python/python3_3.9.2.bb
> index 87231f97a6..9c87d9d2eb 100644
> --- a/meta/recipes-devtools/python/python3_3.9.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.9.2.bb
> @@ -177,6 +177,10 @@ do_install_append() {
>  }
>
>  do_install_append_class-nativesdk () {
> +    # Make sure we use /usr/bin/env python
> +    for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
> +         sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> +    done
>      create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN}
> TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
> PYTHONNOUSERSITE='1'
>  }
>
> --
> 2.17.1
>
>
> 
>
>

--0000000000006b365305bbe9075d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Is it possible to avoid the use of sed, and fix the p=
roblem at the source? Why is it specific to nativesdk and doesn&#39;t show =
up in target?</div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 22 Feb 2021=
 at 02:22, Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@windriver.com">mingli=
.yu@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.=
com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
<br>
Make sure the python interpreter is &quot;#!/usr/bin/env python3&quot; for=
<br>
nativesdk to avoid the shebang path exceeding the limit when install<br>
the sdk under the directory with long path.<br>
<br>
Before:<br>
=C2=A0$ cd ${target_sdk_dir}<br>
=C2=A0$ vi ./sysroots/x86_64-oesdk-linux/usr/bin/2to3<br>
=C2=A0#!${target_sdk_dir}/sysroots/${SDK_SYS}/usr/bin/python3.9<br>
=C2=A0[snip]<br>
<br>
After:<br>
=C2=A0$ cd ${target_sdk_dir}<br>
=C2=A0$ vi ./sysroots/x86_64-oesdk-linux/usr/bin/2to3<br>
=C2=A0#!/usr/bin/env python3<br>
=C2=A0[snip]<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.9.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.9.2.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.9.2.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.9.2.bb</a> b/meta/recipe=
s-devtools/python/<a href=3D"http://python3_3.9.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3_3.9.2.bb</a><br>
index 87231f97a6..9c87d9d2eb 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.9.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.9.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.9.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.9.2.bb</a><br>
@@ -177,6 +177,10 @@ do_install_append() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append_class-nativesdk () {<br>
+=C2=A0 =C2=A0 # Make sure we use /usr/bin/env python<br>
+=C2=A0 =C2=A0 for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}=
`; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;1s|^#!.*|#!/usr/bin/env =
python3|&#39; $PYTHSCRIPT<br>
+=C2=A0 =C2=A0 done<br>
=C2=A0 =C2=A0 =C2=A0create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TE=
RMINFO_DIRS=3D&#39;${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo=
:/usr/share/misc/terminfo:/lib/terminfo&#39; PYTHONNOUSERSITE=3D&#39;1&#39;=
<br>
=C2=A0}<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000006b365305bbe9075d--
