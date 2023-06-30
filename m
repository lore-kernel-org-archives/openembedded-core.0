Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63587EB64DA
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 10:41:17 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.7907.1688115007595436944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 01:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@snap.com header.s=google header.b=YZrsiwLV;
 spf=pass (domain: snapchat.com, ip: 209.85.208.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51d9bf5411aso1650012a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 01:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1688115006; x=1690707006;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6EkzD3Rx18oNZpNb980wPPmJAAXwjuPlOI8L0m185Eg=;
        b=YZrsiwLVWsAK5/siQzH6aD+twl3YJHRf9CQ2ghFW9E8YLgN70Aifb6Fif7gRW6h24t
         ByQedNlCX2Box9DwLfhoZb6UFX6Tb9ilGpA9Ub/jEy08+5E+yZZv2xa/NSrYf9uSYGnK
         dWj7T3EXHdtcHMtPQscP4nD0mC+8uqLyNMRcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688115006; x=1690707006;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EkzD3Rx18oNZpNb980wPPmJAAXwjuPlOI8L0m185Eg=;
        b=NyBh1RkAnrvDxgE928THYkqJG+rupnLSOlkZlv1viBrMYeyX0iwe5r+Vn4CwUf00fv
         6Ys8Hh/1vadLuB6db30F1L35wepFkXrjcMnJSMQNUOq1+F8v486Cuzsx7JbV5dxrNFeg
         9IzPcPaGgPVJNS/XSFXneZG8hISlNveXc7euurC8D2hIoSjCLUeTcpWeHHmeZ+OXd0Hq
         urACeAzDH0ZxqiWXifT+5fpB3qcTR6jwMiwDKaCOPoljVo0mBKstUYJwNczj7BoyFY9n
         sOPXSid42tCspx0MDf6iXf0U5Yx9Nh6e5ptqBZu0pYbg9faPX67WLg9mLmZGbkoD6vRr
         oFvg==
X-Gm-Message-State: ABy/qLYc7gHgKk8UtO9TJpZzmx/WFdIkAbuK6KWKUUOIFzs2b3qR2Bgt
	SUPTEnEb+XTqGKjRBFHYiE1TmpyPJpfwjAWsyVUGIPO4LdQbx8P6fHe9eA==
X-Google-Smtp-Source: ACHHUZ4Qta+w1CaCbzCFhQHpxkghUZd5H9jhBh/2TM3RqrHjjQyfMuOHTIX45fFWwaC8oqW2+xcNyK+Xt/PRu7Qemy0=
X-Received: by 2002:a17:906:f6d2:b0:971:5a79:29ff with SMTP id
 jo18-20020a170906f6d200b009715a7929ffmr1232503ejb.48.1688115005637; Fri, 30
 Jun 2023 01:50:05 -0700 (PDT)
MIME-Version: 1.0
From: "Etienne Cordonnier" <ecordonnier@snap.com>
Date: Fri, 30 Jun 2023 10:49:54 +0200
Message-ID: <CAHUKmYaD2u05xyrNoGd+8eFFHbFo1wXHN1COxj+TDSmNAkHSXA@mail.gmail.com>
Subject: Backport of libxcrypt fix to kirkstone branch
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="00000000000040c11205ff54e735"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 10:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183692

--00000000000040c11205ff54e735
Content-Type: text/plain; charset="UTF-8"

Hello,
can you please cherry-pick / backport following commit to the kirkstone
branch:
"libxcrypt: fix hard-coded ".so" extension" (
2639746ba7f8a651fffaa9819ef9d9df776108e3 in poky and
7ed6bfa2428b4f1ba7f09d6e9e67c462ff355153 in openembedded-core). It is
needed to be able to build meta-darwin's kirkstone branch with the latest
kirkstone branch of meta-clang.

Thanks!

--00000000000040c11205ff54e735
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br>can you please cherry-pick / backport following =
commit to the kirkstone branch:<br>&quot;libxcrypt: fix hard-coded &quot;.s=
o&quot; extension&quot; ( 2639746ba7f8a651fffaa9819ef9d9df776108e3 in poky =
and 7ed6bfa2428b4f1ba7f09d6e9e67c462ff355153 in openembedded-core). It is n=
eeded to be able to build meta-darwin&#39;s kirkstone branch with the lates=
t kirkstone branch of meta-clang.<br><br>Thanks!<br><br><br></div>

--00000000000040c11205ff54e735--

