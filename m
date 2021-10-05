Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E6DC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 11:09:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.23965.1633432151286029983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 04:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zm+ytRkZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id p21so6298413wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 04:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=O9LqNgBL37k+SGFDYmqTMqttdwXWxK6C0UTorIhGRhs=;
        b=Zm+ytRkZzn9laQyuo/vguBlH9LvFLznB7Pg1nBavPtjvomGZm0hNfPqLwMb2wWzwfZ
         q6BWK1Ae75ugMUSQtuJDAJB5K7FqO74AZT6Ls4Wwus3ZMzLIBJwyZBah1HEUA6i8k9Gw
         RN0B0fw9dQsVWPgxaL5JooAaWoAEk+IqNNveU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=O9LqNgBL37k+SGFDYmqTMqttdwXWxK6C0UTorIhGRhs=;
        b=ZhyowpjNtTXt2JaVWGhDuNrwt6KP35v1b/Nio5TjsIP9ZA4JknaKKPnGBdK4eC3A+z
         mOlYm5/GaTeKE8cLfeJ1XhmYTfEb//xu8y1Y2nsLN/vWtA3m4zIuWH3kw02abWYge/5x
         hxPA6OomLmxVYRzkzt5D56/DgTTURTy4Vqfap9PdgZNbCSDIgLjjCyMH/S7PAO0rKl08
         gJgsqlxeSn9Gj96pbX29roLy2T7JvMeq8opeshMMeKVdVf8I8baEfIeVbC7NVqqhvJoo
         ypD9bZByjxqPAvvgjkLBwJDAGpcnMlzIx39gDc/AsQRHE/h74HKEdmDKOZo9y7eLJAE4
         HD5Q==
X-Gm-Message-State: AOAM533iO7xki+IW+hzVX5eqcQ2OrqtKMLBk4KyGr6Cny7boUnymO02y
	O4tlP0wZrAuRVgwZOSMBAwoWZQ==
X-Google-Smtp-Source: 
 ABdhPJwi2rYEpvx1sbO1eBctcV2Qccpzwyg2K+VS650uC4+l8vtWrXM7NLn6TWha5hwCtogMDpCR+A==
X-Received: by 2002:a05:600c:17d1:: with SMTP id
 y17mr2683683wmo.64.1633432149662;
        Tue, 05 Oct 2021 04:09:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3440:8498:daef:94bb?
 ([2001:8b0:aba:5f3c:3440:8498:daef:94bb])
        by smtp.gmail.com with ESMTPSA id
 t11sm17152750wrz.65.2021.10.05.04.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:09:09 -0700 (PDT)
Message-ID: 
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
Subject: Re: Improve npm support to run build scripts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	jean-marie.lemetayer@savoirfairelinux.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 05 Oct 2021 12:09:08 +0100
In-Reply-To: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 11:09:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156643

Hi Stefan,

Thanks for bring this up, I've been wondering on the status of our npm support.

On Tue, 2021-10-05 at 12:04 +0200, Stefan Herbrechtsmeier wrote:
> I must improve the npm support for our use cases but need some 
> fundamental decisions to proceed. I need to build express and angular 
> applications from git repositories.
> 
> I have the following changes in my pipeline until now:
> - Support npm packages with missing execute mode for directories
> - Reduce command calls in npm run
> - Add support for local tarball and local link sources
> - Rework crunch license to recognize more variants
> - Move known license checksums to CSV file
> - Pass README as fallback to guess license if a license is missing
> - Add support to pass build arguments to npm install
> - Add support to run build scripts with native packages
> - Parallelize the populate of the npm cache
> 
> The build (install) of npm packages leads to problems because of old 
> versions in the dependency tree. For example, older versions of packages 
> are incompatible with the Node.js version and older versions of node-gyp 
> require Python 2.

Hopefully over time the python2 issue should reduce and fade at least. The
node.js version is trickier.

> 
> I see three solutions to integrate npm packages:
> - Build npm packages from the npm project outside of OE and only fetch 
> the data.
> - Fork the npm project repository and fix everything inside the fork. 
> Use the fork direct or create patches from the fork to build inside OE.
> - Create recipes per project and incompatible version to fix everything 
> in OE and reduce redundancy.
> 
> The last solution keeps everything in OE and benefit from the existing 
> OE functions like download proxy as well as license, CVE and version 
> check. But it increases the initial costs and makes only sense if there 
> is an interest in an meta-nodejs layer.

The latter solution sounds like the only really viable option from an OE
perspective since we do need the proxy/CVE/license handling, it is a huge part
of our value and without it, it isn't really OE.

Creating a meta-nodejs layer isn't an issue if there are people willing to look
after it.

Cheers,

Richard


