Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BCAC3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 12:30:27 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.36656.1721046626000960146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 05:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UnsBGkI5;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e96d4986bso4262084e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 05:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721046624; x=1721651424; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bCuwZvqi9PEMuy0y9vN3tpxsx5H04TZaJmmmMOfx7HU=;
        b=UnsBGkI5Nov+8Mg2g7icnkL/clNBz2ykZiSsAnIOzlTb0uVEXStUgZn9TGZeIkbsEH
         oDNBIv/8e39wJG6MZL+SgT0Z5meR74mKYXdffJev7soR2eFhPc1dRiASBSR1wiTmElgi
         wqfFN2t0knX5X1rAkUE/yDge2CvqfgpJMIholqLj9oZ9VBvd4edhm4fyxbYDSD8WXGHT
         1Kp2gwW0E6BQVlovcupb+Xksnixk+UI6qwPnWslNPOmoOtSu6ldixO2neDihoAAffRE/
         PbN7mUEkeLYB6Bx6QgnFQCDyY1hj5yw2iYtpKlmYOCWjfjUVeXQOWO5QOwDMqH+qIE+B
         ucRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721046624; x=1721651424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCuwZvqi9PEMuy0y9vN3tpxsx5H04TZaJmmmMOfx7HU=;
        b=vyg6nflR13oqReaTmxc+cyNxgqB9WBtehZH8b1675dJicuv5SQ0yRSMnz4E161q9qV
         tlfDzXNz+3lv/33uPHessuCLF+7ZoRQYgCwhe/29nncxViyJOsZYe87aj3hTAesu9J7v
         U7RKM+e40ceamf6b/XcraHjgZs2Kb3B7o/SPzLXyGMya+rnTE1hrFiy5EY2KCwVMmg14
         +XHSUp7vKP33woOoPI84gbTs2wTkDh0Z8D3CXP5JCB34/hRap0Iry2LfmbGZLpAdsziO
         MjLVcN8dAbFe2OrQfsoJhOXqWayab1GTvGE5qnTX8CKjFFxL7Uqa78J+m1N4wqzv2Dgs
         zTNg==
X-Gm-Message-State: AOJu0YyXuJeXLu8WkDKLkwpFit30CA6EuGTciaLh6/roMBloELr8Pbxq
	oYndDJUIcXTXlJlXfa65+pXDLFz4oQz8ZRe/FLtmaHRVMIiEJe/fjkmZojbpeu/6KBrv8K+8ifw
	WoCEyfA4uvmvgYLRCToTW7REDFqoGiw==
X-Google-Smtp-Source: AGHT+IEoinAsMN0yq439ZHCwqXnK+Ns010OUg5RlMdxFeB3UELuqz4AFuQm22UjqJ7d1nRTwWqbk4HtPlh22EXFp+n0=
X-Received: by 2002:a05:6512:1095:b0:52c:de3a:839f with SMTP id
 2adb3069b0e04-52eb999535fmr12759846e87.20.1721046623706; Mon, 15 Jul 2024
 05:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8AxXZ2Cpk6DiCo0V8sk7pROD-Rp-WXkUHU5mGmHcK2Qg@mail.gmail.com>
 <28508.1720812152706147809@lists.openembedded.org>
In-Reply-To: <28508.1720812152706147809@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jul 2024 14:30:12 +0200
Message-ID: <CANNYZj8Bn-5twN5pK-PikX2Tr-00V4V72SNEGUVm_osHYMjAtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: remove paths to sysroot from configargs.h
 and checksum-options for gcc-cross-canadian
To: ohnatiuk@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 12:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201921

On Fri, 12 Jul 2024 at 21:22, Oleksandr Hnatiuk via
lists.openembedded.org <ohnatiuk=cisco.com@lists.openembedded.org>
wrote:
> gcc recipe structure is quite complex. Where should I put these common functions? gcc-configure-common.inc ?
> I see that all 3 files (gcc-target.inc, gcc-cross.inc, gcc-cross-canadian.inc) which use this code `require gcc-configure-common.inc`.

Yes, I think that'd be the best location.

Alex

