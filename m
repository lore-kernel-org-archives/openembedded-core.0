Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADBEFA0C5E
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 09:23:01 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14856.1776244974566281364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 02:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=TYzTpRcl;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.41, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9840bc8030so62937566b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 02:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776244973; cv=none;
        d=google.com; s=arc-20240605;
        b=ILeFiDBCvDa8uLiqG8PDlzM/KovdrEdfuKNDr2E0pX72ONOfwufnmSLdDHAeZ/13ks
         rgcIh7wHtMHT1RGtHegYSH91g8OAR15zjViryiAPzbqsxaU9KnxF1Hms8tbfhn1NNyWI
         c5CAQRo+Tl3AjB5nj4I8ZxJ679Wd9RXi6A3kTWoE6fCCTf0C2BajDL+mCP0EjrhjmTTz
         pS8zxQDQVXOh5R3u/6YLNdA7mUAtJIiRnO68vs21uiYEghuVAB/sUUV95wTLrkhPcRF5
         kMAraAxbFvsdshUkllG86Eoxj5LTEkVQcVA11kNvN9j9ZMgznKC28ZYOoMfs+muIVlGm
         Ahrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8DWRJJu+O9my1r1NTjBXyVZZKhTn+RAfNGzBYroNrbQ=;
        fh=8Yx1Dt+84nbJhO3/EUfuWluw4HkkzvtrmpXqI0aVL1w=;
        b=SGu54ouRqerOTlf4NQgRWOMc9NGul5e5O6y87xNRuaz5MtgcdnZwwME8lHiBBI77+t
         lnISh36a9JCpz31pjMIj0wORY/2dtzJLeyeHJrsasK7JClq5kE7sa2DhjitnUgB0GxY7
         pW3y4EY0pQxGHCLVs1MXK5GlP6Q3cW37XG04tkFG4Qx5pUr3bvRIZeFKTy0AZsq4Msm4
         Ie0n4IHSWzwZUuBYk0x2OkEnpjb/4JwSOhTApnu/R4C9RovwhKpcowQ3YJ0J+mPO7mAP
         JT63UidbZJd7cfExq9VUOD7v2ySExMeXAxYTQEDR5BR2uKvrG94LeSS6qikg9KXyUZNP
         c/ag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1776244973; x=1776849773; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8DWRJJu+O9my1r1NTjBXyVZZKhTn+RAfNGzBYroNrbQ=;
        b=TYzTpRcl0ZDJ0xyYjubKnP91A6iYTMUN32DoWcDX5SkP0kscHBdZ57cHkHgqNN/Kkp
         d1xqIcxkFFy7h/5UOw2nh3ckPUZUrfdXyZ6DAsnl9Xyw9YIzxwTZBwBhWaLhVBetAk3c
         z5Q6CqE06v2TwA0sELylAqcg1AQXPEBIHSPUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244973; x=1776849773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DWRJJu+O9my1r1NTjBXyVZZKhTn+RAfNGzBYroNrbQ=;
        b=fvT+pUhBVQPe1YWu7JJXm4C4zzMdQNnpsx+jSHOoVP4/rt9M/ANcT8l+ZBrTWegsEy
         2sN+OD1YfyFBn24BHMkMC/EpE2WD0TnvpEegGdKWTrKkZM9wEGIQ98jf5TDkadyhcd75
         SxEgH9kymq8ZrJWc4Nky/7yQITyTeT2H+uo9iZsfjWFfUtNlhEW6Jifg6GOWXgqxERrD
         9r8e5tNEx1kJW52JSb3W0taOsO1AYGZ7PVw9iWY4ICVLWY9eA1GhXbmnPnCHYwPMbJW3
         HzxwQnyuQ2rN+gWymntGf4fLusDNGbqNOeZH1ENB2qpMbZ3N/Si0m5QBg6roFgGwEo6k
         Wttg==
X-Forwarded-Encrypted: i=1; AFNElJ/AR+y1Pq7VUesn4CTR8q/HNLPMIsfXtXEg/JDybLY+DbMFYg5FpIUkFJEFZwAAeWoczeyYf6gbIhouDcuZTYCw2Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyr42MTX7vb66YIIrM5htaf+ytr2NBFV7GYyg8FZtQ0GQ78lYEV
	GJSsQUItfcHgiRDHsYTDTxX7cn2PMJFyyufsMvqrizWQ2D6pXiLVJvEofYu7G5//aRZHoMeLd2m
	iSMdEeeUi6yleynXemFub+7PB5Ya1mYjs0FYtJ0CuqQ==
X-Gm-Gg: AeBDiesYTI3GdnFAOd7z5SAwT9mIPkzZBlOpC/1EqciNF7hy1AUzc6GWsmaFviKwM9S
	ilJ+MTROVHcEBx/XSOhvMYk3D77C3DMJQTepfH1rztgsn4FZu/qDGi0NjCxpQ3Z6ontvPadLNAR
	rufs8OzogHurGUA5u2VyoymQnZcXosJH1IO0jFSxFRS3lPa6CDM1g9Haq7aDMwAxPHmOPBX/npV
	KW9kYg1rfno6IqdH9XZaqBcuTLBmssS+4Hr65vK0WqBG2mW+9YkbgKQClcjUEfEuZOvWAedLIeM
	3JSxDFVwiISlnTKNpG82Zr36R5cyQSD1w1dLq0Py
X-Received: by 2002:a17:907:7249:b0:b98:2518:a9a6 with SMTP id
 a640c23a62f3a-ba164b2c5a8mr33556466b.1.1776244972494; Wed, 15 Apr 2026
 02:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260414190245.2182865-2-rs@ti.com>
In-Reply-To: <20260414190245.2182865-2-rs@ti.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 15 Apr 2026 11:22:40 +0200
X-Gm-Features: AQROBzAd32conive2zNMepOja9S1nr6l9Iw6sR6yHJvA4ONThUXEva7KJukwJzE
Message-ID: <CAHDQB6NWqbxXfRE0Qdxi2RTbKATJUXy3cbErA+eyaOTUN8V8HA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] systemd: fix edit functionality with vi
To: rs@ti.com
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	mathieu.dubois-briand@bootlin.com, openembedded-core@lists.openembedded.org, 
	peter.kjellerstedt@axis.com, joerg.sommer@navimatix.de
Content-Type: multipart/alternative; boundary="0000000000009eb57e064f7c42cf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 09:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235188

--0000000000009eb57e064f7c42cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello;

And the pull request for systemd to not assume an editor can handle +LINE
is here:
https://github.com/systemd/systemd/pull/41642

Poettering has closed the pull request with the following reasoning:
```
Uh, there's a myriad of tools that rely on this, not just "systemctl edit".
for example "less" does.
Maybe fix your editor if =E2=80=93 in 2026 =E2=80=93 it still doesn't suppo=
rt this. I am
really sure we shouldn't participate
in such a race to the bottom for really really really old editors, that
don't do what every other editor does.
Moreover we have been doing this for a whole decade now, and no one
complained, I am pretty sure we
shouldn't make things less usable now, a decade later because of some
ancient editor once upon a time
hasn't been updated to match what everybody else does, including all
vi-style editors of more recent date.
I might be more impressed if you convinced less to drop support for calling
$EDITOR with "+".

Or to express this in a more positive way: please prepare a patch to your
"vi" flavour of choice to add
support for this very established syntax instead.
```

A patch to add +LINE support to Busybox's VI was submitted on the 4th of
June 2024:
https://lists.busybox.net/pipermail/busybox/2024-June/090778.html and has
subsequently
been ignored without feedback.

Like it or not, Poettering has made it clear that this patch will not be
supported upstream,
and his reasoning is sound. The correct thing to do (in my opinion) would
be to bother
the busybox maintainers to apply the 23 line patch to add support to a
feature used in almost
every editor out there.

Either way, should we really be pulling in a patch like this that won't
ever be accepted upstream?

On Tue, Apr 14, 2026 at 9:03=E2=80=AFPM Randolph Sapp via lists.openembedde=
d.org
<rs=3Dti.com@lists.openembedded.org> wrote:

> From: Randolph Sapp <rs@ti.com>
>
> Systemd currently expects any $EDITOR to support +LINE functionality for
> jumping to a specified line in a file. This makes busybox vi misbehave a
> little as it opens a file called +LINE and shows the user this file
> first, as it's the last argument passed to it.
>
> This has been submitted upstream as even IEEE Std 1003.1-2024 doesn't
> dictate that the default editors need to support +LINE functionality.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  ...ot-assume-the-editor-can-handle-LINE.patch | 46 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_259.5.bb    |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644
> meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-editor=
-can-handle-LINE.patch
>
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-edit=
or-can-handle-LINE.patch
> b/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-edit=
or-can-handle-LINE.patch
> new file mode 100644
> index 0000000000..cbcb472201
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-edit=
or-can-handle-LINE.patch
> @@ -0,0 +1,46 @@
> +From bc4177de928fa9c80f2cdd70fd79d07a37d7b2e2 Mon Sep 17 00:00:00 2001
> +From: Randolph Sapp <rs@ti.com>
> +Date: Tue, 14 Apr 2026 13:25:55 -0500
> +Subject: [PATCH] edit-util: do not assume the editor can handle +LINE
> +
> +If we're checking $EDITOR and trying to use an arbitrary list of text
> +editors we shouldn't just assume they know how to handle the +LINE
> +notation for jumping to a line in the specified file.
> +
> +Nano and Ed can handle it, but require that the line number is given
> +before the file. Vim and Neovim can take it as any positional argument
> +and just assume the last file specified was the intended target. Vi
> +cannot handle a line number specifier at all.
> +
> +There's nothing that states the $EDITOR has to take anything other than
> +a list of file names. Even that isn't really written anywhere. The
> +latest version of IEEE Std 1003.1-2024 does not indicate that the two
> +required utilities (vi and ex) need to support this functionality.
> +
> +Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/4164=
2
> ]
> +Signed-off-by: Randolph Sapp <rs@ti.com>
> +---
> + src/shared/edit-util.c | 7 -------
> + 1 file changed, 7 deletions(-)
> +
> +diff --git a/src/shared/edit-util.c b/src/shared/edit-util.c
> +index d48c36c1d5..b813c206c9 100644
> +--- a/src/shared/edit-util.c
> ++++ b/src/shared/edit-util.c
> +@@ -260,13 +260,6 @@ static int run_editor_child(const EditFileContext
> *context) {
> +                 }
> +         }
> +
> +-        if (context->n_files =3D=3D 1 && context->files[0].line > 1) {
> +-                /* If editing a single file only, use the +LINE syntax
> to put cursor on the right line */
> +-                r =3D strv_extendf(&args, "+%u", context->files[0].line=
);
> +-                if (r < 0)
> +-                        return log_oom();
> +-        }
> +-
> +         FOREACH_ARRAY(i, context->files, context->n_files) {
> +                 r =3D strv_extend(&args, i->temp);
> +                 if (r < 0)
> +--
> +2.53.0
> +
> diff --git a/meta/recipes-core/systemd/systemd_259.5.bb
> b/meta/recipes-core/systemd/systemd_259.5.bb
> index d84e38d7cd..4f443cc2d0 100644
> --- a/meta/recipes-core/systemd/systemd_259.5.bb
> +++ b/meta/recipes-core/systemd/systemd_259.5.bb
> @@ -35,6 +35,7 @@ SRC_URI +=3D " \
>             file://0003-Do-not-create-var-log-README.patch \
>             file://0001-meson-use-libfido2_cflags-dependency.patch \
>
> file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch \
> +
>  file://0001-edit-util-do-not-assume-the-editor-can-handle-LINE.patch \
>             "
>
>  PAM_PLUGINS =3D " \
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235172):
> https://lists.openembedded.org/g/openembedded-core/message/235172
> Mute This Topic: https://lists.openembedded.org/mt/118828793/10152556
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adam.duskett@amarulasolutions.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009eb57e064f7c42cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello;</div><div><br></div><div>And the pull request =
for systemd to not assume an editor can handle=C2=A0+LINE is here:</div><di=
v><a href=3D"https://github.com/systemd/systemd/pull/41642">https://github.=
com/systemd/systemd/pull/41642</a></div><div><br></div><div>Poettering has =
closed the pull request with the following reasoning:</div><div>```</div><d=
iv>Uh, there&#39;s a myriad of tools that rely on this, not just &quot;syst=
emctl edit&quot;. for example &quot;less&quot; does.</div><div>Maybe fix yo=
ur editor if =E2=80=93 in 2026 =E2=80=93 it still doesn&#39;t support this.=
 I am really sure we shouldn&#39;t participate</div><div>in such a race to =
the bottom for really really really old editors, that don&#39;t do what eve=
ry other editor does.</div><div>Moreover we have been doing this for a whol=
e decade now, and no one complained, I am pretty sure we</div><div>shouldn&=
#39;t make things less usable now, a decade later because of some ancient e=
ditor once upon a time</div><div>hasn&#39;t been updated to match what ever=
ybody else does, including all vi-style editors of more recent date.<br>I m=
ight be more impressed if you convinced less to drop support for calling $E=
DITOR with &quot;+&quot;.</div><div><br>Or to express this in a more positi=
ve way: please prepare a patch to your &quot;vi&quot; flavour of choice to =
add</div><div>support for this very established syntax instead.</div><div>`=
``</div><div><br></div><div><div>A patch to add +LINE support to Busybox&#3=
9;s VI was submitted on the 4th of June 2024:</div><div><a href=3D"https://=
lists.busybox.net/pipermail/busybox/2024-June/090778.html">https://lists.bu=
sybox.net/pipermail/busybox/2024-June/090778.html</a> and has subsequently<=
/div><div>been ignored without feedback.</div><br></div><div></div><div>Lik=
e it or not, Poettering has made it clear that this patch will not be suppo=
rted upstream,</div><div>and his reasoning is sound. The correct thing to d=
o (in my opinion) would be to bother</div><div>the busybox maintainers to a=
pply the 23 line patch to add support to a feature used in almost</div><div=
>every editor out there.=C2=A0</div><div><br></div><div>Either way, should =
we really be pulling in a patch like this that won&#39;t ever be accepted u=
pstream?</div></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 14, 2026 at 9:03=E2=80=AFPM=
 Randolph Sapp via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;rs=3D<a href=3D"mailto:ti.com@lists.openembedded.org">ti.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.co=
m" target=3D"_blank">rs@ti.com</a>&gt;<br>
<br>
Systemd currently expects any $EDITOR to support +LINE functionality for<br=
>
jumping to a specified line in a file. This makes busybox vi misbehave a<br=
>
little as it opens a file called +LINE and shows the user this file<br>
first, as it&#39;s the last argument passed to it.<br>
<br>
This has been submitted upstream as even IEEE Std 1003.1-2024 doesn&#39;t<b=
r>
dictate that the default editors need to support +LINE functionality.<br>
<br>
Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_bl=
ank">rs@ti.com</a>&gt;<br>
---<br>
=C2=A0...ot-assume-the-editor-can-handle-LINE.patch | 46 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_259.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_259.5.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 +=
<br>
=C2=A02 files changed, 47 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0001-edit-util-d=
o-not-assume-the-editor-can-handle-LINE.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume=
-the-editor-can-handle-LINE.patch b/meta/recipes-core/systemd/systemd/0001-=
edit-util-do-not-assume-the-editor-can-handle-LINE.patch<br>
new file mode 100644<br>
index 0000000000..cbcb472201<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-ed=
itor-can-handle-LINE.patch<br>
@@ -0,0 +1,46 @@<br>
+From bc4177de928fa9c80f2cdd70fd79d07a37d7b2e2 Mon Sep 17 00:00:00 2001<br>
+From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_blank">rs@=
ti.com</a>&gt;<br>
+Date: Tue, 14 Apr 2026 13:25:55 -0500<br>
+Subject: [PATCH] edit-util: do not assume the editor can handle +LINE<br>
+<br>
+If we&#39;re checking $EDITOR and trying to use an arbitrary list of text<=
br>
+editors we shouldn&#39;t just assume they know how to handle the +LINE<br>
+notation for jumping to a line in the specified file.<br>
+<br>
+Nano and Ed can handle it, but require that the line number is given<br>
+before the file. Vim and Neovim can take it as any positional argument<br>
+and just assume the last file specified was the intended target. Vi<br>
+cannot handle a line number specifier at all.<br>
+<br>
+There&#39;s nothing that states the $EDITOR has to take anything other tha=
n<br>
+a list of file names. Even that isn&#39;t really written anywhere. The<br>
+latest version of IEEE Std 1003.1-2024 does not indicate that the two<br>
+required utilities (vi and ex) need to support this functionality.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/systemd/systemd/=
pull/41642" rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd=
/systemd/pull/41642</a>]<br>
+Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_b=
lank">rs@ti.com</a>&gt;<br>
+---<br>
+ src/shared/edit-util.c | 7 -------<br>
+ 1 file changed, 7 deletions(-)<br>
+<br>
+diff --git a/src/shared/edit-util.c b/src/shared/edit-util.c<br>
+index d48c36c1d5..b813c206c9 100644<br>
+--- a/src/shared/edit-util.c<br>
++++ b/src/shared/edit-util.c<br>
+@@ -260,13 +260,6 @@ static int run_editor_child(const EditFileContext *co=
ntext) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (context-&gt;n_files =3D=3D 1 &amp;&amp; c=
ontext-&gt;files[0].line &gt; 1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If editing a s=
ingle file only, use the +LINE syntax to put cursor on the right line */<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D strv_extend=
f(&amp;args, &quot;+%u&quot;, context-&gt;files[0].line);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_oom();<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FOREACH_ARRAY(i, context-&gt;files, cont=
ext-&gt;n_files) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D strv_e=
xtend(&amp;args, i-&gt;temp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0=
)<br>
+--<br>
+2.53.0<br>
+<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_259.5.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_259.5.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_259.5.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_259.5.bb</a><br>
index d84e38d7cd..4f443cc2d0 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_259.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_259.5.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_259.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_259.5.bb</a><br>
@@ -35,6 +35,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Do-not-create-var-log=
-README.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson-use-libfido2_cf=
lags-dependency.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0018-shared-fdset-add-deta=
iled-debug-logging-to-fdset_new.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-edit-util-do-not-assu=
me-the-editor-can-handle-LINE.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PAM_PLUGINS =3D &quot; \<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#235172): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/235172" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/235172</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118828793/101=
52556" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/118828793/10152556</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:adam.duskett@amarulasoluti=
ons.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009eb57e064f7c42cf--

