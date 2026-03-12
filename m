Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31C7105A58F
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:50:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19674.1773316252564794570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xi3p9LRa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48534237460so9596825e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 04:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773316251; x=1773921051; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feaBfXsTorz6GYdDDipFOV2YDmUW3JBM12iAfLPD0vc=;
        b=Xi3p9LRaFv4VSuf6P7vL3IdXUlyeKPUitRT6xODZzzNRAP0w3huWZSsaquKemv0eaC
         5v24sXfn9XbRs5KuC3qRbu4irwCrqmF6n1cOz3EZlSjuq7tZV3u/fBsHIoeo3HN+fZ+r
         9s67w9z4L0N17ObPuMkuz+MfdETHMsaruZ3vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316251; x=1773921051;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=feaBfXsTorz6GYdDDipFOV2YDmUW3JBM12iAfLPD0vc=;
        b=ulqZvb2uOf58T2AkAAQ8vCWh1hsq+ZRXBOI1zGQVmwv2T2mQ7DhAohY4tZ6B3is0mh
         W7WoUTtTVsN5fSUahG5g19dubfltJINU8p7h5Gcv+xjoC2VYjRzsB3IUKrNYb3VkbEcQ
         HrvQqRqi256rTdmbQFQ+U42B5zdIZh0IX1oIg7WMZsbdj86iuBH2pQgprigDkJWwTIdZ
         fTALutPgkT+2gVnCpH7mv4kgq0Y7IoxzQJdpQ9QDDsNFEpdZGfxua8HFCuJ6poDhYp7n
         OwJHvGJ8LzBspXIe8fgz+Nm8X3cb2BkgoI908Awrm/mWprRmYXfp4RK5liNi+KCm95n+
         3rFg==
X-Forwarded-Encrypted: i=1; AJvYcCUizz5J85EPQ0nCtSkdFn+vME7uNOawIfV7okvxQGICN94Do80LrbVopw5840Nb93N3FeSUkwrh/409oQOW17vSUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzukvmb/raFhQBY53ivcabUMVCjUaLOLKE8fVkClJue7nPwSFET
	HO5Wi8XjpklAnqOptZ8OsQWttFlztjxrHTpc/1Z9abxjxVOVV6T8/AvLAMetyTrynRLLttLPNtW
	X2BB+8+E=
X-Gm-Gg: ATEYQzz7NvY6SWPQx8t8m6hFYH/6kJZiKB+XUHAwgYqVNZFpqQUtRwwXr+liCWBcm86
	Qf5TtSunZ+nemBUKgUfxA98UK5ta87Vhijtyv7ee2KbUNaXnUUiwXrfNWlhcq4o2sAUWGz2e8It
	FHocoayOuMaZik+yACA5RHiojVGqXjWKO48HZw/Djk1m4rrQjfYnbvIjqWoI5NHZxeH8Hds+UMu
	QlneUHD82ief5ujslJusY+Q9qRNeiUm4kJkksPtSl+6QLjv/gKOaw6C6CN4c42YX0DQLTGn1u2j
	SqqTeVeLS7YFwOPVkF/uuc/YY71DU07orSzPzrYANIpamT3iOQ17EmndqzkrkmxgximA9MDXOkM
	GVnbBuFkN8knEOnTDXwF6lR8xeY7v9Kt0QwD5Y2IcvHQcVT7TjD/5ebr80TCUVAliDY1ZftzA0H
	/oPIaP1GfVItBsczE61SK2GkWHTyM953jmy5JdnC+4wNe6ZK2+PAB8kjjNBnXnwlPHpFSb22CbL
	9W51itpCYTb
X-Received: by 2002:a05:600c:8b45:b0:485:4388:3496 with SMTP id 5b1f17b1804b1-4854b10f9bfmr90531135e9.11.1773316250874;
        Thu, 12 Mar 2026 04:50:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:215f:5162:d0b:8f1d? ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19acbbsm7985975f8f.2.2026.03.12.04.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:50:50 -0700 (PDT)
Message-ID: <3e79cdb1a950e22ceba17475844843bcc02cf680.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v6 04/15] spdx3: Add recipe SBoM task
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2026 11:50:49 +0000
In-Reply-To: <20260310184058.533343-5-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-5-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 11:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232943

On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded.org w=
rote:
> Adds a task that will create the complete recipe-level SBoM for a given
> target recipe, following all dependencies. For example:
>=20
> ```
> bitbake -c create_recipe_sbom zstd
> ```
>=20
> Would produce the complete recipe SBoM for the zstd recipe, include all
> build time dependencies (recursively).
>=20
> The complete SBoM for all (target) recipes can be built with:
>=20
> ```
> bitbake -c create_recipe_sbom meta-world-recipe-sbom
> ```
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

With this change I got a bit confused as it wasn't obvious which task
you'd run just looking at the meta-world-recipe-sbom recipe.

Should that recipe do something like:

addtask create_recipe_sbom before do_build

so that the recipe actually triggers the thing which it is there for?

Cheers,

Richard

