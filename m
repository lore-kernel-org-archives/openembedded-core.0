Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 97D3378836
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:34:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 04:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,340,1511856000"; 
   d="scan'208";a="9635163"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 10 Jan 2018 04:34:47 -0800
To: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>,
	Martin Kelly <mkelly@xevo.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bc9e458c-d1fc-2833-6cf3-8a4cac183240@linux.intel.com>
Date: Wed, 10 Jan 2018 14:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
Cc: Jussi Pakkanen <jpakkane@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with meson in SDK with cross-file
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
X-List-Received-Date: Wed, 10 Jan 2018 12:34:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/09/2018 11:50 AM, Nirbheek Chauhan wrote:

>> Recently, we got meson added to OE-core as part of Yocto (thanks Alexander
>> Kanavin!).
> 
> Great to hear that! Thanks for your work, Alexander :)

I've built on the meta-oe meson recipe created by other people (tried to 
credit them in the commit). My contribution was mostly polish and 
testing, so that the recipe is of sufficient quality to be included in 
oe-core - particularly that it doesn't break anything on the autobuilder 
across architectures and configurations, and switching recipes from 
autotools to meson does not come with feature regressions (e.g. 
gobject-introspection, which is notoriously tricky for us).

>> - When --cross-file is specified, make meson not assume that env vars like
>> CC and CXX and similar point to native tools. Instead, just ignore them and
>> look for native tools in the normal way that meson does when these vars are
>> unspecified. We still may wan to inject CFLAGS, LDFLAGS, etc into the build
>> because people may mess with them interactively during development.
>>
> 
> Would it be possible to tell Yocto to not set those vars when building
> a recipe that uses meson?

FWIW, I fully agree. Environment variables are an obsolete technique 
from old Unices, and a notorious source of frustration - because it's 
very easy for software to quietly modify them behind the human's back, 
as opposed to setting things via config files and command line switches, 
which are both a lot more controlled and disciplined. Ideally, I want to 
reduce or eliminate the use of env vars altogether in Yocto (long way to 
go there, I know).


Alex

