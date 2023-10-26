Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BC0C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 09:48:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.66883.1698313692492805255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 02:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dAyjceyV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4083f61312eso5586305e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 02:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698313691; x=1698918491; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GujxO/eJ0wMMu8+sUMm+MgNkOjnfF/it+II0Ki6ULZY=;
        b=dAyjceyVDEMDe1ygj4mMGWV2OMAVQmgY7/dHUVGLOUU+hEFyfAxywDeu5Nas+MEixu
         S2y1YCqxSeS8DecL7xTu3cEpBweJyXVoiQonA/jk9ZVYM0U1xwjxdNERQmtTfB8StWmR
         Mp1aUy2Ju5HNP8hwEI5Y+3uvvQ1VEpLlPegP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698313691; x=1698918491;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GujxO/eJ0wMMu8+sUMm+MgNkOjnfF/it+II0Ki6ULZY=;
        b=omrSsxkBdaYZWN5ivMzunyL0JEEO/2ok0TuHdWdqCk5bPEHUnU8QvbakVb2LvFScLw
         GYGrynrRzA+m+tr87zndY78KcPSVEuJOwa77lgqXaiA3hWZBGd3OprTk3lSMKorE89rB
         puv4Lyz2Gpj2OzzD1BDyGyK1ihe4/QMqFbtQP6ayd7uzebA60VtnR3II8t8mYD09fVeb
         TpwBoj6McAd/363Qyoot9acONt/y1MLi+ccV0D/CCoN+cVX22Z5q8Ds30oVd6pS+0L4M
         6LFXYQDNU0nziHc54spMwfjIjR1fJ46qXWttz+/cRZOk9aO1f5a7zK3lWL1A/o5gSz+G
         4aBw==
X-Gm-Message-State: AOJu0YxzpmFqQfMUJAyyQlWvpSpdGyasgtEN9OFLv3z0P/phQcrlx74r
	TO4D7t9yJVmGskss5ad72kQaJA==
X-Google-Smtp-Source: AGHT+IHUrOcJ2I8gI7aIEj+3f/8yt4k172j3qsyKgG4EF8hJXWrOw1lfaX0cNDwLfS3WafC23nOTGw==
X-Received: by 2002:a05:6000:92c:b0:32d:e478:9d70 with SMTP id cx12-20020a056000092c00b0032de4789d70mr14347019wrb.14.1698313690507;
        Thu, 26 Oct 2023 02:48:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3? ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id e16-20020adfe390000000b0032dab20e773sm13858242wrm.69.2023.10.26.02.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 02:48:09 -0700 (PDT)
Message-ID: <dc7253bbf353c9d27708cda8cb056e6a614979c6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] cve-check.bbclass: support embedded SW
 components with different version number
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Oct 2023 10:48:08 +0100
In-Reply-To: <ZToWNBD4lXRRxocy@nuoska>
References: <20231020074926.230734-1-mikko.rapeli@linaro.org>
	 <ZToWNBD4lXRRxocy@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 09:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189703

On Thu, 2023-10-26 at 10:33 +0300, Mikko Rapeli wrote:
> Hi Richard,
>=20
> I see master-next has both v1 and v2 of this change. If there is a rebase=
,
> maybe you can squash them into a single commit which is v2.

I've been meaning to look at what was going on there.

Many of the patches in -next are in a holding pattern whilst
discussions come to conclusions or there was feedback needed which I've
not gotten to yet.

Whilst I understand the corner case being addressed here, I worry it
creates a whole new set of issues (such as the CVE exclusions for an
embedded component needing to be duplicated). I'm therefore not
convinced it is quite in the right form yet. I've not had enough time
to think about any suggestions to improve though.

Cheers,

Richard

