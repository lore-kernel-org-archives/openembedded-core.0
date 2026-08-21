Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9706FC5DF8C
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:53:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4115.1787306008616972827
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PLqouHvZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b966dd74so3410835e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 02:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787306007; x=1787910807; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tBeeN0QY2iQGhwDKFlnHxIQ2BvQNiEDzjX6uCWnvOeI=;
        b=PLqouHvZ8dOdDrp5Atk2Ye8GntmQRNdrf7vhXJ78Ke4fdpb9ELCWn2awry4E8OoNcq
         4PcGMb2Xg83uuP/RUL7pe152EhsIVpVLj9bvnVN+Uw4kwddilPqTysrYZBJaQBt2jHjv
         e7+1t8ooW7py5xutnCJexuzOQzuLnA6edFxFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787306007; x=1787910807;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBeeN0QY2iQGhwDKFlnHxIQ2BvQNiEDzjX6uCWnvOeI=;
        b=jEfSW/0u0xvs3JtS140hmig/+M2rWCJVzE4CyeO2oH1VuK3L+khUcXA3RMbpOQIXTN
         gcGf+lhJnCCE6VqdqLOqG3pYI0QY1AYM5Brh3uU22IgpB4ATS8H+3/NPJxlWnpjDs4n+
         hxpm/cdmHuQnuGEHWoZNM+bFWOqc5irfT9bKcKmmqe7oUxbbR1zezin8+gmix6k99Brk
         eP621uqyaBCL68GAjpXYYDP9M7KnDBksGkbxly7DtV6QNV7oSmMgmdS6hwJ4jrWcQupg
         MxaiOFw/aaCQK/NYJMimbd6aV4bZBxXHXOCrG6Cuf+D4/i9+e8vdz2IInxjlFCJaOxms
         sy7A==
X-Forwarded-Encrypted: i=1; AHgh+RquJcke3FrpnB1/OrcEliu8P8wX5kRBvnGEVTK+knbfYupPCQ0gOImdNpIUK7MFWX61GFAjho+6IjZl2kKuOjEjeg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyvw68YZJD2X1/OuyFfWdp8ytW3fzjOUmuJybzzMTBScDrDCbfU
	psHcF8Ue0T9UkKwgSnBB4sECdqOJuABxA4pFKlUY9tOq4YDpdjh8UU5pkwqWOndyut8=
X-Gm-Gg: AR+sD11vHdwouDSJX/1JJQw8+Psr8f+BFhEhUWyjCR0aiK3i8WgD1Bp7N3pPg8fA3y7
	ANg4AaPmXgCk0i4e1NtfZqrlEK4Im/gky07FzNBwH7RivGn/dM29GSZoh58xnLZy7wk95XLngAO
	a57ASE2KSLfUohQwWazL0DD07j7sjYuB38nVPty5fv/ig12xsXerWbzRjGTN/J3z5LOn6wpc4fK
	Dq9jEU1bn8vnilD5QImX2gXyO+Pqw/4wELdPML2r2n7l0f4lP6TouXpupT1hGMawNRAHMvrc4pZ
	MO851h8rY8X8iOsGKRqD8vEFDqIlQSREu/X42cqNHsHtoSGEw5fotmJMf6jgQ8WkTzpfMO5cOc4
	+a58mYQGtn3VxQTV9PTxIdq4RuwwQDkpF3yTyDbt94ajP/MJF7UWOeSiHkfwicY3zOJyI2j7QZE
	VmwJpc90Z2TnNNdFBVn6TmF52fK5OzKyQQi3V2iuYmA+10to83wePM1lbMzGtmjDaqBj8org6KJ
	S0nDlRNZR+/5XGC3OgNuSDg/bQC1X16Z82HSfB32kfvG0ZELORj0w==
X-Received: by 2002:a05:600d:6401:10b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-499bdf1758fmr13379175e9.3.1787306006677;
        Fri, 21 Aug 2026 02:53:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030? ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9049f84sm21894475e9.0.2026.08.21.02.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:53:25 -0700 (PDT)
Message-ID: <de195972078571547fce49942da75b68128a5f7f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] elfutils: upgrade 0.195 -> 0.196
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 21 Aug 2026 10:53:24 +0100
In-Reply-To: <DU7PPF66507B2D78A20F62905C5CBFD51D8F3A32@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260819105724.61332-1-jaipaul.cheernam@est.tech>
	 <a63d458443daeedcb04fccbe9a9b07209ca77949.camel@linuxfoundation.org>
	 <DU7PPF66507B2D731DDFBF104814314E869F3A32@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
	 <DU7PPF66507B2D78A20F62905C5CBFD51D8F3A32@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 09:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243918

On Fri, 2026-08-21 at 08:26 +0000, Jaipaul Cheernam wrote:
> Here is the commit
> https://patchwork.yoctoproject.org/project/oe-core/patch/20260821064959.6=
4772-1-jaipaul.cheernam@est.tech/
> =C2=A0 in oe-core.=C2=A0

Thanks, that is much appreciated. I'll get it in for testing.

Cheers,

Richard

