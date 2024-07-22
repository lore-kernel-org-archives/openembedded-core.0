Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C22C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 14:44:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.19941.1721659442004754803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 07:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JyuXNuot;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3683178b226so2147262f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 07:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721659440; x=1722264240; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TX2X3ae+sFKiYiU0m3Uul7KRz823tY6weMtkAG1q8cg=;
        b=JyuXNuotat7MpHPXB3ojEruBpZ4ekThW4zxvk8f7ljWYo5VjXtfk64tpSru4g5d8UH
         LRkT4kVL/dU8dC43xtmKp5VEZxyJRPzFS8aWcmzXQlusuJmltaRV0EKlXFDkh3JdXada
         cHooQm2GxjEepJhpjRp4XEd8agXlCeUXiaw1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721659440; x=1722264240;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TX2X3ae+sFKiYiU0m3Uul7KRz823tY6weMtkAG1q8cg=;
        b=byVKzuUOPD5fGOtMXbrLNKgvxWhQhnI+P9qJh1PJBhFrIROxttBljPASA4xB24YZ4Z
         hSIdD71hVugx7PqiECSaV4r3ekGcGVCpaBdCo9JvhS5iyC6py6M5DmmEDTtQiRDh/O4n
         RefiiNeGkQCKxAKXzhcbcHjAeHGUtQkkS4scf7yCIzDIkmJs2vSUMJo3ZcT/Ig+PgPzs
         G4KzchuFWteE6WMZw/6jU8obupTk7lCIWKMAhD9xeLCY44bqhve8ZIP9TUhjAm92d4on
         Y4CM727VpLFyIUCL8Cp/M1fvEah0RGr1aRIvm0Vazf5pJ8DqCiaeRP2ZbusTR3zaxdVQ
         3iVg==
X-Forwarded-Encrypted: i=1; AJvYcCWveQq/hpnli5n6WOQQEBQ5BADw9WHe6wdFvNzXNJokeC02ElQx/lHajJBhC0AyeKINEUxFmMTFSW7p/96HKThpe2YKHTBnP97lW90s8s1+Iqhx6EGgJnAg
X-Gm-Message-State: AOJu0YwcOPg9YhZnWzZdcdqTmkT4G88TBuLcTu+4RUd//GYSOuQaCV+W
	DRUHxBcxnjmMXHDux4y4Xdb5hQ3MCMHByC0ww4RvUmHGrcP3b4EzPLfBdC4oCzQ=
X-Google-Smtp-Source: AGHT+IGFRw9OnmFM9yrop0/nZtno3/TRYwBWHtWegFRdYfhcm6FknEgaoNClmy833OAalvQkAyxkng==
X-Received: by 2002:adf:e882:0:b0:368:4c38:a669 with SMTP id ffacd0b85a97d-369bae3c660mr4514928f8f.10.1721659440342;
        Mon, 22 Jul 2024 07:44:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ff2:149f:b661:e63c? ([2001:8b0:aba:5f3c:1ff2:149f:b661:e63c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787ed580sm8655926f8f.112.2024.07.22.07.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 07:44:00 -0700 (PDT)
Message-ID: <c52ad793f05ea2fd92ee97711dddb29c039a175e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/4] lib/recipeutils: add a function to
 determine recipes with shared include files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 22 Jul 2024 15:43:59 +0100
In-Reply-To: <20240717182216.1661015-2-alex.kanavin@gmail.com>
References: <20240717182216.1661015-1-alex.kanavin@gmail.com>
	 <20240717182216.1661015-2-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 14:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202315

On Wed, 2024-07-17 at 20:22 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> This functionality is needed for 'lockstep version upgrades' where severa=
l
> recipes need to be upgraded at the same time to produce a buildable
> outcome.
>=20
> The function itself obtains BBINCLUDED for each recipe and then massages
> the data until it takes the form of a list of sets:
>=20
> [{'cmake','cmake-native'},
> =C2=A0{'qemu','qemu-native','qemu-system-native'},
> ... ]
>=20
> There's also a selftest that checks for the above.
>=20
> Unfortunately this won't detect mutually exclusive recipes like mesa and =
mesa-gl
> as they're chosen with PREFERRED_PROVIDER and can't be enabled in the sam=
e build
> at the same time. ('devtool upgrade' will also accept just one of them bu=
t not the other)

This is partly why I was suggesting the internal list of files that
bitbake has instead of BBINCLUDED, even if it comes from the same data.

Even if a recipe is skipped (as conflicting providers are), I think the
cache entry in bitbake is still needed to know if/when to reparse the
recipe.

Your patch is good and I'm happy to merge as is, I just wanted to
mention that it might be possible to catch the mesa issue.

The challenge is that even if it were identifiable, the code still
probably can't know how to actually enable it for the upgrade/testing=C2=A0
:(.

Cheers,

Richard


