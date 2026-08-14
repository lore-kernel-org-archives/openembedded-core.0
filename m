Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F3BC5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 07:13:28 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7961.1786691604480619234
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 00:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IYCHgDgP;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-836ccf53ef9so5930117b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 00:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786691603; cv=none;
        d=google.com; s=arc-20260327;
        b=pPfbsdG3rWGFDA88RkRw3XN9zWTOlRvH52shCfxqXRER8djkp76f1zcyC2OfJLQDpG
         3D6k87J4l760hRdZiLXucUo4yagkdGgR9eBDn3iZWwFR5WLXtO6JpbIXHvGqpSkRHhng
         0vzR+0s/0XBnJZ6rgY768qE71L3NNOH0zxCWJlqFI9NAfVEeGikchDNMglyFS3mEZ+M2
         Ij4kIhKwiYuIyNikVzJgVQ4dNzTU5BKiZwMzv4aVZfIzNVwpTAj3QFXIF3S0TDA5tmKS
         +M4EgXm/lHXmSw8LdHcG+RDgIblkOMSccXIXO7EQopjEkpPOLDRa8v+WLWYnyh/Wq5dT
         8S6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z2yPr3GonWHYPF8B3+yB/XKulMXdsMpA3s0TposSiOc=;
        fh=Bc7VRjYxp1iBuEwP+uYYgAFRnFFVP3c8EW7fySjCzvc=;
        b=NBCtbUyWLZrEMAREMHXEgYG5YBjvm28lbMXCu57QUGmayEac5o5b5Gjn7otjvsOK7v
         yZaNZzgYw3Jq8A81oLPRFqQFtFSKItFJlueT0HTeueCWQTOwQdgbTGeAUlLsIGU85NNT
         vZ2kYHMq+JYXyOhl/V4uwiyDZq7ZdylVBddgNWXf+9ZhwR9jAqNTHCdkJCFLmr8UVJDc
         iusLFT3s+IgTrqGyv8VpT6ST1/m8YKSXSNb9vY7lWIpF0fJ1GK0RBBvIuQ/zqQQIpXLU
         yrF/IqmfRkV4Qs4+c2tYMC1Atx7hzxZckOu5YZSGw0RbpQKC3Ey5f0+LNtbVweGYkSKd
         C/Lg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786691603; x=1787296403; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2yPr3GonWHYPF8B3+yB/XKulMXdsMpA3s0TposSiOc=;
        b=IYCHgDgPYdkcilwY0fD4rMAF96hFMFXcGsYvU7mfiGHt+qlIGc7wL9lEvgBgeL7laf
         4zg5J/ZfyAH0f93Sgb2kmrOjG+hAFbTA4y01wsIkC15Nal+mldv1F0SliFzeVKTVwIQ6
         OnrcdblnNq0qV04fgTd3M4QfkZAmfE8gqJkS6KVSKEaGCwfolLZLouzbo/VAWKE2y9AH
         c2yFe0R+E0gwxYq3oCEz+O+FVtEKAZJ2JFVYPkQzoZJar9yl8qfl5jYb8lp5alxh/WF2
         sHn+AAxrNet8q1JM2qEnGl128nMCgIRUb3+GNUkjUxCw+4ThlZhYA0cBo0K3kTSOxlY3
         /aJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786691603; x=1787296403;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z2yPr3GonWHYPF8B3+yB/XKulMXdsMpA3s0TposSiOc=;
        b=LAG38yD8cW2j1+DlQ5Ds7jO2qZIEi+qrzfSIcZP/BDGE0hLSRkjhLh/w3nGMyDVDb3
         o8iPt78j7Coaywo8w71QylfJLaKsMVMmQGvgop97FjDC//ZDTGPgB6uqI52hRgJecs/N
         WMOmOr21xz6RB96r6ONjFSbrXg1wrW3nIF/pA4gT/jh0Jti1OLgRlj37ithOeK3mwSQn
         SEhhcDWpB0fQn/3PLwVdxz7VN6GWt/zx0x1SekRWQIiOhmevnjFRA/W2QtRLgQOjnd1Y
         Nd7CtBu+b7dYMsWlOYXoO2bFql4VgllBqLbedHBUaZoExYLGsAKYA+lORkJaYzJ+09GC
         KGJg==
X-Gm-Message-State: AOJu0YyHC1oIQn3A6CESNXGI8e9sRsD2gwUrsSjtM+10pZH2hfZL/U3A
	0S4bbmGr/+kg0dr/8iRA5VSvf7cfTMtdrwo16G+NRe4G06r35EjFDVbxv0uvkf8Qz88geAXIs1W
	m4bzf9FJp/tFkHt4Xgx9bDPNnonMNQHo=
X-Gm-Gg: AR+sD125usD6sY8aexWVCzkW2/BYayoArCXaQx5i4e3P7NX69s9SS6QpfwnxDfwX0i4
	STHzuGrajQ/3oHbKlgMkdIoXPofUqAppbc7FvxRMqYljx9EF/4yepqKi9zD+yvtddnAI+Rrx6m4
	CkrusKBo1jXwsR5YyunvNiCaHhiI+UMSJEAiZqmCpsWG6kz3TiQv60Ohazsoz8OBxsDa2jotReH
	MNM3Ml2x9uQJhcQfjVqoYmVCIKfJmuqqKJMz7tKMSrv/M01BstBKImIT/muTnQztGMPi4q/Nr7y
	H8IwWqf57suCZIsXGQfqQJE74grsdQdbtKOSqTGE+hAOkdQ+OZCw1/04nHs1JpaVk7/3UlHX5Pt
	CGtGDiBeuW8NZwviQIT0799Ux+ehMpa8zfAHpMXVWXuPwxM3oxRqqJtDKDqAF6NK9DMDd9K9x/Q
	S8/AYE2AoiLMLR/gMQH8vt9albo1MEEbKZ7figziB8HzRUoqiQaIKxeO5Nh7BpUuG4cPIuWBNmi
	fS5twxUgcDFv+9iGXvWymC9
X-Received: by 2002:a05:690c:386:b0:7db:a109:f12f with SMTP id
 00721157ae682-8370ce2bfbbmr13936667b3.1.1786691603496; Fri, 14 Aug 2026
 00:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260812161341.822689-1-f_l_k@t-online.de> <20260812161341.822689-2-f_l_k@t-online.de>
 <CAMKF1spJ66aBORv02hW-gGRm4X1q0mBG1q4V6eHMhCWGOXmE_Q@mail.gmail.com>
In-Reply-To: <CAMKF1spJ66aBORv02hW-gGRm4X1q0mBG1q4V6eHMhCWGOXmE_Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Aug 2026 00:12:57 -0700
X-Gm-Features: AUfX_myqmUKlMywmL-AEZCSqMh_IcPVt4QW6Jx15z6y3fii4a92lCXsxxBiKv7I
Message-ID: <CAMKF1srji-Cwc7_Q7zr6rjDSL8p3sSEXTfXh4zoiOkK6Dg=AZA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/2] clang: auto-derive CLANG_EXTRA_OE_DISTRO
 from DISTRO
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org, Claude <noreply@anthropic.com>
Content-Type: multipart/alternative; boundary="0000000000005981bc0658fc8eed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 07:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243423

--0000000000005981bc0658fc8eed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 6:02=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> I am seeing a libcxx-native failure on debian13/arm64 host building for
> 'yoe' distro. See
>
> https://errors.yoctoproject.org/Errors/Details/962419/
>

FWIW, this patch is not cause of the above error. So this one is fine.


>
> On Wed, Aug 12, 2026 at 9:13=E2=80=AFAM Markus Volk via lists.openembedde=
d.org
> <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
>> CLANG_EXTRA_OE_VENDORS already auto-derives from TARGET_VENDOR and
>> SDK_VENDOR, recognizing a self-hosted OE build host without manual
>> configuration. CLANG_EXTRA_OE_DISTRO has no equivalent -- it ships
>> only 'poky:poky', so a self-hosted host running a custom DISTRO must
>> be manually registered before Distro::IsOpenEmbedded() recognizes it
>> via /etc/os-release.
>>
>> This is easy to get wrong by hand, since the registered id must
>> exactly match the raw ID=3D value in /etc/os-release, including any
>> hyphens, which must NOT be converted to underscores (unlike the
>> generated C++ enumerator name, which requires the conversion). A
>> single typo silently disables the OE-specific GCC-install candidate
>> with no error, causing native clang-toolchain builds to fail to find
>> crtbeginS.o/libgcc despite running on a genuinely OE-built host.
>>
>> Auto-derive an entry for the current DISTRO the same way
>> CLANG_EXTRA_OE_VENDORS already does, so self-hosted OE build hosts
>> are recognized out of the box with no configuration and no
>> hyphen/underscore typo risk. 'poky' is skipped since it is already
>> the shipped default.
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> Co-authored-by: Claude <noreply@anthropic.com>
>> ---
>>  meta/recipes-devtools/clang/llvm-project-source.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc
>> b/meta/recipes-devtools/clang/llvm-project-source.inc
>> index 5cd08d4085..5a07080d55 100644
>> --- a/meta/recipes-devtools/clang/llvm-project-source.inc
>> +++ b/meta/recipes-devtools/clang/llvm-project-source.inc
>> @@ -28,6 +28,7 @@ CLANG_EXTRA_OE_VENDORS ?=3D "${TARGET_VENDOR}
>> ${SDK_VENDOR}"
>>  # ":" separated the ID in "/etc/os-release" and the triple for finding
>> gcc on this OE DISTRO.
>>  # eg: "poky:poky wrlinux:wrs"
>>  CLANG_EXTRA_OE_DISTRO ?=3D "poky:poky"
>> +CLANG_EXTRA_OE_DISTRO:append =3D "${@ ' ' + d.getVar('DISTRO') + ':oe' =
if
>> d.getVar('DISTRO') not in ['poky', ''] else ''}"
>>  # Match with MULTILIB_GLOBAL_VARIANTS
>>  ML_VARIANTS =3D "lib32 lib64 libx32"
>>
>> --
>> 2.55.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#243297):
>> https://lists.openembedded.org/g/openembedded-core/message/243297
>> Mute This Topic: https://lists.openembedded.org/mt/120720285/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000005981bc0658fc8eed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 13,=
 2026 at 6:02=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr">I am seeing a libcxx-native failure on =
debian13/arm64 host building for &#39;yoe&#39; distro. See<div><br></div><d=
iv><a href=3D"https://errors.yoctoproject.org/Errors/Details/962419/" targe=
t=3D"_blank">https://errors.yoctoproject.org/Errors/Details/962419/</a></di=
v></div></blockquote><div><br></div><div>FWIW, this patch is not cause of t=
he above error. So this one is fine.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Aug 12, 2026 at 9:13=E2=80=AFAM Marku=
s Volk via <a href=3D"http://lists.openembedded.org" target=3D"_blank">list=
s.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.open=
embedded.org" target=3D"_blank">t-online.de@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">CLANG_EXT=
RA_OE_VENDORS already auto-derives from TARGET_VENDOR and<br>
SDK_VENDOR, recognizing a self-hosted OE build host without manual<br>
configuration. CLANG_EXTRA_OE_DISTRO has no equivalent -- it ships<br>
only &#39;poky:poky&#39;, so a self-hosted host running a custom DISTRO mus=
t<br>
be manually registered before Distro::IsOpenEmbedded() recognizes it<br>
via /etc/os-release.<br>
<br>
This is easy to get wrong by hand, since the registered id must<br>
exactly match the raw ID=3D value in /etc/os-release, including any<br>
hyphens, which must NOT be converted to underscores (unlike the<br>
generated C++ enumerator name, which requires the conversion). A<br>
single typo silently disables the OE-specific GCC-install candidate<br>
with no error, causing native clang-toolchain builds to fail to find<br>
crtbeginS.o/libgcc despite running on a genuinely OE-built host.<br>
<br>
Auto-derive an entry for the current DISTRO the same way<br>
CLANG_EXTRA_OE_VENDORS already does, so self-hosted OE build hosts<br>
are recognized out of the box with no configuration and no<br>
hyphen/underscore typo risk. &#39;poky&#39; is skipped since it is already<=
br>
the shipped default.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
Co-authored-by: Claude &lt;<a href=3D"mailto:noreply@anthropic.com" target=
=3D"_blank">noreply@anthropic.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/clang/llvm-project-source.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/rec=
ipes-devtools/clang/llvm-project-source.inc<br>
index 5cd08d4085..5a07080d55 100644<br>
--- a/meta/recipes-devtools/clang/llvm-project-source.inc<br>
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc<br>
@@ -28,6 +28,7 @@ CLANG_EXTRA_OE_VENDORS ?=3D &quot;${TARGET_VENDOR} ${SDK_=
VENDOR}&quot;<br>
=C2=A0# &quot;:&quot; separated the ID in &quot;/etc/os-release&quot; and t=
he triple for finding gcc on this OE DISTRO.<br>
=C2=A0# eg: &quot;poky:poky wrlinux:wrs&quot;<br>
=C2=A0CLANG_EXTRA_OE_DISTRO ?=3D &quot;poky:poky&quot;<br>
+CLANG_EXTRA_OE_DISTRO:append =3D &quot;${@ &#39; &#39; + d.getVar(&#39;DIS=
TRO&#39;) + &#39;:oe&#39; if d.getVar(&#39;DISTRO&#39;) not in [&#39;poky&#=
39;, &#39;&#39;] else &#39;&#39;}&quot;<br>
=C2=A0# Match with MULTILIB_GLOBAL_VARIANTS<br>
=C2=A0ML_VARIANTS =3D &quot;lib32 lib64 libx32&quot;<br>
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#243297): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/243297" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/243297</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120720285/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120720285/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div>

--0000000000005981bc0658fc8eed--

