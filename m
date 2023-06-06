Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70967C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 11:06:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.6154.1686049564207644975
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 04:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=iL94tIVt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6d7abe9a4so52005255e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 04:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686049562; x=1688641562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukg2rOQY0lODVIwlTtWsezbvAigddWgd3FD9q75KApk=;
        b=iL94tIVt6e2d+Kav/feeUsEZQ56VevIO6/tECLQNYUptD2QFLaM6UMqtI0drYuuvkP
         WHMiy0KmJq2bUmWaUicUqgAHrD92vZzrcdqjTpukLn37eyCCNUpvXdWge1eEKchFWwFL
         UE67S6iOnRWY3m66TduDBn70DHtBE+3qUfHZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686049562; x=1688641562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ukg2rOQY0lODVIwlTtWsezbvAigddWgd3FD9q75KApk=;
        b=ObEBKsI0Ad4gvdZsSjNGsmFpJ9oEM2LH+JJCGN7Rq409GFctoZplFFugvtxxZt11ny
         z4oPx5wAk4uQDlDd4ndRPGA6/acGcmVo39+0db3mtNPC/2SqBoxIS4w33lkXxHrwDGu2
         rS5col4ksn85XyyoDTr270nMXtkj9vorp6zHl2fYh6Jvc+X++m6Yz4aJedNamrakQHMC
         qes/s7kDuWo3TTehJNxpCzh3vuy4hbKSsCeH5ZAfvBKHQHJ3UK1SMFJaEbvI1ET++Rbs
         /g64B2igdDxAVH401+xGP6lqFUs1023Nu7sDWKfWrBDH/poVyivywwjqk8rUbKERi5ez
         mCag==
X-Gm-Message-State: AC+VfDxCZBqtaakawF6SShmbqP7NGjBnDm7IopYTKvOOzud7MLwmeQUl
	1F6miDN9BeWcDAs0BtqVto5hpoyKaRtRgGSkP3c=
X-Google-Smtp-Source: ACHHUZ5vDu3NbYfBXWS6kO2PnF+k94nXu5oTT1WxR0q9nfrAG8ptDOUdPzIp2/kK2VbKOWNb+hmTBQ==
X-Received: by 2002:a05:600c:220e:b0:3f7:3673:5429 with SMTP id z14-20020a05600c220e00b003f736735429mr1637847wml.2.1686049562764;
        Tue, 06 Jun 2023 04:06:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f10:3282:4c2:7240? ([2001:8b0:aba:5f3c:7f10:3282:4c2:7240])
        by smtp.gmail.com with ESMTPSA id p5-20020a1c7405000000b003f6f6a6e769sm13699610wmc.17.2023.06.06.04.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 04:06:02 -0700 (PDT)
Message-ID: <960e71f0a07b665aff2b1ea780781f198036aa9f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v14] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sundeep.kokkonda@eng.windriver.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 06 Jun 2023 12:06:01 +0100
In-Reply-To: <17458.1686044851774043729@lists.openembedded.org>
References: 
	<32fea4adeae13df4a98727293e9aa82b0f65b87d.camel@linuxfoundation.org>
	 <17458.1686044851774043729@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 11:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182423

Hi Sundeep,

On Tue, 2023-06-06 at 02:47 -0700, sundeep.kokkonda@eng.windriver.com
wrote:
> Thank you for review, testing and confirming that oe-selftest is
> passed. We've worked on the regressions caused with the patch and
> fixed the issue.
> The rust builds (bitbake rust/nativesdk-rust) were not part of our
> regular oe-selftest so we've not tested those earlier. From now we
> will make these tests are=C2=A0 part of our regular testing.
> =C2=A0
> With latest sources there are a few new test case failures observed
> and we are working on it.
> Also, we see there is a rust 1.70.0 upgrade patch in mailing list. We
> will send the V15 after rebasing to it.

That explains why we had a misunderstanding in the test results. The
v15 sounds good, thanks!

Cheers,

Richard

