Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33436C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 12:08:33 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.19464.1736942912030653460
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 04:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TYEtkUMY;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467a3f1e667so44257201cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 04:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736942911; x=1737547711; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dBRzzEqoPvtt7RjHAe1bh5QvTRDZkIaotbv/vFoCMUs=;
        b=TYEtkUMYrXl8axErpXBE6d8X0TCmtrq+i/woPM/YVTuUMOAoa71UwNS96NENXMt2hb
         nrgMmcqrEY2CT3yp1QPndVrrTW/WpD3nDo6jcaaQCAB0k6iJgkNV1Aa+l6LFjRR5N47m
         MJKQnmlbB3Xiw7WHmOKGbNlqM9RBz3JIVkl4SCjO6Isto9/9iR/rOQfKBGL6kbGt6UV/
         lr1E63bbjuMNEg27IJORuZQbE3rsR51iCiX8FFZuvEeMXLOo9UcjRIQ344iQ1MdCaqIs
         GwXYuvbHjx+F968pYF7VZCcLmcRKg0hck/fqu1mGEeZZiT6VYOIdpm7dyks4RZYeDTSC
         8tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942911; x=1737547711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBRzzEqoPvtt7RjHAe1bh5QvTRDZkIaotbv/vFoCMUs=;
        b=lvx7LnTBoUybibAR6u4vPycP5HZneUmw3WkrLNEu/+pbJn8fPhGHnHn16TwFLIrj6t
         P/Y4EZhjbGid1PflLP4k3IGsHuT1RmmzzQIzRwARablYp5puabj/QjySsEcrQNtRFlUQ
         7wU5lY+s+lNsxvNemEuCKJ1Wj3aWSocnEBqyx6UfU+H8fQXKQaGR0XoWnYt0qdpC2JGj
         hDFbyEK/xSji4V0HYxck/F+gWXO5pCa2efMNy8cVMmSI/ysB4SIh8FKT3PpIUMJcDnD6
         bwaYCnghWpJoJExq2FsT93/AL0N+plcmbQW78/Z6xqcoR0CK3ujj8s1PrBM8I3MDNxgW
         tU9Q==
X-Gm-Message-State: AOJu0Yx486eZYaVrg5QprWhs5EFCs+JUv9q947HUb+8o8nu794rwhxT4
	lnY7eYK68GcZ0yRK0rafc3PKRbLesrKYu+3rWLpy1YV0ZQpRY+SIkcqEKckQhhfHQM/2bqXyQBf
	kcfFk/z0V3/mJ55w/8LDzc6dvuAyH3Kz6
X-Gm-Gg: ASbGncs9aCg3nesG2FDF1z4Om+V85CNVKjLRQLj+DwhWVV8mm5j5nCEO51px+jlOoqd
	I+ygkXbQ8xig+uH5LOdYVybpsboxv93BFUK47
X-Google-Smtp-Source: AGHT+IHl39OPGJXs7EnTizvXn9MaXnTanB9KtTP8nJe7TOMQCyhPdxOA1tWJuKMx6umbJ9188Uobup5TuSd4MTGhJZw=
X-Received: by 2002:a05:6214:624:b0:6d4:b1e:5418 with SMTP id
 6a1803df08f44-6df9b2d388dmr457331976d6.33.1736942910769; Wed, 15 Jan 2025
 04:08:30 -0800 (PST)
MIME-Version: 1.0
References: <1736843308-4094-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj_=sCFxY83eCUzSVu5e7HXwB-pk1r4RS26LovYT=i6q8A@mail.gmail.com> <TYWPR01MB1186111770D515F743B8A403BDC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB1186111770D515F743B8A403BDC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jan 2025 13:08:19 +0100
X-Gm-Features: AbW1kvYOonCf_eBRKz45weVTj3etVjHxJ5VzeoGvZXz09w9DWm4Vn8HWuluxbJQ
Message-ID: <CANNYZj95wba_5BVO3uPETN416c2eyqT-6CLy+F1Oy_-2Ts1iUw@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH v2] ncurses: Fix install conflict when
 enable multilib.
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 12:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209895

On Wed, 15 Jan 2025 at 02:04, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com> wrote:
> We think about two solutions:
> 1. Use the v2 patch to specify --with-xterm-kbs=del
> 2. Temporarily modify the following code in Yocto. And submit patches to upstream:
> --- a/configure
> +++ b/configure
> @@ -9470,7 +9470,7 @@ echo "${ECHO_T}$with_xterm_new" >&6
>  WHICH_XTERM=$with_xterm_new
>
>  case $host_os in
> -(*linux-gnu|*cygwin|*mingw32|*msys)
> +(*linux-gnu*|*cygwin|*mingw32|*msys)
>         want_xterm_kbs=DEL
>         ;;
>  (*)
>
> Which plan do you think is better?

I think this plan with two action points:
1. Specify --with-xterm-kbs=del in the recipe. You can adjust the
commit message to explain the above problem with linux-gnueabi.
2. At the same time, propose the above patch upstream, without adding
it to Yocto.

Alex

