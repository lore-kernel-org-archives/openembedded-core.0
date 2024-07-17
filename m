Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAB0C3DA4B
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 11:14:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.12779.1721214879172906988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 04:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PriGpLLh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so45291165e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 04:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721214877; x=1721819677; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HtMpjbb7fISYAENSjE7Mzr3Gn48HrXbqMpaWBp4jasI=;
        b=PriGpLLhpu9tg9n91Sv47VDNWyH3Z30azGXLEkCMzCY4wpysGLah/bGKBsAEWuDj1U
         Tfh+tSQV0GRXDB06uAoJOZWZd+kLAI7I+FLRlCfNGPUd7Lz5b/yiDvQoZi2Z+fk+vJ2Y
         dFca4vMjpqDTa3Xj0zIGzVND3sSB/OWzcldrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721214877; x=1721819677;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtMpjbb7fISYAENSjE7Mzr3Gn48HrXbqMpaWBp4jasI=;
        b=lihZsEHiIQl8wTEZMlHK7Gz2k2fNySe+WlEd1govpG9BqsUjXhJwYbXPDd0k6g2/yF
         yXXv9JVGetWrFAaF2jUsSTdAY0Nywb5BTn8lkRuYmFvjbZZbAey7YXLLTeewmSs9eARG
         FKbb3llL0FUGn861ZWIjyJm6iLdOy9VGmPe7KhLXqSmblLpR853HkIPko34tCnzHrFSU
         NgDqQMteVkcjxLXyaUopKUgqI6R/g0vhJ8mEmbiby6QYoE5agYWL+Gakwkdny55SR76y
         M8cLNWhtPCiuaO0OsYROUYa18JTYHTMCe13Ptj0tHPrHUJIVla1P4mTKyWL/07whir/M
         79iA==
X-Gm-Message-State: AOJu0Yya7DCB8ikILDcbIXcPAVxvO7utoGiEfbtahI3/66G4sM30DZdu
	dLvOfMIr3zfF8OnRlF3IONX/0UmJkWGVOcmNMmkx710xh6SW/kdGORiBFYFAo3s=
X-Google-Smtp-Source: AGHT+IFZ+wc/8JYsx4Kp78sycWB5hhveaxSFjt3oyKeblQX/+ov6pB2ibXvhHfn20kvO9N/Hs60TVg==
X-Received: by 2002:a05:600c:3552:b0:426:61e8:fb35 with SMTP id 5b1f17b1804b1-427c50e29a7mr6095845e9.4.1721214877582;
        Wed, 17 Jul 2024 04:14:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9a16:3e6:efff:89c6? ([2001:8b0:aba:5f3c:9a16:3e6:efff:89c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f23cc5bsm199110185e9.2.2024.07.17.04.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:14:37 -0700 (PDT)
Message-ID: <fcb3124819c1cb100f3a9599e1e604ef07285523.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] python3: Drop generating a static libpython
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org, Steve Sakoman
 <steve@sakoman.com>
Date: Wed, 17 Jul 2024 12:14:36 +0100
In-Reply-To: <CANNYZj8ULdOa+-4zDFUWh5_moKeqndOJ+k7tUU9fMxHQDjR_oQ@mail.gmail.com>
References: <20240711112749.1212183-1-richard.purdie@linuxfoundation.org>
	 <23423.1721207846219832779@lists.openembedded.org>
	 <CANNYZj8ULdOa+-4zDFUWh5_moKeqndOJ+k7tUU9fMxHQDjR_oQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 11:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202156

On Wed, 2024-07-17 at 11:20 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> You are welcome to send such a backport, but it has to preserve
> existing behaviour by default.

Given I found no users of it, I suspect if we wait a week or two and
hear no complaints, this one might be ok but it would need a little
more careful review/testing/TSC acks.

Cheers,

Richard

