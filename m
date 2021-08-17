Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web09.35969.1629183580869639742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 23:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RIwESE4Y;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id b5so2831098vsq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 23:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CqItw+TxK9I6cb3jrGGMRHGh18N6GQZDoKqcqTKocoo=;
        b=RIwESE4YBKPOriQRJtzRYANDkHJ3jAzmTZ5CdIkcuoMEpxqg/gq6Q3l3dnOhPSc6na
         fmbuTqwrWbLg9V6FPSxzllpy7p+elt2TvgxgqiM0OrfqOtNoplEmbqNfnNEe0ndFBxTh
         4Q4o297XlMYYkdY7waudWPYdEaiceF5CHpFtNGf65FSWJduAPZrfDmPWdtpNjbwo1SU6
         WgicKcjGs5Vaqx+gnVYA5JTvMZhyGh/Ay+EJB/RMN+k1+3z8Y2mZDo7nSKRddjxyGw6b
         +QKqNCeHbidCKYNWmhcgtNPWgXWHkphCxL81WPT89E4lYxHrSV8nlXPRzVB7KyjBSkhE
         HH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CqItw+TxK9I6cb3jrGGMRHGh18N6GQZDoKqcqTKocoo=;
        b=Kx++j401MtbYJIOtGJh8JBg8SEXQWJVPl84joCTVnwE/bR9XmrJ9ELfvcs7r8KwoZn
         CdpmydrlqCe+w69E0NlfDiUKX29IMgULkMjohxOgFSCD5I22o6E6zDmENZauM3c4DPDO
         mxiTH7drt5um2BVMnmKqeBndoj86+sKZsKNR0524GQWNnbSzoxdCBPxEK9e14Y8Hyr2C
         TbLGzHr0YXKphZXus8LDeCSwgkVq4JkbO8Un9NbtwAQfp7n6zHu1BV94mkZTaYflgzbR
         uNpr4LsoPiljsKDfDd3RDO4ucQ1jeFx1zkNJcG9EE1rE+1T2ZwlbdkRv5Igi1qd/20mP
         trzw==
X-Gm-Message-State: AOAM531gJWE4EymZ0R9uJeIi7OTaKhvFX5AU3uVjXXWw05XUUPq/ZvRH
	cL+nMLW9DbZCuRhUGoJwqHpO1QFiykHghKGRzma54RgX
X-Google-Smtp-Source: ABdhPJxyTn0yO/K9TE3pFRa/McPhPLuARbG3JBf3Hi2oAr6/GBCO0B9hzLUCsc0kBAcsHcpLHag45mbA5iDH0rmASDM=
X-Received: by 2002:a67:844:: with SMTP id 65mr1376300vsi.20.1629183579934;
 Mon, 16 Aug 2021 23:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210817031124.35396-1-yi.zhao@windriver.com>
In-Reply-To: <20210817031124.35396-1-yi.zhao@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 17 Aug 2021 08:59:28 +0200
Message-ID: <CANNYZj8M0dWxvrqpbU-HcNK1XPBG44n7OdnrBZ82SgaaA+Ypww@mail.gmail.com>
Subject: Re: [PATCH] shadow: update default settings for useradd
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008e540d05c9bbdc85"

--0000000000008e540d05c9bbdc85
Content-Type: text/plain; charset="UTF-8"

If the issue is that /etc/default/useradd was deleted, shouldn't we address
this by reinstating that file? Patching the source code does not seem like
a better solution, and introduces surprising behaviour for those expecting
upstream defaults rather than Yocto's.

Alex

On Tue, 17 Aug 2021 at 05:11, Yi Zhao <yi.zhao@windriver.com> wrote:

> The shadow 4.9 stops shiping /etc/default/useradd[1] and uses built-in
> settings by default. Some settings are not consistent with previous
> shadow 4.8.1 in oe-core. Per shadow 4.8.1 settings, change the default
> shell to /bin/sh and stop creating mail spool.
>
> [1]
> https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267b
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...0001-useradd-update-default-settings.patch | 38 +++++++++++++++++++
>  meta/recipes-extended/shadow/shadow.inc       |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644
> meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch
>
> diff --git
> a/meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch
> b/meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch
> new file mode 100644
> index 0000000000..1e6702019b
> --- /dev/null
> +++
> b/meta/recipes-extended/shadow/files/0001-useradd-update-default-settings.patch
> @@ -0,0 +1,38 @@
> +From 46106ec16409ea99f73a8a8823e50ac54db8e122 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Tue, 17 Aug 2021 10:11:27 +0800
> +Subject: [PATCH] useradd: update default settings
> +
> +The shadow 4.9 stops shiping /etc/default/useradd[1] and uses built-in
> +settings by default. Some settings are not consistent with previous
> +shadow 4.8.1 in oe-core. Per shadow 4.8.1 settings, change the default
> +shell to /bin/sh and stop creating mail spool.
> +
> +[1]
> https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267b
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + src/useradd.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/useradd.c b/src/useradd.c
> +index 0d3f390d..715351b4 100644
> +--- a/src/useradd.c
> ++++ b/src/useradd.c
> +@@ -104,9 +104,9 @@ FILE *shadow_logfd = NULL;
> + static gid_t def_group = 1000;
> + static const char *def_gname = "other";
> + static const char *def_home = "/home";
> +-static const char *def_shell = "/bin/bash";
> ++static const char *def_shell = "/bin/sh";
> + static const char *def_template = SKEL_DIR;
> +-static const char *def_create_mail_spool = "yes";
> ++static const char *def_create_mail_spool = "no";
> +
> + static long def_inactive = -1;
> + static const char *def_expire = "";
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-extended/shadow/shadow.inc
> b/meta/recipes-extended/shadow/shadow.inc
> index 97ffae978a..e2a7a5bac6 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -16,6 +16,7 @@ SRC_URI = "
> https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
>             file://shadow-relaxed-usernames.patch \
>
> file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch \
>             file://0001-libsubid-link-to-PAM-libraries.patch \
> +           file://0001-useradd-update-default-settings.patch \
>             "
>
>  SRC_URI:append:class-target = " \
> --
> 2.25.1
>
>

--0000000000008e540d05c9bbdc85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If the issue is that /etc/default/useradd was deleted=
, shouldn&#39;t we address this by reinstating that file? Patching the sour=
ce code does not seem like a better solution, and introduces surprising beh=
aviour for those expecting upstream defaults rather than Yocto&#39;s.</div>=
<div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, 17 Aug 2021 at 05:11, Yi Zhao &lt=
;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao@windriver.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The shadow 4=
.9 stops shiping /etc/default/useradd[1] and uses built-in<br>
settings by default. Some settings are not consistent with previous<br>
shadow 4.8.1 in oe-core. Per shadow 4.8.1 settings, change the default<br>
shell to /bin/sh and stop creating mail spool.<br>
<br>
[1] <a href=3D"https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd1=
826eb41f6629669ef0b647267b" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b647267=
b</a><br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0...0001-useradd-update-default-settings.patch | 38 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-extended/shadow/shadow.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
=C2=A02 files changed, 39 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/shadow/files/0001-useradd-up=
date-default-settings.patch<br>
<br>
diff --git a/meta/recipes-extended/shadow/files/0001-useradd-update-default=
-settings.patch b/meta/recipes-extended/shadow/files/0001-useradd-update-de=
fault-settings.patch<br>
new file mode 100644<br>
index 0000000000..1e6702019b<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/shadow/files/0001-useradd-update-default-settin=
gs.patch<br>
@@ -0,0 +1,38 @@<br>
+From 46106ec16409ea99f73a8a8823e50ac54db8e122 Mon Sep 17 00:00:00 2001<br>
+From: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blan=
k">yi.zhao@windriver.com</a>&gt;<br>
+Date: Tue, 17 Aug 2021 10:11:27 +0800<br>
+Subject: [PATCH] useradd: update default settings<br>
+<br>
+The shadow 4.9 stops shiping /etc/default/useradd[1] and uses built-in<br>
+settings by default. Some settings are not consistent with previous<br>
+shadow 4.8.1 in oe-core. Per shadow 4.8.1 settings, change the default<br>
+shell to /bin/sh and stop creating mail spool.<br>
+<br>
+[1] <a href=3D"https://github.com/shadow-maint/shadow/commit/bbf4b79bc49fd=
1826eb41f6629669ef0b647267b" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/shadow-maint/shadow/commit/bbf4b79bc49fd1826eb41f6629669ef0b64726=
7b</a><br>
+<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
+---<br>
+ src/useradd.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/useradd.c b/src/useradd.c<br>
+index 0d3f390d..715351b4 100644<br>
+--- a/src/useradd.c<br>
++++ b/src/useradd.c<br>
+@@ -104,9 +104,9 @@ FILE *shadow_logfd =3D NULL;<br>
+ static gid_t def_group =3D 1000;<br>
+ static const char *def_gname =3D &quot;other&quot;;<br>
+ static const char *def_home =3D &quot;/home&quot;;<br>
+-static const char *def_shell =3D &quot;/bin/bash&quot;;<br>
++static const char *def_shell =3D &quot;/bin/sh&quot;;<br>
+ static const char *def_template =3D SKEL_DIR;<br>
+-static const char *def_create_mail_spool =3D &quot;yes&quot;;<br>
++static const char *def_create_mail_spool =3D &quot;no&quot;;<br>
+ <br>
+ static long def_inactive =3D -1;<br>
+ static const char *def_expire =3D &quot;&quot;;<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extende=
d/shadow/shadow.inc<br>
index 97ffae978a..e2a7a5bac6 100644<br>
--- a/meta/recipes-extended/shadow/shadow.inc<br>
+++ b/meta/recipes-extended/shadow/shadow.inc<br>
@@ -16,6 +16,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/shadow-ma=
int/shadow/releases/download/v$%7BPV%7D/$%7BBP%7D" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/shadow-maint/shadow/releases/download/v${PV=
}/${BP}</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://shadow-relaxed-usernames.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-out-of-tree-build=
s-with-respect-to-libsubid-incl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libsubid-link-to-PAM-=
libraries.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-useradd-update-defaul=
t-settings.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI:append:class-target =3D &quot; \<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000008e540d05c9bbdc85--
