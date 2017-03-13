Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6096A776D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 14:23:22 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 07:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,159,1486454400"; d="scan'208";a="75499139"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Mar 2017 07:22:28 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<3fee18a7b16ebb71dcabe04629bf9c9346abe82e.1489144807.git.alexander.kanavin@linux.intel.com>
	<d7bb41f1-deef-14ed-297d-6de8ef355a39@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <28846dae-738e-a12f-4534-368dd08d01c0@linux.intel.com>
Date: Mon, 13 Mar 2017 16:21:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <d7bb41f1-deef-14ed-297d-6de8ef355a39@windriver.com>
Subject: Re: [PATCH 34/44] package_rpm.bbclass: add a /bin/sh Provides for nativesdk- packages
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
X-List-Received-Date: Mon, 13 Mar 2017 14:23:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2017 06:54 PM, Mark Hatle wrote:
> On 3/10/17 5:24 AM, Alexander Kanavin wrote:
>> nativesdk-* rpm packages all require /bin/sh because postinst scriptlets
>> are run with it. We can either teach rpm4 and dnf to ignore that dependency
>> (a lot of non-upstreamable work), or add auto-satisfy the dependency
>> in each package. I've chosen to do the latter.

>>      print_deps(srcrrecommends, "Recommends", spec_preamble_top, d)
>>      print_deps(srcrsuggests, "Suggests", spec_preamble_top, d)
>> -    print_deps(srcrprovides, "Provides", spec_preamble_top, d)
>> +    print_deps(srcrprovides + (" /bin/sh" if srcname.startswith("nativesdk-") else ""), "Provides", spec_preamble_top, d)
>>      print_deps(srcrobsoletes, "Obsoletes", spec_preamble_top, d)
>
> I'm confused as to what this is doing...   I see this is only affecting the
> virtual 'src package' (or the one built for archiving?)..

The variable name is misleading. That line up there is printing the 
Provides list into the top section of the .spec file which is then given 
to rpm so it can create binary packages.

> But providing /bin/sh as any type of provide seems wrong.  Either --nodeps to
> the rpmbuild or there should be a configuration file that the (host/cross) rpm
> can use to say "yes I really just have /bin/sh.

> (rpm5 has a single file you could put arbitrary file provides into, at one point
> rpm4 did as well -- but I don't know if it's still there.)

I checked - rpm 4 does not have that feature now, or I couldn't find it.

> Doing this runs the risk of someone asking for '/bin/sh' and getting a source
> package (a random one) as part of their build process using the DNF sources
> option and such.  Definitely not what is expected.

This only affects nativesdk- packages, which are well isolated from all 
other packages during installation time. I haven't seen any issues with 
it either in my local testing or in the autobuilder run. If it pops up 
somehow, we can do more to isolate the package sets.


Alex


