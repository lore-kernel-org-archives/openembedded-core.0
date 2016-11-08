Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 38C4170016
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 14:48:32 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 08 Nov 2016 06:48:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,462,1473145200"; d="scan'208";a="189022938"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 08 Nov 2016 06:48:32 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
	<fced9d20130046ffaf6daa1fe7d619098fdf91c6.1478013702.git.alexander.kanavin@linux.intel.com>
	<CAJTo0Laf3ZkyWqz2qY8Evj2R3OB1swBzfWeAZ9D+y3hFXjSecg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4c171a1e-eb6b-0193-12a9-07ef533710a0@linux.intel.com>
Date: Tue, 8 Nov 2016 16:48:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Laf3ZkyWqz2qY8Evj2R3OB1swBzfWeAZ9D+y3hFXjSecg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/13] icu: update to 58.1
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
X-List-Received-Date: Tue, 08 Nov 2016 14:48:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2016 02:16 PM, Burton, Ross wrote:

> This breaks under musl:
>
> ../../icu/source/i18n/digitlst.cpp:67:24: fatal error: xlocale.h: No
> such file or directory
>  #   include <xlocale.h>
>
> musl doesn't have xlocale.h but does have a crippled strtod_l (doesn't
> actually support a passed in locale, which is the entire point of the _l
> functions).
>
> Upstreams such as pulseaudio have
> done https://bugs.freedesktop.org/attachment.cgi?id=118644 to guard the
> include, but I see that digitlist.cpp has an alternative branch where
> strtod_l isn't supported: as that function on musl is crippled maybe ICU
> should be told not to use it?

Thanks, I've forced icu to take that alternative branch (when musl is in 
use) by monkey patching configure.ac; the updated patch will come with 
the next batch of updates. There's no configure switch or environment 
variable that will have the necessary effect.

Alex


