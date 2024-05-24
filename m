Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468C1C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 07:38:49 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web10.10688.1716536320897961621
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 00:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=KcgEaPNG;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=867b0be4a=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1716536321; x=1748072321;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=4wZWLHnGflYQ559OPhKVWs1UWdM2pIgkomWbN7/JFz0=;
  b=KcgEaPNGE2lCNkOpphX4ED+YxlTe7Fo4CB8AoYk29YUTS1oQvSk5UM1a
   4WxisRwX43dvBYweMXp1inrtxw6PMar11YJu2sjk20VmHKUajyqS7Nu60
   VgKJsq5OAJ9YgGo4RRiNY5V322GE1rFJI5mpodXWLk9rtHXvdV2jc7v5T
   0=;
X-CSE-ConnectionGUID: Wb+InaEbQdOSd3DVs4WYhw==
X-CSE-MsgGUID: 8jfzRu0ZRiaQd1eXulRM4Q==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 24 May 2024 09:38:38 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw2.muc with ESMTP/TLS;
 24 May 2024 09:38:37 +0200
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb2.muc with ESMTP/TLS; 24 May 2024 09:38:36 +0200
Received: from [10.242.8.58] (10.30.85.211) by SMUCMP10E.europe.bmw.corp (10.30.13.87)
 with Microsoft SMTP Server (version=TLS; Fri, 24 May 2024 09:38:35 +0200
Message-ID: <a1e882da-6a83-46cd-904f-f1df8f586701@bmw.de>
Date: Fri, 24 May 2024 09:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] package_manager: Clean up shared deb / ipk helpers
To: <openembedded-core@lists.openembedded.org>
References: <20240516072439.2998567-1-philip.lorenz@bmw.de>
From: Philip Lorenz <philip.lorenz@bmw.de>
In-Reply-To: <20240516072439.2998567-1-philip.lorenz@bmw.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SMUCMP02G.europe.bmw.corp (10.30.13.25) To
 SMUCMP10E.europe.bmw.corp (10.30.13.87)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 07:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199829

Hi,

I haven't received any feedback on this so far and couldn't spot the 
series in master-next either. I'm not too familiar with the review 
process so please let me know if you require any further input from my side.

Br,

Philip

On 16.05.24 09:24, Philip Lorenz wrote:
> This patch series fixes one issue which I missed in
> "lib/package_manager/ipk: Do not hardcode payload compression algorithm"
> (2ad05635a6da403b4fadcc126fe7734067c12c73). Default configurations using
> zstd are not affected but I'd still like to make sure that things are
> cleaned up.
>
> Additionally, this series cleans up some deb / ipk related code by
> moving their common base class to a shared location. This originally
> used to be the case, but as part of a larger refactoring, the class was
> duplicated into the individual packages. If there was some kind of
> rationale for doing this (I couldn't think of one and couldn't figure
> this out based on the commit history), please let me know.
>
> As part of this clean up, the `extract` method is moved into the common
> base class to ensure that future adaptations apply to both
> specializations.
>
> Philip Lorenz (3):
>    ipk: Fix clean up of extracted IPK payload
>    package_manager: Move OpkgDpkgPM into common module
>    package_manager: Share more common DEB / IPK code
>
>   meta/lib/oe/package_manager/common_deb_ipk.py | 97 +++++++++++++++++++
>   meta/lib/oe/package_manager/deb/__init__.py   | 85 +---------------
>   meta/lib/oe/package_manager/ipk/__init__.py   | 95 +-----------------
>   3 files changed, 101 insertions(+), 176 deletions(-)
>   create mode 100644 meta/lib/oe/package_manager/common_deb_ipk.py
>
-- 
Philip Lorenz
BMW Car IT GmbH, Software-Plattform, -Integration Connected Company, Lise-Meitner-Straße 14, 89081 Ulm
-------------------------------------------------------------------------
BMW Car IT GmbH
Management: Chris Brandt and Michael Böttrich
Domicile and Court of Registry: München HRB 134810
-------------------------------------------------------------------------


