Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4740571E47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 16:00:32 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 13 Dec 2016 08:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="41883785"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 13 Dec 2016 08:00:30 -0800
To: Mark Hatle <mark.hatle@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <F0CA9E243F4F424B836EAC30E41BF4CF5DF514DB@PGSMSX104.gar.corp.intel.com>
	<a3c142bf-8c0b-3f90-dda9-7f72dd4da1cf@windriver.com>
	<CAMKF1spG=v7_wb_VYktNBL7NTan28NbB47G7u2B_-E43jBL8vQ@mail.gmail.com>
	<687e0950-a18a-5d44-aeae-18517df275e6@windriver.com>
	<4F081825-2EC8-4F85-9E55-1E24F215723D@gmail.com>
	<89015693-dfeb-5b47-7c2b-386c85571dec@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <877d5207-0156-c57e-38db-9b2c47b61d78@linux.intel.com>
Date: Tue, 13 Dec 2016 18:00:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <89015693-dfeb-5b47-7c2b-386c85571dec@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Gupta,
	Rahul KumarXX" <rahul.kumarxx.gupta@intel.com>
Subject: Re: openssl: OpenSSL 1.1.x update
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
X-List-Received-Date: Tue, 13 Dec 2016 16:00:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2016 06:39 PM, Mark Hatle wrote:
>>> The OpenSSL community itself is looking at 1.1.0 as a transition to newer and
>>> better design/api/etc... which is why it is not marked as a LTS release.
>>
>> api changes can be a bothersome point from integration POV, do we know if there
>> are some forwarded porting incompatibilities in APIs already?
>
> I have not investigated it, as my focus has been on the LTS version at this point.

I've quickly put together a openssl 1.1 recipe to test what builds and 
what fails in oe-core, and this is the list of failures (any 
dependencies of these aren't even attempted of course, i.e. webkit):

rpm
apr-util
ruby
openssh
bind
socat
mailx (I believe debian provides a rewrite of this one which we need to 
package)
cryptodev-tests
u-boot-mkimage

Openssl does not seem to be designed for parallel installation of 
several major versions at the same time (headers and pkg-config files 
clash), so (unless someone has a better idea), we need to either wait 
until the above listed upstreams fix their code, or do custom patching.

Mark, when can we expect rpm updates from Wind River? It's been a while 
(actually, 10 months) since anything substantial arrived. I'd like to 
have both a working CVS recipe (for dnf oe-core integration work), and 
an update to the stable release with openssl 1.1 support in it - so that 
oe-core can provide openssl 1.1. I simply do not have the bandwidth or 
the expertise to do this work myself - far too many patches to rebase, 
and a code base that I don't even begin to understand.

Alex

