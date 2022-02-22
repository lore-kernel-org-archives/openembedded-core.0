Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF54C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:46:47 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.2390.1645559206066188348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zkHYE99U;
 spf=pass (domain: linaro.org, ip: 209.85.222.170,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qk1-f170.google.com with SMTP id c7so1142331qka.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y0E438zP+cuvE3uNsxwCf/4JXHNE24BYQoXO57CAfLU=;
        b=zkHYE99U6i25BWCe03xNiupvjPeJoouYyZXQf+wb4GEqRU9R/q5hgvSrGvIUOd/CLh
         8D6z9vwSuCJ8p41mg7u3I8FKx+/jAd1wiRbeOTu9tnKisGbihcT1rzjwBdxWcHm1HGIY
         nouusZHChLtVePSyZZsO0qB55WY6ihA84b87F0eG+DiXZReLmnLB7T0N7iHKuxSzmv16
         TrSxBBTR8puuFNsm5ULbhb3pwfrEmCicfE6hEiol7yve0xpGPQBRkOdFs9ba/MJueO9J
         h4aJ5MpW3BrU9hZgv9iAJzEh1eaDCKCBzLryQNA9qq+jnv4YCAnA4zJ3zIYgDhnM4XvD
         W+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y0E438zP+cuvE3uNsxwCf/4JXHNE24BYQoXO57CAfLU=;
        b=kRaaTXRunBQOBIbiRMnEzHnB1FHIims64g3JZjv9Qop0dgra5F5JwptfGT2xiUU6sz
         TsnIYrR14BGy6UspU/HN+LHLakC6AKZZAXyUWM4mTY672nNvOfhhJVtVgAJDjZXxseUG
         FFRU1eoRf5rmzLeQXKkJruCc3/S/218gWBhs9O7GDqzUmrFJ4EFA6e9ZSCoO3pHXg6tF
         ZmcNwFgrbH6avj1oLvqQdRGKIAhn1KLci0E/DHVp4YRb15xQMLwnFHXUL1w/vRc+Uhqa
         mgQR59o/vW4Rqn7UxnnuM87VdKmnhDxKUFm2EXEteo9tWSmQTA1/rLzskPL2cANmbjrx
         zqGw==
X-Gm-Message-State: AOAM533cKn+RrNnGPpXMYCK//I4esZba5P2KPFb/NjchTUQcvYU3gXZh
	aLaXsw8UopFapp8Er2F+uBn7yQ==
X-Google-Smtp-Source: 
 ABdhPJxZBqt89CvhcCUvj94N50272HXZBTDd+MYOF4S2Oi1Pj/EfBGXW5UGhPmhxBYwTFfqeiNSP1g==
X-Received: by 2002:a37:ae43:0:b0:5e9:562d:9780 with SMTP id
 x64-20020a37ae43000000b005e9562d9780mr15985662qke.762.1645559205247;
        Tue, 22 Feb 2022 11:46:45 -0800 (PST)
Received: from localhost (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 i21sm325305qtq.32.2022.02.22.11.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:46:44 -0800 (PST)
Date: Tue, 22 Feb 2022 14:46:43 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Subject: Re: [PATCH][RFC] cve-check: use local copy instead of global db
Message-ID: <20220222194643.GB807980@maple.netwinder.org>
References: 
 <AM9PR09MB46421C5E3A51479C951310FDA83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: 
 <AM9PR09MB46421C5E3A51479C951310FDA83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:46:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162227

On Tue, Feb 22, 2022 at 07:46:59PM +0100, Konrad Weihmann wrote:
>instead of using a global DB (default in DL_DIR) copy an existing
>DB file into WORKDIR and use it from there.
>This should avoid running into the reported "database is readonly" error
>while at the same time there's no need to arbritrarily limit the
>cve_check task to just one run at a time

I tested this on dunfell branch (the patch needed some minor context 
tweaks in order to apply). The slowdown I observed during do_cve_check 
seems to be gone, and the actual CVE report remains unchanged.

Will keep testing it some more, but for now, it seems an improvement.

Tested-by: Ralph Siemsen <ralph.siemsen@linaro.org>

