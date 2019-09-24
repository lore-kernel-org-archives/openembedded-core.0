Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail.openembedded.org (Postfix) with ESMTP id F191B6B513
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 01:00:17 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id w6so28934lfl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 18:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hvrWAKXW7uh4kg7Ig1RQVd4iGwhiKEn88aIJvq/6XiY=;
	b=vVr0yibpYaLa36x+QH33DE4dd95NRY6aDPxn2XpRFcLnTabVuysrpFSHBjmt5wfSfh
	pNARXpbt04rB3H/dyxYoGRbrkE/7Gi8c47ui0Ju4elZ0zsZ8U6tePsEodagP6ODaz1qm
	mpkqdtGfu0SBExXvTd2TsJX3thfVTr7+3dtAZ9XFOvzaxidOjNsRasu4RGhr3XABzeO2
	93BbiJRXL/oC1/hGdb+tx3Zp5FX9UiFr7IEnplHkCGjNl1ENXCOsqp5DXA63LOAJ9p53
	DS/KijNaZ1yjfs6wKLJoV0esdYrihN0aIfHf3hkUDGWRMRpmdKlsEl1/1U1YM6P1+5rg
	I8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hvrWAKXW7uh4kg7Ig1RQVd4iGwhiKEn88aIJvq/6XiY=;
	b=XIFNs29oZ5sCkLmkCOXUZdIPz1aUnFFzl+44NjvJSgDbGVIpseeNdCNQWiawRptjDa
	ouGE5L8+W12IX2Z8RUA2Hyn2sdUaOhSf6Quw7qCH9OnBWmAWPRV26isT5KqqT0qxZ2eR
	9rhBc5Q3NgJcDaMi7V2ZztP2z2ZL9SEzIZY0dEfRQ57wmIDvN/uGDqrgZPrp3UvWsj7L
	pbT+0uRm57Ut19h+fPISN/e3Eqha2JUxXT0+JJnWr9MYsH6AUNKH6qFm0XGvQL2dPeoa
	FEU+ZizAlcrJx5j8wnREarBdmnAoUAq/vr4MrvR+LL8f66k0GHu4SuKJYUgUP8jBv0WF
	9O1A==
X-Gm-Message-State: APjAAAUIoN2oDB+/giTx3bsBTELMZTwcIWdsRPOVFavEWLna+O2ZD7CO
	Ey1e5u61301k+B4ocB/mOl9xxA/8qL0tcIuWPOM=
X-Google-Smtp-Source: APXvYqw7sBierqexq/8Wiq/BpSAF2JOxlHBodo3b/eHudJgO50K7MP3XXCGXAU3OKeM20vNcPfvdSUJMNEqhNk0csDI=
X-Received: by 2002:ac2:4a69:: with SMTP id q9mr46634lfp.86.1569286818488;
	Mon, 23 Sep 2019 18:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqanCn50yNrGcUDyGZQu9fOXsRZkccvk4o+GvD6F5nPRg@mail.gmail.com>
In-Reply-To: <CAMKF1sqanCn50yNrGcUDyGZQu9fOXsRZkccvk4o+GvD6F5nPRg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Sep 2019 17:59:51 -0700
Message-ID: <CAKmqyKPkQAHM5+X0QfRAR1wneOe2o1ffBirz0boqv8PetCRVkQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu 4.1 boot regression with riscv/musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2019 01:00:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 23, 2019 at 3:40 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Alistair,
>
> OE-core qemu upgrade to 4.1 has ended up with regressing musl/riscv
> port. I could pin point it to
>
> https://git.openembedded.org/openembedded-core/commit/?id=50a7dec95618080962e56fd347f505e691b7ad6f
>
> it works fine with 4.0, I havent looked further
>
> To reproduce
>
> build
> MACHINE=qemuriscv64 TCLIBC=musl  bitbake core-image-minimal
> TCLIBC=musl runqemu nographic

Thanks, I can reproduce this and am bisecting QEMU now.

Alistair

>
> Thanks
> -Khem
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

