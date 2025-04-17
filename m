Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05400C369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:11:27 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5229.1744884678831964653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UNwRxosy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso4739545e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744884677; x=1745489477; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzY6JCrFFAX5UPPqtsfkH7DHHah8iWJnMNDVXzwD8Lg=;
        b=UNwRxosy0AAfemRoxbcy4HVyJdOo+uwMfHiM19qmQVuhrn2IERWVv26quPV7YVrzUE
         vusFLaq6l/wGG5BPE0OEFytNPUSbzLQKtTda9hJgkGzXCKYmoYN+FJ5GfML9FsXYK/m8
         OGc9Kjajw5/+IKlQkdel/3rozY6PhowYWvOTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744884677; x=1745489477;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wzY6JCrFFAX5UPPqtsfkH7DHHah8iWJnMNDVXzwD8Lg=;
        b=KOSo/j4TqERsuhKO5C8hNj87KvB7V5WOcD/2k/522lvGVLwjsHVNHIDSe0NkOo6ncD
         Gq3kA8G4cGlCPr3rSQBFFVkN6NegnAmiX9upT/Z3QYtFYmytgjeMj37Tu9qwp0Eb4PEP
         MYUhXBL9GfmFFwSjFoUcEN0I+SW11Csnjl/e9qfuKoJUVWwv8AxwJVgH8sWQ4IT4b8v0
         fTB5x1n7YGyjlQu05MjOwAEj/O+FIL6oVsVRjNYZ1RfDd9rIOvsZsslxvGuXrk9H3cVS
         Lp1Lde+dARUJGraPCIETlJEFhQ6rW85b4PvlIIo/pU8mAJp4gGcnVnZJ4OrVG6oKcqff
         JprQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzZ+uvdM8yOhZdAm29qipc0TcMxgX35VANeVRypPpt7h7GeLW6uY5qmii88nddTC3Sny9oVsxY71HH7BkQF94GLQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwcG38gJCrxMoiuyFroeQT4MqJyj8EUJn/sqErpmWn7tc5Jl5eh
	/GODlqmxY0M+tv6Wk9UkwGeyc6qD1HU8cEM81KXDWxhYW8E9LM1XdmJMypMgTmE9q275sxVnOh2
	E
X-Gm-Gg: ASbGncuiUDnKGFGBDHCGZFzpHJvqBZTyHFW8GbVnG5caQ4wkIJ1qTjaupchTKZ6+6vr
	d+LhulT3YRTVWyP94aWzUu8A63h16jWBuMgVAwx+agRuQTEcz3POD7lbq10XIYKiqGldtUzPBD+
	MiN4WIxqn0C4qdZNBKA1n2CfEoRdFrRj2SmQy3rquNsGOXi6E933Nf8pRdEWCxeK7PYBsUTk/HS
	rxgUIn22TMPWEORr4sxtP9h+8f1tesvxU2qOjqzs7enJj8/I+0xZ5X2Xih8zmPCwdYlMOEqhbrK
	HSz3WheKAb/bhHWkmVNzqiynd1ucTQDq7Rm9Elh1ColmQQ5JGV3vUJt0V/2C/nkU8Ba2/MP2dJy
	CqZUudA/A3NbNC5c0HB+8RqyQV/B5CQ==
X-Google-Smtp-Source: AGHT+IF2D/rPVqNLXK6xfz9546dddEdUIeeXn9bMLmVv06qBNYR+sciq2XyzcJOPejWfJTyDQCm6yg==
X-Received: by 2002:a05:600c:4690:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-4405d6e078bmr53569195e9.31.1744884676835;
        Thu, 17 Apr 2025 03:11:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2c08:678e:aaf2:4c3a? ([2001:8b0:aba:5f3c:2c08:678e:aaf2:4c3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d3463sm47662785e9.13.2025.04.17.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:11:16 -0700 (PDT)
Message-ID: <95a4ea27c60ac88b47ed68d69c6085179fccf9fd.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH V3 1/5] classes/recipes: remove unnecessary
 qemu inherit and use qemuwrapper-cross
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Chen, Qi" <Qi.Chen@windriver.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Apr 2025 11:11:14 +0100
In-Reply-To: <CO6PR11MB5602D61A318C6EA7C9E1826EEDBC2@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250414053503.1180029-1-Qi.Chen@windriver.com>
	 <c4542dc8cddfd0e401f74629fd7f28e9dd209237.camel@linuxfoundation.org>
	 <CO6PR11MB5602D61A318C6EA7C9E1826EEDBC2@CO6PR11MB5602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215052

On Thu, 2025-04-17 at 02:26 +0000, Chen, Qi wrote:
> Got it. I'll look into the problem ASAP.

I did look into it a bit and the issue seems to be that fontcache
recipes are allarch but can call into qemu to run fc-cache. An allarch
recipe can't depend on qemuwrapper-cross since that is target specific.

I guess we may need to exclude the dependency in layer.conf.

Cheers,

Richard

