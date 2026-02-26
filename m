Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D111DFD8FD8
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 16:35:31 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74289.1772123725731981556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 08:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eApqQMv1;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b936331786dso78749266b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 08:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772123724; cv=none;
        d=google.com; s=arc-20240605;
        b=JbsQxeK7TrRukFnzRHuBFUj/+h4Fd8LcDS4tSO/MqIsJ7yU07bdQgAZ4+id1nMfbOh
         bIdXAU9T9vHkTOvBn9r5iOEIzjX8uZA0Eyg8ems+AkcbnrEapi+IpKzwCQso6nJlSk55
         ZZEnGKE+0X5zuQkURvu4tHXA+PG9yQfLro8P0/X869WOgRXgr/fsA/l4R2F8a4/j70jz
         8RqQso8TPTis7tXKtEeyANi5bs7JUevS4DUZU0FAHXQsvK+ogOYBwY6MRp1Y+JgkF7ny
         1d7zhgqDTGpMJUjhgJXi7qLd0/47KwKIBkg4TIz0eZSPFFoOoqiB3fc0c4isNP5BnE6K
         W59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6kKB0ZqbBxnyyeFxwHP/UwmdVVAUtEz4RZag1d/GgZk=;
        fh=cbgl5IOPsNxVRhYTH4PVIGJOnA+jpdWoNWXXxuAa4Z0=;
        b=kXcObW2PjeUZ/6UPbs8taHufczvFrvJ2wSclyZMCQoM1y4J1/kZSowlWZmrQySeEIP
         w/LQbxJQMhaglrwGMkno/4f2JgY/aX9+8qwmK0G/LHTqtNWndTEJAPJJ0qiJPMMSPk0+
         vG9WyCT54l4tdUVzuVLtbdBW1wm06MIR1qLQUCQe7PX1YPRQ1ALEmc7g8E6Im/QPkxlO
         TPp1LDPwTmbTaoD9FnfYv2oVm6Dbt0Ww1sekYTk3JXzr3MqKGi9dj5l0lL08Qu3l9rVP
         G5NWWPDXCTJiPqMOHTIXiMQ7cKj+iAnMdYyxs3mfZAilJBRzBKbR3xnosCWhZKgrtzTq
         h2Ag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772123724; x=1772728524; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6kKB0ZqbBxnyyeFxwHP/UwmdVVAUtEz4RZag1d/GgZk=;
        b=eApqQMv1MjSFgrwFe6WwcKwW7sjRMgn5W0gglKlG1wo8XV3YGMUaXrVZFC1bgC8ipi
         s/CibEhcqkU8fUv2LobvIJ3USG7vipaNFnMcV+5/rDlw5j/m8v2OWMS9Q0cFNVpygRTC
         SXdpgDfKWVzKArXB47TZDhTz3n2hBtJMdb9cs0J/5d1N7aPFi1AesZpbfWc8rKjDi4yr
         bk6bXCFY+7EM6cPDdbE6308tX0LnAyY3kvrD6m/VYu6VAwne7f7A9F9HmJuLGf5TDrqT
         MiP9O/xxMhyMH6Vj6IR4Z0KSsPVDj5fJ3xboyO9yVpj2CSosw55bqADldGrT84mmYhAh
         mxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772123724; x=1772728524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kKB0ZqbBxnyyeFxwHP/UwmdVVAUtEz4RZag1d/GgZk=;
        b=lxiqivPoCYwNloofA3Wpxjqjx/Yp54CMKTmvz1OtzOQCN3xewml2DEBgNgSpbVT39o
         aptmmbPHrpu754LQrjcdumTNEnYNpu1mTBuG9qHyZ+6kB/hEIjf9eI93I46nG0N7JiK2
         E7cXGq8/ixMSELTshtqZSiqBR3VPcbVG2HOrELNKQrwH4n6a9fCMFw8tX7ZxLWoL3UfO
         B2jsaYFbEJ5ztiCmAX/qqtcDi4u4Lhe8NcZm2MTe2B2kNc0Wq1CvXqst6wKrkZ9pO2F3
         QXYHYAVuA4tSyO64sRMKGkFXhh1Shrm5ReBoaCE+YNe+EIOMjhBNUWs7oM3GthJ7qB03
         V/uQ==
X-Gm-Message-State: AOJu0YyHk46ScQ8Rh9hcD8XSMDnmZVbGmXEteUaRytQzbywGlSm7RD90
	B1F1usv0GlRPjCUtOe1XE1tl6qzpct/NOiHzl9ttUni2j5mIpjQJrCz45wgK+8gKoV2w9uI8Is6
	D+5Q0GPwKliRDopMH/j/qeLkyXUkMK6A=
X-Gm-Gg: ATEYQzzyHCJ9/eCjBSVgqyFRv88WUrwA/9lUz2K9iZ2ymml4ZZbcW4RM1LuQLnNH9Sh
	qfGyGZNLektzupgo5RC4bt0KO5DCWLze8BjztS3VnMIkZGWdncdqXK6er2inVQw4gvmMcMlz+n4
	cguxnmBnaJcH4d+VXSd8dCCCywPXlcu1V3qZ+GWKlWIVtVLSQfa1WQJRURkvvYa1jOZimSNrk/c
	gwTSEkft6aYDph2j1wdvTm+nImu0Tl2j2owKnjzJH3GY3G5QZ6tynvUYKCdE55nMfU2QgLwdimh
	n3CWNGrZ8M8IQYXQRSWr
X-Received: by 2002:a17:907:e8d:b0:b88:646b:ae32 with SMTP id
 a640c23a62f3a-b9081a35236mr1159014166b.22.1772123723788; Thu, 26 Feb 2026
 08:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20260226113605.704256-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260226113605.704256-1-richard.purdie@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 26 Feb 2026 16:35:12 +0000
X-Gm-Features: AaiRm51FLAg-H-hY3BW-YjpQ5qWGpc5UUcjAtb98OMeaYvADlcdQzh6fnHVfCL4
Message-ID: <CANPvuRkCzzCXCAzzATxoFFLjdGMnHE-fU5=NmTE6oGk82ub-iQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Switch BB_SIGNATURE_HANDLER to
 OEEquivHash by default
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000df8c8064bbcb533"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 16:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232038

--0000000000000df8c8064bbcb533
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie via lists.openembedded.org <richard.purdie=3D
linuxfoundation.org@lists.openembedded.org> escreveu (quinta, 26/02/2026
=C3=A0(s) 11:36):

> Hash Equivalence is an extremely powerful feature for reducing build time=
.
> In simple terms, if something is rebuilt and the output is the same as a
> previous build, all sstate build artefacts beyond that point can be reuse=
d
> instead of being rebuilt.
>
> This can be done with a local hash equivalence database/server which is t=
he
> default and even local builds with a local sstate can benefit hugely from
> it.
>
> There is an assumption that builds are reproducible in order for this to
> work
> optimally.
>
> The downside is that when enabled to pull from a shared sstate cache, you
> need
> to use a common hash equivalence server to match it for things to work
> well.
>
> OE-Core wasn't enabling hash equivalence by default but this changes it t=
o
> do
> so. This has been extensively tested as the deafault in Poky for a long
> time.
>

I am happy with this change and it will make the noditro better
aligned with what
has been used and tested in poky since dunfell.

However, I would like to highlight a problem I have recently encountered:

When bitbake starts from scratch it takes a lot of time to populate the
hash equivalence database.
The issue can be observed locally if we start from an empty build directory=
:

watch -la build/cache/hashserv.db
bitbake core-image-base -n

and bitbake gets stuck in "Initialising tasks:" 44% for quite a while.
In some cases, I noticed that in some cases the time reaches 20 minutes.

Jose


> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d247eb3adfc..9308ee431f2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -951,7 +951,7 @@ BB_DEFAULT_EVENTLOG ?=3D
> "${LOG_DIR}/eventlog/${DATETIME}.json"
>  BB_DEFER_BBCLASSES =3D "native nativesdk cross crosssdk"
>
>  # Setup our default hash policy
> -BB_SIGNATURE_HANDLER ?=3D "OEBasicHash"
> +BB_SIGNATURE_HANDLER ?=3D "OEEquivHash"
>  BB_HASHEXCLUDE_COMMON ?=3D "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH
> BBSERVER DL_DIR \
>      THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL \
>      USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE
> PRSERV_HOST \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232001):
> https://lists.openembedded.org/g/openembedded-core/message/232001
> Mute This Topic: https://lists.openembedded.org/mt/118010453/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000df8c8064bbcb533
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded=
.org">linuxfoundation.org@lists.openembedded.org</a>&gt; escreveu (quinta, =
26/02/2026 =C3=A0(s) 11:36):<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hash Equivalence is an extremely powerful feature for reducing=
 build time.<br>
In simple terms, if something is rebuilt and the output is the same as a<br=
>
previous build, all sstate build artefacts beyond that point can be reused<=
br>
instead of being rebuilt.<br>
<br>
This can be done with a local hash equivalence database/server which is the=
<br>
default and even local builds with a local sstate can benefit hugely from i=
t.<br>
<br>
There is an assumption that builds are reproducible in order for this to wo=
rk<br>
optimally.<br>
<br>
The downside is that when enabled to pull from a shared sstate cache, you n=
eed<br>
to use a common hash equivalence server to match it for things to work well=
.<br>
<br>
OE-Core wasn&#39;t enabling hash equivalence by default but this changes it=
 to do<br>
so. This has been extensively tested as the deafault in Poky for a long tim=
e.<br></blockquote><div><br></div><div>I am happy with this change=C2=A0and=
 it will make the noditro=C2=A0better aligned=C2=A0with what</div><div>has =
been used and tested in poky since dunfell.<br><br>However, I would like to=
 highlight a problem I have recently encountered:<br><br>When bitbake start=
s from scratch it takes a lot of time to populate the hash equivalence data=
base.<br>The issue can be observed locally if we start from an empty build =
directory:</div><div><br></div><div>watch -la build/cache/hashserv.db<br>bi=
tbake core-image-base -n<br><br>and bitbake gets stuck in &quot;Initialisin=
g tasks:&quot; 44% for quite a while.<br>In some cases, I noticed that in s=
ome cases the time reaches 20 minutes.</div><div><br>Jose<br><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index d247eb3adfc..9308ee431f2 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -951,7 +951,7 @@ BB_DEFAULT_EVENTLOG ?=3D &quot;${LOG_DIR}/eventlog/${DA=
TETIME}.json&quot;<br>
=C2=A0BB_DEFER_BBCLASSES =3D &quot;native nativesdk cross crosssdk&quot;<br=
>
<br>
=C2=A0# Setup our default hash policy<br>
-BB_SIGNATURE_HANDLER ?=3D &quot;OEBasicHash&quot;<br>
+BB_SIGNATURE_HANDLER ?=3D &quot;OEEquivHash&quot;<br>
=C2=A0BB_HASHEXCLUDE_COMMON ?=3D &quot;TMPDIR FILE PATH PWD BB_TASKHASH BBP=
ATH BBSERVER DL_DIR \<br>
=C2=A0 =C2=A0 =C2=A0THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL=
 \<br>
=C2=A0 =C2=A0 =C2=A0USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET CORE=
BASE PRSERV_HOST \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#232001): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/232001" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/232001</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118010453/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118010453/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000000df8c8064bbcb533--

