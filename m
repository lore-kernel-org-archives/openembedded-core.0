Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C633EE87847
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 16:25:36 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20477.1770135935562231209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 08:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lu+Rbyvg;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c5389c3cd2so599550685a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 08:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770135934; cv=none;
        d=google.com; s=arc-20240605;
        b=Hf3ZDYEhIdKDBLJbIX0tX76Qi06cEAUNB7Sk4T7eWdQ3RKXDJ8pokzgpsyjp3FvCEr
         PmhByhZt4j3wP6XtCtRFHd2VRa4zCmwZZbvI/BW2Wdu+eA26mBykteMhHsDdS48JU0qO
         u96jgCt7/xhYzlgDn4FhH1DYv7qMWsKdwKH5zFc9tyKlv8XpYS3F/Jl12LMvepZ7TYuQ
         k+gBl3Ggja3LgsQzAXQ2Pt0jjyLNco2chDNdv946S1+wL7b6wzStDzrYQ7G/SxlyZyHP
         ENOF0kWnIOl9Jwm/j+t6VYtC3RIUL6b88XVmhez3WYUl1KB+AKlO5ZgivmoypiFHXGiC
         K1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K0anuXLOWJP0qUx1Mcj+XuQUeOMvtE02xqYYTQpoKog=;
        fh=hMvX7Neg8SABZJdZP9hUxP3d1in0keu95/1GmREQDdw=;
        b=lr/XJqOVn8E5fJkglzj2YZnGH6dJRhH14++k/rSoox4iMLWlZAZRldYxvHUn5oF4z5
         LPbwOQvWy6+Sn+d2GxdOqmZEKxJqJP5yLtf9CDOaebPwBoBLNk1/idKHpeKSH48lCtg9
         nH936TCN75CRaIw3iV1Fj2UpBuiV9hpxwDDQtlxpPkEu8B17MYKFoVjQX2a//sll+PPR
         sBG2A23tJ1vucKPOKRG4kfHg2dgGe4lR/6j1ghj9/WnzBzv++kI0Kp5AfqMifRqEjgR2
         myGr2L1kv+plxMEBVj2k+uRN4/xwZNCXxeJx73SX3S/bYWFZgcKUYpnOZC+O3ifK1kuv
         Nbrw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770135934; x=1770740734; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K0anuXLOWJP0qUx1Mcj+XuQUeOMvtE02xqYYTQpoKog=;
        b=Lu+RbyvgIzyehjCJZhq4noFOEQNTs98+n5Kwi0uAq6Kco9KmidkJ3EGzoM8FaM1D9Y
         PQ3hRRf17EjfL0KBYVsVDJ/LS+5DsrbO2kvD6BU3Ymo55byFpao8VuyTohc0Hj69Y2RC
         EnuR4wW9cehse2G+nFYNtRFgM2yvKKlpvYsYAZkkPXhAniX/ARlHBE2FCYwwVjakujW9
         dBnecXzBAOwqtN/PJF7IkPrv326vlDjT8gDjFtQVUBUuckVWpmHLk5zRkaLPkNM5KhzO
         qMp0YiLNj0y43jlw9TrawzCz+SQIUMbulni4QLuseB/5hCHSxcpp0QhVZ8psKAqaNVZC
         EDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135934; x=1770740734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0anuXLOWJP0qUx1Mcj+XuQUeOMvtE02xqYYTQpoKog=;
        b=ddp/PfVdomMPJJcMu1+uqkxPJiJ2wgmAEdYw+cwBVH7DSEghRqml9X2BEc5fk4Joh7
         cKsNOZKutmfXwdhfOVYMnFDc8d1BPERyNlBzqBLv+2FAMTTGBKsKeKmgbeF/QLDjPiZ8
         szcNSB+Cmkt4U5WiE62JgYMzV0Jrl5w6pQ7QSBTr+EpYQ5F1sBOsJtwhEwwA93gkHFpC
         ZfanLDcv29Mup9rjNvlCGii0EBjtFzA/r137KpGwEo4ObQQi0bOwS5XPpwC4EYmzAZK5
         Y0deNhsvllndAPb831U3R4NhBYIMx9c/l40fbGi21YE2Hmikks+kmOqRvmgzm82b8mvt
         Ijdw==
X-Gm-Message-State: AOJu0YzENJZYaRzQh+WO/r0+6M5GEdGxvWlGba3db380To5gwaXT1N4T
	obSDg4PkPWykyhKjnvbbG8HTMd51Y7f4FT8bdSA1DHRJYpDlQcHyPWTNNewjE/fZpiDe2Z68elk
	gLSy/c56e+TK0rH3NtgRcqII29S+mR8Y=
X-Gm-Gg: AZuq6aL1SlvfTEvaps6706P8KmRbcKWKsev4LDuGAjppW14AeTZ/Xr1xs6au8za+JIa
	8s6B9+t8D5QDe1bbAzhWwUtKZv5APOg6FOQ7aMynjLqtoCVqsAdLjk6Kt6eO6SSlCrhvQJvz36Z
	uBPN53gwzBXZCQSejrnUZFLSlJNyehqsYynnKb88768II5kMszZdii8vgxPq1v6H/bVRaDfqzq2
	xehrW7YBqhQdthJZbbm2i42NEKuCLUvBcGLIgshVsb8fDNSlcrzJBYfZNovbNXI3pJEl5LIMBF5
	7MsNiMPN/maKSWg8wEorULzZ5OCfyQ==
X-Received: by 2002:a05:620a:28cc:b0:8c9:e8e9:9bf5 with SMTP id
 af79cd13be357-8ca2f9b702amr13794985a.53.1770135929833; Tue, 03 Feb 2026
 08:25:29 -0800 (PST)
MIME-Version: 1.0
References: <20260203143434.3117764-1-samuli.piippo@qt.io>
In-Reply-To: <20260203143434.3117764-1-samuli.piippo@qt.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Feb 2026 17:25:18 +0100
X-Gm-Features: AZwV_QhqB9efwf_4rDEqHL0KbTJg7QjigqCdYygOZsamnjRjHKTdQm6-Ds8o69w
Message-ID: <CANNYZj_WD666FjyPdrrrWCGqsSb+cgLen+y2K8rD-Vhx-UcpYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe/utils: filter license packages
To: samuli.piippo@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 16:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230463

On Tue, 3 Feb 2026 at 15:34, Samuli Piippo via lists.openembedded.org
<samuli.piippo=gmail.com@lists.openembedded.org> wrote:
> Make packages_filter_out_system() filter out also the
> license (-lic) packages.

Why? What does the function do, and where is it used?

Yes, it's possible to spend time, read the code, and find the answers,
but you would really help the review by writing those things into the
commit message.

Alex

