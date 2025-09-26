Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D17CAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 09:16:40 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.13181.1758878198312608962
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 02:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TIWnZP9t;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-78f30dac856so16210256d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 02:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758878197; x=1759482997; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEK9wvLHYQlB2nBMLze7QfpwqRKmFXU368vKLIeR7Yo=;
        b=TIWnZP9tZOv73VUScp3Uva3U1vYE6aLTXH+5cvpqsxGZLrYvrPqneYiS75EvW5QbFr
         7YXup5BSlIsjnDxv1AkYQe8pK4HJVkF3VLz9WTBhsojhdltP/OxmBfQIAH8uHqUVMYX/
         1WVS6ykowPHrY4etcHxS+IglrYw7E/BNg0wxlicT194WAGbgszdtSrQFCX6z10gyEGZ/
         Cjtn130QQkwhtCMwEBBEClH3jC9Tc8holiU08De+mPuTDT5fZztbiHAljq3r14Mh/kKq
         E0gTpb1IuX1494u5A6yAZMP7CFFFhe7dOQ/51hfnfL+QEPVn64s5z8yXEGh7nwAGecP1
         DQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878197; x=1759482997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEK9wvLHYQlB2nBMLze7QfpwqRKmFXU368vKLIeR7Yo=;
        b=LKtmgoXubivXIcI7Evskg6T7ivoqp9LAQkpbFvh08mR321lN2FbDWB3DQB1pR5Nn9f
         4AADPVGUnCRekmYztxdYHcwk+hJjFDJDEypzgEQ4EThzrOuaIvpCmWCFZBZJxrNVPQE/
         Ujx1vEnt9MTHltTvqkM/KogO+O7FMAAidpZQIeMQ0vpRsrHIbKvvC9dLp4Pq4CQQIZCA
         M5ptaiG02PaHVXeu1fQ8VeZWTmzc5YVfyJafAj5ky3cPFNr4ZVOKBYRgWXPE9jjkIcNb
         iod5N0ahTSx532YBFJJpZOkpH8hGEPNHkMvkWxZcILPtIdSr8uZZqecZuXY1IHpF7QCu
         xNYw==
X-Gm-Message-State: AOJu0YzKVuQrQU1VxEG1IYC0duKT4fIwIJVMz4Fd6hTQgIBbjcb7cFxX
	z5tOEjnxicuCIVE5pGMHbBiEc+v09M4KrB8fPUtA4U2ADeTybzHFSIXn0IrdhoIRmt7qLGZfEya
	Bw1VwmLlsM54Euja8/uozuOFm4d3tDOI=
X-Gm-Gg: ASbGncv4D3PCUbKBdpk+2LJX3IkPIReiyu6Pau0vUNB8gQKDEMOg/rRg9MrKOb/9bQC
	KuR5Ezj13baFJIJVMUaB5w2+hz1RyYzWP2Z9a47iqfC7HAkkEx154+vxJBnfU14CH1bhC8lvOST
	HM3tDPfjVjHAAhTEh1z20mRNQLxlB9J5G0O+J0cdiRtEgApovkjNDKMGL3TKf8yt/MnS0fsaiC1
	E7/5f2Ox6Y87oamqjZl0gwwlI9Lz0xMqLhouS0PFlGk6Bs7RJF7Sv4W0fviu6cAF9RuYwfN45Qo
	ZYlwNRzRwQGDtgp2CMfH7RAND8+Cfc3G9Jii1aUMexWshRfjVZM=
X-Google-Smtp-Source: AGHT+IGZ2Doj5eTlRlf9+q0bx6dmwy+igo8RdGbr2ZMy6V5te+vdWZAjnJbq9eQKT/vG3m9eTOxpYeeb0sdTLL3mwME=
X-Received: by 2002:a05:6214:124b:b0:80f:e547:f03c with SMTP id
 6a1803df08f44-80fe5482445mr57675936d6.34.1758878197017; Fri, 26 Sep 2025
 02:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250926071158.3439500-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj-=rkw_rpYXK9FA5wQDbXRXthUk2y_LWRs4Mym+_em6iw@mail.gmail.com> <80e911a6-ff3e-4f2e-ac0d-6f6043d43670@windriver.com>
In-Reply-To: <80e911a6-ff3e-4f2e-ac0d-6f6043d43670@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Sep 2025 11:16:24 +0200
X-Gm-Features: AS18NWAEbVFXYjHw9S1LTlPOBHjk2KiuIwDl8EsA0veczNWHQ9Z55irubU1oMT4
Message-ID: <CANNYZj_E99VW1o5pSJtPAmU_mJXK5HoWvo6Ns1zsN5s5uOcqwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Drop rust-llvm use clang instead
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 09:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224066

On Fri, 26 Sept 2025 at 11:03, Deepesh Varatharajan
<deepesh.varatharajan@windriver.com> wrote:

> I=E2=80=99ve also rebased these changes on top of Ross=E2=80=99s poky-con=
trib branch that splits LLVM from Clang. The rebase went smoothly, and the =
build completed successfully without
> requiring major changes, the only adjustment needed was to depend on llvm=
 recipe instead of clang. Given this, would it be appropriate to send a v2 =
now ? or should I wait till Ross's patch to merge first ?

Don't wait. You can include a comment about what needs to be done
if/when llvm is split.

Alex

