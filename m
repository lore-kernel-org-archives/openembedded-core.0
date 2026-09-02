Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF8BC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:48:59 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.392.1788364132252089349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WChEENW3;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90cd1012479so24188686d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 08:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788364131; cv=none;
        d=google.com; s=arc-20260327;
        b=NhLNB+1e0B5hVv4M+4WrIJZ5CXA9ZbucY+4Mn+/qXbTLzfQiRA8zEbNEHGfiP7eeYB
         /Gr4K4QhCWZ06noIl8QGJNadlm1PJi/2GYbb4/dqlldwBEBQMCqaNSQIHjdOdRg5fg45
         EfKawgo2W0aFJh6DPfS8SJwnq1p3/U2buboW20Q8BNE73nLbfh3eg4HAkdtnqLFcxfWM
         Kf5kgNgdAEefW/xFEjWK5dI/9yX8b/iqSBSqq8HRVBfkbkaNg3hnF3XalzKOLlIuTqU5
         0fVxnSm7dtn1zChDV+6Y2OzM0C0tq5bWLQuapWPPP/wpXU+zWhtGxUlwTrh+ovFKp6P1
         E1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8+NUvzK5IsC3o26OI0Mo/whvDAw97f5leg407dAZa1o=;
        fh=71abzk+jWAeDPl3/3yNVuuKHJ8SDtwNAJsLUXfSZoz8=;
        b=W+wojyjEYpJheVjh21eDujB5U8Aj3B1I1RhPBwF+0iZ9zjf62GCXNdLpx7Xd2AWhvb
         59QkC7u21by8k1pDT7Jn4TzMUA+9Nup4hKOHTutAj15Rpxr0w7jz2Z8UAS90JVMBmgUk
         mqVqyBFU/SmFs2Hq6jy437FIPy+f0EU7dt81kqfOcKurNYWbtQ1tSIsGIGsophwvMzUU
         LAfGkyJrA/vNDrPmZ2djzrg0ktgf2Mu80liKkwa3OLOX6DBEMFw2kxYqo5ZxuvLmm6R8
         2NTvVs8vDMeAFsgwjtQIN5aRs1I/0hN87k8i48D+4jAUVQEuv5pYt824HAxqCQbsbaId
         uUhQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788364131; x=1788968931; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8+NUvzK5IsC3o26OI0Mo/whvDAw97f5leg407dAZa1o=;
        b=WChEENW3ylTbFa18Yp727gAx0g6fFXHSjc3P9FEEDsw+zbmaWxJ+vD2zNiI3mZSC/Y
         QvRovz76EfzUEbsPc9QRG/zXpAES2IYyx5AYyyUu6py2zRxMgjkmaoAYafTHhCI1Hifr
         jNLnfYE/Rs5/4bfkozW0lTNw90n2ESALOq+YJYx5hiILtmtiriweZXSEnKc0+A1pl9hD
         qLJZAfRQfdgoMgmIaVIdN9dQmdudkzFveI0MDibVlMw6GianNCWab754IZ4iSQ4Wqp20
         zBIXni9XU5rYhbiVzZGzrirrvmfHpAVAnanjiG2oejZFPCOnUXMurTfJ1y8oaagqLDgd
         SUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364131; x=1788968931;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+NUvzK5IsC3o26OI0Mo/whvDAw97f5leg407dAZa1o=;
        b=bgUqY2ELUaAh0kx7GHDvrvyAbqUmTYaIfqM3rGUzO32THYWsTk2TzMnq6l1HTHPn2B
         Gn33xoQLtFPJ5yTwC+2uwxunOF1Vs+QCeaOK6/KCNKo4AHmlvsn4oPKzBSDzuFegLnvt
         8+KCHBo/mdHzrKni5ywcq13lTi+IxTAreVewgcb078YHQXN1zv5CgXDm+liVYOjh0mHs
         P3WiNuNDuFH5sl6tSvab1UnjOfYXJ+4CvT3E5jtO8LU17xiS5qFkmL/5V7GOg0f5a5Ct
         vyP2YtxRMYeou0mp5QFH6nWX9MBTtJ9c5mlGQ2FDlP4zcQj6uZaglVp0jAXjnmuJnCMc
         adqQ==
X-Gm-Message-State: AFuF++lMdchvWMjbAtnImcFF2axcRplu2qBWLVJg6DeNt4gMSqK5tF4g
	vA5Di1NGELQMrBF/wr3YOY1Yd7nq4EYkjLsfoWD7CQdrkrtYCLA0JaePE1xoh8wEnZzkMefsMof
	9EDtDCoiFRGOb+CwuylDhWhflxCKswN0=
X-Gm-Gg: AR+sD11g8F1a/NuaSD02byF1rWfs9XVXIWeVkqkfZF6XyewAOso3/YEjnkKKKo7RzvB
	lo7p//+6y7pnx1gKrno+TC/ygIXkpVSrVjsc+cuW3zlC+sTYsvRxWH0VJRsoDarUnvHibg3DkkJ
	GSNLOeFe0SnxLnYcQaK6sx7pXw/NHG92YIP2mX9sWz3Rr6ry8NlakQsFQTuphHCsnz5ZpRcAqd5
	liLYODmll9i4SnnHKPQtyw4HGSh+FHpzM562a50qcNduItxGG/RvrtD7s3bkJnodeWM22DZAqHh
	m3T3Q8+uOPficuVtB2XP5RsRgNDkDVEeijBBackQ6jxhs8OI5W770LNQv1u+dN8FhB7Z0o0TsAz
	AnNA=
X-Received: by 2002:a05:622a:4d8d:b0:51b:fb5f:b263 with SMTP id
 d75a77b69052e-53042f6fbacmr2110931cf.4.1788364131053; Wed, 02 Sep 2026
 08:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260902083814.3966089-1-gustali@axis.com> <CANNYZj-U2CMMmb51x2phvgMwT5O+dPh+OrOu4hy=GjAjezbO2Q@mail.gmail.com>
 <DBBPR02MB10462218FD1B6135FB85DC4B087B72@DBBPR02MB10462.eurprd02.prod.outlook.com>
In-Reply-To: <DBBPR02MB10462218FD1B6135FB85DC4B087B72@DBBPR02MB10462.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Sep 2026 17:48:39 +0200
X-Gm-Features: AcwNN1WLTBxM2Cx9dYMaIscJDftfV4HzQYn9R_e8ba5o-QnjghKcpw9d4OvLvao
Message-ID: <CANNYZj-U-aq+tFW0VXDEhnFvgV=49ckEBL4Czg=PgXa+3v4MqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv6] boost-asio: Add recipe
To: Gustav Lindberg <Gustav.Lindberg@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244982

On Wed, 2 Sept 2026 at 17:11, Gustav Lindberg <Gustav.Lindberg@axis.com> wr=
ote:
> Making these changes upstream would require everyone who uses boost to bu=
ild the boost-asio shared library whether they need it or not, which would =
be wasteful. Note that my change doesn't require all openembedded users to =
build the shared library, it's still possible to use the boost recipe witho=
ut the boost-asio recipe and get the header-only version of boost-asio with=
out the shared library. The point in making these changes here is that user=
s can decide whether they want to use the header-only version or the shared=
 library by using the correct recipe.

That's not the preferred way. The better way is to keep everything in
a single recipe, and enabled the shared library (or not) with a
PACKAGECONFIG option, ideally one that passes down a command line
option to the boost build system.

Alex

