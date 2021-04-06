Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web08.521.1617722530975224962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 08:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SmwYk9ec;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id t13so1288684qvs.7
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sdovEKth0i/mK2vqdEbcP5YMQPOH/Pny9VTdlAsdNzA=;
        b=SmwYk9ecgMFGcKMcB9GBn0jqgMPXkanEv2GI/VuD4yD0jaq8wKdgVBP0F7cbeY2bu7
         MfrfkLALBnOYHcYaBRnml2gpJz39KUFY5Jc+V0xIoHDJOLgd9yuYd/16HcirCfw4b88z
         XocfXBfh6ipCVBgIb5uLx6WmXOjz4ULzSk4yo1GyBi2C19tsFQ0xILHDD+gQ8fop7Oc5
         dgR1TQQlg32vlBE3moUx5uz0sQ5QNwCjbsWA1LYqpcIR4l88w8PaftrNg0gJzLygmWK1
         iWRHfXSmkNp6623HW7aH06yqAi++wMamFcLNasF3dDm1NzqQbSTTOoAteNtcr4GvlRMd
         lIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sdovEKth0i/mK2vqdEbcP5YMQPOH/Pny9VTdlAsdNzA=;
        b=qGIQNODuZrWyvZE0IuV4gFwQ2U5TRj4dsqV/ockWBYzC0VTNz0WPVVXVcXrgzIFHAV
         BJHHUOiCcLrCQbjEhl78j3WPY1/H3CrwP4nyquYKz1RIw0xcyHuqhKanRw6LgT+5zn8a
         tbc4em2OIhk7RNY3UET2kFYtgOLpXEvPx2fgvspL4nK4f9beXn3UKOsNnvs6z9T39pfJ
         0WxklIqT9ypUNTNGry0ZnzyAVM9Cz3mKrCzcvXk18tiAxv2RUu7JSU1gxFEXor5YzMCb
         hUf/NbaL+cw5nrT22IRHxnwLFfUQoQ7Bpm4CCgg28RHckJXwZxu0+T+asavFyEGmjkM3
         AfvA==
X-Gm-Message-State: AOAM533eQMrcHE3USoM3Lm7zmXH9GZC1n9QdK8l0VhilKMjO6iEQ53fj
	w5Au5NLWzT5UPMos8khm8guAchX2rzf75rqTgDYIEonf6U4=
X-Google-Smtp-Source: ABdhPJwyrTizEa9oiu38R2cGOsuQiFnb2ifcMgYqpG0WliFTpsN55X7qF7AvicNDGZ11oj7BGjEk34N0skI2s4LJFhA=
X-Received: by 2002:a05:6214:f27:: with SMTP id iw7mr29630800qvb.50.1617722530154;
 Tue, 06 Apr 2021 08:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <1617714478-10348-1-git-send-email-pemorrow@linux.microsoft.com>
In-Reply-To: <1617714478-10348-1-git-send-email-pemorrow@linux.microsoft.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Apr 2021 08:21:59 -0700
Message-ID: <CAMKF1spzWbNYUOSNkwExTRF4H1dc7H7+1Yb3QQfNt_hWo-Qrgg@mail.gmail.com>
Subject: Re: [dunfell][PATCH 1/2] goarch: map target os to windows for mingw* TARGET_OS
To: Peter Morrow <pemorrow@linux.microsoft.com>
Cc: openembedded-core@lists.openembedded.org, peter.morrow@microsoft.com
Content-Type: multipart/alternative; boundary="000000000000c14d8705bf4f603f"

--000000000000c14d8705bf4f603f
Content-Type: text/plain; charset="UTF-8"

Lgtm

On Tue, Apr 6, 2021 at 6:08 AM Peter Morrow <pemorrow@linux.microsoft.com>
wrote:

> mingw32/mingw64 is not a supported value for GOOS, so map from 'mingw*' to
> 'windows' to enable building for windows targets.
>
> Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> ---
>  meta/classes/goarch.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 1099b95..ecd3044 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -114,6 +114,8 @@ def go_map_mips(a, f, d):
>  def go_map_os(o, d):
>      if o.startswith('linux'):
>          return 'linux'
> +    elif o.startswith('mingw'):
> +        return 'windows'
>      return o
>
>
> --
> 1.8.3.1
>
>

--000000000000c14d8705bf4f603f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Lgtm=C2=A0</div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 6, 2021 at 6:08 AM Peter Morro=
w &lt;<a href=3D"mailto:pemorrow@linux.microsoft.com">pemorrow@linux.micros=
oft.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">mingw32/ming=
w64 is not a supported value for GOOS, so map from &#39;mingw*&#39; to<br>
&#39;windows&#39; to enable building for windows targets.<br>
<br>
Signed-off-by: Peter Morrow &lt;<a href=3D"mailto:pemorrow@linux.microsoft.=
com" target=3D"_blank">pemorrow@linux.microsoft.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/goarch.bbclass | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass<br>
index 1099b95..ecd3044 100644<br>
--- a/meta/classes/goarch.bbclass<br>
+++ b/meta/classes/goarch.bbclass<br>
@@ -114,6 +114,8 @@ def go_map_mips(a, f, d):<br>
=C2=A0def go_map_os(o, d):<br>
=C2=A0 =C2=A0 =C2=A0if o.startswith(&#39;linux&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;linux&#39;<br>
+=C2=A0 =C2=A0 elif o.startswith(&#39;mingw&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;windows&#39;<br>
=C2=A0 =C2=A0 =C2=A0return o<br>
<br>
<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div></div>

--000000000000c14d8705bf4f603f--
