Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F242CC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 13:11:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.32592.1640265067566152757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 05:11:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SjI0r69N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id c66so3603498wma.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 05:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=DQ+b8UgNXwIdycp2mL6C3kb4qd5t5nzL7TXS+wH7Elg=;
        b=SjI0r69NUcuwB9ZTp7J2i5/d8erwLO3MeQtrBaA+TKNTj+xn54z+tkYZ1bRrRsM48R
         a5Zl9CKYhUcOQ8wcWQIdiAhDR5ZcfVd1S4DslO6BqwSu2ppB/uSBc22a3+eIzmvBesUC
         G+tV1CNg2UUqO+lsg/nn8WrHEl+6srxnD1JeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DQ+b8UgNXwIdycp2mL6C3kb4qd5t5nzL7TXS+wH7Elg=;
        b=D/CU/OEO2pUBzeXLi+fWQ40IfGvH+irhJDnffDJ8xeFzx/sApfYPi34y7ZEqB2+Wqq
         IoT/xLGdfzAKmxXuazEYWmWXSe1u91/qo9ALNAboiSrA90731NnOHq8DTLsJGTHTKPkf
         YltYhZmqeSqS3EFkWaj6Mx29pXRJ2ftVL4CZqQZ2U33YGcAweL7UlbIix443bRBId8dU
         hHJwsQghL9uvzRiWIuHoDsUrTRbSAI9Ss/NuWhZRGyQNGGW7cb10Er71xwy+kBlyYbBz
         mCYIFDQwzrZbKPd+8xWv/HHM2/DGUYmO26pcNKoA7nfFv6l8hXSd2L3Kd3tTtcP/IMpt
         EFjA==
X-Gm-Message-State: AOAM532n8llmuBlbDW1Dk5kE6KXI3Zb4xWNwVWtBN5/E6emmkcFCe6o9
	baqIcrtefM2ysBEGYYaUZvL6Bw==
X-Google-Smtp-Source: 
 ABdhPJwTY6ych2CQvFYPDPYb2zsxms0krtFHZXKxr05Htu0QYWOt4Po1x1yPPejYHhNLfkLMViN4WQ==
X-Received: by 2002:a05:600c:224f:: with SMTP id
 a15mr1831069wmm.72.1640265065894;
        Thu, 23 Dec 2021 05:11:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1853:9343:6af4:2b3f?
 ([2001:8b0:aba:5f3c:1853:9343:6af4:2b3f])
        by smtp.gmail.com with ESMTPSA id
 l26sm4485617wme.36.2021.12.23.05.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 05:11:05 -0800 (PST)
Message-ID: 
 <a468b92caeabf9fc6307ee951e462e4adbd10bbe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 23 Dec 2021 13:11:02 +0000
In-Reply-To: 
 <AM9PR09MB46424FF6EC0BC8DA32B7B66BA87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
	 <baa4d9a18f054cc9a9064f9ca415d829@axis.com>
	 <AM9PR09MB46424FF6EC0BC8DA32B7B66BA87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 13:11:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159981

On Thu, 2021-12-23 at 12:31 +0100, Konrad Weihmann wrote:
> 
> On 23.12.21 11:49, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
> > > Sent: den 23 december 2021 00:21
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] [PATCH] base/patch: Disable network for unpack/patch/configure/compile/install
> > > 
> > > Use the newly added nonetwork task flag to disable network access where
> > > possible in unpack/patch/configure/compile/install tasks.
> > > 
> > > We can't disable networking in sstate tasks due to sstate downloads and
> > > also so we can report hash equivalence to the server.
> > 
> > Since no tasks except fetch (and apparently the sstate tasks) are expected
> > to use the network, wouldn't it make more sense to reverse this flag? I.e.,
> > add do_fetch[network] = "1" instead. That way you don't get away with
> > adding some random task and using the network from it unless you explicitly
> > state that you will.
> 
> This is actually a brilliant idea, which would also make it easier to 
> control this behavior from a user's perspective

Part of me wonders if we really do want to make this "easy" for the user :/

Cheers,

Richard


