Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D7DC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:49:40 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.5914.1741690171596889918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 03:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kxAP0nTT;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476805acddaso23637911cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 03:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741690170; x=1742294970; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XBHrXnySrl4YceQISZkNBUxt8mHiKf5A0oBNWYNbo3M=;
        b=kxAP0nTTw26/MHRRAmxxOSmWvgvxUXJKN8/EHkeDpw2N9LPhWjDSIdKDTf//GRxiz7
         kRdsMmWBHmL4PaSduYcWH++rpetwz7XBhgzlh4Sh+ZrKogFrS0QA9DTMDPKIp4BmJQvA
         vb8WK2umO30yDSqnDVMPkQ3jt35M4LJ0fGxSrhhZHwN4P6kaMVTgJYxcwfivOdttXQIy
         1uGqQxWTK5EtrJKyDQdLfQVi5TN3AByrxVC0KpWpFC8j0UdDW8s2I3D0VOUKmQ4xbXLd
         ekg35fWgIYiuTIx1nGyRjvRwBOcTZPOTJZFv6DecK+iXUmjI8QsNuLiXLtQrYrMBCB2J
         z8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741690170; x=1742294970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBHrXnySrl4YceQISZkNBUxt8mHiKf5A0oBNWYNbo3M=;
        b=IqUfMQh8uY3I2SRW7ECrPg6YS/wqfL+ATct6Ecic/k2G2uLfzEdBx7niWDGbjCo8Ki
         COVWLDmTHqeBf7U8hGCEthNbow/dYdt3enWtQ+XAQMXDOe3E/f0YQ7u43PfkRJIaDonl
         MYZkY5KluHijgMtK7ndtlwr42bYCbmIws+cHBhmD0loUyW67JaHy3hSIu8txEPhVH49D
         Q4NomxdUniEKWjS7N6/l+yrm1AnwXS61nHZprkKmscBfi7FmlQchcQ5OJonkXa8DmYZa
         wen2vVRbxoLSEVsI3H+lEito2fcq+pEDbW3btVi/TwudGs52s8v1CmpF1NrmIZ3ovu7T
         zNYQ==
X-Gm-Message-State: AOJu0YynwmNeY6WCWrZS7PVUORXVrqn40aQbz9MvjQ169zWqW+Tjb9+V
	2NetoMxutyl27lpKgvqFLs1+aH+UcCMVle6WTy0sCsVaFWvlIiYtYVkyh9WTlzXJjX/ZdiFpu+d
	UEbPR4rIf5XVMpYmiMjd9Wo2s7RY=
X-Gm-Gg: ASbGnctwusJZu0A/eff6GewmL5nPoFpcr55lLaK/h2FlIRkETKLh5xHoiP6iXh7YVsE
	tsU7mG218kQUxunKiX4qlBx+fM5cVuXNPLdVdV+32QUMjOyn73xSG1OLdSv7UYLACQWjmI4yNt4
	h0YtBfuDjmfiyPBdr0Y+CHemd1u0THxQhFy9FzFtvvOgTr0Yi6JQJpfnZ4QjtStV49f9USW3Y=
X-Google-Smtp-Source: AGHT+IHx0m+6pPaPxiwGHeY0qKygRzSuAAppcHLJBFDjnBygQcp5fp+vlb9hewcXvFPRYQmfglyTGiQLXQr4P9x/u3s=
X-Received: by 2002:ad4:5d65:0:b0:6e6:668a:a27f with SMTP id
 6a1803df08f44-6e9006049efmr216832646d6.17.1741690170456; Tue, 11 Mar 2025
 03:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250311100500.355914-1-alex.kanavin@gmail.com>
 <20250311100500.355914-3-alex.kanavin@gmail.com> <CAApg2=QaDqX6UngNosZqkiAQiC3iKo99-gx63DJPUq-h3SFaXw@mail.gmail.com>
In-Reply-To: <CAApg2=QaDqX6UngNosZqkiAQiC3iKo99-gx63DJPUq-h3SFaXw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Mar 2025 11:49:18 +0100
X-Gm-Features: AQ5f1JpVXZEVmvRFIWPCRGg1wLcSnyrMbYfABlbu5yZkV40Fygvriv8xbBNHa1Q
Message-ID: <CANNYZj9FPonC00f=js4pDaan4Fm5fqyA1WDmJo8h05nxK4hK3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] gnupg: follow odd-even scheme in upstream
 version checks
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 10:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212558

On Tue, 11 Mar 2025 at 11:42, Marta Rybczynska <rybczynska@gmail.com> wrote:

> Could you maybe add a comment next to the version hash saying that the project is using odd/even
> convention and that people should only update to stable branches? At least it might avoid the error
> next time.

This change is not only for version checks, it also affects version
upgrade attempts with devtool or AUH, that from now on would only
consider even versions.

We have many other recipes with this restriction, and generally people
don't attempt to manually update to something else.

Alex

