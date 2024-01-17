Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3516C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 14:37:09 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.3816.1705502228901627521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=N0psXhVx;
 spf=pass (domain: konsulko.com, ip: 209.85.219.178, mailfrom: trini@konsulko.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc223f3dd5eso1785573276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 06:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1705502228; x=1706107028; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=064cjQSrk7adufNfngpcI0Nrwe/SO6VaIIGNoKSP8yY=;
        b=N0psXhVxnbv6W9N1/zr9bl8JLB359oUccN0ui5WkxkVuml3xoYCZVYitu4s8oqcWF0
         oPrhN/R9Ib0B9b7seDUjfXJbwmeHyXgZMDL3nohFg6VIVBBT4MkAJoqy0R9/oo/Meqwf
         LD7alKRYC7+H2XTIwFiKth110U1lkhTCsG2KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705502228; x=1706107028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=064cjQSrk7adufNfngpcI0Nrwe/SO6VaIIGNoKSP8yY=;
        b=Q0vx71tUtfso4QryrHbEn50F3Qlnj/Zk7B7nOU33L/g4sxppnMV5lkOX7kxoNlk6H4
         5I/Uw0cQxC0ez6jezkqVxsUWxfo1segm4B9OgyHBSrMTgylHETBDhFgd8AtJVx6CfeiP
         QFskbFekGSopQZ7xLuFFQg+5cvBrBqZnFHyb+o/cER1bFM857MPbQGaK0IQwIaBG/Cg5
         B94hg5iMsy6RELJ7BQ4NE8+uYieg8dXeHNiteL/ljuld3cClZZQ292RdptzQe7s496ko
         bmGUAHA5JnQKOTOJl5i9V+fp4qNnK1srF9HHNFDS3kej+LRO8Z9WeTHAsOxpiDpbj9sU
         8Lgg==
X-Gm-Message-State: AOJu0Yw3VIaPBhbB51WVCNYeEDEQTh73wkHvcA3OV0JhJCbJs886wxVd
	zT7iEVMbNJ0ff3qIqYFpOIuGL0mtlGlOqhPmnMAkHQNrp0I=
X-Google-Smtp-Source: AGHT+IFxWyD5eJh2kOZ1Dti9941uMgoiPVzhdrjVgzz+bYXjy79odHBAidMUwlow7p/EPmtSmhjPTw==
X-Received: by 2002:a0d:db4b:0:b0:5ff:7cd9:6b92 with SMTP id d72-20020a0ddb4b000000b005ff7cd96b92mr124036ywe.98.1705502227971;
        Wed, 17 Jan 2024 06:37:07 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-3119-0000-0000-0000-1002.res6.spectrum.com. [2603:6081:7b00:3119::1002])
        by smtp.gmail.com with ESMTPSA id n186-20020a0de4c3000000b005ff755fc857sm208861ywe.3.2024.01.17.06.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 06:37:07 -0800 (PST)
Date: Wed, 17 Jan 2024 09:37:05 -0500
From: Tom Rini <trini@konsulko.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uboot-sign: support to load optee-os and TFA images
Message-ID: <20240117143705.GW12635@bill-the-cat>
References: <8f804eb9fff6b055a4d53198fa4553242e1204af.camel@siemens.com>
 <1770.1705462624460046867@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1770.1705462624460046867@lists.openembedded.org>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 14:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193913

On Tue, Jan 16, 2024 at 07:37:04PM -0800, Jamin Lin wrote:

> Hi Alexander,
> 
> One more thing, So far, bitman only support hash 256.

What hashing algorithm would you like to be using instead? We can always
include more and better options with configuration as needed.

-- 
Tom

