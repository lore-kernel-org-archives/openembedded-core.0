Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E42C982D7
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 09:21:57 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7196.1789723316164648762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 02:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=01AAbVSn;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so282057f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 02:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789723314; x=1790328114; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDhpXnyVUV+ciaZ4INxh06m+6ujOW0zIsewpvkfEKOI=;
        b=01AAbVSnRkBY8lekeXsF99PxmCa594Hua4MBu5LMcmsuUn7ad28T4mn9wxik0O+Uh6
         UfK+Ei3vu/6j0h+g57iTb4/UM+DCt/HyjiFZs39cVHHvvkxKMIlbwADAD2R94VFJsh/d
         VOQc60unapu46T75Fevcoq00RbdMC89zUaB+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723314; x=1790328114;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDhpXnyVUV+ciaZ4INxh06m+6ujOW0zIsewpvkfEKOI=;
        b=tccX86ku5sXMq3FY5bgVi/+hfVlAnRoBP9laGW4YqEU5egJbTWtOdg0BwfKFGXcPat
         kfHskQfw428q2FgcjDRJWF3FcMx7tPUdyoSk0KBCUkP9QPsuNZ/LBD9TdltDLJeiG95N
         txpcLCIJxweeHA16nvg4OXwrTl7qKF0otpvfeZcqGCxf3kneekUmhRVhWkWgSBVtk4gA
         VhTfoDGKUuH7HGvpawoABjmJE9cYL8BntFrP8QhZxCS/U4Ab7hTmkQ8CYrLtBZEzeHS5
         BbuNDxvN6qIVLo6L9OlrxSIJ+6t75WxITbMCwTtpd4wa+NjMGCt6oMhA/U2rvuN5pWRK
         7kaw==
X-Forwarded-Encrypted: i=1; AKwUvBxYPsRBqYMF9NQUeqi34vQztqStW0e6NBIIYHSEo/0IiQlSKBQoA3mwvqhHvWiy4SQLF/gAKL05JloZYFPRWdTVuQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++nQ6pgBn7I14N5M/JCIFQNB8YsKvRYbOG2pue9Q/nvxPglrDX7O
	S8JRzFrrAvP/yz6fM1te1KUcN6PCtX/rQLJM/YLiX1SCkHYFEL86m17bBatvgViSQpk=
X-Gm-Gg: AYBFou2zY488RaFeT50bX0ZjXO8/bCHYb8qYvsfDX4wTT6x7H59aXj1J8apAHi1U/Ca
	6D+eIthMuwBnerP/nTVP2FORFbFELbBqThjycv93HWGTWoW8TFwjx5BqsK4zInmlbNc8Fbm1s6B
	unUaNGXMSq1uYNJA6ZoLkiRmjzWX96do5Y0XU3wQN/RSBPDNSSKfwaOWfx3esG+Znel+Fwo7Hpy
	YjlZiP+NyUhJagU+KdCvN6wCK5CwsO3DZd5EcKyxvZ8vH0K80xo3331FptPbNG9oU4NWQ272f9q
	tbI9iOfSobyrLvxrRZy15MtkGsjreVvb7hD62xyuCdqR3jt3sewHoRK83ozZ0tLYyiCEnBNvy3J
	Yd7Sm38efNqjMfMfcKN2JAV3bDfXU8dfepLUxhCf2Kh+fwmKPLWXv/yFTGnAkWMPOWWCJyL6rQB
	EHPg1DQuU5zB2G5I5IRQx8JCE9xgtLsAP7Q2ymesxnV0jk1eidFDdki4r1XM/4YYwr8/Dn04WEW
	U4tEKqKW92ps+qtxZc0+0mereRMerQA4L+NgVbjtYfyiPHfM4SNLHVAEbTQaps=
X-Received: by 2002:a05:600c:6296:b0:49e:63cd:31fb with SMTP id 5b1f17b1804b1-49fc5714bdamr21555395e9.9.1789723314422;
        Fri, 18 Sep 2026 02:21:54 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc55cd8a8sm43647535e9.0.2026.09.18.02.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:21:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 11:21:53 +0200
Message-Id: <DLIBYRX0TCX1.DDHXW0VLSJG3@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v3 5/5] curl: fix CVE-2026-7168
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <deeratho@cisco.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260804103305.1180770-5-deeratho@cisco.com>
 <20260824094720.2194782-1-deeratho@cisco.com>
 <DLIBX22WN2SX.1MVF74KFYR0Q1@smile.fr>
In-Reply-To: <DLIBX22WN2SX.1MVF74KFYR0Q1@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 09:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246203

On Fri Sep 18, 2026 at 11:19 AM CEST, Yoann Congal wrote:
> Hello,
>
> This patch conflict with other patches in my branch. Because this one
> has issues, I will hold it for another cycle, you will have to
> refresh/rebase on top of the next merge (or send me a new version that
> applies on top of the -nut branch I will push/test later today)
>
> Details of the issues below:
I forgot to add that sending partial series (only 4,5/5 and not 1,2/2)
make my tooling throw warnings... Can you send the patches as 1,2/2 in
the next iteration?

Thanks!
--=20
Yoann Congal
Smile ECS


