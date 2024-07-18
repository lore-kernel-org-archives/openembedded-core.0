Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE9BC3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 08:09:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.10302.1721290193279363941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 01:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b22G2SRd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-426526d30aaso338905e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 01:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721290192; x=1721894992; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F5/kx0tEMDeH7egCdujn2NobFanywUuSn0uL5KE65kQ=;
        b=b22G2SRdfMK0b8Lzjtyl/56hE2X8k9uiLX+lY5Mkj9OQl7npVxVTo3PdZk7LE/Yjnl
         hKh7fdq1WrqnYyQO2FZh7YBO5xX045BKTkMr416Hv2D5iVMJOf0VVVnu4pjF+bJbVj8Y
         h0xZegFhOQd9zif2bNOWFPa2S2kZe5zJUrEPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721290192; x=1721894992;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F5/kx0tEMDeH7egCdujn2NobFanywUuSn0uL5KE65kQ=;
        b=lyUKzHICPUXgfHLcGUZAQPvXDdvN8F3xZl8tuNESgvrGKxPtfaQlO4lzxItkMLp0gA
         TGFH5VOC2RyI7/6O9oCCjm5kUrnNzCMByHg/hzcgGkwdPdnmvGtqfl3s19LgUqJnAQTM
         1GTeZvjKHJV/oJmm54NOjXwEqIHa9Ue9yDieC8LpO6AvoqDCb7rpGGUTeatnc67JYEb/
         DJ39GiRT98dVdyuyNEahh7lIFlkgShfSRZvrSGqe3hkSG0M6AQy/ChzFRrjyOjA/2nz6
         7cybQuG0SkldR/96u39MaXK0rj88/QXL1Mj+uDveTsX47i7C/fnjRyhyXb2mK99hJnE7
         yW5g==
X-Gm-Message-State: AOJu0Yy5R5sdccJsS4I1mqz91NK7YWMNOdaGsRZp0IjlWAQK6xnGL6Ho
	ukGUZX8TIufhivW7GzHQhxfDMbwC81GFMK0TUD7XSEKvbFq4EFrGi25QKPPjcDu4Von3ja+fuOz
	d
X-Google-Smtp-Source: AGHT+IEO7U0Yq6QYL8EMnDmhJ1JwcmcwU32xYqzV9LitgmNnIZg56b/GJOaUcIeIrwQc5wl4clgzpw==
X-Received: by 2002:a05:600c:4f42:b0:425:649b:60e8 with SMTP id 5b1f17b1804b1-427c2ce4ec2mr28583535e9.18.1721290191611;
        Thu, 18 Jul 2024 01:09:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:490f:365a:34f5:8141? ([2001:8b0:aba:5f3c:490f:365a:34f5:8141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2b29d68sm285295e9.38.2024.07.18.01.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 01:09:51 -0700 (PDT)
Message-ID: <011f18a97cd6ff44e917828739b62eb49efe2ee9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] gcc: remove paths to sysroot from
 configargs.h and checksum-options for gcc-cross-canadian
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ohnatiuk@cisco.com, Denys Dmytriyenko <denis@denix.org>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jul 2024 09:09:50 +0100
In-Reply-To: <SA1PR11MB582845C51666A74D1410542DCBAC2@SA1PR11MB5828.namprd11.prod.outlook.com>
References: 
	<CANNYZj8AxXZ2Cpk6DiCo0V8sk7pROD-Rp-WXkUHU5mGmHcK2Qg@mail.gmail.com>
	 <20240717095606.3572072-1-ohnatiuk@cisco.com>
	 <20240718002131.GK17572@denix.org>
	 <SA1PR11MB582845C51666A74D1410542DCBAC2@SA1PR11MB5828.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 08:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202192

On Thu, 2024-07-18 at 07:40 +0000, Oleksandr Hnatiuk via lists.openembedded=
.org wrote:
> I am aware of this issue. As stated in my commit, it is designed to
> improve reproducibility of gcc-cross-canadian as opposed to fully
> fixing it.
>=20
> I have another patch I was going to submit which fully fixes this
> package by modifying the code of gcc's fixincludes program to not
> include full source directory, only source file name. However,
> removing these files entirely as you suggest will also work.
>=20
> Of course, it would be best to fix this in code and submit the same
> patch to gcc upstream to fix this issue for everyone. However, this
> would take more time and require us to maintain another patch in
> openembedded-core. Not sure which approach is preferred in OE.

We've now worked out why we didn't see this in our CI and have patches
to fix that but that does mean we need the patches to fix this error
more urgently! If you have something please do send it as I was
thinking I might have to look at this today.

Ideally we'd fix this with something acceptable to upstream, they'd
take that and then we'd drop our changes next time we upgrade gcc.
Maintaining a backported patch is fine, it is the ones that never get
discussed with upstream we've been pushing back against.

Re: deleting the files, the question is whether they're being used. If
they are, we need to keep them. If they are never used, they could be
deleted. I don't know which is the case here.

Cheers,

Richard



