Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683BCC54756
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 09:13:23 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.9300.1724836398052428592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 02:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=flAyCZKl;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f025b94e07so59661161fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724836396; x=1725441196; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+vbuNqDiF7KiUPv9RQoj/vsXToBQkjEmsYVsPTnwCPI=;
        b=flAyCZKlY4lZ08ERO9doG48hRQYZvcnAMaoM2oIuwlDcXX/KEDyi9u8oUiX/h9fl8a
         bMWs0mKBNVeP5GFjwUS/nuEi0F8LYQmvH0yWAusNc4e+gvh44gEJrjHt4+OsTsEtQhG3
         SY0xgNJyu6dYd53HtOfC922Ah8vqX8QHO/VIEE4t896xW7H5kA3mXuTSDhU26Tm+fV63
         p/C+DXNmr1Pv/2SsxRJd8mvKmGuFmdZQshbRCCtRIMsstFEXcUwftrK3peONq1700sIR
         lJgJyyisgY1Wqk5iu5nH/3xMSwApIzWDNdCHWAhTHPCieVrXmW4HKIXG9JejUfraSki4
         xh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724836396; x=1725441196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vbuNqDiF7KiUPv9RQoj/vsXToBQkjEmsYVsPTnwCPI=;
        b=jAqiPYhUt7Et1Z10Jtoal3DKjDJulSrhTrnIf4RHUw73cwR+yygDaGPZkRZhZBnZue
         EvANAlQs6nVor1zvrpkak/vDfch/vvEtjLi92lW8v701bAmAPmxI8GDw/S/PwQZfNc6i
         48fAgFb8iPVRJ6AaZ7qfth2RUc5Sg7xjQe7ny82sY+Or/B41a3VPMjCIxAwJLDHwB9eu
         cWa5aJPxiPgMIm6shy1bfsd3WBMz9CtZNHaqcIikHQnRVdf/k5Jjiei4sycKlyFf3dij
         qQeK4mH9enMuypLszPz/0TdMG3eFfGqr+cLQ/MfAsyrVXHt8UT3ZhWiaSw5ZYDP/Nng+
         MxzQ==
X-Gm-Message-State: AOJu0YxonKmgLhCpUs8SnD7pr1eh5W24eEuYHfK3jgH1gYv9MYiqIsrc
	dt6/HZvXfm+LEMxfOAPq/Kh3w4Ek6B7gcfqpXDRQdR7TSbwDz4w9zLjjLQu3A1cPV59D9slJszr
	Ev0yFOAZlaIiL19Pq0qCC70dmAyE=
X-Google-Smtp-Source: AGHT+IEwEjEBU8Vxo0i0Tp8wNE62Hk84ouK+xufRncsigVTNjndJMRUQ4Q2RDhcfePkJ4fUhskNcZ40SXftiTTIdDm0=
X-Received: by 2002:a2e:b8c4:0:b0:2f5:11f6:66c6 with SMTP id
 38308e7fff4ca-2f55b684da2mr9715651fa.13.1724836395462; Wed, 28 Aug 2024
 02:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com>
 <1724833600-2270-2-git-send-email-wangmy@fujitsu.com> <CANNYZj9SxQYZz3HUNzcS4EG_h9WYOPu_X1xW-MJXdmRkrJd8ew@mail.gmail.com>
 <TYWPR01MB118613A796F30E757B5ED7D10DC952@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB118613A796F30E757B5ED7D10DC952@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Aug 2024 11:13:04 +0200
Message-ID: <CANNYZj97bkau5cdSNM+BEpz5zypqmZULATFBFz9izfiCNvfAcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] util-linux: use update-alternatives to solve
 conflicts with lastlog2
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 09:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203875

On Wed, 28 Aug 2024 at 11:04, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com> wrote:
> I found that the lastlog2 have been merged into util-linux:
> https://github.com/thkukuk/lastlog2/commit/60bea9dcee0fa18ea3dce0372a14f5e4f177ada6
>
> There are two solutions:
> 1. delete lastlog2
> 2. Add RCONFLICTS option for control
>
> Which option is better to choose? Or if there are any other better suggestions, please let me know

Option 1 please. Send a patch to meta-openembedded that deletes the recipe.

Alex

