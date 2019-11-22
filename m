Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id D2F127FC84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 01:12:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2019 17:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,227,1571727600"; d="scan'208";a="201331843"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by orsmga008.jf.intel.com with ESMTP; 21 Nov 2019 17:12:32 -0800
To: openembedded-core@lists.openembedded.org
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
	<31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
	<CAD0U-hKMtXR+tvpS45D9=+XqaZVZBs7jMm9U3Vk7r+mJuVW5-A@mail.gmail.com>
	<CAD0U-hJ96imEfDwAyMQyjvABmaNYxEexQWNvpHJr+wsNzpGSbw@mail.gmail.com>
	<CAJ86T=Ucx125+XdRrpnh64km1WypAyyc1fUN5pWbjXzmUSXu3g@mail.gmail.com>
	<20191121080503.GC3527@hiutale>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <71954d26-1354-383d-bb6e-216238c2bf92@intel.com>
Date: Fri, 22 Nov 2019 01:12:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191121080503.GC3527@hiutale>
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Fri, 22 Nov 2019 01:12:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 21/11/2019 08:05, Mikko.Rapeli@bmw.de wrote:
> On Wed, Nov 20, 2019 at 03:53:14PM -0800, Andre McCurdy wrote:
>> But anyway, in all cases, the way to debug what's going on isn't to
>> try random recipe changes and then rebuild the final image. Instead
>> you should build your chosen version of openssl, look in the
>> packages-split directory to see which package includes the openssl
>> command line tool and then add that package to your image.
> 
> Or enable buildhistory, build openssl and/or image(s), cd build/buildhistory
> and git grep for the binaries needed to find out which binary package
> they belong to.

packages-split doesn't work with rm_work or where sstate was used. 
buildhistory needs to be enabled and you need to dig manually.

It's better to use the tools that come out of the box:

$ oe-pkgdata-util find-path /usr/bin/openssl
openssl-bin: /usr/bin/openssl

That's a glob search, so **/*.py will find all built packages that ship 
Python code for example.

Ross

