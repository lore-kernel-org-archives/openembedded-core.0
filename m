Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CECAE674A3
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 04:32:12 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.30358.1730435526134415264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 21:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ToWr+yZE;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f72c913aso2612294e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 21:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730435524; x=1731040324; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BztXQdKtNUKJkj+vyJz/vJUTW9pkluiGE19e5E7ihgM=;
        b=ToWr+yZEI5FMrxu8vndB6om9Ll/PayllbveG4yslfHU1ly68jbSmL4XGA93bBMFuWt
         iHjRDTedSuyUz3pZxhAsl/sYbAJQI6KnB+sSVZdSfYBQPjSmZ3QZNMe3p461Yj0Pwf83
         Uu953AlLVDtDkoO4mvgWn4kk/ChhG632UVvEcsiAB/SHuIaBwdq9gTodUAllqJOszbq5
         Dja5H0kCwhwQ3eRJU6vNkhtuE9Rsx9yVTFyl2KVEmvLc6Sqx82ed2SjikVrtK+K3Z/uy
         eOd8syuI9HPkRpUEcZpknsjdGxkfBUOK6u2fAyUaf3Xjj1QMUTzuyNZXRXrPynHX7Eii
         pcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730435524; x=1731040324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BztXQdKtNUKJkj+vyJz/vJUTW9pkluiGE19e5E7ihgM=;
        b=lnP3LGjynv7q13I/HkbywvtD0+TLJWhzpstOjSmkaLegzsEp2dd18ziDvSUPGWm9hK
         AJuk7xt9Rvw9dP2rOttqz8oefYLYRT891h5ywi2fz7+sXkoGt1ROBJSkmXjo6RIIQ9pi
         dSoEt9Ico9aozVv3iJMWvE82wr+Tlxs9CxX4slO4zU8fbjWN/4mGaC0yOJVb3/Gr42y/
         sVazM7B/E6fZwEUkM463qaSU5tgb4nVN9eSyyrsxuKfTZfA2OQqyAB8nZ695ieWmkmgs
         wRXUfGZO5h3MHV35Q3LN0Rp00EwoPt1c5RyzNNtl92R3KfakRGs2+PJxjgSvqZquHwxd
         B7jw==
X-Forwarded-Encrypted: i=1; AJvYcCUf8cJpKMCYq/bRG7A+yO4NkeUYQEFITo9edXFeg4jELWtrFanB8BP5DSJaymZh3YSLJ33Pmzf5cOrLfkXnNBmBlw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz2vH4YhLPaJVLnSRsEJacMpIZpUx/+SRMsp6QMSSAhu7/OAsOJ
	jWh2ybqKcgKTxS+Rerkqq3gbkCXZvtVuLspPL9CfU8xVvSMH5gFT4yO8qds0GqSA3zWRNCYxQwL
	Z8RWWPRyrqqISivHToRi0ThMGens=
X-Google-Smtp-Source: AGHT+IHjAmCZUdyWSanFPKGZEe9XBxd+LlG16N/rq2whSZoz6BSgPWtVwIhYqhvPfJFT54LqywJUPGP8oMJJdCRCDhE=
X-Received: by 2002:a05:6512:3e1b:b0:539:f4a6:ef40 with SMTP id
 2adb3069b0e04-53b34b395cfmr11667584e87.54.1730435523980; Thu, 31 Oct 2024
 21:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
 <CANNYZj_KF41W10duL5u0mDDbv1aFUxdcGAmUtO2fEc0EtZ4ymg@mail.gmail.com>
 <TY0PR06MB5707BE94581CC7F425214A2EE2552@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <CAMKF1srdKcP7HMPkQF+iCqOkCfpGv6oB0M8R7=qbO3C216xgmw@mail.gmail.com>
 <CANNYZj8v9LUJFDXqBms6Yg7F0t=xQZAcCg417x00zJxqeYqtog@mail.gmail.com>
 <TY0PR06MB570732A6C54A787FB10C50B6E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <TY0PR06MB57070328EF6E490CA8B8C0A8E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
In-Reply-To: <TY0PR06MB57070328EF6E490CA8B8C0A8E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Nov 2024 05:31:52 +0100
Message-ID: <CANNYZj99sKhO24ehF4ks8cWCJa_kg92vGVML8PqtiQFTwnNEaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/2] wic support different sector size
To: Vince Chang <vince_chang@aspeedtech.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 04:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206600

On Fri, 1 Nov 2024 at 03:57, Vince Chang <vince_chang@aspeedtech.com> wrote=
:
> > > Also if you can (in a separate commit) drop all usage of this
> > > "2>/dev/null" pattern in wic tests that only harms fail diagnostics,
> > > that would be helpful.
> >
> > I will send a separate commit to remove "2>/dev/null" in the wic test c=
ases.
> >
>
> The wic test cases use out.splitlines to get the command result. If we re=
move "2>/dev/null", it may capture other warning messages, making it unable=
 to get the current result.
> To avoid needing additional code to use splitted.index("BYT;") and consid=
ering that =E2=80=982>/dev/null=E2=80=99 is also used in =E2=80=98debugfs=
=E2=80=99, I would suggest not removing "2>/dev/null". If the same issue ar=
ises again, we can manually remove it to see where the error is. What do yo=
u think?
>

If the issue is intermittent or difficult to reproduce (and in this
case it was - I had to spend a couple hours reproducing it for you on
a particular build host in yocto CI cluster), it is far better to
write the code such that the needed diagnostics are printed right when
the error occurs in the first place in CI.

Anyway, implementation runCmd() indeed defaults to stderr being
redirected and appended to stdout, so the standard stream and the
error stream are mashed together.

To avoid that, you should also set stderr=3Dsubprocess.PIPE when calling
runCmd(). Check meta/lib/oeqa/selftest/cases/runcmd.py for examples:

    def test_output(self):
        result =3D runCmd("echo stdout; echo stderr >&2", shell=3DTrue, syn=
c=3DFalse)
        self.assertEqual("stdout\nstderr", result.output)
        self.assertEqual("", result.error)

    def test_output_split(self):
        result =3D runCmd("echo stdout; echo stderr >&2", shell=3DTrue,
stderr=3Dsubprocess.PIPE, sync=3DFalse)
        self.assertEqual("stdout", result.output)
        self.assertEqual("stderr", result.error)

Alex

