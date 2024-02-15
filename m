Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A8BC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 19:44:02 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.1951.1708026236018687428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 11:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QhYqk9vJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso1139919276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 11:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708026235; x=1708631035; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4GVv7cGO5lr3bblbHbHlo7bfbdy6E09VEdMs5zgkbfQ=;
        b=QhYqk9vJ3TGax0WiqmKdhE5EuBNCZJFCD8685pVxoNluZnuGgiU/oCKkwLWAb1wTF9
         N6JzqIiQ2PYCk0Wfxa3lOzfHsLwKcnZLismfrX+AnMhdsfaYPef2YdZpEAKYuYRDPbYg
         G67zwrQHQoAb7N5TpWGjYdCa9Ce9RE4ria4ecyujodnAogkoAj+L4fuitGTEVd+7Lxbx
         LdY/Rn9lpEKUZmaOxC7Me9Rj0fqpL1KNqQumKDwdCOkRP1wQJaZTLphBrF1z26dv7vSJ
         WfjUFnZQEPkKBH7baZzBV3wV5DvpCQC2bv5n0XvUj2olDBjOv3aSyuGzGfEYNL2Ygz2t
         9yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708026235; x=1708631035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GVv7cGO5lr3bblbHbHlo7bfbdy6E09VEdMs5zgkbfQ=;
        b=FRsmioIwGi9iYVMM6aUbApl3D2kwpsspXXfrYvHCj1Soyowl+tmWGa66bqbH/+FU/P
         T3y/hOrPG7A8TzU2frqx1SKfqUE5YNwmj0Od+FHq+w4nZRkXXrV21B8P4wPF30PMQILS
         dZ7r6fCglFHpvp5xO5bHG5GlaHM3vK2kepDoVgpAJOCTu/uDIaErE4KcxjvyrBc3+Sju
         4kJ/PHqA92AKj2UeuPkdf5yce4yaCSVYG+C4w6sjvNgl4wvnnftLVBTPNkwFM8aNvNCl
         MNXi1C+lyD6QOVy9XwfDBKA5WolYF8E2mXRfD/zODHnuh842WPpNrWQ0IPBoZEAYzXfF
         gI5w==
X-Forwarded-Encrypted: i=1; AJvYcCXLXmq2yI4rZTbUDS0lPzLEvJBukEBhtHqWrXiTj05HA6ZGVFGIQEgHNGk9Lk2++NHEVqoGOIWF4LcGKqeUdMojDxohjQ1birUqoRIa/vj+p3/wcDFtPXh0
X-Gm-Message-State: AOJu0YzvYHVbhUSiVbCrgWTlXYBk9jAs3KGu21JRontImrTA1rZaYIdT
	xdKN0wFYhRzZHP9UyeWUULdEZ+ERGmQwf5/6bA1H93nC5gorZ+btv0MlDdlgdx4Z3jTwqMa6CSz
	Xx+vnaxOkASGqhi1vFQwQUyIYRqg=
X-Google-Smtp-Source: AGHT+IEyGGRI1FTCYmA0VCM6WltOI+EzHor73nxjbDL6giyQIrfmEqwuIy+IBZDemzNK0DyV+5LlR98HalzOt6EZz2A=
X-Received: by 2002:a25:a348:0:b0:dcd:3663:b5e5 with SMTP id
 d66-20020a25a348000000b00dcd3663b5e5mr2460285ybi.25.1708026235075; Thu, 15
 Feb 2024 11:43:55 -0800 (PST)
MIME-Version: 1.0
References: <0101018dadd3a2d9-02259879-e7fa-444b-90f0-4d4cc8b44526-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018dadd3a2d9-02259879-e7fa-444b-90f0-4d4cc8b44526-000000@us-west-2.amazonses.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 15 Feb 2024 11:43:44 -0800
Message-ID: <CANx9H-DqJNmmSmte9ZF+yYR8tEmw9WVgAk3aF3WWa8D8Hv8pDg@mail.gmail.com>
Subject: Re: [OE-core] [AUH] python3-poetry-core: upgrading to 1.9.0 SUCCEEDED
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: Tim Orling <tim.orling@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000002420a061170d92a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 19:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195694

--00000000000002420a061170d92a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This version deprecates the very PEP-517 build backend we depend upon for
the python_poetry_core bbclass.
We do not want to take this so late in the release cycle, nor do we want to
add all the dependencies required to build the full poetry.

https://github.com/python-poetry/poetry-core/pull/692

On Thu, Feb 15, 2024 at 9:33=E2=80=AFAM Auto Upgrade Helper <auh@yoctoproje=
ct.org>
wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *python3-poetry-core* to
> *1.9.0* has Succeeded.
>
> Next steps:
>     - apply the patch: git am
> 0001-python3-poetry-core-upgrade-1.8.1-1.9.0.patch
>     - check the changes to upstream patches and summarize them in the
> commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this
> time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
> From 7441a91a0d58936eb42a90698ec8e8d80f4d72ad Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Thu, 15 Feb 2024 08:16:50 +0000
> Subject: [PATCH] python3-poetry-core: upgrade 1.8.1 -> 1.9.0
>
> ---
>  ...ython3-poetry-core_1.8.1.bb =3D> python3-poetry-core_1.9.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-poetry-core_1.8.1.bb =3D>
> python3-poetry-core_1.9.0.bb} (94%)
>
> diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
> b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
> rename to meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
> index fcb6d30ee0..dfb29c4b86 100644
> --- a/meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
> +++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "\
>
>  file://src/poetry/core/_vendor/tomli/LICENSE;md5=3Daaaaf0879d17df0110d1a=
a8c8c9f46f5
> \
>  "
>
> -SRC_URI[sha256sum] =3D
> "67a76c671da2a70e55047cddda83566035b701f7e463b32a2abfeac6e2a16376"
> +SRC_URI[sha256sum] =3D
> "fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2"
>
>  inherit python_poetry_core pypi
>  PYPI_ARCHIVE_NAME =3D "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195585):
> https://lists.openembedded.org/g/openembedded-core/message/195585
> Mute This Topic: https://lists.openembedded.org/mt/104377480/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000002420a061170d92a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This version deprecates the very PEP-517 build backen=
d we depend upon for the python_poetry_core bbclass.</div><div>We do not wa=
nt to take this so late in the release cycle, nor do we want to add all the=
 dependencies required to build the full poetry.</div><div><br></div><div><=
a href=3D"https://github.com/python-poetry/poetry-core/pull/692">https://gi=
thub.com/python-poetry/poetry-core/pull/692</a><br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 15, 2024 at =
9:33=E2=80=AFAM Auto Upgrade Helper &lt;<a href=3D"mailto:auh@yoctoproject.=
org">auh@yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *python3-poetry-core* to *=
1.9.0* has Succeeded.<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-python3-poetry-core-upgrade-1.=
8.1-1.9.0.patch<br>
=C2=A0 =C2=A0 - check the changes to upstream patches and summarize them in=
 the commit message,<br>
=C2=A0 =C2=A0 - compile an image that contains the package<br>
=C2=A0 =C2=A0 - perform some basic sanity tests<br>
=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --reset-auth=
or --amend<br>
=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
<br>
Alternatively, if you believe the recipe should not be upgraded at this tim=
e,<br>
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that<br>
automatic upgrades would no longer be attempted.<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
-- &gt;8 --<br>
From 7441a91a0d58936eb42a90698ec8e8d80f4d72ad Mon Sep 17 00:00:00 2001<br>
From: Upgrade Helper &lt;<a href=3D"mailto:auh@yoctoproject.org" target=3D"=
_blank">auh@yoctoproject.org</a>&gt;<br>
Date: Thu, 15 Feb 2024 08:16:50 +0000<br>
Subject: [PATCH] python3-poetry-core: upgrade 1.8.1 -&gt; 1.9.0<br>
<br>
---<br>
=C2=A0...<a href=3D"http://ython3-poetry-core_1.8.1.bb" rel=3D"noreferrer" =
target=3D"_blank">ython3-poetry-core_1.8.1.bb</a> =3D&gt; <a href=3D"http:/=
/python3-poetry-core_1.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-poetry-core_1.9.0.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-poetry=
-core_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.=
8.1.bb</a> =3D&gt; <a href=3D"http://python3-poetry-core_1.9.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-poetry-core_1.9.0.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-=
core_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.8=
.1.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-c=
ore_1.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.9.=
0.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-poetry-c=
ore_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.8.=
1.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-poetry-cor=
e_1.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.9.0.=
bb</a><br>
index fcb6d30ee0..dfb29c4b86 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-core_1.=
8.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.8.1.bb</=
a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-poetry-core_1.=
9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-poetry-core_1.9.0.bb</=
a><br>
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://src/poetry/core/_vendor/tomli/LICENSE;md5=3Daaaa=
f0879d17df0110d1aa8c8c9f46f5 \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;67a76c671da2a70e55047cddda83566035b701f7e463b=
32a2abfeac6e2a16376&quot;<br>
+SRC_URI[sha256sum] =3D &quot;fa7a4001eae8aa572ee84f35feb510b321bd652e5cf92=
93249d62853e1f935a2&quot;<br>
<br>
=C2=A0inherit python_poetry_core pypi<br>
=C2=A0PYPI_ARCHIVE_NAME =3D &quot;poetry_core-${PV}.${PYPI_PACKAGE_EXT}&quo=
t;<br>
-- <br>
2.42.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195585): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195585" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195585</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104377480/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104377480/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000002420a061170d92a--

