Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E483CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 15:45:18 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.20026.1758296711748543179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 08:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NQZxk+sx;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5797c8612b4so1842983e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758296710; x=1758901510; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aO6y95ZMZonPxJ4kfMFAWu+Y5wMNLSuZMOEdIy6T7Es=;
        b=NQZxk+sx+K5dOWNgKE+E/Gxd41RIJel3mGLeui3MLYfR9o9JHN9NwjTN0eqOfGfjT5
         Y2Va+TPj86gzPdPf6mUxcv5Yj6e1wiooxGuSYR6jeqN+kCduWv/qPg9rc9Vpu/AjLoK9
         uwgQrC6JUmJ812OmLZyy6kRgLccRcl+EK/MQX4CYUuBP4OSmkBlw5pfx2QpCPLFOTr39
         U+/EG2vbHFUCbpgEHCaZ3Y7mFSj40NqV3W2gM/WWpbPPPfNz0w7qUs0sehBvs3fb7Bt+
         G8YWHqfYukLJbPZCdH8J+9Mf1fRz8qlRHMKB/WZK34LKldT8AEhX3HZhAAFk6ji6W+D4
         0iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758296710; x=1758901510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aO6y95ZMZonPxJ4kfMFAWu+Y5wMNLSuZMOEdIy6T7Es=;
        b=tA4qTdGK5dqx9idX5noUB6lUcp4N7Kh1LdV3JU0nrJiHnpmVnBTUi6PdC3OnY7hdGs
         IzsHjUAGs83n1Mn9Ia7KMvjc+PjQ6WzrsJ2gfNsGPKi0pLRWuJ08hak8NSK91RvDglt4
         yhMlJInh0Gs5L/Yy+SNlifKoZgKxE4Yd9DALRszA9S6uHzmblauCPEKSss/gnPe+9G40
         nmDbDPMzLDbmFkpe/mkhjaz6X3T/1lS/1aBeLiev0GJJh9MdY7xXSVH93FQAN8i0FfWU
         A1SLah1APdH/rKrcaliO4fK71l/ovw/NLv2r3HiuVC2USttHfzOk8QkhI0jjp0Cp5x/a
         4YXg==
X-Gm-Message-State: AOJu0YzSfqdoosco2qcFJ4lagKYTBepmRVt5Mb5y4QPfx58vLb/5Wh/V
	cENQ5acrqMHub/4ygyNAQK6+Cv4YEpLPoKbBzsoH4zY50qQtqxNBNg7XpB0WvjcOVUQ0nc83I40
	mqNs59FiF5yDdgefrowBtoK3+EjrHIEc=
X-Gm-Gg: ASbGncvY5urADLacBVxNd+Bpb0OwzoxrxdWS3MKQocR7qwjRfpUuipwyJvzDVDJlBC9
	zGfEdPQBgFbNYCSr+wmFFUwaZlwACLCT0AvpO2ktY2nxy/GW4BHTdW4+3TjDv3qBi81zIKzwgeQ
	SpBDcghCZybQYxvvfCrhnSDlbdw4oZlHqqKq+fMFFLRnp0CS1moyTfac/mZOiyYanNDiUYZIBb7
	h2EbP8i3g==
X-Google-Smtp-Source: AGHT+IH7npgK7+OVFJKZE2WjD30vyFbwUtLADy2n+6PhD4lpiwAbzDJs/fdngVWKSf3w4BSih664laF6YnLd5DIXkKU=
X-Received: by 2002:a05:6512:12d4:b0:57b:234f:52a7 with SMTP id
 2adb3069b0e04-57b234f5788mr124875e87.34.1758296709493; Fri, 19 Sep 2025
 08:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250919135123.4177466-1-adrian.freihofer@siemens.com> <20250919135123.4177466-3-adrian.freihofer@siemens.com>
In-Reply-To: <20250919135123.4177466-3-adrian.freihofer@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 19 Sep 2025 17:44:56 +0200
X-Gm-Features: AS18NWBbebgyIFiHhdS_0FiMu9xKB_187iHrYbgYIwUhXSCSIECbTovhm8Hgpbk
Message-ID: <CA+chaQdPuhemJ+2xCi-ztiuaS=tZKGb8Y30HFULrBw87DbL+cA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 2/2] llvm: fix build with gcc-15
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 15:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223757

On Fri, Sep 19, 2025 at 3:51=E2=80=AFPM Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Pick 3 patches from meta-clang's scartsgap branch to fix build with
> gcc-15. These patches are already in upstream llvm but not in
> 18.1.8 release.
>
> Note: the patch 0039-Fix-build-with-GCC-15.patch from meta-clang
> is not needed as it targets lldb which we do not build.

LGTM, looks like all my builds on host with gcc-15 were using
meta-clang, so I never needed to build llvm-native from llvm recipe.

