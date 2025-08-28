Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FAACA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 13:03:35 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.20416.1756386214346734417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 06:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bhq+SovO;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-70deaa19d5aso6150026d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756386213; x=1756991013; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iZO6SpInFPEsvgLj47m46qr8yrn6Adt3/8gvYxZuP/s=;
        b=Bhq+SovOroyxfzUbcnTnFb0t4OIvsrynXpC4gS8wG2lThh4qEUjZa5fH7DCUJPXgkS
         YBvAuO3moSquPzM9q49Dd1sE6A00kkts6awdnyYyA1flbsQLM/lveIBw1qswzOf1XXLq
         9Z/cKB8gNjLZJcVkWcd7fEOCLImBMK8O3+p7cyu7whZPOUWLoGD6cZXt2a2vLguaZUda
         kTc64KXuqaFHfZ5I8uWKLBmyNEGeanwe8Ehb2EzcymLcTZL/LzOLnD1cCstDzRrOOtAL
         P1HRZJbsY8loFKahYseZNnDilEfbEMnMva8F0djQT+8iscxzIHldmZ1zV3qtRfKl/Q1P
         LXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386213; x=1756991013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZO6SpInFPEsvgLj47m46qr8yrn6Adt3/8gvYxZuP/s=;
        b=SoHjpQ54JbWvY5Gpy7rRiy1vc8T2OtdqSzxVzvCsuYrQijeZ1md5qYgooN/kQTIeVN
         L/ZtMqt7qKnD3z9yHoTsuG9R7h827DQpR7uE04G3eEIWM6joR9Fw2Mcvy71twuAknrbX
         pCWUAnW0fMG597owbfZgyloHa9xwLR7DHJF3x4nL5C3GNows253taJR2j6SUhExS/9R3
         lB462ts6pnAS3+EPyNaGFda6UM9ONWQP6S8YIVXIZDbTxFtEcOZDkVJckDL1ZNeUhjHU
         h02aaPXHQo17otv3xsGqCrgdnSqMd/at5FNBnPKFK41rgn4AxOx6NtjsrA/VznwLn5N5
         wBcw==
X-Gm-Message-State: AOJu0YznjRZEp8hHjFzwcnyKtzS/aYXxsIue2G06/KcKyJ1hdRuk5JDb
	dkzu64j1JiSCDsDmYysOOC6k1kyQr6mtfh+F9q5JRiX0B0oeTZJIF3sLD13GhIavqVJB5QWueK4
	+PNkLoStei2F7KCFQCDS4ZqR8P0VfOeXk5Qjz
X-Gm-Gg: ASbGncsIhRN8OaioJuyt8WgQ3nat1HPea358LqSr6fx3+0jqlOC43H+h2b5ZjlCXaSv
	SfZG7snH3sBSnZ/mhbySetucwHd1lUhTJjvxFoPnBWY+Sdx2oRdG86QdJ98WZTOx61hSoAm20fd
	UIxcV4J5jew2v1GbUckI73FNhMYxvrQ2eXpOJiX3PPuEiqRm2os/PVhXlDlapBtgoDHy6HWIddZ
	WchUN4nZp6QJSc0aSowkIKKyhA=
X-Google-Smtp-Source: AGHT+IFTpCJQpdsbcQ8/oyESyVPMsTiC5XmvUYRXtPQs5kuidLHRlR+1D0AO/1ErCiB3YBSzx4WOGdW8UCfHoXRarE0=
X-Received: by 2002:a05:6214:d6a:b0:70d:b3de:ced3 with SMTP id
 6a1803df08f44-70db3dedb2amr237074476d6.25.1756386213126; Thu, 28 Aug 2025
 06:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <29f1bfef-97ac-44bb-b2de-63661a38e814@windriver.com>
In-Reply-To: <29f1bfef-97ac-44bb-b2de-63661a38e814@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Aug 2025 15:03:21 +0200
X-Gm-Features: Ac12FXwxlGEQFvEzYzEnL9jrYd0X23k4_s9eOCxGsI-_g0t-HeBIfETA2QmtyWI
Message-ID: <CANNYZj99rO9YpEUe1_sGBFXiaOA0dgoRMRK_AwgPKkaQWCnhfA@mail.gmail.com>
Subject: Re: [OE-core] Drop rust-llvm and use clang instead
To: deepesh.varatharajan@windriver.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>, 
	"Dora, Sunil Kumar" <sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 13:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222573

On Thu, 28 Aug 2025 at 13:45, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
> We have removed rust-llvm and updated the Rust build to depend on Clang instead.
> With this change, we successfully built Rust for both native and target. Additionally,
> we ran a full bitbake world build without encountering any issues after dropping rust-llvm.
>
> We now add these flags "-C link-arg=-lz -C link-arg=-lzstd" because of this following diff
> otherwise we will get errors during link time.
>
> Setup in rust-llvm
> -DLLVM_ENABLE_ZLIB=OFF \
> -DLLVM_ENABLE_ZSTD=OFF \
> -DLLVM_ENABLE_FFI=OFF \
>
> Setup in clang
> -DLLVM_ENABLE_FFI=ON \
> -DLLVM_ENABLE_ZSTD=ON \
>
> You can find the relevant changes on the poky-contrib branch here:
> https://git.yoctoproject.org/poky-contrib/commit/?h=harish/rust-llvm
>
> Differences seen in builds:
>
> with rust-llvm for bitbake rust
> real    54m54.184s
> user   0m13.470s
> sys     0m1.380s
>
> f/s usage
> 41G
>
> without rust-llvm for bitbake rust
> real    57m51.015s
> user   0m18.129s
> sys     0m2.051s
>
> f/s usage
> 45G
>
> We are open for suggestions, improvements, or concerns regarding this change.

Thanks for checking this! Is it possible to have a conversation in the
rust upstream about starting to use proper clang, or reasons to
continue using rust-llvm? Maybe there's a ticket or you can open one?

While 'proper clang' appears to work now, deviating from what rust
developers do is risky and can cause problems.

Alex

