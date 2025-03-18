Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318E7C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 13:58:05 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.12481.1742306278626811431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 06:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lTP8mit9;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6df83fd01cbso23584746d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742306277; x=1742911077; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8+8CkG246bCNv3BHEhp7XeGii0wVsTuiI7THWNsiNc=;
        b=lTP8mit9882C0TkBZ2bV15JBzpWDPavt6bN/ijpluIfm26PsXJ8rtjo/TVo/mCrrJc
         SaIYOw1c8FfE4M59XZObhCaWCMCHnXuOlkh7C9ndaDRpwubGtHOipm0k7L4gXaUzxygd
         xNPrD28vKrNMDLufERNBvojWGqFfmrDiZnf9jhG18MbGn2l2dADedmZ+PNlzsFm/scjy
         tZ+VVbvdpRDOqK8sQRPxn9+oq35b/aDjwqbAnwvDiOo4E9RU+G/7GYT46gzvOUUjvdQV
         Qr5/cDcSPe0twsmob4D/2m24c/S+SuRhYX60XEhRiWiDh4cdfkp5UnuY3BO17mURIrgN
         1OVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306278; x=1742911078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8+8CkG246bCNv3BHEhp7XeGii0wVsTuiI7THWNsiNc=;
        b=FK5aC1ZJ6oU77jGRweNPnr2KPPKdo+mVOHK+aQMqsrrmb442AckkOmZvc2QehLjtUE
         LxtfGPCCOuRyUMlLQt39santg0CAbcrPsnvzGLcFErztb24JshABOJMUzvU05ljyWQhp
         MKmHB0kWyJ/Mn9ueYSpwn01Iwxo6lPQK/PjETD/yPrSTw3JEv8fFibrM1pJxCHcxx0gW
         m2uboaTpgvU1lpGsFlxGi6M8jssr9YEEr0DLCohViYQOLQS366r7ue6S8s9runa2mAFD
         JWYQYDxvND92PphFo3BBhZOWnBm1UtNIqxA9olRuyC0kOdwQJ7rEyFWxvu1BduHRodKz
         f7YA==
X-Gm-Message-State: AOJu0YwDU34JhA92RM7tJkoiAhCbzStX+vTZ25Cb5brtubpaPi/0ptki
	qCW1xsoYWWw3ztqt/58ghk05KUTRQ6Zxy2Z01uB5K0BI7qv7YVrwszg5FrvO6sr950W5FzVIuUa
	DxlxuIpU6OYctwaMkprJ75lDQP+E=
X-Gm-Gg: ASbGnctLzHQ4OmQgaVTBn5HKidDz2KHEQan31yaMT9qf9zBMhor5bQz5Bs9+EB3hTq6
	8MD8BVbUDJV0Wd9Gfrl+so6BwCrussMptTy6UAPIpCF28ACcvX3sLgoOE8vPFJWiPGrLROrO5Gq
	P0RdZnrGiyYsJQ5SGGGZjNB6O0H2Nxd6hPyF95CG8Pn/cbHRg2ThVEfXga5yHU
X-Google-Smtp-Source: AGHT+IFU6rxgpjgb+80sBwD/iVIP/oMCQAgZRSICDRD/uz+16RUAepCehVyRfkOmz81E6G9UFvH8LRktuF0VeQXYhyE=
X-Received: by 2002:a05:6214:da2:b0:6e8:fa72:be51 with SMTP id
 6a1803df08f44-6eaeaa4fa58mr264632706d6.19.1742306277511; Tue, 18 Mar 2025
 06:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250314144539.2885974-1-frederikbraendstrup@gmail.com> <CADs2FCHRm4-fjjNJyCTB8s_ch6mP62FPjNgp4jKYP=E_tmxK_w@mail.gmail.com>
In-Reply-To: <CADs2FCHRm4-fjjNJyCTB8s_ch6mP62FPjNgp4jKYP=E_tmxK_w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 14:57:46 +0100
X-Gm-Features: AQ5f1JpyzOPUsWJleDCRjQKBUatFl1Qj_2v9v181Jq1g7rQ3H51S6JU1SI40Ukw
Message-ID: <CANNYZj_h2WdEH3VMkpHFQBkKDGGSYdupSWokzW3V7+fcic7Ghg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Check if version is actually a file
To: frederikbraendstrup@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 13:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213212

On Tue, 18 Mar 2025 at 13:19, Frederik Br=C3=A6ndstrup via
lists.openembedded.org
<frederikbraendstrup=3Dgmail.com@lists.openembedded.org> wrote:
>
> Recipetool incorrectly made the assumption that version is always a
> file, but when it's a directory, the call to open fails

Thanks for the patch. There is some missing context in it,
specifically, filelist is formed like this:

            filelist =3D RecipeHandler.checkfiles(srctree, ['VERSION', 'ver=
sion'])

Shouldn't rather this function/method be fixed to only return files?
There are multiple other places in the same file where the same call
is used to form filelists, and they all potentially have the same
issue.

Alex

