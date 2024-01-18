Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53148C47258
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 03:25:02 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.3440.1705548301031879089
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 19:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Cz//iq+5;
 spf=pass (domain: konsulko.com, ip: 209.85.160.175, mailfrom: trini@konsulko.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-429c7ba12a2so43939281cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 19:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1705548300; x=1706153100; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mLfCrKx8aK1g7+8NV1OmyGw+dLitqI4DRZK21MDUBJc=;
        b=Cz//iq+52soXedljIDTSE3QU2IPwXqpbb8lanFRijGzzGl2nQWF9kCwiflhaRxcCky
         06v+XnLLacEpjyDtEBlWbGnIbU5s73z9d+6mHKstm9Z0Dbyd4SU8tP2NVLhpXRgbwI3K
         dBGzdG4A6EhM6VMEDqz/IG6siHxSEGAkzT+Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705548300; x=1706153100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLfCrKx8aK1g7+8NV1OmyGw+dLitqI4DRZK21MDUBJc=;
        b=sCQ1fZa9pK2qFO0KyJ4BaxDssuLZs+FifJOmhEoKPQjFwUevOvYBag9iE4XRb6XsAi
         a/yLuGqewtiugnVHdOmpf9bIjNAxAlbtjvQrtG4m9ozb4xVXjLtADzL74R02OyUhwOYO
         4mIN3aIZ8lbnhmBuYJw9R9cmTyKwWPniRA8KIxknrolAL/TUQ7cMtFokcUMGckumy+ZX
         cbSN8ieOHC2kruH/WzBJZCsUO40NAgDSI9v5zxjEFpIKl9Bo4GewTGilzqDZXjaCZ5Ze
         pRMzYcjrVxKKEl6nD+YRGUWfLrrDIdABXu/OpBvySxzg2DL5kcj9v6ENOKcUc0jlUsh0
         GzVw==
X-Gm-Message-State: AOJu0Yz44NdjIx3lc2Pa2pr41OQ3vYaS6Z1Y6R3UxUA8CnL2afnvShx5
	mCh3NqTbsLPhRUGNEPUTvW7iTUDXqKQ0dqU0qYkTelLiToNU29nP+HsElTejrAzBdPpe5KQnVzy
	Q
X-Google-Smtp-Source: AGHT+IErO3HwYRy5j6xWR3bPs6FaBTBFmjyOPoaWttSOd91iFDYblDC96SOJjUDfq35Xcd5eLB2mWg==
X-Received: by 2002:a05:622a:612:b0:42a:6a2:3904 with SMTP id z18-20020a05622a061200b0042a06a23904mr225111qta.101.1705548300103;
        Wed, 17 Jan 2024 19:25:00 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-3119-0000-0000-0000-1002.res6.spectrum.com. [2603:6081:7b00:3119::1002])
        by smtp.gmail.com with ESMTPSA id g7-20020ac87747000000b004181e5a724csm6364030qtu.88.2024.01.17.19.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 19:24:59 -0800 (PST)
Date: Wed, 17 Jan 2024 22:24:57 -0500
From: Tom Rini <trini@konsulko.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uboot-sign: support to load optee-os and TFA images
Message-ID: <20240118032457.GZ12635@bill-the-cat>
References: <8f804eb9fff6b055a4d53198fa4553242e1204af.camel@siemens.com>
 <1770.1705462624460046867@lists.openembedded.org>
 <20240117143705.GW12635@bill-the-cat>
 <SI2PR06MB5041B4FBF62741BAB50A66CDFC712@SI2PR06MB5041.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SI2PR06MB5041B4FBF62741BAB50A66CDFC712@SI2PR06MB5041.apcprd06.prod.outlook.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 03:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193962

On Thu, Jan 18, 2024 at 02:19:09AM +0000, Jamin Lin wrote:
> > -----Original Message-----
> > From: Tom Rini <trini@konsulko.com>
> > Sent: Wednesday, January 17, 2024 10:37 PM
> > To: Jamin Lin <jamin_lin@aspeedtech.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [PATCH] uboot-sign: support to load optee-os and TFA images
> > 
> > On Tue, Jan 16, 2024 at 07:37:04PM -0800, Jamin Lin wrote:
> > 
> > > Hi Alexander,
> > >
> > > One more thing, So far, bitman only support hash 256.
> > 
> > What hashing algorithm would you like to be using instead? We can always
> > include more and better options with configuration as needed.
> > 
> > --
> > Tom
> 
> Hi Tom
> At present, makeimage tool support hash 256, 384 and 512. It also support rsa 2038, 3072 and 4096.
> It would be better if binman support these algorithms.
> 
> I patched uboot-sign.bbclass the original goal is to make yocto support optee-os and tfa in the old version of u-boot.

Right, but it would be best if OE leveraged binman I believe and in turn
you made binman support taking the hash algorithm as an input as needed.

-- 
Tom

