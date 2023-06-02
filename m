Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AD6C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 11:46:18 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.10372.1685706377089781657
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 04:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IB2AXUB1;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f6067a9029so2417123e87.1
        for <Openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 04:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685706375; x=1688298375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ub7JltWYRclQuIVu/qid6PXj6XrRgV5uOFEWqA1MPho=;
        b=IB2AXUB17OJZSkX5DWi67XEA0MYbJpQ/P2Fy0xfnwY+IIVJsiaExnWk06QsR9VdX2C
         S9M/9WArAoNE/CBWJO+7Bb5lNwnS68bWMk2GoKNRcp02g7PWpJAm2YOusfn9LoaC0io2
         mvQfoNkb9scxsfsJ8aMnj9HRLPtauD9jhGRA+acGyQyvLPF0/JKMI1q9+12tHxD+EYOj
         SQR96LnLZ84yMu7I5A8XhYEsf4R5lccPeWc/TfhnwO453rR2SYZJlI5MW7HTxnLfaALn
         TXBhA9RyBS1B2ZknInqpqtdYWXlGCABHl7mPn4nT0MfJLVQvdBTmZ5yXiirTS9OjyjVe
         nbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685706375; x=1688298375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ub7JltWYRclQuIVu/qid6PXj6XrRgV5uOFEWqA1MPho=;
        b=WPs92Zg2HQ9pwzKT3atpDunS65qJvP8SsM3LG3yVoLlQLZm87jGdJBf/vnnslB8rju
         eyPVZ0GyxGGJ2iTc/y1f12McMCp0+txp1Bw1y2uHH7nAIEHfLSy0A8GzQr0Kwr8JGT83
         tkJtIe2mr8xTe70q40y+O3SkkpxNbBBXodX8TmC5pV82GJGFvseH/pd1o0W7fRkUQHc0
         vjuZMEnupRMKy6mdlk3w36qdEAe4EojsFUmV1kdLaeoSIJJ0tlNsPswDg6WtzFwE89Ok
         zEBaTvODrL13XOjF06kSZcc/iST68j+LC/VeEmjykiv6CpuLIMG9QI4ukaZnJEW885zB
         RqoA==
X-Gm-Message-State: AC+VfDzQjcgTUehLY1DFT7B9IJABtBx3ijqiUjhal+V1f2msKCqnbc5I
	zaHZoOafCTzvPeXy2OuwQOb72nILC6H/pxc0xcI=
X-Google-Smtp-Source: ACHHUZ5bbuqi60Bv76WZj2tw8W92s9I7LqyDiYBT/jhTNPTAI/1qFlZrMgU1u0jqA1LbBItktIR2godR9JCWUNBmjME=
X-Received: by 2002:a19:ad41:0:b0:4f6:e50:d40f with SMTP id
 s1-20020a19ad41000000b004f60e50d40fmr1132303lfd.50.1685706374924; Fri, 02 Jun
 2023 04:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230602095037.97981-1-alexis.lothore@bootlin.com> <20230602095037.97981-4-alexis.lothore@bootlin.com>
In-Reply-To: <20230602095037.97981-4-alexis.lothore@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Jun 2023 13:46:03 +0200
Message-ID: <CANNYZj8vV1=GOacn_vHpfeJ1h29AdLNJsO6X-wXPrW9vahc_5Q@mail.gmail.com>
Subject: Re: [OE-Core][RFC][PATCH 3/3] testimage: implement test artifacts
 retriever for failing tests
To: alexis.lothore@bootlin.com
Cc: Openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 11:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182306

On Fri, 2 Jun 2023 at 11:50, Alexis Lothor=C3=A9 via lists.openembedded.org
<alexis.lothore=3Dbootlin.com@lists.openembedded.org> wrote:
> +# When any test fails, if path to an artifacts configuration (listing
> +# files/directories to retrieve on target) has been provided, all listed
> +# elements will be downloaded from target before shutting it down
> +
> +ARTIFACTS_LIST_PATH ??=3D ""

I think this should be simplified further by simply specifying the
default list directly instead:

TESTIMAGE_FAILED_QA_ARTIFACTS ?=3D "${libdir}/*/ptest/ /var/log/ /etc/versi=
on"

Then, if desired, the list can be overridden globally, or per image as
needed  -  from the image recipes and/or regular bitbake configuration
mechanisms used by CI (local.conf etc). If the feature needs to be
switched off altogether, that can be done by setting an empty list.

Alex

