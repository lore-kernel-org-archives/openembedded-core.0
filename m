Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BAFC4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 10:02:50 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9355.1784196166763593500
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 03:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KeyxBbkq;
 spf=pass (domain: konsulko.com, ip: 209.85.210.169, mailfrom: leon.anavi@konsulko.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8487088510aso6562467b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 03:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784196166; cv=none;
        d=google.com; s=arc-20260327;
        b=hjXQM0GLekZHwJP6MQjzzmrKoNTN2yQwIDFGz+POztsNdr6hdOHlxbILaPROqb0QeW
         XIAVo9VXivp88kfmUnM71FjSUOz3MjGxdM/rMsVTnjC0/G2wFCBLggph4YIKmhChmaDn
         mzjYqVzJHKxNf9CftntaLuXCffbqqJsGJEDqhnBowPbyd9EYoNSU3qYkV1qT0Frt6EGf
         ryqR/ey7CeRjV0UYdWqldUYECEgyGzIwNVnTg7NJN+d7lPpwZXNYl50ZouwTBYgiq4sz
         9GsrypLbRQL/9e+kix58FFh/mFmPoLCRiuiGmDY+cX3Fmy/Cza0rj/Oj7rC0BVtfEvQa
         GhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YDLHpmPSt4ni9N6VZyWdJQlJr2l/cCdqfIcEnRTKoBI=;
        fh=YIhvX7OJyTJc7Xdw9mD9Qaae1OIABeR4T+HCRYeklD8=;
        b=RpFOms31hYD49jTexuldTxAZ0ngqxNQW8ljQHqWlQE90IxSiRXYHk+L9qXumZBD1qM
         Jm62nzHpjQTQo1c3uZcbgBwea4gmhcNwunm2sLFa8OZiT3GEvkvhWb6ECrtq5JDU4yTF
         iG7pjXjTHGuwIVI1iIhp+UJwJeRJ4U8jOtnB4enDTor8Y4GUTktvESlMnf2QDyM4cmz+
         dcZPoldjt/ibbN2wpu7wFNOibWqyTstBL+VVvQ2zKuAA+jsV63E/TwgiJ4HCnkamIcbJ
         +7I3m7Z+OJ+4Uvzk/TPyQuEngmtygm2cK9b182z7m0RqHN9lPztXSyPytaSrdQR2yr6s
         +FSA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784196166; x=1784800966; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDLHpmPSt4ni9N6VZyWdJQlJr2l/cCdqfIcEnRTKoBI=;
        b=KeyxBbkqGcbOVYtGvk1EjdbRE1J1mAnjgJEBX9QtK2QQ2iVwbS1Gjk+FPwW3kkBeAS
         c1z6uWjPVqJjvajoy4yrPocNPbzXUb4BNoyqYLQXolNmsOqnF5xQrAKOohtz0r2B43oD
         1LJYb+1wDWmACFHKsAqgNaBL6vr7LDQSkur7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784196166; x=1784800966;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YDLHpmPSt4ni9N6VZyWdJQlJr2l/cCdqfIcEnRTKoBI=;
        b=C6P5G9yMJq1Bt+DEacQkPxJ9JilZRqIODVMUnU0NXn6SN5IvF/iE8xa9ZUnhy01LjA
         0y+zfZ3AuScB4kzUgI7zTVo+cfYQkrTY+ez6h1zFXiC54+7w4pgp+Yr+X9oaplUDTkYA
         YCuxjfTub1+urltOvXjbhx98Z80gEyJQYbEBxHor6dKn9ZCtLcYOAkRLZs0UGi7LyUW2
         ddW9QEHdtjPb6j2hlab4MLA21iR/Yap2wUIfZaN0GnAtK8sXlSb7Jipi6RNh39OuAFJT
         eMdQ48d7XIgSUzXCqAfmgBkK11HUcvPerbnSPgh33lX/FcVQ+f0biqfNdU8Lsi/TVLev
         oJRg==
X-Forwarded-Encrypted: i=1; AHgh+RokNk3eydhY4M9/Utr3GNHA4TWsU3FIvQaKhafKnwouQKajmltTQ00Zpm/fcMohc8zFkBwaNj7nnf9uZFUeur1Sbw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yznx8u6OgnKkJVFHtip9qdDmkVoh6S0eK0PVM2iSVR1ZJaH3Mjz
	jDJkDZsbGoyl2zFZ2wXF3xN1WsbC6Thg0PUTAAprytAOacK6o8AH85LfW0g9dgApdT3kBcmLbeM
	d9uGR/DYobsRPDLpyvgK/foSyBZrvhS6H7SpuxlZFcQ==
X-Gm-Gg: AfdE7cnHh+OQR+lRDShyNAiTl0Hn+k2ZCd0pNEjjbKCrJrvlECfaJkFkUzvcaclSCwR
	fcTZkjfqNk/clz7AfSIxg1MhMiOTbfHLXxCKFwzZ7lCSHLmlZfy63bKjNQqXwDcv7ynJRlKD1nM
	Za/4CAX3fDe36siN6dyUZNsu7dbGIsw+7EYkFUanglhhDDol4UsPGdxdyaE5gzqiL7fV9iJ/WR0
	IDzCn6NC/g3ddbozzqC8gUOtLm8MTv55V35Okww4wFhWYu1sFADc3e9YB17fI8cgvIzrh+rA26d
	0bKM0y3ahApBzx+RsPUMz9vq/12Ba5u4tA/m88sPKGIFy05cM2GleNVb6HELhqvBLXnVxFo5
X-Received: by 2002:a05:6a00:1942:b0:847:99b4:d011 with SMTP id
 d2e1a72fcca58-84a51605710mr10089320b3a.39.1784196165961; Thu, 16 Jul 2026
 03:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
 <c068df721aaa08116114fca946a3eaa6936b4f76.camel@pengutronix.de> <CAJdd5GaqWhzsOS-5DVxDGyS8ORd-hmDqW3PKYu95H2XcKCyERg@mail.gmail.com>
In-Reply-To: <CAJdd5GaqWhzsOS-5DVxDGyS8ORd-hmDqW3PKYu95H2XcKCyERg@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Thu, 16 Jul 2026 13:02:35 +0300
X-Gm-Features: AUfX_mwM6t3K3jTxL7xJ59YQ6o10qP4Nbdo8QHec2OUkilwipzwMtxW_jlQkgY8
Message-ID: <CALtQ3O1pW9C_DJNf2SjTBG=QZ1EteAt6_3KHGaOJAHbCTp0+SQ@mail.gmail.com>
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using systemd
To: Joshua Watt <jpewhacker@gmail.com>, Paul Barker <paul@pbarker.dev>
Cc: p.zabel@pengutronix.de, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ae9d430656b78a27"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 10:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241076

--000000000000ae9d430656b78a27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul, Joshua, Philipp,

Philipp, Joshua thank you for the code review and for the insights
regarding weston and weston-init. In the long term, discussing
modifications to weston and weston-init probably makes sense. However, for
the moment, I think my single-line change to add pam to the defaults is
simple and makes sense, especially considering that this fix is also
suitable for cherry-picking to release Wrynose.

Paul, following your initial code review, could you please have a look at
the third iteration of this patch? I would appreciate your feedback on
whether any additional modifications on my side are necessary to get it
merged in the upstream.

Please note that my modification through DISTRO_FEATURES_DEFAULTS targets
the nodistro and the yocto-check-layer use case. I consider this change to
be safe because in my opinion Poky or custom distributions are expected to
define an explicit DISTRO_FEATURES. So (most) other cases will remain
unaffected by this adjustment of the defaults.

Thanks, Leon

On Mon, Jul 13, 2026 at 11:30=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com>=
 wrote:

>
>
> On Thu, Jul 9, 2026 at 2:45=E2=80=AFAM Philipp Zabel via lists.openembedd=
ed.org
> <p.zabel=3Dpengutronix.de@lists.openembedded.org> wrote:
>
>> On Mi, 2026-07-08 at 17:37 +0300, Leon Anavi wrote:
>> > Add pam to DISTRO_FEATURES_DEFAULTS in init-manager-systemd.inc.
>> > This way pam will available if variable VIRTUAL-RUNTIME_init_manager
>> > has been set to systemd. Otherwise having systemd in conjunction
>> > with wayland but without pam leads to a conflict with the
>> > REQUIRED_DISTRO_FEATURES for weston related recipes.
>>
>> I think these requirements are partially incorrect, btw.
>>
>> Weston itself only requires PAM for the VNC password, so if
>> PACKAGECONFIG[vnc] is disabled, there is no PAM dependency from
>> weston_15.0.1.bb at all, and if vnc is enabled, the PAM dependency has
>> nothing to do with systemd being enabled or used as init system.
>>
>> The PAM dependency in weston-init.bb comes from the PAMName=3Dweston-
>> autologin option in weston.service and the corresponding weston-
>> autologin PAM configuration. Those files are always installed if
>> DISTRO_FEATURES has systemd, even if VIRTUAL-RUNTIME_init_manager is
>> set to something else.
>> Shouldn't either the pam distro feature depend on the systemd distro
>> feature, or should the weston.service/weston-autologin files be
>> installed at all if the systemd distro feature is enabled but
>> init_manager is set to something else?
>> I think it wouldn't be even better to remove the PAM requirement from
>> weston-init if VNC is disabled, as Weston doesn't need the PAM login in
>> that case.
>>
>
> I believe weston-init needs PAM regardless of VNC being enabled.
>
> The intention of weston-init is to provide a minimal setup to start westo=
n
> on boot and not run as root (since that's a huge pain). There are
> certainly other ways of starting weston (such as a login manager), but th=
is
> one has been around for a while and is nice because it "just works" even =
on
> devices with no keyboard for (e.g. a user login in a login manager), has =
a
> good security model (not running as root), aside from PAM has almost no
> dependencies, and is quite simple. IMHO, It works well for an embedded
> device because you can set the weston shell to the kiosk shell and
> immediately start your application as a client to show your UI, but it's
> not really great for a "desktop" experience (but I never found that a
> useful experience on an embedded device outside of demonstration purposes=
).
> It's more or less a copy of a similar system I use in my day job and I ha=
d
> lofty goals of removing our version for the upstream one, but I'm beginni=
ng
> to think this is an unrealistic goal.
>
> Regardless, if we continue to use weston-init, we probably need PAM by
> default - not because of weston, but because of weston-init. Alternativel=
y,
> we can do something other than weston-init, but I don't really have any
> idea what that should be, what it would take to switch, or how useful it
> would be in the real world.
>
>
>
>>
>> regards
>> Philipp
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#240546):
>> https://lists.openembedded.org/g/openembedded-core/message/240546
>> Mute This Topic: https://lists.openembedded.org/mt/120174368/3616693
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> JPEWhacker@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000ae9d430656b78a27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul, Joshua, Philipp,<br><br>Philipp, Joshua thank you=
 for the code review and for the insights regarding weston and weston-init.=
 In the long term, discussing modifications to weston and weston-init proba=
bly makes sense. However, for the moment, I think my single-line change to =
add pam to the defaults is simple and makes sense, especially considering t=
hat this fix is also suitable for cherry-picking to release Wrynose.<br><br=
>Paul, following your initial code review, could you please have a look at =
the third iteration of this patch? I would appreciate your feedback on whet=
her any additional modifications on my side are necessary to get it merged =
in the upstream.<br><br>Please note that my modification through DISTRO_FEA=
TURES_DEFAULTS targets the nodistro and the yocto-check-layer use case. I c=
onsider this change to be safe because in my opinion Poky or custom distrib=
utions are expected to define an explicit DISTRO_FEATURES. So (most) other =
cases will remain unaffected by this adjustment of the defaults.<br><br>Tha=
nks, Leon</div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jul 13, 2026 at 11:30=E2=80=AFPM Jos=
hua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com">jpewhacker@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 9, 2026 at 2:45=E2=80=AFAM =
Philipp Zabel via <a href=3D"http://lists.openembedded.org" target=3D"_blan=
k">lists.openembedded.org</a> &lt;p.zabel=3D<a href=3D"mailto:pengutronix.d=
e@lists.openembedded.org" target=3D"_blank">pengutronix.de@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mi, 2026-07-08 at 17:37 +0300, Leon Anavi wrote:<br>
&gt; Add pam to DISTRO_FEATURES_DEFAULTS in init-manager-systemd.inc.<br>
&gt; This way pam will available if variable VIRTUAL-RUNTIME_init_manager<b=
r>
&gt; has been set to systemd. Otherwise having systemd in conjunction<br>
&gt; with wayland but without pam leads to a conflict with the<br>
&gt; REQUIRED_DISTRO_FEATURES for weston related recipes.<br>
<br>
I think these requirements are partially incorrect, btw.<br>
<br>
Weston itself only requires PAM for the VNC password, so if<br>
PACKAGECONFIG[vnc] is disabled, there is no PAM dependency from<br>
<a href=3D"http://weston_15.0.1.bb" rel=3D"noreferrer" target=3D"_blank">we=
ston_15.0.1.bb</a> at all, and if vnc is enabled, the PAM dependency has<br=
>
nothing to do with systemd being enabled or used as init system.<br>
<br>
The PAM dependency in <a href=3D"http://weston-init.bb" rel=3D"noreferrer" =
target=3D"_blank">weston-init.bb</a> comes from the PAMName=3Dweston-<br>
autologin option in weston.service and the corresponding weston-<br>
autologin PAM configuration. Those files are always installed if<br>
DISTRO_FEATURES has systemd, even if VIRTUAL-RUNTIME_init_manager is<br>
set to something else.<br>
Shouldn&#39;t either the pam distro feature depend on the systemd distro<br=
>
feature, or should the weston.service/weston-autologin files be<br>
installed at all if the systemd distro feature is enabled but<br>
init_manager is set to something else?<br>
I think it wouldn&#39;t be even better to remove the PAM requirement from<b=
r>
weston-init if VNC is disabled, as Weston doesn&#39;t need the PAM login in=
<br>
that case.<br></blockquote><div><br></div><div>I believe=C2=A0weston-init n=
eeds PAM regardless of VNC being enabled.</div><div><br></div><div>The inte=
ntion of weston-init is to provide a minimal setup to start weston on boot =
and not run as root (since that&#39;s a huge pain). There are certainly=C2=
=A0other ways of starting weston (such as a login manager), but this one ha=
s been around for a while and is nice because it &quot;just works&quot; eve=
n on devices with no keyboard for (e.g. a user login in a login manager), h=
as a good security model (not running as root), aside from PAM has almost n=
o dependencies, and is quite simple. IMHO, It works well for an embedded de=
vice because you can set the weston shell to the kiosk shell and immediatel=
y=C2=A0start your application as a client to=C2=A0show your UI,=C2=A0but it=
&#39;s not really great for a &quot;desktop&quot; experience (but I never f=
ound that a useful=C2=A0experience on an embedded device outside of demonst=
ration purposes). It&#39;s more or less a copy of a similar system I use in=
 my day job and I had lofty goals of removing our version for the upstream =
one, but I&#39;m beginning to think this is an unrealistic goal.</div><div>=
<br></div><div>Regardless, if we continue to use weston-init, we probably n=
eed PAM by default - not because of weston, but because of weston-init. Alt=
ernatively, we can do something other than weston-init, but I don&#39;t rea=
lly have any idea what that should be, what it would take to switch, or how=
 useful it would be in the real world.</div><div></div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
regards<br>
Philipp<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240546): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240546" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/240546</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120174368/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120174368/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div>

--000000000000ae9d430656b78a27--

