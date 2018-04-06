Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D5F797474B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 15:42:09 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w36Fg7Yv028063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 16:42:08 +0100
Message-ID: <1523029327.2942.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Charles-Antoine Couret
	<charles-antoine.couret@essensium.com>
Date: Fri, 06 Apr 2018 16:42:07 +0100
In-Reply-To: <CAMKF1srQLn+7YKX0AeE00Y+r=7PC4R7cFUjGNm9wjEa0kVr8gA@mail.gmail.com>
References: <20180406125354.21247-1-charles-antoine.couret@essensium.com>
	<CAMKF1srQLn+7YKX0AeE00Y+r=7PC4R7cFUjGNm9wjEa0kVr8gA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Split glibc and libcrypt
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
X-List-Received-Date: Fri, 06 Apr 2018 15:42:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-04-06 at 08:03 -0700, Khem Raj wrote:
> this series is ok. Although dont like the fact its not upstream yet
> but it reduces glibc baggage for future.

Were you able to find out if glibc will definitely do this?

I think applying this nativesdk is the only thing we can do right now
and it does set us up well to migrate this further if glibc do go for
this. After thinking about this a bit, the patch series needs a few
minor tweaks to avoid wider testing failures:

a) libxcrypt needs to SkipRecipe in the target case and be nativesdk 
   only
b) We need an RDEPENDS_${PN}_append_class-nativesdk = " libxcrypto" in 
   glibc-package.inc
c) The override used in glibc-pacjage.inc is wrong suggesting the code 
   can be dropped.

Good news is a few of us tested this on f28, f27, ubuntu 1604 and 1710
and the new uninative built with it seems to work well.

Cheers,

Richard

