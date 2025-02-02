Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D422C0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 12:23:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.63091.1738498973953600251
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 04:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UMTNEsHQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: petr.vorel@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361815b96cso23534635e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 04:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738498972; x=1739103772; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtM+ECC7PuFTuQAtXtSkllWwEEu9GYKXUSfMySdjoro=;
        b=UMTNEsHQ9ifcL2vmAGTzm9dONigawDFw/LaehcjlEuyZV4eLAF3kMyJW3pCu4RkSp1
         BKhNHxt+mFloWyjgxJ8BgwPj7JQg1flUD/b7qwyRE5XdctSxcGTb+pWZavfD/oHXt5j4
         qTPA0XCx5pizmnO57KEI6T/fAMVjuekxB4Yd1laKSeqOFj03k0susP+2vKxDosqHplBL
         xTv26xs890JsbSOcaUc2Rw1teRpZrg+y1243TpDQpVXETk/PzcgHcjyXmm40JEXmGku7
         DYoDGEzY9rfEGcI3a1BFAOgMalP5xeTFFFr1efIQhJIpr+BONJ7LBDk1NdbI9o3SRHjb
         yHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498972; x=1739103772;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtM+ECC7PuFTuQAtXtSkllWwEEu9GYKXUSfMySdjoro=;
        b=DoFXZUffFKBReoak+4fLOOjTKHqxJevflGhqTRovSQ/VVi8psCq+hvTf4Qtd2ukvjk
         m3TYjgjMhtzRKFqx1+q86U7Gshj9h42DbWLV/X77y2zfEvjD7qy6TlebmypafmFOoyu+
         GL7iKn9YWJi2DP7G28vrbR8mrO/o0RGM/n8xKATUgKBjUf9wtcMmKvw5U0yjiRiXaIGy
         BS22zbrk4mm+iHYfTPhMw2tBNTpaRimWjcUnuU3x+A6CE4vm707BZt07kwhtHR8vlttY
         DZBdhv/uT1o++TQMaTYPeOCIw8FoTiNCyR6SyLEQJRk//iqm70LNQBLJjh2G5pLIt1BG
         6Kfw==
X-Gm-Message-State: AOJu0Yw535aH/Fdkl98ZGvgcUIYI+NA49Rz38D/jOj+IaMLggCdoKiAX
	G+0qmyfw8bNiWwQfncROsGgIY56y4MK0RWWcciy4+9HCVklJSdx3
X-Gm-Gg: ASbGncvWQ6HLVhSvkU7KZYBlm7Ew0g2irnZ0S8qS8vQ0oS19iGzfGvvG43+jGZrM5Y5
	B1Vshr+WpNDgMRdIyRXC1/f1clOsc819HZTgaOnYP+wfNLoxkdrBSjUmQR3DMAloA436xEsV1ER
	58dXFGGQ2kYJrjxkW+WI22UQVdQCx6wpru9aafysuox9QqCsII9Qivh4k+MC6Lf586xBAPQWTe+
	/8mjsEjdzJcuw5xMox8pMnudGC5kEwBmF53pDOxVO65Z9l6ViLhLL+4ySzXhgUnU/wYen+FRhM/
	vmfWatUF2CVBmmLNbrfM
X-Google-Smtp-Source: AGHT+IGjRW+64jgP+FTYBJo5q+d3T76qIRPNm2asIkVDMvZ04FwZq4Lqi4Z+Ua09quvgQB5VFNsQNw==
X-Received: by 2002:a05:600c:4f0c:b0:438:ad4d:cf09 with SMTP id 5b1f17b1804b1-438dc3bd818mr140932895e9.9.1738498972098;
        Sun, 02 Feb 2025 04:22:52 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc1315esm151626415e9.6.2025.02.02.04.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:22:51 -0800 (PST)
Date: Sun, 2 Feb 2025 13:22:49 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>,
	Hui Min Mina Chou <minachou@andestech.com>
Subject: Re: [PATCH 1/1] ltp: Update to 20250130
Message-ID: <20250202122249.GA1150099@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20250131225444.1144932-1-petr.vorel@gmail.com>
 <166c73cfa10449a1163cefae2879ca881f3b42f9.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166c73cfa10449a1163cefae2879ca881f3b42f9.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 12:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210619

Hi Richard,

...
> I ran it through our automated testing and whilst the main tests ran
> ok, it failed on musl:

> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/932/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/948/steps/11/logs/stdio

Thank you for running the tests for me. Although we have musl (via Alpine) in
LTP CI, this error slipped in:

| CC testcases/kernel/syscalls/listen/listen01
| In file included from listmount01.c:22:
| listmount.h: In function 'listmount':
| listmount.h:18:16: error: variable 'req' has initializer but incomplete type
|    18 |         struct mnt_id_req req = {
|       |                ^~~~~~~~~~
| listmount.h:19:18: error: 'struct mnt_id_req' has no member named 'size'
|    19 |                 .size = MNT_ID_REQ_SIZE_VER0,
|       |                  ^~~~

Fortunately fix looks quite obvious (missing autotools guard).

I'll send Cc to LTP + v2 for yocto. I'll try to force myself to run the yocto
build myself to not bother you with testing for me.

Kind regards,
Petr

> Cheers,

> Richard




