Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE74AC9EC70
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 10:56:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30448.1768215389928815164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 02:56:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iOA2EeDN;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fbc3056afso3534806f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768215388; x=1768820188; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0BJsIhAsBkaoteY28i5OgASDMiijHVRQT79YN2YoDWY=;
        b=iOA2EeDN/ZdyK+f/hOZbggHQ2YO4TpuzgCZLEUNVjsaw1EF4Gok9LRCJhDe78yQIZa
         lRTiOthUEBKCUMf4QUZy/sWC1YNvKj4fZdudBe0hrYK9VPOOVHVIBE4H6FYMa9rFJd2h
         GUsN4jd4/IvAl8XLyMNOgzmQPCaVD7iSdoa2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215388; x=1768820188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BJsIhAsBkaoteY28i5OgASDMiijHVRQT79YN2YoDWY=;
        b=swPdxw+5yNRczWoxdjCLL0s1cmqFQz3oZQtQVC8je3FWuc7FaydKhjgFfolbNsVjvv
         YvLFKTjPh10kxKORLqghyrS87FIjf+C6RkV0XhWM4Tp8RlG7SXDa7cJsU5dME1FhQbrK
         7/NDAT/2mP6BzQTzf5r+gpbrXZzh0qe6KU/JI+VBqXHP+/47wx4paPDJFvZbNGYhg3hh
         PKgzEjGYUl/2DMCVpIgIcAqN4tIEeoK3m6uKdAeCPu4LyZYS13iB3PeFwpd8cwh4cwv3
         ixvIneHj3/5Ce6ezyOMV2PSt4Y5QcM6gu5AHMu8QRAYgbcSxCINMKTF71yn8hB66FPLY
         GLtw==
X-Gm-Message-State: AOJu0YyxGcGyQDTjzEYzHbr15XVOfF+2Wvqz0m3BO4KOsCKt886ECmGL
	5f2+UpT+NlB14eYhlsnta+bgGWtauG3FBxgRO9Hfd4U86QJ3hpxHXUhx3IoYhjDA+YlaGzTtY0U
	jFUYK2WOi7loiWsxfGeGdw9ab6kOOXIOGI3ahOVgFuw==
X-Gm-Gg: AY/fxX6uh/DjGrkRjTxpL8zwaTxC0M5Z0HMgNYoqTGHCqOFFn9f1CX/iTU8LxoqRktS
	m4iT9qIFZLEOP8MkXduEAlvtzrHNNeKNpady2E7I/k61dPpGEbWWpSUxdzh/zPwPIrBy1wAliXe
	Se1UQY04BOVyH8n3B6q0ZuZjCYX/z6yMhoD5sMPEgLUE42xI1zeRb4HO3bchcSm2jNzUz5kR7ok
	0RGZzy4l8qV0C+iUBfEqPRL80AxObvfgoNmeBqOLvM4FTaeQ8vAbWld+CUhyi40KsfLtmhGhg==
X-Google-Smtp-Source: AGHT+IEExa7C+F+UAAa2wtJeFR7TcgGwhgd0HmqL7x4IAOvGbMU7u7x42V8zrDz4mcH2+voDT1CtuWlQY91L1vP+Ac0=
X-Received: by 2002:a05:6000:178a:b0:430:f449:5f18 with SMTP id
 ffacd0b85a97d-432c37644b4mr21991125f8f.46.1768215388141; Mon, 12 Jan 2026
 02:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20260101121459.7191-1-peter.marko@siemens.com> <20260101121459.7191-3-peter.marko@siemens.com>
In-Reply-To: <20260101121459.7191-3-peter.marko@siemens.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 12 Jan 2026 11:56:02 +0100
X-Gm-Features: AZwV_QiGQqqtedBOUXoDGF5nVn9gl0sBd5Zntnne73oAIXGIhCtAwriJyntEjRw
Message-ID: <CAMSfU+47RP_P+aobc1Dt57X5Q8w7HFqK6QRUU-ter=WzQOzT4g@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 3/3] cups: allow unknown directives in
 conf files
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000018c5d106482eba92"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229206

--00000000000018c5d106482eba92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 1 janv. 2026 =C3=A0 13:15, Peter Marko via lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :

> From: Peter Marko <peter.marko@siemens.com>
>
> Patch for CVE-2025-61915 by mistake causes fatal error on unknown
> directives in configuration files.
> The default configuration already contains unknown directive in
> non-systemd setups:
> Unknown directive IdleExitTimeout on line 32 of /etc/cups/cupsd.conf
>
> Backport fix for this from 2.4.x branch which reverts this behavior.
>

Hello Peter,

It looks like master needs the same patch.
Can you send this there as well?

Thanks!


> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-extended/cups/cups.inc           |  1 +
>  ...pping-scheduler-on-unknown-directive.patch | 43 +++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644
> meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unk=
nown-directive.patch
>
> diff --git a/meta/recipes-extended/cups/cups.inc
> b/meta/recipes-extended/cups/cups.inc
> index ce55a8ef6fa..f70c4e7026a 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -29,6 +29,7 @@ SRC_URI =3D "
> https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
>            file://CVE-2025-58364.patch \
>             file://CVE-2025-58436.patch \
>             file://CVE-2025-61915.patch \
> +
>  file://0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch \
>             "
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/OpenPrinting/cups/releases"
> diff --git
> a/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-u=
nknown-directive.patch
> b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-u=
nknown-directive.patch
> new file mode 100644
> index 00000000000..572a8941f40
> --- /dev/null
> +++
> b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-u=
nknown-directive.patch
> @@ -0,0 +1,43 @@
> +From 277d3b1c49895f070bbf4b73cada011d71fbf9f3 Mon Sep 17 00:00:00 2001
> +From: Zdenek Dohnal <zdohnal@redhat.com>
> +Date: Thu, 4 Dec 2025 09:04:37 +0100
> +Subject: [PATCH] conf.c: Fix stopping scheduler on unknown directive
> +
> +Change the return value to do not trigger stopping the scheduler in case
> +of unknown directive, because stopping the scheduler on config errors
> +should only happen in case of syntax errors.
> +
> +Upstream-Status: Backport [
> https://github.com/OpenPrinting/cups/commit/277d3b1c49895f070bbf4b73cada0=
11d71fbf9f3
> ]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + scheduler/conf.c | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/scheduler/conf.c b/scheduler/conf.c
> +index 7d6da0252..0e7be0ef4 100644
> +--- a/scheduler/conf.c
> ++++ b/scheduler/conf.c
> +@@ -2695,16 +2695,16 @@ parse_variable(
> +   {
> +    /*
> +     * Unknown directive!  Output an error message and continue...
> ++    *
> ++    * Return value 1 is on purpose - we ignore unknown directives to lo=
g
> ++    * error, but do not stop the scheduler in case error in configurati=
on
> ++    * is set to be fatal.
> +     */
> +
> +-    if (!value)
> +-      cupsdLogMessage(CUPSD_LOG_ERROR, "Missing value for %s on line %d
> of %s.",
> +-                    line, linenum, filename);
> +-    else
> +-      cupsdLogMessage(CUPSD_LOG_ERROR, "Unknown directive %s on line %d
> of %s.",
> +-                    line, linenum, filename);
> ++    cupsdLogMessage(CUPSD_LOG_ERROR, "Unknown directive %s on line %d o=
f
> %s.",
> ++                  line, linenum, filename);
> +
> +-    return (0);
> ++    return (1);
> +   }
> +
> +   switch (var->type)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228819):
> https://lists.openembedded.org/g/openembedded-core/message/228819
> Mute This Topic: https://lists.openembedded.org/mt/117024509/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000018c5d106482eba92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0jeu. 1 janv. 2026 =C3=A0=C2=A013:=
15, Peter Marko via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openemb=
edded.org">siemens.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</=
div><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Peter Marko &lt;<a href=3D"mailto:peter.m=
arko@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
Patch for CVE-2025-61915 by mistake causes fatal error on unknown<br>
directives in configuration files.<br>
The default configuration already contains unknown directive in<br>
non-systemd setups:<br>
Unknown directive IdleExitTimeout on line 32 of /etc/cups/cupsd.conf<br>
<br>
Backport fix for this from 2.4.x branch which reverts this behavior.<br></b=
lockquote><div><br></div><div>Hello Peter,</div><div><br></div><div>It look=
s like master needs the same patch.</div><div>Can you send this there as we=
ll?</div><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/cups/cups.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 +<br>
=C2=A0...pping-scheduler-on-unknown-directive.patch | 43 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 44 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/cups/cups/0001-conf.c-Fix-st=
opping-scheduler-on-unknown-directive.patch<br>
<br>
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cu=
ps/cups.inc<br>
index ce55a8ef6fa..f70c4e7026a 100644<br>
--- a/meta/recipes-extended/cups/cups.inc<br>
+++ b/meta/recipes-extended/cups/cups.inc<br>
@@ -29,6 +29,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/OpenPrint=
ing/cups/releases/download/v$%7BPV%7D/cups-$%7B" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/OpenPrinting/cups/releases/download/v${PV}/c=
ups-${</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-58364.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-58436.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-61915.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-conf.c-Fix-stopping-s=
cheduler-on-unknown-directive.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/OpenPrinti=
ng/cups/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/O=
penPrinting/cups/releases</a>&quot;<br>
diff --git a/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-sched=
uler-on-unknown-directive.patch b/meta/recipes-extended/cups/cups/0001-conf=
.c-Fix-stopping-scheduler-on-unknown-directive.patch<br>
new file mode 100644<br>
index 00000000000..572a8941f40<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on=
-unknown-directive.patch<br>
@@ -0,0 +1,43 @@<br>
+From 277d3b1c49895f070bbf4b73cada011d71fbf9f3 Mon Sep 17 00:00:00 2001<br>
+From: Zdenek Dohnal &lt;<a href=3D"mailto:zdohnal@redhat.com" target=3D"_b=
lank">zdohnal@redhat.com</a>&gt;<br>
+Date: Thu, 4 Dec 2025 09:04:37 +0100<br>
+Subject: [PATCH] conf.c: Fix stopping scheduler on unknown directive<br>
+<br>
+Change the return value to do not trigger stopping the scheduler in case<b=
r>
+of unknown directive, because stopping the scheduler on config errors<br>
+should only happen in case of syntax errors.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/OpenPrinting/cups=
/commit/277d3b1c49895f070bbf4b73cada011d71fbf9f3" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/OpenPrinting/cups/commit/277d3b1c49895f070bb=
f4b73cada011d71fbf9f3</a>]<br>
+Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
+---<br>
+ scheduler/conf.c | 14 +++++++-------<br>
+ 1 file changed, 7 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/scheduler/conf.c b/scheduler/conf.c<br>
+index 7d6da0252..0e7be0ef4 100644<br>
+--- a/scheduler/conf.c<br>
++++ b/scheduler/conf.c<br>
+@@ -2695,16 +2695,16 @@ parse_variable(<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Unknown directive!=C2=A0 Output an error message and=
 continue...<br>
++=C2=A0 =C2=A0 *<br>
++=C2=A0 =C2=A0 * Return value 1 is on purpose - we ignore unknown directiv=
es to log<br>
++=C2=A0 =C2=A0 * error, but do not stop the scheduler in case error in con=
figuration<br>
++=C2=A0 =C2=A0 * is set to be fatal.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+ <br>
+-=C2=A0 =C2=A0 if (!value)<br>
+-=C2=A0 =C2=A0 =C2=A0 cupsdLogMessage(CUPSD_LOG_ERROR, &quot;Missing value=
 for %s on line %d of %s.&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lin=
e, linenum, filename);<br>
+-=C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 cupsdLogMessage(CUPSD_LOG_ERROR, &quot;Unknown direc=
tive %s on line %d of %s.&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lin=
e, linenum, filename);<br>
++=C2=A0 =C2=A0 cupsdLogMessage(CUPSD_LOG_ERROR, &quot;Unknown directive %s=
 on line %d of %s.&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line, line=
num, filename);<br>
+ <br>
+-=C2=A0 =C2=A0 return (0);<br>
++=C2=A0 =C2=A0 return (1);<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0switch (var-&gt;type)<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228819): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228819" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/228819</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117024509/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117024509/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000018c5d106482eba92--

