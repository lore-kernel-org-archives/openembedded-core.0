Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA7EC982D6
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 16:31:20 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44266.1789662674622525212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 09:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=14Ho8R/4;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.18.1/8.18.1) with ESMTPS id 68HGVAJQ293631
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2026 18:31:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1789662671;
	bh=5sDvWScMG8Zli+yGsqvm+LPNm1mGrTpfmC0RHr54kpQ=; l=725;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=14Ho8R/4mobrD1Oqsn2XGkuusIzNwmEYmHdNUlY8uOKEln8J52Bn+bXbTJtDreBat
	 yxP+tB8B8PPQKPjKfA9SQq61O9fndDzVNucYpae+LNE+i+uoetLzsnBjHxsUo/J1P3
	 OLKn16u92wrghXN0KfauD+H353KRZC0NrGzkaletqNb2tj27YxdDSv8TepPYz5XPwK
	 cCBCk1XI2i1R+e65izWkuyHa+1fMhZmGUFmde9IRPYyi8nAczotdSlrYcI+lpRTwtg
	 MSYb4W6hgz6EtuNl0tZlrtK/lTrOGqB6MCkFOHOpgxePtjnbwqSrVLu5WUXxgyQg/s
	 CwZXYI8fKcs1g==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.18.1/8.18.1) with ESMTP id 68HGV8Ug725569;
	Thu, 17 Sep 2026 18:31:09 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id N6S81T6JJ4; Thu, 17 Sep 2026 18:31:06 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 68HGV6tC287613
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 17 Sep 2026 18:31:06 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.99.5)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1x7F0s-0000000CCNm-0th0;
	Thu, 17 Sep 2026 18:31:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Ross Burton via lists.openembedded.org"
 <ross.burton=arm.com@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Subject: Re: [OE-core] [PATCH 8/9] classes/cargo-c: pass flags via
 CARGO_BUILD_FLAGS
In-Reply-To: <20260804165803.598030-8-ross.burton@arm.com> (Ross Burton via
	lists openembedded org's message of "Tue, 4 Aug 2026 17:58:02 +0100")
References: <20260804165803.598030-1-ross.burton@arm.com>
	<20260804165803.598030-8-ross.burton@arm.com>
Date: Thu, 17 Sep 2026 18:31:06 +0200
Message-ID: <lytsnnzvp1.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 6aac15ca8721c0ca765d27a6
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 16:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246078

"Ross Burton via lists.openembedded.org"
<ross.burton=arm.com@lists.openembedded.org> writes:

> Add the flags to CARGO_BUILD_FLAGS so that they get used in all calls
> and do_install no longer does any building.
>
> +CARGO_BUILD_FLAGS += "\
> +    --destdir ${D} \
> +    --prefix ${prefix} \
> +    --libdir ${libdir} \
> +    --library-type cdylib \
> +    "

Most/all of these flags are not supported by cargo and will break recipes
which use it directly (e.g. by inheriting the ptest-cargo class):

| ERROR: ... do_compile_ptest_cargo: Unable to compile test with cargo, '.../cargo build ... --destdir ...' failed

It would be better to define and use a dedicated variable
(e.g. CARGO_C_BUILD_FLAGS).



Enrico

