Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179C2C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 07:06:28 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.54386.1715583984396238104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 00:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KEBD5xgU;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51fcb7dc722so3769537e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 00:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715583982; x=1716188782; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACp5Mnf3Mm4noZxFf6aAipJy9lrzxTGP1Z+xtmilzYs=;
        b=KEBD5xgU6auD4EdVIFLItz2al4Jx2h4REMsrpZo3uhV0pj2PjIwxgoisKcrGOBF1oY
         jHVst3pbHEK/7/7VqcVqyqVjle2Ypv0nW0c6PlP3pMPTYskImUTnHBYuLENGuOmfsk92
         sKPFkrVL3kr8AZycIr/Fkoh2qWx+eNGl70agNTZBEkdLbv+/u+9hq87YRDNeLRk1HhIH
         N2vKhvjDTwIEzJwKswoA3hOQTiE9WNPjwEk/fIZj8mxsYvrDWFn7lrClo9NIo20eP+yU
         a0ltDa2n1tQ/CXqOXtY/M3V5r46G5DmD0FMdS92cV1iYmMzjYKeKT00RKB//cOXymTII
         8Q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715583982; x=1716188782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACp5Mnf3Mm4noZxFf6aAipJy9lrzxTGP1Z+xtmilzYs=;
        b=PzCEt04pAvwNSMzoS5g2PosPWG2PbCBDBftHGccy1ALoYxXZwtP4iGQL/r0jtnK8Rc
         VPd/aUI6PfP33rdFv74d6qTN1gOsUgKNvGCo0WQsKUQ84VFQvQkT5rZS6lHh0Tln/MoZ
         fUzyMIszQPsGEONLjtj2wBwU+AeYs4u53U9/wL5dOKXMCVVN0SGm9c+Kt3nSxbC95KHA
         0XLNfuMpZhIqHAE9eLy8s2xGoUveVltRkCgQpcj8tHiY5t2d/wh5ThmmHpHQxn4rzw3w
         U1P+8Rnlg78/PkpVRZwofMvkzkU4DrJ9K8l3mWbsOxgaYqc5YRhTFJkZCi2qV7UhtO3R
         Mqtg==
X-Gm-Message-State: AOJu0Yyvquh5zdP8upWk7QUBmD/yO7u3e9wgOD18emya5QhLhpGLfvLP
	ptdWQ4X2YoJ6Fkdr367HW3dWDtZPyoYdAa52oAwdpHQw/z4Oxcn07K2mcX4tabpDRq3aHYmITnX
	sd0KLOTGrO9Tjvr2ongJKC6V3gsA=
X-Google-Smtp-Source: AGHT+IG8XNMgSX0A60iJ2keSN0jobWhDHwREsv5MDBtEG5SlSRSNIZHP50VyK1by4OxBvx6X4ZngVinDqKr4uZEb51Y=
X-Received: by 2002:a05:6512:2116:b0:51f:25f8:7757 with SMTP id
 2adb3069b0e04-521e155a1afmr3356609e87.32.1715583982098; Mon, 13 May 2024
 00:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240511162231.4102212-1-raj.khem@gmail.com> <CANNYZj9yKE4RAUqqZic6v3jSt7Q1bmDeE2MGBmyHOxUN0-2nJw@mail.gmail.com>
 <CAMKF1soUrT2TNoSJG7hmzdAcKa-jmvrTyUh_YHdfEcEPKqg4Ww@mail.gmail.com>
In-Reply-To: <CAMKF1soUrT2TNoSJG7hmzdAcKa-jmvrTyUh_YHdfEcEPKqg4Ww@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 May 2024 09:06:10 +0200
Message-ID: <CANNYZj-U=zQqHj6WHmghXRTF1Vz-s68LrErXtoK7g9k2KGA75A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] valgrind: Upgrade to 3.23.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 07:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199224

On Sun, 12 May 2024 at 22:19, Khem Raj <raj.khem@gmail.com> wrote:
>> Please no pending patches. Submit here:
>> https://bugs.kde.org/enter_bug.cgi?product=3Dvalgrind
>
>
> I am aware of it and it=E2=80=99s working in parallel, I guess it=E2=80=
=99s better to submit it to Debian or arch first and get it tested there th=
an openembedded perhaps.

I don't understand. What is working in parallel? Have you submitted
the patch or raised the issue with upstream somewhere? Where?

Alex

