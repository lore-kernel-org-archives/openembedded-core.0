Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A2AC5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 14:59:56 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.7819.1748617195399688173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 07:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=REGTifZe;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-60be8b6f1e2so959794eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748617194; x=1749221994; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k//7ijwNRgC1x+AuSD4OARc7OO3sYUpAVXMnhidlcWA=;
        b=REGTifZemxv28ORkglxtoSUEgQ1NakEY3IAnyXQ3eTKbxm+ShEyU81TlhSGYA3A9Po
         YXAebJ62lM08zGKK/PrkkVm1ZGAti42MCBsp6+ensr2ZkgcTfb9M4ACxG8w9WwUtCoGi
         XS4utXbUSsor8k2MU1hgmV5nmiNl1FEnHC+r5fNs2qKztXR/f5on/wt2Dsd2o2nmmNEr
         ymFiprIoMi3HfjGIhFAHmF1T0K8RBiBTmt9aZ7RbOIWMwpNOAPg9gLKLU9YQvuqJtrSD
         dOHAfNvp/o+0nvz2KXWCMLDzNLx1OpvmPfYQOzhuJkkKVQmt4UHG20VWFG8Ft8P+wPxL
         aShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748617194; x=1749221994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k//7ijwNRgC1x+AuSD4OARc7OO3sYUpAVXMnhidlcWA=;
        b=q6n9p2fiP+kZ6m2YjBTfz98lGN/HYumoG179UGklwy1i3iJgAGliqvXlNWMuPz5ssW
         MkFnzK4cg2GCrO20Hca7vGZjXTFjTr/oT/5RRq8/twj9yPZBsFQMEs0qCNu0bBO9Twto
         o6oQcjlmMV30NzbGGPvE1uCt+95MjDUshrpUSlryE8Niyyb+tsvOnXTMPaFQNni4CKyd
         xqD5cTIN9R7L8E/pEo037RI99ZXaneSkwwPbKcdsyQSWLmI8aZORFdhszZ/rPUN8e8Mu
         1bvfDe5jOKFayAr2NSXwB2svTtmu17dwAvURhXCYWMU5GEo0o+d2VwvL8l/dfgOftCSJ
         wA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSEjxSm5tfJChznq4muyWNccJPrrwxMwihEvfw8zjtB1CUjMuSJGsqtPsl+9Cz2oXQPHrqCDShWUoZ816dg/IanA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOM0Dei9vaWfsdVvhQy5+sWpUTqilrOr+bLUdo09acCJiZIPOn
	dBxEaWUYCv4clPxgOla74bNKEjr1WMFzVL6gGeW8bjHKLO3jrE4wDzbkcFUGjtiQqeMGnw3xae3
	cyZgj5VBEr9w5H/6uKA5/KibQvye0TTA9zvkKk7Y=
X-Gm-Gg: ASbGncsvqfM8oyfQk4Z384oEadiuRXKJt74Xv6QA9oqYHk4O9BjmYirhO/aG/bPdQkL
	EkJXQ4lOxuEMux99GWvRTlLs6M4vguJPpmmKXgxnWmaqb4uKL7GwGOk2GkJDf2+N3wEr2A1ldG9
	ff5/vPy9EJ6/xsfw08XkpIhb5RoUJh96jxbwcdT7nppnB2wE8=
X-Google-Smtp-Source: AGHT+IFCZurY6CYQx0w8il3fvGu5KjB+PJNTebmYn7ZyvXrhaJ//3GrvaTi9H8Mckw6NhMEcj9pZ1++Sv4EL86OsNX8=
X-Received: by 2002:a05:6871:7288:b0:2d4:ce45:6983 with SMTP id
 586e51a60fabf-2e92122171fmr1975474fac.10.1748617194566; Fri, 30 May 2025
 07:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250527082748.1608410-1-Qi.Chen@windriver.com> <87E85F85-D3EA-43FA-A162-D9E8487F8E85@arm.com>
In-Reply-To: <87E85F85-D3EA-43FA-A162-D9E8487F8E85@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 May 2025 07:59:26 -0700
X-Gm-Features: AX0GCFsPlpAz72JzqjvHgYuPpZriimduISRrWwtQKO0qGrxfzA0g3fMokLPSUjg
Message-ID: <CAMKF1sqL6zvU8mP3DY8zDVa_5fFaJV_OrA7BraVYzM+wSRX8YQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH V3] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
To: ross.burton@arm.com
Cc: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 14:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217509

I am seeing regression on musl

{'util-linux': ['kill:_decode_functions']}

On Thu, May 29, 2025 at 5:29=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
>
>
> > On 27 May 2025, at 09:27, Chen Qi via lists.openembedded.org <Qi.Chen=
=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Chen Qi <Qi.Chen@windriver.com>
> >
> > License-Update: add EUPL-1.2.
> > See https://github.com/util-linux/util-linux/commit/74f3265b9a079f9f60a=
d6e606d77deae0029a43a
> >
> > 0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch is
> > a backported patch to fix kill/decode test case.
> >
> > 0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch is
> > used to fix testcase failure of lsfd/mkfds-foreign-sockets.
> >
> > The su tests (su/environ for now) are removed when 'pam' is not in
> > PACKAGECONFIG. This is because su is not enabled in such case.
> >
> > lsfd/option-inet is removed out of the excluded list because upstream
> > has fixed the issue:
> > https://github.com/util-linux/util-linux/commit/eaa3870880aaa8d3d6b1aa8=
ea6bb19a717708b8e
>
> When the tests are run with core-image-ptest-util-linux (which is how the=
 AB will run them) they fail because the tests want to write several hundre=
d megs of logs.  I=E2=80=99ll send a follow-up patch.
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217411): https://lists.openembedded.org/g/openembedde=
d-core/message/217411
> Mute This Topic: https://lists.openembedded.org/mt/113322181/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

