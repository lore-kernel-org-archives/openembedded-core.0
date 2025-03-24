Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DECC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 19:46:05 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.48622.1742845559464241908
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 12:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NaDFJdkN;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f6a92f234dso2699474b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 12:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742845559; x=1743450359; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3HKEwWPfYCSmO+03i0uY+PRtivi6W0FYNkC0B4fsjQ=;
        b=NaDFJdkNZdBmyZeJotwFKx2B8rmEU3ZXp7fU/2gbVCOTrEynFyvF9f3zyEzoFw838Y
         hs4UD5DfRmxbwwN99d3LJS2BxhtYPjgYMV6sNnL/44XYvuM9gtENoTibcIRlo91WHpaD
         PMRzBD1OZN6NTEM8O3uN/996Z4Jhh1gBgECP1rN7x9HzYlKdgEBkze4t/IikvfO2/rKF
         9OchOlD4Xs8zH1VGuD/cKTium/W07sZ5fBXZ4WP3UoDbNjmuT0wXW0w7vGk+j8Nw5SEp
         RwP+3QtgJciPdfdN4hf2aHgiO07XampnNohx2TEL6ERxd/Sh9o+P0uwSf79rTBMArjHT
         BFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742845559; x=1743450359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3HKEwWPfYCSmO+03i0uY+PRtivi6W0FYNkC0B4fsjQ=;
        b=PN/Uu5CNzyoNlRp6OHRXk9pZstqbFhcpnWrnh/RlZNgM1oj7pIIW+P4Y/gzZ5ztED7
         htTLXLikhw5HyXhGOAG1Rp2JNgwKAQYQ6XxWrswXYipKTPN7zkuj0044sQc+SJOyRXLJ
         sHNvyrEcDS7CZaErp0j6+Gn4OeVEaOl5m/Bp9BIomh4tQPissaCjpUhN9I7g+H9bxoT5
         v7KzvoCZlgoeXuFimu6gvSnBMg2RvHymtLaEEgXJ0Ez55uJlUeZjMo3g4oiKNqFRIr2B
         9fsW46Yw4yooBk/WlpOXx62SHtUI7dO68vWcWLpL8RJiINDCc6MCNAkvFJ/MITnqGi91
         Xa0Q==
X-Gm-Message-State: AOJu0Ywa1jiTm/OLtfvdlXqsdA5wcLHNE0En5b2Wa4D7vanNVyn0Jzst
	fhsjM2R+Cj+oX6sgwLHUd0EL7CLoFNIJxI05/sL+TFUlvGNVPIRf/AUgGzjYeOYesbXI3Ir1+Lp
	dXrMPQGtFrZkb1wxMfIk7069s/so=
X-Gm-Gg: ASbGncvsE70IqJhc2U5Cvbmf6U6xbVNtQO0YQs4aaZ8qThzHNlEDahB8ST9ElI+AzW5
	mmUupcazEHH9Yk9CC8wxzUvcQ/wWLwfE/DM2g1mMA1Piz1+7EHUkzyWopaHo6BezimNT/5ywBle
	v4WwsqQ4xWN2a8shvkOIqNYeS0ymK1QEvvVrEvboLvMTlFW+4o78g3ESI=
X-Google-Smtp-Source: AGHT+IFfpIGSRAHsjie20+Ox7KA5Wdj5fSuFlWqU6Nbu91OgH/7YdYVukiOPrJ/zzsAMBJZyQilEZv/1u1SfKhUmhC4=
X-Received: by 2002:a05:6808:6b8c:b0:3fc:16de:c6f with SMTP id
 5614622812f47-3febf739164mr10262746b6e.19.1742845558501; Mon, 24 Mar 2025
 12:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250319093535.3368863-1-Harish.Sadineni@windriver.com> <30508.1742377284114642018@lists.openembedded.org>
In-Reply-To: <30508.1742377284114642018@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 12:45:32 -0700
X-Gm-Features: AQ5f1Jpe5i18_6dW3C5UdselrN4OXvmuoZxWANP6C8in04SjNmcHbpfF4oq40bE
Message-ID: <CAMKF1sr5O+zVRSqKNsirPZ9oytnRqbht_sZup06KWUoWNCGqiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Fix CVE-2025-1148
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 19:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213579

On Wed, Mar 19, 2025 at 2:41=E2=80=AFAM Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> In upstream this patch has only been applied to the master branch and has=
n't been included in any other branches yet. We've sent the backported patc=
h to the upstream binutils-2_44 branch, but they seem hesitant to merge it =
into the stable branches.
>
> This is the response I received from the original author(https://sourcewa=
re.org/pipermail/binutils/2025-March/139987.html):
> "I deliberately left that patch off the branch, and even now after it has=
 had some time for potential problems to show up I don't think it
> warrants backporting.  Memory leaks of this nature hardly qualify as bugs=
."

Thanks for additional context, since Alan is the original author of
the patch these comments weigh in. We should drop this backport from
OE as well since its going to be added maintenance now that upstream
won't have it on release branch

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213317): https://lists.openembedded.org/g/openembedde=
d-core/message/213317
> Mute This Topic: https://lists.openembedded.org/mt/111786120/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

