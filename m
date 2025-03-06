Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABC3C28B24
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 16:35:03 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.18368.1741278893573352701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 08:34:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zBls2qoB;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30baa27b209so7465021fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 08:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741278892; x=1741883692; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KyqdrDfqjWJurLTIZVndd/iWGW+uJWciOBmY4qVP+6M=;
        b=zBls2qoBJj9kJuOMS95Lvcmvv09qKjMikHM4iOdGFJxYuclWF3iWgwEKnFHU1122YY
         peQsbJBag1mlkbhxsznamHr35SvkUrjIAGDwAD6PLQuLXnXMVR3ApB7/amV+YnpV1dXW
         yWd12pB1Qarh6iAMXRqm/K0EYrYKAaQpNYePQcXSd3DCbzodhHZHouLaFZ/OrZ5jJ6PR
         bhMITQSsGckmNXmKsCOX2zS9kWVZPU6OgoA4C2xWlF1fRZV5+ec95RdnEWO7WU0FWG1r
         O1pmE87N/cnaDhXPvdDYryCbxXf6YF+BJyM3WKx4yb3iFI4ibDgJq35MxiyyrJr3XUmM
         o9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278892; x=1741883692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyqdrDfqjWJurLTIZVndd/iWGW+uJWciOBmY4qVP+6M=;
        b=KJrYCoNF8DZ/LdN9RqIQ9sRLe1qAFF27yarW+WZ/ZSGci3UU3gpomtAAfwvR0y/D6z
         ID6ACejXI9oMwCpxKCJ8SBcekRmpvC7V8Bb7gAIJbZMFtXtbHK2Q8bEA1PUprxUUPbXj
         nTH/N+QPZx3+IcaHpSPimZ3WJ0XmY5SRgBSugAPzcR+4SnLSWdvf7mdvSsvGf/6qWy+O
         ZpVYzKMqflDeK3nvJet5HK5bYkok4TI5/dkKmFAY452M3gc8EtgXlUN7TyqLRYqMFgSI
         XB3IAYdLy4oIRr3feYcC0Y21kqnRiNW9JcqM8Pzm3QdlPby7W0Wcu7N3qFykadS8VUyo
         PWhg==
X-Gm-Message-State: AOJu0YxfX0l9bPmfbIx2CKoD4sky3mtkXkFpalwEYqhlr906xjtt/evN
	YYJ4wvlwWGaEmrM0EDmv/y8yEUCoJmv+XCZIa4yC75ot825c/3k7HiKAhJs+diU=
X-Gm-Gg: ASbGnctXSVNn0sgYeH8D0bDcK5o2vxnkqt9rqwcUwvFccnxziNnBBb8tU+OmFS0wCI0
	pytrPuMk/lNsFT8n2TFiPz9MrPiSvxf7BdqIsMSZ1ARAg27lpfqhnBFL9O7mVonqrizPbs/n+VA
	okBWc+8+MVWITqRf8lGzbvFWlVYye68fpPzjXpKj5QTkD37Tx72GpULx5i7QjqP2n6XvuDs9npW
	K8SfKy7/Dr2uTgVthBGDeLyP0YMZQxZQfn4csyyIiWJ3Iv+1Cn6lhoCpaUl3fVQ0ry/o88gECIe
	U3JBc8ViS4TsNlMdSQjSRK1+J4Vf25PeynncFCKMpjAIKkazUeAQF7unNYch5w7MpOSD/W3EYWh
	cey8n5cUr3PEpukamngqMCtih
X-Google-Smtp-Source: AGHT+IFmHpwEmaaejze75VqU8ogIDByj1UF1AdLtRUoeGu9yzkez5mnzQKHkulztCAxrcI1K5ETanw==
X-Received: by 2002:a05:651c:1401:b0:30b:b7c3:ea4d with SMTP id 38308e7fff4ca-30bd7a43da0mr23978321fa.12.1741278891543;
        Thu, 06 Mar 2025 08:34:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bf11ffed0sm885291fa.102.2025.03.06.08.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:34:50 -0800 (PST)
Date: Thu, 6 Mar 2025 18:34:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] dhcpcd: upgrade 10.1.0 -> 10.2.2
Message-ID: <hgsl6c4c5rdbasqucpei4ino3zdipd77xbpipkfwzjdspdmr7g@ycs5t4vjsqbe>
References: <20250306145246.2923077-1-quic_bpothuno@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306145246.2923077-1-quic_bpothuno@quicinc.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 16:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212397

On Thu, Mar 06, 2025 at 08:22:46PM +0530, Balaji Pothunoori wrote:
> This change includes:
> a. upgrades dhcpcd version to latest 10.2.2.
> b. update LIC_FILES_CHKSUM for dhcpcd
> License-Update: Updated MD5 checksum for LICENSE file to reflect
> changes in version 10.2.2
> 
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> ---
> v2: added commit text.
> 
>  .../dhcpcd/{dhcpcd_10.1.0.bb => dhcpcd_10.2.2.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.1.0.bb => dhcpcd_10.2.2.bb} (94%)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks!

-- 
With best wishes
Dmitry

