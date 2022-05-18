Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5589C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:33:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.3374.1652870025704720731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CwFwN4bn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 r188-20020a1c44c5000000b003946c466c17so2912264wma.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=p7fqHH+EnwpZUgGIPvUhUQLzfLKwyIYtoyr8gjUVuO0=;
        b=CwFwN4bns8NXP5+Mh8XE/YmNdEnTiC6GZoq5lz3i6n5Ua7p9Z42qj+mInfdHlFTS7z
         rqk7kx6HVfBYoAZgW17kUT0cMag+ze7+1aL/AqK8nuBW5EmJvjX3glpFPhualFo4CRX0
         1H4wPgoh9RNJf4V7xs+npVbtm+xilRcfyPQVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=p7fqHH+EnwpZUgGIPvUhUQLzfLKwyIYtoyr8gjUVuO0=;
        b=O4sjI+xjdDE1QmzVbD1KPmBDEmtVelSeWdo+kngRZvqH9cm8smJX3SR1yfCZzzj4OI
         HufASnMZKzdEkrDW6wVj/6pyo/wCtTBPBKLuifxxlLb7OsBmUFavcrn7lG9kL3/DVzC0
         CZt7QJzWV+EnmP1HvZK9oLF1wy+mlXy/otbtCb8jkSP2kMjoVTlhOk5C2Qj3YJBacTDD
         QJyyGsBf3u0XvIymRJwTHsZJfnQam/HU1k6g1Ng9rVSrwrm/w6DnzfUXVbfBCZ95Mxi2
         0PWL+TSaLwAmMdtTAqA1mNstNBaEReusa+ye1foQ2wdMXGelxyS4Kfjwn3hHZiqa/ed/
         sk3Q==
X-Gm-Message-State: AOAM533y7UrmavKpa+TcfrcV929i7Tg35PsjuIh4GwTriC+S8N1MvU4G
	Ky7h2nV73qZzwoo32h99HPATVA==
X-Google-Smtp-Source: 
 ABdhPJyPNqUxm2+IXgVn1BPF/tcVjSVvIr5EtqDJg8EUUmE6QPdh3KUfEkgEPGBZ/yAFRjqmFYUSvw==
X-Received: by 2002:a05:600c:1c12:b0:394:6858:526f with SMTP id
 j18-20020a05600c1c1200b003946858526fmr25816940wms.2.1652870024183;
        Wed, 18 May 2022 03:33:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f9c5:af58:f70a:331b?
 ([2001:8b0:aba:5f3c:f9c5:af58:f70a:331b])
        by smtp.gmail.com with ESMTPSA id
 s18-20020adfbc12000000b0020e5e906e47sm1618646wrg.75.2022.05.18.03.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:33:43 -0700 (PDT)
Message-ID: 
 <e793362e2958aecec75daa66230558f7feb9add5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCH 1/3] cve_check.py: Add new
 method get_ignored_cves
From: richard.purdie@linuxfoundation.org
To: akash.hadke@kpit.com, openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2022 11:33:42 +0100
In-Reply-To: <13088.1652867175060959086@lists.openembedded.org>
References: 
	<722011c32a289bb9945a491e1f9b9e290e62c3ea.camel@linuxfoundation.org>
	 <13088.1652867175060959086@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:33:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165796

On Wed, 2022-05-18 at 02:46 -0700, akash hadke via
lists.openembedded.org wrote:
> Hi Richard,
>=20
> I tried modifying the cve-check.bbclass but did not able to get the
> solution for disabling the NVD data, because when we inherit cve-
> check it executes the cve_check task that checks CVEs from NVD DB. So
> I am also not sure how to disable it hence I used the separate
> bbclass.

I guess the task dependencies are a bit of an issue there. There are
probably ways to make those configurable, it would just take a little
work.

I really do want to encourage us to work together on common cve tooling
rather than having several partial implementations so I can't take this
patch series.

Cheers,

Richard

