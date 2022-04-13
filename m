Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE099C4167E
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from avasout-ptp-002.plus.net (avasout-ptp-002.plus.net
 [84.93.230.235])
 by mx.groups.io with SMTP id smtpd.web10.758.1649868120998046040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=KPJXeeK5;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.235, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id eg3qntqgBO2rieg3rnOHl5; Wed, 13 Apr 2022 17:41:59 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=Zs/+lv3G c=1 sm=1 tr=0 ts=6256fd57
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=z0gMJWrwH1QA:10 a=iGHA9ds3AAAA:8 a=ka8fnN3Aj-0wkp4P0eMA:9
 a=CjuIK1q_8ugA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=fDzvP0Fp58GFsYKm0G8OSuzA3hB19zcuYOqfUcA9/iw=; b=KPJXe
	eK5OdIiBcooYFCQJCf4FeN5CWQaGyrTAM0mYQDSRok3ETCvy3ZNWeR/8V2QlQub70UO1+rjYrvluM
	UxORqwkHJuUCcLX1FJz0tGtIUUqolzDTW5zLwWRZxKDssK6Af/mp9zReqLLZbsXU8DjiDA0U+bQ/x
	qTdRECc69vxboXZXI8ilwEsIci4eqXgJiEiU9mRBQIG4XMuPkorePhvTyCfXs35uUqo2+6UQ1luuG
	5KGlIvMaVMKmgLV7Rfdjde/yLIIOxqoap9cLCYH4ybRmyinQMruCutNKJpDcK7z+aYLj6bxsB1OAn
	gha72erURZn++YqZmnjlZ1J/TqOfw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1neg3q-00EN3V-5J; Wed, 13 Apr 2022 17:41:42 +0100
Date: Wed, 13 Apr 2022 17:41:42 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Steve Sakoman <steve@sakoman.com>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>,
	Ross Burton <ross@burtonini.com>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
Message-ID: <Ylb9RoAyRpDHTaqe@mcrowe.com>
References: 
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
 <16E57E79FD292EFA.13992@lists.openembedded.org>
 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
X-CMAE-Envelope: 
 MS4xfOIF5kC5eDpByHzJoMSGkapLIV+zL3qL1iPy6pak928UBazgREQvxW5AQqHEI5+wUMmPYiSp6z8WK7aT2vTmLBs5rZ1znrSGNGrrtntaRKsYxWc+kFTy
 qTJ1roD/9jJxQSuVFeZYLXHkMluyLqtGjrSs7EnrD9Yd7ZmNJhrLbQc6ExStUkV1pnhIdGLABLvG0is9Ow56wDiYUS98MAKAoR4=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164342

On Wednesday 13 April 2022 at 06:02:22 -1000, Steve Sakoman wrote:
> Both runs completed and I'm still seeing success without the zlib patch:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5069
> 
> and failure with the patch:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5070

I'm certainly no expert with the autobuilder, but it looks like nothing was
actually compiled for both of those builds - everything came from the
sstate cache.

I believe that Ralph's reproduction of the test failure without the zlib
patch was from a complete rebuild without anything coming from the sstate
cache.

I suspect that if a PR bump or something similar that causes zlib and all
its reverse dependencies to be built were tested on top of the commit used
for build 5069 then the test failure would occur then as well and
exonerate the zlib patch.

Mike.

