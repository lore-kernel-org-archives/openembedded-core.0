Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC60CD21690
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 13:01:15 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.12853.1728997269371549400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 06:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X1C3ql7w;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso1848558e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 06:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728997267; x=1729602067; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYTvB6G/fXsjB6iYuL/peJSLaWB2i19lLvjXOxi1KLM=;
        b=X1C3ql7wZBIbTGMvC0UfUtDB3MffV2f3O/aKBXPjI6XljpGQaZESvcYyilSFyeKwOs
         dA7DG7o4IAkDs7OQcVeyi6k94RbxhnJupjTw9pWkrmGsR7zFzm1OAiMtZAuC5PIbg+HI
         JCI1ib7IrFDgTPvACgJ0yP4vt+9bjJ7DHH99ggbqN2qytmdr1iXJ6QreUqbWtCSwASIi
         M2ouJAuw7tNz0BsePCjUUazTPL4bmTdGg0JreEk/wvBzGTuCsuz/2IHvpl9XMOUm+B0b
         R3gEhK6DqfZGUfMOumkjZ6gGiYMhexRPyhmO01HNTpDFyHYonxzI/LbhlDeOCIrvREY5
         6Knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728997267; x=1729602067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYTvB6G/fXsjB6iYuL/peJSLaWB2i19lLvjXOxi1KLM=;
        b=GQMSzElR0EHnjgEabfkAC/PMCAP0oNzIEr6c5n8ipuW2v5NPllp1SRuuPT/2F7ELnl
         Gjx5AhbLefhKdaErYMH39z3JBmPOSsJ3tc6lvhwIUkH1UXChquiLWueKao0WrBU9fETz
         fuWFObgRgkmxXsp0I5x6C4uas39/dUh/trq0oSrDEl2MKjuDj228FMuVaobWk4r+a1dy
         4ulqCNLAcGIrQCd9rll/iY3T/OYw5mo9E8hoBLJZRlcP2AwFDa1HbndHw2S16Q+1st50
         aFMM2h5mWSTB1jwmiKmzzLqTwl5EyP4M10JI3dyNgmYLecJgJK1ue3yQqKGmCdDI3HUa
         E7jg==
X-Gm-Message-State: AOJu0YwBYCIHOHlMGTpYHjZCLhFfxTuStidCdfNLEEFC1JgDFw/cnDX2
	ApJGlQ+70JqTPz5b+loB8l6SXdodaAWbPzqO0CIThqhIddvmKcki+9RDimR9YMoeKlcQ2CvwVgM
	dMPAPtA/HR1sRBrtGGv1vPMLilmU=
X-Google-Smtp-Source: AGHT+IFD7kofAW9FW4shNNQHv/JetOXLxSCWiPd1P0IubLXdB0/tlz88jcKnDeygRlM0PnN1JpYOzBg5O0y5rHs+9KI=
X-Received: by 2002:ac2:4e03:0:b0:536:553f:3ef9 with SMTP id
 2adb3069b0e04-539da4e0b9bmr6875571e87.27.1728997267157; Tue, 15 Oct 2024
 06:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <748f5761-7fa1-48b6-9f00-b055bdb97bde@gmail.com>
In-Reply-To: <748f5761-7fa1-48b6-9f00-b055bdb97bde@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Oct 2024 15:00:55 +0200
Message-ID: <CANNYZj-Om4bhJgsZ1X=iNaA4KBR7UCst5D__RMEVv4snjLsrzw@mail.gmail.com>
Subject: Re: [OE-core] scarthgap build errors
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 13:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205915

On Tue, 15 Oct 2024 at 14:43, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
wrote:
> I found build errors in scarthgap while trying to update
> my meta-python-ai layer to be Yocto 5.1 compatible.
>
> 1. python3-pandas needs "inherit pkgconfig"
>
> The pandas version now uses the mesonpy build system and
> in turn meson. The latter complains about the lack of
> pkg-config. Adding "inherit pkgconfig" fixes it.
>
> 2. libgfortran-dbg throws a QA error about TMPDIR references
>
> Is INSANE_SKIP:libgfortran-gdb += "buildpaths" acceptable at this stage
> of scarthgap development in upstream meta-openembedded?

It's maybe better to check those issues on current master and send
backports for any needed fixes.

Alex

