Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA721F46134
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:47:36 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19350.1774277249248037169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 07:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HMvKsh4n;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cfbbdbaf3cso414891685a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 07:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774277248; cv=none;
        d=google.com; s=arc-20240605;
        b=L2aBEkWykPJb5w4f+GkbAD38EjXTZT4YMa/6UEvezGTknac7ZUzjGHURVInruSLcR4
         iwtA5aryOXEyVi4iANbJUbrg2qA/Ca2hPVrZyIVYZnH6aG2k/DZWNuhgxbzUmqpQFVFP
         w7uE1jy+9ViAU1Xl2fhriMg9phk8lOaEzAjJ9KMRRUFfhnU/Ng7Zjp7DnajjN2CHAUg6
         K35a45CgJi/vh3xtSGlwaRCupL5150PFgjZydRUu7Ebbl0fxpX8mt8PHtfM8e67aPTN5
         B/5i6xae7eDGy0F6kmTKOqKhLjv6P/sbY67vW7ivZbVNpAL9kcgKreKbXBzJ1Z+eeNtO
         EKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YXU62rtYvOpyQRVA3G21KiN+tvBJUKATXx6gMUezCzM=;
        fh=cB+nO0T6xU7Ddju8EBjVd1VMcd49lfgGwMUOht68ACc=;
        b=X59KA92wEu0ddM4MLIEWot6iFKTb9m4ly7mKRUPWkkzSH67CtxrvhEqzqU151PMu2H
         ePjmCZ8WNUvKI8B/m1Mtj+p2rTsSv3WNX79dSIY+/TlBb3fqwd8OqHhLSvsfJ3LTE1Yd
         FoFa3nfV1B2NrSJ3KzeKClZio6NqWNaz5RqG/3hgWkI2T+JquQ/L3XMya+vhWVHPhPvu
         Molo48o+H9OGlsv2m1sAij82G15ZQ60CIxOeWVhcXMSoevn4ywl/1gvbfscPCAY5p+Xg
         BgkwEsZwOCISi43fuRQzUVrQJFZkj7QMeq/E45tzi90ADRTZmc58VYsprx39LLIz5oKT
         Gf+g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277248; x=1774882048; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXU62rtYvOpyQRVA3G21KiN+tvBJUKATXx6gMUezCzM=;
        b=HMvKsh4nrpXXWgQox8CX71+5lSOTxEEQIPwS7dr+gLa7NMDlxW83tLDn29XbQMcyBA
         a03/CZeLgSkzhrGTgtZFQukbCxThJxcltO5DDW1ETgArbs9dDr40Q0dodT5qngT8qiwd
         Qz+/TwYfPwvu794CMbd69hx4TBbj4tE+1E8nvFC2HVevg2aQUQCDlSEGvfGbOZHfjFNV
         VrlZ5kuX+ufAPrmGX68nLgQMbofDyPWwiYV7+zwVqbWkFvjAwDx4j8p9bV+IdFXluVVK
         62doGCJ8eS6wGxT5vGhBiDNKwnZR/cjjTmoq5GCmQc3+Bzsa9A3/lFUjB8exa7aK+HHT
         8OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277248; x=1774882048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YXU62rtYvOpyQRVA3G21KiN+tvBJUKATXx6gMUezCzM=;
        b=SkF3tkJTi7FaqeCTseg603oUK9r/QFyMK4jegGN1+XHWT5gPj5CU670yDnuYkrcKid
         CDN50Ypunz5g71+ZK+T9UX//vRqRJ32IlZx3W/6tZ4VLjuIDb7UrZIAthao2EIRLyJSQ
         UJweuQov4vlF0l8T+BsIOsQeMvhy8cGWtqYa9V9cI5/PB22pZLATxBbTPPYxiJ/rJRiE
         ZH61nhr88KbLgHWM6bW7NBnnf/y46bLPnK8yd126/BnIj1pAxpOop45KIbAFf1O9cs8a
         aEFtOALiLYhBs6nYnRRbxlcnn6S+LcKLp5IrPM6vvZq1re1gD70CVBfFf7VX5A/10eKA
         DPiA==
X-Forwarded-Encrypted: i=1; AJvYcCV8FHAn/jbCvzjR2ATtCPzkvY5UgiWc6atpdlEeFrjCX+pExxCNPJvR+IowTWAkdBfwKy6+Z9Y4p9bcC7SxGR545w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxTn0zg1rAg0qdX2XPaGi4Za0BF/d7Rm9Rs7oYPfFG1BCGoN5uG
	G6H9GYAVXELa46BvnibGZsxcUHeHnSCjootLYhu/rjLlVoT5Gs4IuNFkNjDKr8vUGqQr7d2560O
	RFQIMRaagp90SzlcotBPYcW3IiNINeIA=
X-Gm-Gg: ATEYQzw4nyDjK0cztgTQCLfgu6Gq5ibnjE9czjBoRO9yLW1kNur/JHP1IfHogfVWOi4
	SvHmvFxIbVYAOYdfwdcfzyKthps+EM0vmZdg9WgG8DLNAzcmnuXk4cNmbR5T4OZtwHjpDNVoaBC
	1ob2tzGEpzlEA5MrUwTEDBFh4uKUqWA9uT2BoNTIhR5NEkF9PMguyU8vFL+BjU6LlaZnh109BPu
	lA97U96Hkb2nwGQWei/SEnW9h2/4ly2YxWU1JALO1G/n/9DiSAmLM1npmDlM9hIVz438TOVV0g4
	cZJy/YBYgsUj8GlP6v4RMEaDKYEKKkNyXd0SOgydCw==
X-Received: by 2002:a05:620a:4110:b0:8c7:1271:f336 with SMTP id
 af79cd13be357-8cfb9daa41dmr2163691085a.2.1774277248140; Mon, 23 Mar 2026
 07:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260312120024.3745232-1-zboszor@gmail.com> <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <c0ef676d-27c6-4db4-9fa0-06a78c38954e@gmail.com> <CAMRc=Mfa8R1=eVdHdw1pZL5n33nd+nWvR99=9Qh3fZwTdo24kw@mail.gmail.com>
 <c59c3cf6-1cb1-42c9-8155-ecc28dab2ae0@gmail.com>
In-Reply-To: <c59c3cf6-1cb1-42c9-8155-ecc28dab2ae0@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Mar 2026 15:47:16 +0100
X-Gm-Features: AQROBzCwn67Nq2QK63cqr-o5ZKY2YqoK6-Oa4MYEYWMpmnxDAUuLeuLdvX36a7g
Message-ID: <CANNYZj-Z3TKK9RTas0dnn__fvoo+-jP8SRjjLzhKBghR7NiWWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for
 free threading
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	"Zoltan Boszormenyi via lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233740

On Mon, 23 Mar 2026 at 15:40, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
> I also see other issues popping up, first in python3-installer-native.
>
> Probably this setting ("python-freethreading") should be a
> DISTRO_FEATURE and then the python3 recipe would use that
> to enable its PACKAGECONFIG.
>
> PYTHON_DIR in python-dir.bbclass should also be set accordingly.

In patch review it was suggested that we should actually have two
co-installable recipes, rather than an exclusive choice between.

Alex

