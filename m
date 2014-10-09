Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6A34265E1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 23:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 8F0E1314ED1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 01:31:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id GtrCicc_g2H7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 01:31:24 +0200 (CEST)
Received: from [172.22.22.61] (55d41bd5.access.ecotel.net [85.212.27.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 91A2A314ECD9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 01:31:24 +0200 (CEST)
Message-ID: <54371ACB.3020009@opendreambox.org>
Date: Fri, 10 Oct 2014 01:31:23 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1412712030-12657-1-git-send-email-anibal.limon@linux.intel.com>	<54344EC9.2040303@opendreambox.org>	<54346DFB.8030802@linux.intel.com>	<5434799B.7020503@opendreambox.org>	<54357BB2.6090405@linux.intel.com>	<54358935.30909@opendreambox.org>
	<54370F4B.7030207@linux.intel.com>
In-Reply-To: <54370F4B.7030207@linux.intel.com>
Subject: Re: [PATCH] busybox: fix upgrade problem with deb packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Oct 2014 23:31:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 10.10.2014 00:42, Aníbal Limón wrote:
> Now i'm testing dpkg-ua changes, my first impressions are,
> 
> Some work in order to use dpkg-ua version instead of opkg-utils (default),
> files meta/conf/layer.con and
> meta/recipes-core/packagegroups/packagegroup-self-hosted.bb.
> 
> Currently isn't created symlinks for tools in target image.
> 
> Comments?

Sounds like this problem:

http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/47626

Did update-alternatives get staged correctly into your native sysroot?

If opkg-utils-native was built after dpkg-native, it may have
overwritten update-alternatives. To avoid this I've put the following
into my local.conf:

INHERIT += "blacklist"
PNBLACKLIST[opkg-utils-native] = "opkg-utils-native must not be built
when using debian packages"

I'm not sure whether this may cause a similar effect.

Regards,
Andreas


