Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D90C77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 11:10:43 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.24252.1683285040932781854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 04:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=N9vc/CxK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f19ab994ccso16381305e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683285039; x=1685877039;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q7Ad9HQIt9fi0BuPItDrBIXtW+0ctIU00jPmwQUfZgY=;
        b=N9vc/CxKklUsAlIJRqMpVBYw0pwheiA//v+1cw6INKHI63O47XpymDmjN/22EGis8a
         j+G5RNWib5b1X751cKCBOOkK7CL80XlvbVTmrKC55KCkrhtffxz2mHPRqCaJycEstFJY
         Nwh0M0xmnATJJc+sW2iuI5vVXXOqH+hTFaEfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683285039; x=1685877039;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7Ad9HQIt9fi0BuPItDrBIXtW+0ctIU00jPmwQUfZgY=;
        b=RQHmQJvjnQFVKYCs9Oeg1V58fEwOGCIp0PIN69jAZ/e5d2L7Zhh/hlRAPWCzZ2l+TF
         6s5YWQP1bX6Dui/mTl+ChQeeH+jeYC35zh83ARGPJEBqbxjHH6MNoDoGBYXVcUtCJi/e
         AYnGsIAXRu2dz+Fy2b8dJVT3ELRg31OtJunjkHaZXCnjo70GTqN/HHstLraCR9LjMzlw
         ucPEcDBabplvKxGnnaNtOjRpZczdB0L6eTVdVNjJEBUY1JYYWfqcGslhuuRk23hDYS3I
         jRqo2NUBYZQ2xxbBy1emyVlNjDAbVVEmvJdHdCgwsuuvbKcaPJ8OZqpdx8dXMgpkDT10
         n9tA==
X-Gm-Message-State: AC+VfDw9dK5eiqTNAgWMUozZ0vEy0ovQmo35M7vDjKwW/kR0t7dq2mbY
	AM0rDrYRwfz6SDwCoSVy8lIWdw==
X-Google-Smtp-Source: ACHHUZ5i8C/CpNI8jYTOj+7Oyu3RNuUR3WBLfdH5BXqHiT/IoaoaAiFU5m7s0Gs3MdG29Unq5UeMjA==
X-Received: by 2002:a7b:cd97:0:b0:3f2:5400:9d71 with SMTP id y23-20020a7bcd97000000b003f254009d71mr826217wmj.40.1683285039118;
        Fri, 05 May 2023 04:10:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86? ([2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86])
        by smtp.gmail.com with ESMTPSA id a14-20020a5d53ce000000b0030732d6e104sm2049007wrw.105.2023.05.05.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 04:10:38 -0700 (PDT)
Message-ID: <5256ecbe3a4fda1014bbe260740f529d90727943.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4] devicetree.bbclass: Allow selection of dts
 files to build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr =?UTF-8?Q?Kubiz=C5=88=C3=A1k?= - 2N <Kubiznak@2n.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Fri, 05 May 2023 12:10:38 +0100
In-Reply-To: <DB4PR02MB10030398AE71DDC1E005F8848E2729@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230426072204.3255437-1-kubiznak@2n.com>
	 <2826abbfbfb636f23354faddf7d35def35a7dc13.camel@linuxfoundation.org>
	 <DB4PR02MB10030398AE71DDC1E005F8848E2729@DB4PR02MB10030.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180909

On Fri, 2023-05-05 at 10:59 +0000, Petr Kubiz=C5=88=C3=A1k - 2N wrote:
> Thanks for accepting the patch.
>=20
> I can for sure send a doc patch, just want to make sure it is desired
> since the glossary does not list any DT_* variable at the moment, and
> the devicetree class section in this respect only refers to the class
> sources. So I think both DT_FILES and DT_FILES_PATH variables should
> be documented at least, right?

Ideally all the variables in use would be documented in the manual.
We're trying to fix and improve the docs so yes, adding docs for the
ones you added would be great, bonus marks if there are others you can
add at the same time!

Cheers,

Richard

