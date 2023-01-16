Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF78C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 17:56:29 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.174424.1673891785187692097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 09:56:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MAkLpfKF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso2865755wms.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 09:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EEuHprCPixbwNOrMLlmTYLF4ppO0dL6iQidupboEeX0=;
        b=MAkLpfKFNsmKPBV0IPZKLJncmJv3JYQaouRHAcIh4E0tuAhUOqeqePeHQNq/qPXkDW
         r6fyhhMH1rmICDdFJto1itzQ5XcM6HDXw2H5uEHgIRpQdrLf3CQrFFSU4ZXCsYzzMevu
         7rWwKFKwpCL7QFegNhLcLAopJuseRIDf3TB/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EEuHprCPixbwNOrMLlmTYLF4ppO0dL6iQidupboEeX0=;
        b=NHQj518zfch0kl5Xfy9GYpy4nIM66OcfB02Udm8Lb8zb4jOH5aVJpfGJjA9NqPiGQU
         toPqRTrRH2TSIPU64FJ5r78G1ilUyEPRzY4T75JrpElNiT/8Imob0fsImkJ53vzhcrTR
         P+Wwo33TEYs9EaaEUFRVb8PQE9PLV5zP/FOTOiMiOsVhi5KiBDxMzPQY4U5xoXwjkEV6
         QGQoac+ZSLzDsw8JCQz6ejCtSk5mg52W4hKsIqibl9wtNuZ4Q59oJaPVM02H0h+fA/+s
         ZPSADw8h93NqavU2pkkS3Vf4KiVIr9ZP6aWvxEsI9fjnPuzz3z98nwmmBkxcKMO2ATRr
         CwTA==
X-Gm-Message-State: AFqh2kr/x12q3FO+ASdrBxq5r4Pc7eXxfhyh2+cHmQMgoYOwz/uDkY0u
	Y14ZOqVFEqnXd7zW2P4tJZfMlw==
X-Google-Smtp-Source: AMrXdXv3qx8N5XJCVqA6Az66zdGnIJkkX5JvJChTa8PkCJu2rBjdnm1n1MiDaVBclUcVstvZAfnx8g==
X-Received: by 2002:a05:600c:4928:b0:3cf:a41d:844b with SMTP id f40-20020a05600c492800b003cfa41d844bmr367258wmp.5.1673891783320;
        Mon, 16 Jan 2023 09:56:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b003d9e74dd9b2sm33165376wmq.9.2023.01.16.09.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 09:56:22 -0800 (PST)
Message-ID: <b5b5df9998b2a854bc7d4d9f038428638c05fdbf.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] neard: dont pull in wpa-supplicant
 unconditionally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2023 17:56:22 +0000
In-Reply-To: <II9LOR.Y1Q7EACQVKAA1@t-online.de>
References: <20230116164325.289867-1-f_l_k@t-online.de>
	 <ca881583fdf1906bb5828607c19a11113cbd895d.camel@linuxfoundation.org>
	 <838LOR.7MMYBGDJNPM51@t-online.de>
	 <74d632633cef4a52f0833ee6eeb1141403ecbff4.camel@linuxfoundation.org>
	 <II9LOR.Y1Q7EACQVKAA1@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 17:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176011

On Mon, 2023-01-16 at 18:20 +0100, Markus Volk wrote:
> Yes, that's right, of course. What would be the preferred way to deal
> with this. The dependency on wpa-supplicant is a bit annoying. Should
> I use a bbappend to remove it, or is the RRECOMMEND on wpa-supplicant
> perhaps removable from the neard recipe?

It might be time to add something to meta/conf/distro/includes/default-
providers.inc along the lines of:

VIRTUAL-RUNTIME_wireless-daemon ?=3D "wpa-supplicant"

I don't like these but probably need something more central/standard...

Cheers,

Richard

