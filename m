Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE375C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 06:56:38 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.11507.1704783395675357769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 22:56:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TCXg5FZN;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-2cd0f4f306fso30186201fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 22:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704783394; x=1705388194; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YL0RtmQPezXsCiTRnMUj/ZhskbJd5hdIjbfomSs9wYI=;
        b=TCXg5FZNQyvQRYRxJTf/dsosLv174K24RhrXEtnPGuF81XZ6O0rupkYSi818n9nVDz
         mkJ2pK3gptnjrYi5OcflpzjBePjNNVK/A//9dO77SdtTvFHFReYDEBmI19w7934eEpyj
         QIA0eyJSdbqNbUB+JslngUH5gDw8OoaG2Y5ONva1A0AGpvFAtHyj+BVDPgYJDh2Utsaf
         IxJg8ZUAqFl78q31TsxjsokJ7fVVu5XX2kGDY/utZsBLrldGJrAHvlV2QF7g+xZCauhA
         Gk05VVCaHtGWFwnV6wQpXdIETY7xVoThFURd48n4Mqupx41X8iEzRNzQ/RMBk7y0JgL9
         uYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704783394; x=1705388194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YL0RtmQPezXsCiTRnMUj/ZhskbJd5hdIjbfomSs9wYI=;
        b=LuBN7OnFoCMuEWeZ3gcOiCWuJdW0cSrHLnTIn5S8norz+ifGdn4HQnaDIJeSY1SedZ
         w1xgSRS2R2Kgxwu9trJvg1frbwQ5t2mr+OfFksN0t9hI7AGipF9VT+wDWVzIjde2cTjC
         DEI5cWEwcyL7hOB3+cQZZPovn32wcFlSdq/qZPZPl1ExbDSzzF2OrjxxKfYiQ+VUGLxe
         zZDmYp6rB+r7eG95f8n/9XMUbibgtW9sF42Tykyu4MGDB/fN/0YAAYvzEwnlzJfvV2A1
         GPsfUxegfrnE87NK78jNiYOO6l74+JAPAYN0f0Es4yIm4MzR0Fcwt+81njvKCCmHApy+
         U8hg==
X-Gm-Message-State: AOJu0YzWH+0DlXBLHupmXIaE3/U23zqj9kxszQAJ5MoKAWJELgVEquIe
	Kaf0jpSTIVIYxeUVHyVmYTswpVB5goTpug==
X-Google-Smtp-Source: AGHT+IG93zve8ipsg1kOh8HkKYJICXZGbpM/c5+oYgRUFxLG//Zfcd/i+8Ik+Xk9YVohV68FlK0mDA==
X-Received: by 2002:a05:651c:1992:b0:2cd:633c:55b6 with SMTP id bx18-20020a05651c199200b002cd633c55b6mr376171ljb.46.1704783393651;
        Mon, 08 Jan 2024 22:56:33 -0800 (PST)
Received: from nuoska (dc7g6tyyyyyyyyyyyyf5t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::133])
        by smtp.gmail.com with ESMTPSA id s16-20020a2eb8d0000000b002ccd49fa5a9sm249862ljp.19.2024.01.08.22.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 22:56:32 -0800 (PST)
Date: Tue, 9 Jan 2024 08:56:29 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: david.zuhn@sonos.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/1] rng-tools: remove unneeded build time
 dependency
Message-ID: <ZZzuHd4vDoIlXTYk@nuoska>
References: <20240108220903.4086110-1-david.zuhn@sonos.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108220903.4086110-1-david.zuhn@sonos.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 06:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193443

Hi,

On Mon, Jan 08, 2024 at 04:09:02PM -0600, david zuhn via lists.openembedded.org wrote:
> rng-tools used to depend on libsysfs, but has since been changed
> to read directly from the /sys filesystem.  The build time
> dependency on sysfsutils is no longer needed.

This is a good change log entry but should be in the git commit directly
to be recorded in git history. No need for extra cover letter if change itself
documents everything.

Cheers,

-Mikko

