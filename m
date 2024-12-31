Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8819AE77188
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 15:06:19 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.84168.1735657573470284152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Dec 2024 07:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lsQO32ef;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-29e2a50586dso4815822fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Dec 2024 07:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735657572; x=1736262372; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q9WFeezPAAX151SpXn59Gk5RBSlciTnRdUkxlcp9tYU=;
        b=lsQO32efXtTmFyCCLyEp6hCFIYt5yisDBTeXP8PypHjsHhACwxdOCj1uW9+QLUBkLs
         4N/w4t5t3Nl5hmtHumaYKLFRHKzCA4iwyfT6Z3h6ISGUwqwELAxScL74XPVEx0u8JrzY
         buKUL9qYvdHKnnZtJX+LiEABEhgZaVk8i/QiAvStoZ7YOq71NfE1uAOXJMWDkNOqd8eW
         zczPOIZY7/xUilN74NFiHEbkwOvXgthkIYqUZ27BT8tIh75aK/iCifIPw+o5bTGLEvQL
         2K71jAu2/wL3RVg69Qj1EA9CtnKb4Ug7QeMZte/S2nnbJWnWLbg2y+FwRnl0yVPJsSgz
         x4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735657572; x=1736262372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9WFeezPAAX151SpXn59Gk5RBSlciTnRdUkxlcp9tYU=;
        b=t8gn/0pEC7XIkkC5w0wPx6ICzs7SO4YNCU23NrC8y5BF9jfohgdB0+rQjvLRY9CLeS
         Y/fwix7pvfYB+k+nDCRMoAK001G4EmNuu/fwUMpO7mkVxBcxYdkzV5TCxAEQ+5HGis9T
         R2Z8CaEQShvd4MSKf+RT0n1kAjis1Hj3Uk72rmME+965nJvV5So0UAccxWiKm7sFFsUq
         aUfDXsT5yiZ5mmaNo1JM11dOgw9B8RJPkZ1NhCQNqDaP9jhAFQRMjbvvn6xXC6Oulakc
         c40orkjBj9092PyZn7hI2fiK+Q/k37adehWfAXQkGSYkI2zdUDN75uef0Q94XaRBB5sX
         C0Kw==
X-Gm-Message-State: AOJu0YyrbWj/ut6xGp4xXuj3rjXwF+zOcIDtYbKbK08vIj2oRhuQQcxS
	o8WU1LGmmF93ccz59x1iiHhUadweDzGd3Q/IwE6/eL+XIaTiQs+ge+Fa5b5657W7nGMEpyuYTIZ
	FgXnbUuNX+/0p9nWS8Wvd2fwHnS8=
X-Gm-Gg: ASbGncsXNQJ8O8xgX2mAGlnfkzI+d1pLuQ9y9gcjYa4ELZGfA3S6kvuWhhF999UFhJb
	6o0fWHuucMRdulZJYjXszU8jXrS5LMrq/XpI/JYsZ3KAR1ctVWsuh8M/Xk+ZBq4k/3nuWqrc=
X-Google-Smtp-Source: AGHT+IFviQCyy60a/oAm/fdAyRcj+oXfzl16K3GcoJPuGbpk72D88jqng+WUkZtsPUq2+/RidJd2d4fYxCDejPs4aUU=
X-Received: by 2002:a05:6870:164a:b0:29d:c832:8402 with SMTP id
 586e51a60fabf-2a7fb56c0d2mr21997767fac.41.1735657572603; Tue, 31 Dec 2024
 07:06:12 -0800 (PST)
MIME-Version: 1.0
References: <20241231094418.30840-1-maxin.john@gmail.com>
In-Reply-To: <20241231094418.30840-1-maxin.john@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Dec 2024 07:06:01 -0800
Message-ID: <CAMKF1sqcYU98aN17FCiqXr9dru=iwnN9q+k5rTBUt2z7dJ_1ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] formfactor: add support for qemuriscv64 and qemuriscv32
To: maxin.john@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000111cef062a9245f3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Dec 2024 15:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209184

--000000000000111cef062a9245f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks good thanks for fixing it

On Tue, Dec 31, 2024 at 1:44=E2=80=AFAM Maxin B. John via lists.openembedde=
d.org
<maxin.john=3Dgmail.com@lists.openembedded.org> wrote:

> Add machine config files for qemuriscv64 and qemuriscv32.
>
> Fixes [YOCTO #15427].
>
> Signed-off-by: Maxin John <maxin.john@gmail.com>
> ---
>  .../formfactor/files/qemuriscv32/machconfig            | 10 ++++++++++
>  .../formfactor/files/qemuriscv64/machconfig            | 10 ++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100755
> meta/recipes-bsp/formfactor/files/qemuriscv32/machconfig
>  create mode 100755
> meta/recipes-bsp/formfactor/files/qemuriscv64/machconfig
>
> diff --git a/meta/recipes-bsp/formfactor/files/qemuriscv32/machconfig
> b/meta/recipes-bsp/formfactor/files/qemuriscv32/machconfig
> new file mode 100755
> index 000000000000..2789b5fc2ad5
> --- /dev/null
> +++ b/meta/recipes-bsp/formfactor/files/qemuriscv32/machconfig
> @@ -0,0 +1,10 @@
> +HAVE_TOUCHSCREEN=3D1
> +HAVE_KEYBOARD=3D1
> +
> +DISPLAY_CAN_ROTATE=3D0
> +DISPLAY_ORIENTATION=3D0
> +DISPLAY_WIDTH_PIXELS=3D640
> +DISPLAY_HEIGHT_PIXELS=3D480
> +DISPLAY_BPP=3D16
> +DISPLAY_DPI=3D150
> +DISPLAY_SUBPIXEL_ORDER=3Dvrgb
> diff --git a/meta/recipes-bsp/formfactor/files/qemuriscv64/machconfig
> b/meta/recipes-bsp/formfactor/files/qemuriscv64/machconfig
> new file mode 100755
> index 000000000000..2789b5fc2ad5
> --- /dev/null
> +++ b/meta/recipes-bsp/formfactor/files/qemuriscv64/machconfig
> @@ -0,0 +1,10 @@
> +HAVE_TOUCHSCREEN=3D1
> +HAVE_KEYBOARD=3D1
> +
> +DISPLAY_CAN_ROTATE=3D0
> +DISPLAY_ORIENTATION=3D0
> +DISPLAY_WIDTH_PIXELS=3D640
> +DISPLAY_HEIGHT_PIXELS=3D480
> +DISPLAY_BPP=3D16
> +DISPLAY_DPI=3D150
> +DISPLAY_SUBPIXEL_ORDER=3Dvrgb
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209183):
> https://lists.openembedded.org/g/openembedded-core/message/209183
> Mute This Topic: https://lists.openembedded.org/mt/110355685/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000111cef062a9245f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This looks good thanks for fixing it=C2=A0</div><div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Dec 31, 2024 at 1:44=E2=80=AFAM Maxin B. John via <a hr=
ef=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;maxin.j=
ohn=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)">Add machine config=
 files for qemuriscv64 and qemuriscv32.<br>
<br>
Fixes [YOCTO #15427].<br>
<br>
Signed-off-by: Maxin John &lt;<a href=3D"mailto:maxin.john@gmail.com" targe=
t=3D"_blank">maxin.john@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../formfactor/files/qemuriscv32/machconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 10 ++++++++++<br>
=C2=A0.../formfactor/files/qemuriscv64/machconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 10 ++++++++++<br>
=C2=A02 files changed, 20 insertions(+)<br>
=C2=A0create mode 100755 meta/recipes-bsp/formfactor/files/qemuriscv32/mach=
config<br>
=C2=A0create mode 100755 meta/recipes-bsp/formfactor/files/qemuriscv64/mach=
config<br>
<br>
diff --git a/meta/recipes-bsp/formfactor/files/qemuriscv32/machconfig b/met=
a/recipes-bsp/formfactor/files/qemuriscv32/machconfig<br>
new file mode 100755<br>
index 000000000000..2789b5fc2ad5<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/formfactor/files/qemuriscv32/machconfig<br>
@@ -0,0 +1,10 @@<br>
+HAVE_TOUCHSCREEN=3D1<br>
+HAVE_KEYBOARD=3D1<br>
+<br>
+DISPLAY_CAN_ROTATE=3D0<br>
+DISPLAY_ORIENTATION=3D0<br>
+DISPLAY_WIDTH_PIXELS=3D640<br>
+DISPLAY_HEIGHT_PIXELS=3D480<br>
+DISPLAY_BPP=3D16<br>
+DISPLAY_DPI=3D150<br>
+DISPLAY_SUBPIXEL_ORDER=3Dvrgb<br>
diff --git a/meta/recipes-bsp/formfactor/files/qemuriscv64/machconfig b/met=
a/recipes-bsp/formfactor/files/qemuriscv64/machconfig<br>
new file mode 100755<br>
index 000000000000..2789b5fc2ad5<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/formfactor/files/qemuriscv64/machconfig<br>
@@ -0,0 +1,10 @@<br>
+HAVE_TOUCHSCREEN=3D1<br>
+HAVE_KEYBOARD=3D1<br>
+<br>
+DISPLAY_CAN_ROTATE=3D0<br>
+DISPLAY_ORIENTATION=3D0<br>
+DISPLAY_WIDTH_PIXELS=3D640<br>
+DISPLAY_HEIGHT_PIXELS=3D480<br>
+DISPLAY_BPP=3D16<br>
+DISPLAY_DPI=3D150<br>
+DISPLAY_SUBPIXEL_ORDER=3Dvrgb<br>
-- <br>
2.39.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#209183): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/209183" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/209183</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110355685/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110355685/1997914</a><br>
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

--000000000000111cef062a9245f3--

