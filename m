Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0120C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 13:55:43 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.36947.1737381341026649746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 05:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KbMWNJdI;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so7712675a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 05:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737381340; x=1737986140; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bc4ZJd1ZPVpd69xGQcmgCEet5ULwFuvvhBN++OUYFQA=;
        b=KbMWNJdIjtNAtMq5dtpVR48r77w8iJneRt7dYBu9ZFO8R1fQUKrsiadc/B/5dCMzsr
         LVU9LCM2KlwDYbcGu42UIZ2v19JBdN4ezf7xn0D+3sCak7Y9YGPeHSfDWki2x5COhKf2
         vKvyUbAoFESHwdE6mlI1ItsVvbWAFrQMGpJm/rheH7S6e2Vnts2lz5AMhS3B0d7SOxRz
         MhAHNFXAkcFt7PUuRVsjrVmXgBYUmRtUQ4ULs35pRc31sg0Dah6KrJzdEWvSxylsyukO
         gr79pPxKgjrMFkITvP3OSv0BQ2PjA5dmXSbCdrEjqMKDWWqFezZHbHi44CKS7mw/XB3E
         K51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737381340; x=1737986140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bc4ZJd1ZPVpd69xGQcmgCEet5ULwFuvvhBN++OUYFQA=;
        b=XeAt8O3lOknvaFYOJLpX5owoLhiyo1kQVnsnpVxhJmIyNMGKS1lS1toa3epuKYWRSs
         9J7FgXRfeCo4d1MoXhwcv4207qmuIZljuV4MyMNbXZy08kCWpTMW3/woGzVtGbaECGoM
         E6hIqKpGC/3vUagiVw4pDpbWeuI2qsuiiTSa0XqDfP+KGPfbqLRAd5nrwZsONxKfi8n4
         b+KI12jCpWf1Z2esriMkYG/cWeurmASM6pkoiuaiPXRjAHWiU+ETbqRJk8UqzfPiLM3X
         nupwa2AkRFCErTNXUMf2EGHHZUkHll2LOuwBX2ME26PHZuyvIGfkgBSaZ6fmWE6BaFyd
         4aGQ==
X-Gm-Message-State: AOJu0YzHr4yVn+5jRId70SpfWl9hbjRGbcZEdyARA4mRaOj8Ep7TFFz2
	qyUWIrpRf9TJbhS2e4moeICy6x3wwQIMHMZpFpd1PNIUPFNWOhBGsZGz05GD+vWv39YqNSnB1mT
	Yj+A1qIFLVcYrgwybPX+urrBttkQ=
X-Gm-Gg: ASbGncu6xKPneSRmkuCPnfjNkcLrJ8tnjpUK3p/2oLRPRcJjcHrfq0AGIc0GXMUtHup
	flqPiGjvSI725wqYqdxZXMqMOHDgcb+AQhXzTNxe577jTeCyBrYN/
X-Google-Smtp-Source: AGHT+IHLY+3eB6p9ZpSl0wjRvf9omu/wr5U7FeOW6Tzv5GfQmVdml4j3cQcOwy+H9DewcZfQiBtYPTEeIIZ2NPDY2I0=
X-Received: by 2002:a05:6a00:2d19:b0:72a:8bb6:2963 with SMTP id
 d2e1a72fcca58-72dafa44141mr18437407b3a.13.1737381340132; Mon, 20 Jan 2025
 05:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20250120065515.2977687-1-ejo@pengutronix.de>
In-Reply-To: <20250120065515.2977687-1-ejo@pengutronix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Jan 2025 08:55:27 -0500
X-Gm-Features: AbW1kvb3tgE5eOub9ziL0p8_hWHCKqkzfngWwcHBbzVWo86hy-vWHB0anNVLzHU
Message-ID: <CADkTA4MvbWtc52rt8-q1dRf_KA+LseXmSr-woY=yGsmVdBUGkw@mail.gmail.com>
Subject: Re: [PATCH v2] kernel-yocto: make kernel commits reproducible
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Felix Kloeckner <F.Kloeckner@weinmann-emt.de>
Content-Type: multipart/alternative; boundary="0000000000009e3e7d062c239d8e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 13:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210030

--0000000000009e3e7d062c239d8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 1:55=E2=80=AFAM Enrico J=C3=B6rns <ejo@pengutronix.=
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
> The class uses 'check_git_config' from utils.bbclass, but this only sets
> the git user and only if none existed before. Thus it doesn't really
> help here.
>
> Since in Git the committer information can be set only from the
> environment variables GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL, and
> GIT_COMMITTER_DATE, we introduce a helper function to set those and
> apply the author settings in the same way.
> As values simply use PATCH_GIT_USER_NAME, PATCH_GIT_USER_EMAIL (from
> patch.bbclass) and SOURCE_DATE_EPOCH.
> For convenience, put the new helper 'reproducible_git_committer_author'
> into utils.bbclass next to 'check_git_config' so others can use it, too.
>
> Using this helper in kernel-yocto.bbclass makes the committer and author
> date/name/email for the initial commit reproducible, as well as the
> committer name/email for the patches applied with kern-tools.
>
> For debugging purpose, allow disabling the reproducibility features by
> setting KERNEL_DEBUG_TIMESTAMPS to "1".
>
> v2 looks good to me!

Bruce



> Suggested-by: Felix Kl=C3=B6ckner <F.Kloeckner@weinmann-emt.de>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>  meta/classes-global/utils.bbclass        | 10 ++++++++++
>  meta/classes-recipe/kernel-yocto.bbclass |  6 ++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/meta/classes-global/utils.bbclass
> b/meta/classes-global/utils.bbclass
> index c9cae8930f..530a490ea8 100644
> --- a/meta/classes-global/utils.bbclass
> +++ b/meta/classes-global/utils.bbclass
> @@ -367,3 +367,13 @@ check_git_config() {
>                 git config --local user.name "${PATCH_GIT_USER_NAME}"
>         fi
>  }
> +
> +# Sets fixed git committer and author for reproducible commits
> +reproducible_git_committer_author() {
> +       export GIT_COMMITTER_NAME=3D"${PATCH_GIT_USER_NAME}"
> +       export GIT_COMMITTER_EMAIL=3D"${PATCH_GIT_USER_EMAIL}"
> +       export GIT_COMMITTER_DATE=3D"$(date -d @${SOURCE_DATE_EPOCH})"
> +       export GIT_AUTHOR_NAME=3D"${PATCH_GIT_USER_NAME}"
> +       export GIT_AUTHOR_EMAIL=3D"${PATCH_GIT_USER_EMAIL}"
> +       export GIT_AUTHOR_DATE=3D"$(date -d @${SOURCE_DATE_EPOCH})"
> +}
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index 7d80e9aa52..697132c073 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -352,6 +352,9 @@ do_patch() {
>         cd ${S}
>
>         check_git_config
> +       if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
> +               reproducible_git_committer_author
> +       fi
>         meta_dir=3D$(kgit --meta)
>         (cd ${meta_dir}; ln -sf patch.queue series)
>         if [ -f "${meta_dir}/series" ]; then
> @@ -434,6 +437,9 @@ do_kernel_checkout() {
>                 rm -f .gitignore
>                 git init
>                 check_git_config
> +               if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
> +                       reproducible_git_committer_author
> +               fi
>                 git add .
>                 git commit -q -n -m "baseline commit: creating repo for
> ${PN}-${PV}"
>                 git clean -d -f
> --
> 2.39.5
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009e3e7d062c239d8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 20, 2025 at 1:55=
=E2=80=AFAM Enrico J=C3=B6rns &lt;<a href=3D"mailto:ejo@pengutronix.de">ejo=
@pengutronix.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">The git commit hashes for the kernel checkout are not reprod=
ucible under<br>
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
The class uses &#39;check_git_config&#39; from utils.bbclass, but this only=
 sets<br>
the git user and only if none existed before. Thus it doesn&#39;t really<br=
>
help here.<br>
<br>
Since in Git the committer information can be set only from the<br>
environment variables GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL, and<br>
GIT_COMMITTER_DATE, we introduce a helper function to set those and<br>
apply the author settings in the same way.<br>
As values simply use PATCH_GIT_USER_NAME, PATCH_GIT_USER_EMAIL (from<br>
patch.bbclass) and SOURCE_DATE_EPOCH.<br>
For convenience, put the new helper &#39;reproducible_git_committer_author&=
#39;<br>
into utils.bbclass next to &#39;check_git_config&#39; so others can use it,=
 too.<br>
<br>
Using this helper in kernel-yocto.bbclass makes the committer and author<br=
>
date/name/email for the initial commit reproducible, as well as the<br>
committer name/email for the patches applied with kern-tools.<br>
<br>
For debugging purpose, allow disabling the reproducibility features by<br>
setting KERNEL_DEBUG_TIMESTAMPS to &quot;1&quot;.<br>
<br></blockquote><div><div class=3D"gmail_default" style=3D"font-size:small=
"></div><div class=3D"gmail_default" style=3D"font-size:small">v2 looks goo=
d to me!</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Suggested-by: Felix Kl=C3=B6ckner &lt;<a href=3D"mailto:F.Kloeckner@weinman=
n-emt.de" target=3D"_blank">F.Kloeckner@weinmann-emt.de</a>&gt;<br>
Signed-off-by: Enrico J=C3=B6rns &lt;<a href=3D"mailto:ejo@pengutronix.de" =
target=3D"_blank">ejo@pengutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/utils.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++=
+++++++<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass |=C2=A0 6 ++++++<br>
=C2=A02 files changed, 16 insertions(+)<br>
<br>
diff --git a/meta/classes-global/utils.bbclass b/meta/classes-global/utils.=
bbclass<br>
index c9cae8930f..530a490ea8 100644<br>
--- a/meta/classes-global/utils.bbclass<br>
+++ b/meta/classes-global/utils.bbclass<br>
@@ -367,3 +367,13 @@ check_git_config() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git config --local =
<a href=3D"http://user.name" rel=3D"noreferrer" target=3D"_blank">user.name=
</a> &quot;${PATCH_GIT_USER_NAME}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
+<br>
+# Sets fixed git committer and author for reproducible commits<br>
+reproducible_git_committer_author() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_NAME=3D&quot;${PATCH_GIT_U=
SER_NAME}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_EMAIL=3D&quot;${PATCH_GIT_=
USER_EMAIL}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_DATE=3D&quot;$(date -d @${=
SOURCE_DATE_EPOCH})&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_AUTHOR_NAME=3D&quot;${PATCH_GIT_USER=
_NAME}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_AUTHOR_EMAIL=3D&quot;${PATCH_GIT_USE=
R_EMAIL}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_AUTHOR_DATE=3D&quot;$(date -d @${SOU=
RCE_DATE_EPOCH})&quot;<br>
+}<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index 7d80e9aa52..697132c073 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -352,6 +352,9 @@ do_patch() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_git_config<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${KERNEL_DEBUG_TIMESTAMPS}&quot; !=
=3D &quot;1&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reproducible_git_co=
mmitter_author<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta_dir=3D$(kgit --meta)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd ${meta_dir}; ln -sf patch.queue series)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f &quot;${meta_dir}/series&quot; ]; then<=
br>
@@ -434,6 +437,9 @@ do_kernel_checkout() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f .gitignore<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git init<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check_git_config<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${KERNEL=
_DEBUG_TIMESTAMPS}&quot; !=3D &quot;1&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reproducible_git_committer_author<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git add .<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git commit -q -n -m=
 &quot;baseline commit: creating repo for ${PN}-${PV}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git clean -d -f<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000009e3e7d062c239d8e--

