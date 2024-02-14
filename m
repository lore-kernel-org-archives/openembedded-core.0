Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A77C48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 10:24:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.38795.1707906248488243938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 02:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g9fgNWYE;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-411e71d8a2bso3353255e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 02:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707906247; x=1708511047; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=avIYgSWoaUsH7uySSCxG3+9tVd0jKtro7ucv5WpHFOI=;
        b=g9fgNWYEPJ1pKKXQhiMSxtl9YHTFYmw0nV1aCqJgVbY61A/vyABtM0TLqm52pjPdt/
         DBhsup6m2Q8UJ0rC050mEhU+EpWodu42RiZGPaBzfu2r3lk0OdhdU6uvdc+tv1JmVyr6
         vrofm66XbDDdVlSbUV4ss+0GAfH4g4mrMVdNrlOaPYpmCSgZadMTB5g2OABhZRSF524+
         dlThlBFYAHdIDI2R9qB9OGqWo6iPrpJzlRYbYqLB0A9jpPlwwBUc3gCKPKf0/LhqyAou
         EFqAT5AHswbD0GIde47R6vXQeuMBt72qgaltGhAOyCXc1t/ZdMyywjv9Pi4DkignH2bU
         sciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707906247; x=1708511047;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=avIYgSWoaUsH7uySSCxG3+9tVd0jKtro7ucv5WpHFOI=;
        b=UcCp2H6MOymNOm1sAPsnuoEEN6vF3iFAxnjRT7HmQR1+kLrancHykNTHvmLNjc+rfl
         HbyQ4tjKAZR1zvxn61bTnW+9hlESJrxqI0kAF3BZw/GAZpVcjY0l8y08XGioLNLN4jaQ
         tlpEH/QytTvzBHEp+qpaGj9BP3GnnMiiAt7HZC98oa19Lb1mQHA1lsWov2sKzhaqQih9
         4P5GMNcFUpQaADa2GzokZA6CJsUDJ+jmC0TSBvFCT/iGlJ1UNeuF6MEetTCcWpeJVtC2
         SelgccR1W9n7qee21KaYotI4gmYOBJSWoEb73Wlp5vCmJjmz5lcKXCL0FkWdt6rqfF/f
         B1Ig==
X-Gm-Message-State: AOJu0Yyj4Nd3K4uZ5Zvq4IHOMVCYaNGKsnGCezhe6kCwcqYG36aI9vy2
	LR7mXfHHTLBTP3D7FoBI3DkY+rBj/hDBydRuc3FhANefxOTJrofn
X-Google-Smtp-Source: AGHT+IH5zxHHW/ED1fQ0M6gym5blAGvFVb/OVj5dzGCQhz7kYfjr/6jSiumO3cKOYxhAr73r7kz5ng==
X-Received: by 2002:a05:600c:5197:b0:411:f49f:b274 with SMTP id fa23-20020a05600c519700b00411f49fb274mr558209wmb.0.1707906246727;
        Wed, 14 Feb 2024 02:24:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4UdiaWCjCCxBT7i3zpgmz8/wlo9RElBpp8EAxnQHlSSRYV0RY55F/PoXLEDc3m90YtYmFBWG2obtfoyMTpmZNSw74afLe8ByThmEJAoHwAaQdzxhbo1Cts3qHZlcEKQZU6Df/sctw7pLoIAVoI8HZoZZ3LBZcNsVdt+9BVHk44rrkpWU=
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id l1-20020a5d6d81000000b0033cda3d3916sm3946970wrs.88.2024.02.14.02.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 02:24:06 -0800 (PST)
Message-ID: <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
Subject: Re: VS Code plugin and multiple build directories
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Ross Burton
 <Ross.Burton@arm.com>,  Mohammed Raza <mohammed.raza@savoirfairelinux.com>,
 peter.kjellerstedt@axis.com
Date: Wed, 14 Feb 2024 11:24:05 +0100
In-Reply-To: <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
References: 
	<DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
	 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
	 <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 10:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195460

Hi Enguerrand
>=20
> I may be mistaken, but from what I understand of your use case with=20
> multiple build folders, you can do the same thing with multi configs.

How I understand it:
Lets assume a company sells 2 different products, product-gen-1 and
product-gen-2. Both are built from the same layer meta data. But the
builds are configured differently by using two different local.conf
files in two separate build folders. As an example the gen-1 product
uses a minimal busybox init based distro and the gen-2 product uses a
systemd based distro.
That's probably the most common use case how Yocto/OE is used. It's
without multiconfig.

Now lets assume that the product-gen-2 has a Cortex-A CPU and a Cortex-
M co-prozessor. That requires building two firmwares for only one
product. One for the Cortex-M and one for the Cortex-A. The Cortex-A
firmware includes the firmware for the co-prozessor. That's were
multiconfigs are used to work with two different build configs
(DISTROs, MACHINEs...) to build only one firmware image for the
product-gen-2. For this example the command bitbake my-cortex-a-
firmware would also build the Cortex-M firmware as a dependency of the
Cortex-A firmware.

Conclusion: The plugin should support multiple build folders. A build
folder might contain a multiconfig build configuration. But
multiconfigs are a different thing than multiple build folders are.

Adrian

