Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8841C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 16:52:25 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.343.1752771143858664459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 09:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LRHqG3Jk;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e897c8ca777so1173915276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752771143; x=1753375943; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyKh2siqfliXF+Oh+tG2Yguo1SoyxDDGnEhcrm+NiWk=;
        b=LRHqG3JkBDJgvQPLpe9U3gVIJ9GCpwhkZLg/pGPlIVCHI6oPiNqC1/9murzYE90wyS
         w17ESH8OCvTM91BDKtwNCL//uMEkwp4NCqbJrpg0weyessCvHveeMDXqt7Jh3LbzrSmQ
         OT4ibXtwV6/fp7cCh8+T8bBSemeyHJtRp6dvviOfWSFBuUI1ZDMeXNnMFdF4r8JhX4XH
         Z9dS+1ZwceBW1GAuVVMbxkMvh4t8YmyESpKnY10pnC2OmSyE6YCsCv0u5ipsBn3uazvA
         CacZDS+cpN2MvWukFZEAeUCCogHa8zn5ClQtk91X0sPettIe2Z6PjYjBRuZ5LAkk22gO
         vPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752771143; x=1753375943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyKh2siqfliXF+Oh+tG2Yguo1SoyxDDGnEhcrm+NiWk=;
        b=dXG1EEQ88RwmNLdk0UU/C4+actNW4rdJyQYP2F+IlziruulPi/kz5oR1gP77ORaFEZ
         Kv0hqfKP7hQYfaOfeVL5HXp/1MOxtQ2kp48y9F8VmuTwfzEw0GxV+LVXxC17OFy2HJcf
         +iTmJg3kDzmDq67TLDJTI0ywFdBX9IkO2/7ThgPl8ktRwyDVqu/AGPTmBkuHNPaD7DWd
         wnsmkZO8hEBgW0CWi36ElNhHAXOn364NEtlJZ7rm+Yoj24oma5Cr5Ukkxbj/7xuCjQwo
         GUK2CrB6WahmdzmdwLM4x92PgHwkJYNxq6W0pFEgK46GU1eskQiQFRk/k692JhvWMumJ
         rwQQ==
X-Gm-Message-State: AOJu0YxELN+TMTBSGYbky8pztYamnmqXwMXiUViC50s8KV8uhYQEj01I
	WuhZCW6YzmT0zIJrEJCdSP1y68bmCywgY6xLNgwCEtKXSIgAcHfUQfHm1BGq9xqzApdH06CkScd
	voFoFudggrkCaiiIvJfRYuBVI2DGmMvw=
X-Gm-Gg: ASbGncsRm1ZpN35zXR7tWyYuOZKzXqePDB7zSE6DS0JvOTCTHWfngJJcRLbH6d2Z+zl
	gfg11ccHK5Bj7UV54O0ZkejDTJ3g54eXY0sVojhKAc0twRxkhFSwEtaEyT020vBf1jgd5xBeZEw
	gGjnImBq1Qm3iQq9b102eurDSIxJ6PtLyf9VL4o3LI5rE2gM+S8TbnrJ6v9os1qXgCSzei9wqki
	WjZyw==
X-Google-Smtp-Source: AGHT+IGKlEJs1ZpTw6ax73G5HNbjqtJkRCrolnbICOsWMc4OXYmx0VFvMq+SdSR3pS5yoEKUra7M+q7+mP7x8j7BbmU=
X-Received: by 2002:a05:690c:64c3:b0:70f:88e2:c4ae with SMTP id
 00721157ae682-7183517be47mr117778527b3.37.1752771142868; Thu, 17 Jul 2025
 09:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250717134806.2790027-1-ross.burton@arm.com>
In-Reply-To: <20250717134806.2790027-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Jul 2025 09:51:56 -0700
X-Gm-Features: Ac12FXyj4uoObRkjM48_DcPF68wBrAe0ALQLtVdqYctHnMwKX91h_p6-03pnM4M
Message-ID: <CAMKF1sraynzNOe77+q4L1JNgcscVfaCdOzmpck6Tkn5GVVM+6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] cmake: remove CMAKE_SYSTEM_* from the
 native toolchain
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 16:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220554

On Thu, Jul 17, 2025 at 6:48=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> If these variables are set explictly then CMake assumes that it is
> cross-compiling[1]. We don't need to set them as the default values as
> detected by CMake are correct for native.

makes sense, I think this is what I was fighting against when
compiling libmusicbrainz

>
> [1] https://cmake.org/cmake/help/latest/variable/CMAKE_CROSSCOMPILING.htm=
l
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/cmake.bbclass | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmak=
e.bbclass
> index 449fe2bb443..0bb0f33a9ec 100644
> --- a/meta/classes-recipe/cmake.bbclass
> +++ b/meta/classes-recipe/cmake.bbclass
> @@ -180,8 +180,6 @@ list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${=
includedir})
>
>  EOF
>          cat > ${WORKDIR}/toolchain-native.cmake <<EOF
> -set( CMAKE_SYSTEM_NAME ${@map_host_os_to_system_name(d.getVar('BUILD_OS'=
))} )
> -set( CMAKE_SYSTEM_PROCESSOR ${@map_host_arch_to_uname_arch(d.getVar('BUI=
LD_ARCH'))} )
>  set( CMAKE_C_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
>  set( CMAKE_CXX_COMPILER ${OECMAKE_NATIVE_CXX_COMPILER} )
>  set( CMAKE_ASM_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220544): https://lists.openembedded.org/g/openembedde=
d-core/message/220544
> Mute This Topic: https://lists.openembedded.org/mt/114203429/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

