Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C768E7718C
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:00:13 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.153362.1734706805158824372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a+P5Sav2;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fcfb7db9bfso1488239a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 07:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734706804; x=1735311604; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f30S5A5zLKUMiajc14dQi2Qdqq99L4xihcG0afja4Vk=;
        b=a+P5Sav2oRej7DulA6S2IAImyl4YGsrlqSuAWIkzxF9IJl7/RjuFZLKejD2fHFY0Mb
         azrvUbE8ZkRtZ9bPFRiDpfRsZ8Vlv1UclQuPK8CK9kP9HCf88EwktSdnzil1ZscMKaOs
         yq7/7wQAKbllkDsj0Z7cbkxCl2vycg2HbLkVvvvFtx/ogF9j4tYww3AKCt2/t6Ldtfaq
         8zXB88A3yy6SrRqDv1KC2sWrNTcKkEXLN7YDmEu7KgNO8jRauOqaowWzV27rOMIQPpj1
         32WLNM0dTZ/KPrN4F4Rint+NwbfnUhvfXqd12eL2dnblw+yTmN2GBvGwMOHm53nT6W7/
         j4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734706804; x=1735311604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f30S5A5zLKUMiajc14dQi2Qdqq99L4xihcG0afja4Vk=;
        b=DIuEJqRn8RWGEc5rVz9Gh2iasIUOmmTrE4jKWkCs1JNwVjkuLzIPZ4dSRpkGgInIPN
         uHUi9/V+S/SDm4hgZoieYdJ5ZWELrcllq2emGhq2YZU2U7X7kzFVfqOaWcia7VKIcFAX
         kf5E2XnoGYo6EDzMzNxHGOkHAJNT5wwJEwctE18yUpNxlL9EMBhkw8VEgBeT3XA1Bkfs
         sjkPOann0im2uNCoVe5DdyHjI7wGer1XOPgnMu4FQqOp7wUr9NRy5I4rVAO/qnkJDo6h
         W2SKbczZhBkvQ6rFPiiSi5SPOGRLROQBHtKDaNncqN81THN5HLioX7gkbrEOlu/BGWXV
         uBwQ==
X-Gm-Message-State: AOJu0YxK3Y8q07W48NPkR2oxe+yM1hnIwki20ZQ+9IJ1CKIIT/K18a/T
	FMfeY7Rg0nR/DYDt1JUQYkbM+n1n9j37wluX3a7tRPwjFX6y8MoxFyHatJiHd+BQgQkyXgJ0xCd
	KwIkcCnMRyrkuYmosTnrNxKRWi74=
X-Gm-Gg: ASbGncscvxINRHty6UA4z6zDbhX/r85MG6VuGmLFTLvoJKlG8lXBR7yDjXnUi2Gi06D
	kYJ+3udSHgwsKbBYDa0yzf3AusyWe8YGXZcgakrA=
X-Google-Smtp-Source: AGHT+IGK6UiwSc78jJ2UHw5pVj/m7vYtIYG9Yf5rKtGzvY9ADdigwD21hwUW3+7HdJ/XRs+0NFLzSdfqDjX9eraH6lM=
X-Received: by 2002:a17:90a:c88b:b0:2ee:f687:6ad3 with SMTP id
 98e67ed59e1d1-2f452eb0eb9mr4654017a91.28.1734706804312; Fri, 20 Dec 2024
 07:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20241217074547.1601328-1-ejo@pengutronix.de>
In-Reply-To: <20241217074547.1601328-1-ejo@pengutronix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Dec 2024 09:59:52 -0500
Message-ID: <CADkTA4O+QD=OScLw6-9Tq6UpOnV88AVBxByye+OA=4FXANwG-Q@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto: make kernel commits reproducible
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Felix Kloeckner <F.Kloeckner@weinmann-emt.de>
Content-Type: multipart/alternative; boundary="000000000000dc56940629b4e61a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 15:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208981

--000000000000dc56940629b4e61a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 2:46=E2=80=AFAM Enrico J=C3=B6rns <ejo@pengutronix.=
de> wrote:

> The git commit hashes for the kernel checkout are not reproducible under
> certain conditions:
>
> - If the git repository is initialized on an archive (rather than a
>   git), the initial git commit not only has the current user name set,
>   it also uses the current system time as committer and author date.
>   This will affect the initial git hash and thus all subsequent ones.
>
> - The patches applied by the kern-tools have a valid author and date.
>   However, their committer again depends on the user building the BSP.
>
> This is an issue, for example, if one compiles a kernel with
> CONFIG_LOCALVERSION_AUTO enabled where the commit hash lands into the
> kernel and thus the package version. This not only makes the package
> version non-reproducible, but also leads to version mismatches between
> kernel modules built against a fresh kernel checkout and the kernel
> retrieved from the sstate cache.
>
> The class uses 'check_git_config', but this only sets the git user and
> only if none existed before. Thus it doesn't really help here.
>
> Since in Git the committer information can be set only from the
> environment variables GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL, and
> GIT_COMMITTER_DATE, we introduce the helper function
> 'reproducible_git_committer' here to set those.
> As values simply use PATCH_GIT_USER_NAME, PATCH_GIT_USER_EMAIL (from
> patch.bbclass) and SOURCE_DATE_EPOCH.
>
> Using this helper makes the committer date/name/email for the initial
> reproducible, as well as the committer name/email for the patches
> applied with kern-tools.
>
> What's still missing is the initial commit's date/name/email which we
> just set explicitly via command line arguments.
>
> Suggested-by: Felix Kl=C3=B6ckner <F.Kloeckner@weinmann-emt.de>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index a5d89dc2c8..1ba2f91e62 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -9,6 +9,12 @@ SRCTREECOVEREDTASKS +=3D "do_validate_branches
> do_kernel_configcheck do_kernel_che
>  PATCH_GIT_USER_EMAIL ?=3D "kernel-yocto@oe"
>  PATCH_GIT_USER_NAME ?=3D "OpenEmbedded"
>
> +reproducible_git_committer() {
> +       export GIT_COMMITTER_NAME=3D"${PATCH_GIT_USER_NAME}"
> +       export GIT_COMMITTER_EMAIL=3D"${PATCH_GIT_USER_EMAIL}"
> +       export GIT_COMMITTER_DATE=3D"$(date -d @${SOURCE_DATE_EPOCH})"
> +}
>

These would be better set in the same class and I'd argue
that they should just be set in same function  as our other
settings check_git_config()

While the check_git_config name might not convey it, the
original intent of that routine was to make sure that if what we
needed wasn't set, that we'd configure/set it for the upcoming
git commands.

Is there any reason this wouldn't work when exported from
classes-global/utils.bbclass ?

We also have already have get_kernel_source_date_epoch(),
that should be used instead of going directly at
SOURCE_DATE_EPOCH (unless the routine is causing a
problem, and then I'd be interested in hearing what it is).

There are some builds that for debugging purposes
we want to inhibit all reproducibility and forced setting of
timestamps, so setting these options should be
conditional on KERNEL_DEBUG_TIMESTAMPS not being
set. I realize that this is a slightly different use of setting
the timestamp as when we build the kernel, but it would
still be useful to disable the forced timestamp in some
scenarios.

+
>  # The distro or local.conf should set this, but if nobody cares...
>  LINUX_KERNEL_TYPE ??=3D "standard"
>
> @@ -349,6 +355,7 @@ do_patch() {
>         cd ${S}
>
>         check_git_config
> +       reproducible_git_committer
>         meta_dir=3D$(kgit --meta)
>         (cd ${meta_dir}; ln -sf patch.queue series)
>         if [ -f "${meta_dir}/series" ]; then
> @@ -431,8 +438,9 @@ do_kernel_checkout() {
>                 rm -f .gitignore
>                 git init
>                 check_git_config
> +               reproducible_git_committer
>                 git add .
> -               git commit -q -n -m "baseline commit: creating repo for
> ${PN}-${PV}"
> +               git commit --author=3D"${PATCH_GIT_USER_NAME}
> <${PATCH_GIT_USER_EMAIL}>" --date=3D${SOURCE_DATE_EPOCH} -q -n -m "baseli=
ne
> commit: creating repo for ${PN}-${PV}"
>

The author, author date and author email can also come from the environment
in my experiments.

Can we just set them the same way as the other variables for consistency ?

Bruce


>                 git clean -d -f
>         fi
>
> --
> 2.39.5
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000dc56940629b4e61a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 17, 2024 at 2:46=E2=80=
=AFAM Enrico J=C3=B6rns &lt;<a href=3D"mailto:ejo@pengutronix.de" target=3D=
"_blank">ejo@pengutronix.de</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">The git commit hashes for the kernel checkout ar=
e not reproducible under<br>
certain conditions:<br>
<br>
- If the git repository is initialized on an archive (rather than a<br>
=C2=A0 git), the initial git commit not only has the current user name set,=
<br>
=C2=A0 it also uses the current system time as committer and author date.<b=
r>
=C2=A0 This will affect the initial git hash and thus all subsequent ones.<=
br>
<br>
- The patches applied by the kern-tools have a valid author and date.<br>
=C2=A0 However, their committer again depends on the user building the BSP.=
<br>
<br>
This is an issue, for example, if one compiles a kernel with<br>
CONFIG_LOCALVERSION_AUTO enabled where the commit hash lands into the<br>
kernel and thus the package version. This not only makes the package<br>
version non-reproducible, but also leads to version mismatches between<br>
kernel modules built against a fresh kernel checkout and the kernel<br>
retrieved from the sstate cache.<br>
<br>
The class uses &#39;check_git_config&#39;, but this only sets the git user =
and<br>
only if none existed before. Thus it doesn&#39;t really help here.<br>
<br>
Since in Git the committer information can be set only from the<br>
environment variables GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL, and<br>
GIT_COMMITTER_DATE, we introduce the helper function<br>
&#39;reproducible_git_committer&#39; here to set those.<br>
As values simply use PATCH_GIT_USER_NAME, PATCH_GIT_USER_EMAIL (from<br>
patch.bbclass) and SOURCE_DATE_EPOCH.<br>
<br>
Using this helper makes the committer date/name/email for the initial<br>
reproducible, as well as the committer name/email for the patches<br>
applied with kern-tools.<br>
<br>
What&#39;s still missing is the initial commit&#39;s date/name/email which =
we<br>
just set explicitly via command line arguments.<br>
<br>
Suggested-by: Felix Kl=C3=B6ckner &lt;<a href=3D"mailto:F.Kloeckner@weinman=
n-emt.de" target=3D"_blank">F.Kloeckner@weinmann-emt.de</a>&gt;<br>
Signed-off-by: Enrico J=C3=B6rns &lt;<a href=3D"mailto:ejo@pengutronix.de" =
target=3D"_blank">ejo@pengutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 10 +++++++++-<br>
=C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index a5d89dc2c8..1ba2f91e62 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -9,6 +9,12 @@ SRCTREECOVEREDTASKS +=3D &quot;do_validate_branches do_ker=
nel_configcheck do_kernel_che<br>
=C2=A0PATCH_GIT_USER_EMAIL ?=3D &quot;kernel-yocto@oe&quot;<br>
=C2=A0PATCH_GIT_USER_NAME ?=3D &quot;OpenEmbedded&quot;<br>
<br>
+reproducible_git_committer() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_NAME=3D&quot;${PATCH_GIT_U=
SER_NAME}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_EMAIL=3D&quot;${PATCH_GIT_=
USER_EMAIL}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_DATE=3D&quot;$(date -d @${=
SOURCE_DATE_EPOCH})&quot;<br>
+}<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">These would be better set in the same class and I&#39;=
d argue</div><div class=3D"gmail_default" style=3D"font-size:small">that th=
ey should just be set in same function=C2=A0 as our other</div><div class=
=3D"gmail_default" style=3D"font-size:small">settings check_git_config()</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">While the check_git_config =
name might not convey it, the</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">original intent of that routine was to make sure that if wha=
t we</div><div class=3D"gmail_default" style=3D"font-size:small">needed was=
n&#39;t set, that we&#39;d configure/set it for the upcoming</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">git commands.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Is there any reason this wouldn&#39;t wo=
rk when exported from</div><div class=3D"gmail_default" style=3D"font-size:=
small">classes-global/utils.bbclass ?</div></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">We also have already have get_kernel_source_date_epoch=
(),</div><div class=3D"gmail_default" style=3D"font-size:small">that should=
 be used instead of going directly at</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">SOURCE_DATE_EPOCH (unless the routine is causing a</=
div><div class=3D"gmail_default" style=3D"font-size:small">problem, and the=
n I&#39;d be interested in hearing what it is).</div><div class=3D"gmail_de=
fault"><br></div><div class=3D"gmail_default">There are some builds that fo=
r debugging purposes</div><div class=3D"gmail_default">we want to inhibit a=
ll reproducibility=C2=A0and forced setting of</div><div class=3D"gmail_defa=
ult">timestamps, so setting these options should be</div><div class=3D"gmai=
l_default">conditional on KERNEL_DEBUG_TIMESTAMPS not being</div><div class=
=3D"gmail_default">set. I realize that this is a slightly different use of =
setting</div><div class=3D"gmail_default">the timestamp as when we build th=
e kernel, but it would=C2=A0</div><div class=3D"gmail_default">still be use=
ful to disable the forced timestamp in some</div><div class=3D"gmail_defaul=
t">scenarios.</div><div class=3D"gmail_default"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+<br>
=C2=A0# The distro or local.conf should set this, but if nobody cares...<br=
>
=C2=A0LINUX_KERNEL_TYPE ??=3D &quot;standard&quot;<br>
<br>
@@ -349,6 +355,7 @@ do_patch() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_git_config<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reproducible_git_committer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta_dir=3D$(kgit --meta)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd ${meta_dir}; ln -sf patch.queue series)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f &quot;${meta_dir}/series&quot; ]; then<=
br>
@@ -431,8 +438,9 @@ do_kernel_checkout() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f .gitignore<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git init<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check_git_config<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reproducible_git_co=
mmitter<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git add .<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git commit -q -n -m=
 &quot;baseline commit: creating repo for ${PN}-${PV}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git commit --author=
=3D&quot;${PATCH_GIT_USER_NAME} &lt;${PATCH_GIT_USER_EMAIL}&gt;&quot; --dat=
e=3D${SOURCE_DATE_EPOCH} -q -n -m &quot;baseline commit: creating repo for =
${PN}-${PV}&quot;<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">The author, author date and author email =
can also come from the=C2=A0environment</div></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">in my experiments.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Can we just set them the same way as the other var=
iables for consistency ?</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git clean -d -f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</div>

--000000000000dc56940629b4e61a--

