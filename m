Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3F9C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:52:18 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.92364.1701082332478599591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:52:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qc48KnI+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-332d5c852a0so2526857f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701082331; x=1701687131; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6E3aC9dM2RL32PeluSZb+LkiMf2W59gkU4WPyR48cYo=;
        b=Qc48KnI+GRs/W7DWXcVi74uWqfm+4no/OhD5+DeQkazUkYdUi/xHerwA377F/7ddue
         iN31FiiqAWc3yN1eNNhdHmzSI+CsD4UxFCqt7ZGzpCJTQwR1MbFHRQMNkc6QlWbwo6Yj
         x2U3dTB3kJfvycnCphww4YujMOtHzDPLfn7LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701082331; x=1701687131;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6E3aC9dM2RL32PeluSZb+LkiMf2W59gkU4WPyR48cYo=;
        b=Nwp9WN+M9BbfmwFrwRvQi9nOjUdOjgDJbjlViXrAX12+b/G6cCMIJSXhzwKNZ0eEsY
         o9d3X7i7uw3usC1feOCL9OvzZggk8Wblk0RKqZwAI+lNT6GjhoXXyS+OjF0yFqjP1dDM
         bEWcT+zXacTpbiqw8r68UKy9yOhUh6BwTWC+kT1+stIOl9cmSyDlc/70bMyEWf9C8dol
         Z35zfgPL1GyE8raXs5VcLSKEvDLl79kl6GYo3NBqSdvFNv/YZMyV/rJOyFIuB8F1v/Ce
         AfaHA1S6KWr4b+b1Grx2hR8S31Ay4jsK3Uk+iIWBxJtkH3PdUUbRzmfU3vm/+EzJZb2n
         OS7w==
X-Gm-Message-State: AOJu0YwOZMlBfUQ+aFWRKS8/aIbra0SSfEsFXX6a9AH/uWKPZvnMvHLm
	5atxkWrCSlz4TO2fVyA0RV+85Q==
X-Google-Smtp-Source: AGHT+IGDKFOgPC9tdIF4VIF5rD4AHtwtA+tO4qg+cK049FY8v8dTRpVctsRiGtG64xhMVrKRa99jbw==
X-Received: by 2002:adf:f4c2:0:b0:332:e133:f7c5 with SMTP id h2-20020adff4c2000000b00332e133f7c5mr8337605wrp.5.1701082330760;
        Mon, 27 Nov 2023 02:52:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:430c:b470:8466:3e0? ([2001:8b0:aba:5f3c:430c:b470:8466:3e0])
        by smtp.gmail.com with ESMTPSA id d11-20020adfa40b000000b003142e438e8csm11665063wra.26.2023.11.27.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:52:10 -0800 (PST)
Message-ID: <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
Subject: Re: [OE-core] bitbake-server does not exit after build ends
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zoltan Boszormenyi <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2023 10:52:09 +0000
In-Reply-To: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191291

On Mon, 2023-11-27 at 10:52 +0100, Zoltan Boszormenyi wrote:
> Hi,
>=20
> I am not sure what's the actual problem here.
>=20
> FWIW, I have recently upgraded my laptop to Fedora 39
> where I test recipe changes first.
>=20
> Now, whenever a build ends (no matter if successfully or
> if there was a recipe build failure) two bitbake-server
> processes stay running.
>=20
> As a result, the next bitbake run spits out messages about
> the previous instance holding bitbake.lock and retries.
>=20
> Fedora 39 has Python 3.12 but maybe an outdated python
> module is the issue.
>=20
> I am happy to try any ideas.

Is there anything interesting in the bitbake-cookerdaemon.log file?

Cheers,

Richard

