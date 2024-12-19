Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E70CE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 09:01:12 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.125909.1734598865251878908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 01:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EPHu8NTy;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d8ece4937fso3983176d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 01:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734598864; x=1735203664; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4QCSgSjvVAL2HItfK0eWarNizK7Bz1/v5qIJ9nxXOvk=;
        b=EPHu8NTyikXWQ+Tr4UFx6YVHk6Uc0K8xxxLF/swN4AuImFxKA67QlvX/SQAMYO7WCw
         XNz+fmwXmDE2YCJ5SaO8cyDIkA+N45ZI04T2ApOYvLcZQb78bEYFcjEBGLrn31L0+Q+x
         UQsTGx9//8TS5u58mrieoCTs8TeQLcI+f7ef5gDeF+PLqVLzoisQovzRiH44rPd4JPfO
         fWwv5a9/fPyU0NTvcY7UJfl+MqQX8f7k2i41jVdQrMqup2gSV6JxvyFjL8rLXMGpOxFD
         oXTfQAyMKyH9tgvGN8s7iw9K9Ss0D8bJURE6/+XM/zZ2rwcC7nTTBKBqAVzmU8e1+GLL
         4myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734598864; x=1735203664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QCSgSjvVAL2HItfK0eWarNizK7Bz1/v5qIJ9nxXOvk=;
        b=PTDep3+/8Gt25i0E+bJ3IqqtcidClVQeR657Q+xu7ZXOl9P+1TRkdq1JIpjkPHvtFq
         kLsAhf64/i+GxmeXd131Q6JwKqR+W6FpBZTWwdepIDeae7Qf8prrrIx47FVlipP/GIbs
         uf8mxZg4cHS1s3UKxZscOmWWXH1HQNXCUcoP2/6o+BZ2pSLF0/stCDfNPUAF8K4nCVLJ
         9kO9b/UhCQEgOU2O9Sg2BzxKRheaz1eedhj0nMj/iRvAIedtqJfUdOvxO+QKZz2ohrMb
         5k69rd/ufNLqEROf9EKylC4dslGf3RTqPNcbe9Cp/J6amnirH8j2UhsmauEG1rR3ySF6
         LirQ==
X-Gm-Message-State: AOJu0Ywda5/JLG61tj5XBM6v8IEARK0MDaPcYM6699j353pPfX3lveyp
	hPtuA00Em3fvv2OSkbKXJ8HHbnmgQuapmSXkNEAV3vz0O/2zovQGkKhhORtDUGS0hfYKiuh2o6y
	tx+JmsR6oLSECRWs8/RfbE1Kn8lo=
X-Gm-Gg: ASbGncvY5QQBTO9PS6GAowGyF24j2p+Wj+we7+odqEB1nvewQR+OEzQYmf1KdOcBEhg
	buvE4d/+BGqEjWNROQWuSZ31pM0qm5EnngtFyQXj+Cl3rxLA/l5SLMSrquc7Gjvx5CmNx
X-Google-Smtp-Source: AGHT+IEHaE1lAcNCmWYKVskK1Z4cWrWDOzfD5sCcxnZ7QHkqsc3at6lEw/NpTEnJ6+3EG/iDiGnEJt3TK5dZ79WL+sk=
X-Received: by 2002:ad4:4eac:0:b0:6dc:d29a:b18e with SMTP id
 6a1803df08f44-6dd0925cc7amr114474216d6.47.1734598864121; Thu, 19 Dec 2024
 01:01:04 -0800 (PST)
MIME-Version: 1.0
References: <1734597713-2663-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1734597713-2663-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Dec 2024 10:00:53 +0100
Message-ID: <CANNYZj8w3j0i7qPob-X6H7D201A9rtOLGg_-ZH_Y=Ydyaix2sQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nfs-utils: Fix const qualifier error
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org, 
	Wang Mingyu <wangmy@cn.fujitsu.com>
Content-Type: multipart/alternative; boundary="0000000000001fb27a06299bc5b0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 09:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208899

--0000000000001fb27a06299bc5b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please do not add new =E2=80=98Penfing=E2=80=99 patches. They should be sub=
mitted upstream
first or there should be an explanation of what is pending.

Alex

On Thu 19. Dec 2024 at 9.42, wangmy via lists.openembedded.org <wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@cn.fujitsu.com>
>
> error with clang:
> file.c:200:8: error: assigning to 'char *' from 'const char *'
> discards qualifiers
> [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> |   200 |                 base =3D pathname;
> |       |                      ^ ~~~~~~~~
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../0001-Fix-const-qualifier-error.patch      | 35 +++++++++++++++++++
>  .../nfs-utils/nfs-utils_2.8.2.bb              |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-qualifier-er=
ror.patch
>
> diff --git
> a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-qualifier-=
error.patch
> b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-qualifier-=
error.patch
> new file mode 100644
> index 0000000000..8fc327e7aa
> --- /dev/null
> +++
> b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-qualifier-=
error.patch
> @@ -0,0 +1,35 @@
> +From a21344466e4c315d6d7098920819983f2d15573b Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@cn.fujitsu.com>
> +Date: Thu, 19 Dec 2024 06:18:59 +0000
> +Subject: [PATCH] Fix const qualifier error
> +
> +Fixes clang error
> +file.c:200:8: error: assigning to 'char *' from 'const char *'
> +discards qualifiers
> +[-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> +|   200 |                 base =3D pathname;
> +|       |                      ^ ~~~~~~~~
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> +---
> + support/nsm/file.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/support/nsm/file.c b/support/nsm/file.c
> +index de122b0..2733210 100644
> +--- a/support/nsm/file.c
> ++++ b/support/nsm/file.c
> +@@ -197,7 +197,7 @@ nsm_make_temp_pathname(const char *pathname)
> +
> +       base =3D strrchr(pathname, '/');
> +       if (base =3D=3D NULL)
> +-              base =3D pathname;
> ++              base =3D (char*)(&pathname);
> +       else
> +               base++;
> +
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> index 543c68f7f5..45821b98e8 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> @@ -31,6 +31,7 @@ SRC_URI =3D
> "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>
> file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
>             file://clang-warnings.patch \
>             file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch=
 \
> +           file://0001-Fix-const-qualifier-error.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208898):
> https://lists.openembedded.org/g/openembedded-core/message/208898
> Mute This Topic: https://lists.openembedded.org/mt/110195053/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001fb27a06299bc5b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please do not add new =E2=80=98Penfing=E2=80=99 patches. =
They should be submitted upstream first or there should be an explanation o=
f what is pending.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex<=
/div><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu 19. Dec 2024 at 9.42, wangmy via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;wangmy=3D=
<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Wang Mingyu &l=
t;<a href=3D"mailto:wangmy@cn.fujitsu.com" target=3D"_blank">wangmy@cn.fuji=
tsu.com</a>&gt;<br>
<br>
error with clang:<br>
file.c:200:8: error: assigning to &#39;char *&#39; from &#39;const char *&#=
39;<br>
discards qualifiers<br>
[-Werror,-Wincompatible-pointer-types-discards-qualifiers]<br>
|=C2=A0 =C2=A0200 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0base =3D pathname;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ ~~~~~~~~<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" tar=
get=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Fix-const-qualifier-error.patch=C2=A0 =C2=A0 =C2=A0 | 35 +++=
++++++++++++++++<br>
=C2=A0.../nfs-utils/<a href=3D"http://nfs-utils_2.8.2.bb" rel=3D"noreferrer=
" target=3D"_blank">nfs-utils_2.8.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 36 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001=
-Fix-const-qualifier-error.patch<br>
<br>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-q=
ualifier-error.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-F=
ix-const-qualifier-error.patch<br>
new file mode 100644<br>
index 0000000000..8fc327e7aa<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-qualifie=
r-error.patch<br>
@@ -0,0 +1,35 @@<br>
+From a21344466e4c315d6d7098920819983f2d15573b Mon Sep 17 00:00:00 2001<br>
+From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" target=3D"_=
blank">wangmy@cn.fujitsu.com</a>&gt;<br>
+Date: Thu, 19 Dec 2024 06:18:59 +0000<br>
+Subject: [PATCH] Fix const qualifier error<br>
+<br>
+Fixes clang error<br>
+file.c:200:8: error: assigning to &#39;char *&#39; from &#39;const char *&=
#39;<br>
+discards qualifiers<br>
+[-Werror,-Wincompatible-pointer-types-discards-qualifiers]<br>
+|=C2=A0 =C2=A0200 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0base =3D pathname;<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ ~~~~~~~~<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" ta=
rget=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
+---<br>
+ support/nsm/file.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/support/nsm/file.c b/support/nsm/file.c<br>
+index de122b0..2733210 100644<br>
+--- a/support/nsm/file.c<br>
++++ b/support/nsm/file.c<br>
+@@ -197,7 +197,7 @@ nsm_make_temp_pathname(const char *pathname)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0base =3D strrchr(pathname, &#39;/&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (base =3D=3D NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D pathname;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D (char*)(&amp;pa=
thname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base++;<br>
+ <br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-util=
s_2.8.2.bb" rel=3D"noreferrer" target=3D"_blank">nfs-utils_2.8.2.bb</a> b/m=
eta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_2.8.2.bb" re=
l=3D"noreferrer" target=3D"_blank">nfs-utils_2.8.2.bb</a><br>
index 543c68f7f5..45821b98e8 100644<br>
--- a/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_2.8.2=
.bb" rel=3D"noreferrer" target=3D"_blank">nfs-utils_2.8.2.bb</a><br>
+++ b/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_2.8.2=
.bb" rel=3D"noreferrer" target=3D"_blank">nfs-utils_2.8.2.bb</a><br>
@@ -31,6 +31,7 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/nfs-uti=
ls/${PV}/nfs-utils-${PV}.tar.x<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile.am-fix-undef=
ined-function-for-libnsm.a.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://clang-warnings.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-locktest-Makefile.am-=
Do-not-use-build-flags.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-const-qualifier-e=
rror.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;a39bbea76ac0ab9e6e8699caf3c308b6b310c20d=
458e8fa8606196d358e7fb15&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#208898): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/208898" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/208898</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110195053/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110195053/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001fb27a06299bc5b0--

