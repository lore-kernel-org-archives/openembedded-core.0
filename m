Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BADCCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 16:32:18 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.705.1760459528610818367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 09:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GHJqnMo0;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d6014810fso55241397b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760459528; x=1761064328; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EK4OfbWhBjyuDecJGEm3/uHXyJjGNi/c5WcquYRDwAk=;
        b=GHJqnMo06zEFpwiMxxgTmm46SfuNf/LH6PquvV+O+tdiGhiEzLC96I03NVBF4fHbGg
         qVwBEr9njzKqPC11OaOT38CHNiU3EOcqe3mMzv0zGjGTrxP6uxPBpe+1yx5G1Gp1YJid
         K3AIPyrg9COlUl3GaKlxvcGANSqWCYwWZa7uSOkNUrKQu7nBSSzXAa7hTdD/Vmho3vOs
         +v3Hs2RbldBaYNBgmKyrm77/EmBjNR1xaToQbFORDr51CEHvPLxep/fMaUjt9rPnLeaH
         /sBJ/a/otcMTtRRjxb2fJ80J03eSVQ80rxc2gZ5hbzm+QKXTTQ93bIWk0DHUmRMp7vee
         ZvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760459528; x=1761064328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EK4OfbWhBjyuDecJGEm3/uHXyJjGNi/c5WcquYRDwAk=;
        b=GJceH0sy+lTZUkwvKBPUjnCoWC7+WEFmNoS7E1T0TRzOh1eVQWqts3Lt77f7ukpUPW
         xCYa1oCl1Oupmjwx4Z//lC9NWFZhQest6KZreDRSqTiw43AiQQZuIU1CNPju12AtcWTi
         zGAdR2sTrfpz5GLAH1uIUL8uqF1l1aRXtsnvF+8D2nqklhzg0465/oOabnJzndceb2Cu
         J1vIYLellBBtJ/lEPb9lLocgTnveGlRQDXAV5KXyEwOqLRStdHthBBP3RouWcvumnZ6p
         w3jCTr5MQeVqTSNVwcBlizsJ5KZAvhSj7XbSN6JUNN0uCnnI9RfIMqs++JQW/7pJ16fk
         MqOA==
X-Gm-Message-State: AOJu0YyZkuurlFUUTEM6XxzSz2UK8lQqiH2qRKhD89Fxd7cA4ZcLWp8g
	Umo+zMgjbcdARrBGbeNd4WfWqMikfWq5ggbbMcryqfNn9oI8TSdB7cPzoop3jhdHovrHTCDccW3
	6VngvX676hO7yLfP3g671BJJZ6jH3BQE=
X-Gm-Gg: ASbGncvvcA6F5R7nIpp/M5qLpPFpg5Abtn3qYrI7QXIymETE6iZjiJKvcLAb23qNy5Z
	GxrHxtVYyTEstaKqHtwjbVV4omk8lm0kK84eu5QfOA51t0aadqrsqz7Lr1gldAl1satTr0dzn0w
	6FXpYTsPltueY9rPF5WQsG7HZV3ex/7lzceb7E2blHCGbUfbR5mqtOmggqeHAPhf7iENpaHOlIs
	OCC0mI+9a2H9uDKc0JuBSwndXB+lSVh6tpj1Fuj7RsXOEuL3wn1WGT7mG4ieoQe0rmBogYTanzy
	GTA=
X-Google-Smtp-Source: AGHT+IFDm2l5m2W/RNCbdLB3LkHaSehYVL/n0sembkw2btvXj9m4/ZptXC0jEKfpSjAOymSSgzhqCc/4p4xVrxtVw6c=
X-Received: by 2002:a05:690e:2c3:b0:63c:dd26:331 with SMTP id
 956f58d0204a3-63cdd260bb7mr13951473d50.10.1760459527553; Tue, 14 Oct 2025
 09:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251014135606.6328-1-phanirajkiran.a@gmail.com>
In-Reply-To: <20251014135606.6328-1-phanirajkiran.a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Oct 2025 09:31:40 -0700
X-Gm-Features: AS18NWAzMBK13nJEDmJgUJ3ho9Elys0lENHvmLi3z9rkAw44p4WNyL2X7ZBzrxU
Message-ID: <CAMKF1so=KHn485wZ=GGsiYCv8UD7j6JTQqMVC09Ft0zkiBy+UQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Author: Mallapuram Phanirajkiran
 <phanirajkiran.a@gmail.com> Date: Tue Oct 14 02:19:57 2025 +0530
To: phanirajkiran.a@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 16:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224842

On Tue, Oct 14, 2025 at 9:13=E2=80=AFAM Mallapuram Phani raj kiran via
lists.openembedded.org
<phanirajkiran.a=3Dgmail.com@lists.openembedded.org> wrote:
>
>     [scarthgap] musl: backport fix for CVE-2025-26519 to LTS branches
>
>     Fixes [YOCTO #15932]
>
>     The musl libc code in LTS (Scarthgap) is missing
>     the fix addressing CVE-2025-26519.  This patch backports the upstream
>     changes (or applies the required fix) so that LTS builds include it.
>
>     Reference:
>     https://nvd.nist.gov/vuln/detail/CVE-2025-26519
>
>     (From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)
>
>     Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
>     Signed-off-by: Gunda Swetha <swetha12g@gmail.com>
>
>     Reported-by: Cristian Morales Vega
> ---
>  ...1-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2=
025-26519-to-LTS-branches.patch b/meta/recipes-core/musl/musl/0001-musl-bac=
kport-fix-for-CVE-2025-26519-to-LTS-branches.patch
> index 3f0b14a5d0..4acedb34ef 100644
> --- a/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-265=
19-to-LTS-branches.patch
> +++ b/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-265=
19-to-LTS-branches.patch
> @@ -1,7 +1,7 @@
>  From 7ee0592397ea0e3d4b47018631642864864d443d Mon Sep 17 00:00:00 2001
>  From: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>
>  Date: Tue, 14 Oct 2025 01:40:45 +0530
> -Subject: [PATCH] musl: backport fix for CVE-2025-26519 to LTS branches
> +Subject: [scarthgap] musl: backport fix for CVE-2025-26519 to LTS branch=
es

This is a component patch, there is no need to reflect the yocto
release branch here.
you can specify that for the patch you are sending for the meta layer

>
>  Fixes [YOCTO #15932]
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224840): https://lists.openembedded.org/g/openembedde=
d-core/message/224840
> Mute This Topic: https://lists.openembedded.org/mt/115755456/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

