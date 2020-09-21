Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.41522.1600693406743245262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 06:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AFSgVIcD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id x23so12042320wmi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HFUJfgAmNsWyK7XhoGeU1kAfLDiLCrpMboqzrXjqj98=;
        b=AFSgVIcDZJoR908sMGrH/DAbv1IOIz1ZYbTDlArKtE4MwshPVjZMi+QJ/2o1Ok59N3
         0LNEmQ0581w4nDWhlLIrZ9etDPwWV4unEz45TUtlGZbl86c5hYn1ytMcbdQLabANM6od
         GDfWhsloGSpub+dGCaTGWS200Mymuuyb5r4Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HFUJfgAmNsWyK7XhoGeU1kAfLDiLCrpMboqzrXjqj98=;
        b=uif03w8xZ+IRwwK02RoEi+VMB3ECYNRY5/6BF/3SFNohEs2SL2QxZcG87RJdxLz/mH
         ExYGqZfsADaoxKlR2SiEOZo7Wp5nCVowpBXStmj4S1z4p8iA1XhtWml3283V0iwnvoW6
         7g3gumFXEJy2xPKb3B8iYg2kLbQjRrYrXCzPeP76Lii0a9aRr23yJ+f3Aq4qhyEGAn7l
         uWX8JbBqZ8tWKCIBY3p3SGCG1gBOztsTbS+QAW7sZRsJWE4kWxupzX5qlAAVMmrtOqhK
         MbEOlKaUJI/KJdvsw+SsmZoErDSvXTjZgvMmsaVxxn1YYRj+0k3io4jzfzJnGRvVS8q9
         HJdg==
X-Gm-Message-State: AOAM532kfzTUkxmsLPGOKS/LfDrAhuGNZFLeFh3Kbyqula2tvVWyV1kq
	EK3g7b95JtpQHpLHi9rxLbbtNA==
X-Google-Smtp-Source: ABdhPJzQ5kKBZGPBBS4tbqeMmgg9muY5b7iDZrqzH+qLagTU3r+os+aC8YCqz0PScyFbVKHNlh4p3g==
X-Received: by 2002:a1c:bbd7:: with SMTP id l206mr31995003wmf.185.1600693405021;
        Mon, 21 Sep 2020 06:03:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.c.9.a.6.a.b.7.4.d.7.f.b.8.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.c.9.a.6.a.b.7.4.d.7.f.b.8.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:38bf:7d47:ba6a:9c04])
        by smtp.gmail.com with ESMTPSA id c205sm19704644wmd.33.2020.09.21.06.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 06:03:21 -0700 (PDT)
Message-ID: <5e940f933da98f5546c1626e8f2ba0fd7b3c58fa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-fitimage: generate openssl RSA keys for signing fitimage
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Usama Arif <usama.arif@arm.com>, openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Mon, 21 Sep 2020 14:03:19 +0100
In-Reply-To: <20200908122835.38284-1-usama.arif@arm.com>
References: <20200908122835.38284-1-usama.arif@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-08 at 13:28 +0100, Usama Arif wrote:
> The keys are only generated if they dont exist. The key
> generation can be turned off by setting FIT_GENERATE_KEYS to "0".
> The default key length for private keys is 2048 and the default
> format for public key certificate is x.509.
> 
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 44 ++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)

I'm worried about this as keys are generally something the user needs
to handle carefully. Making it all "magic" means that a missing key
might not throw an error when it should and also, someone might not
save the keys when they might need to.

Perhaps this code should need to be explicitly enabled?

Cheers,

Richard

