Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 23CD57825F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 09:13:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 02:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="1139569990"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2017 02:13:14 -0700
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1496932793.git.alexander.kanavin@linux.intel.com>
	<1496956519.26945.171.camel@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ee386b4e-eb83-d201-da7e-28940c1202ff@linux.intel.com>
Date: Fri, 9 Jun 2017 12:13:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1496956519.26945.171.camel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Fri, 09 Jun 2017 09:13:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2017 12:15 AM, Leonardo Sandoval wrote:
> On Thu, 2017-06-08 at 17:42 +0300, Alexander Kanavin wrote:
>> Changes in version 2: use openmp for multi-processing instead of NSPR library, as
>> requested by upstream. Add a link to the upstream submission to patches.
>>
>> These two patches add multi-threaded features to RPM to speed up the do_package_write_rpm task.
>>
>> Specifically:
>>
>> 1) Multi-threaded xz compressor is used instead of default single-threaded gz. This has the most
>> dramatic effect when a recipe produces a smaller number of large-sized packages.
>>
>> 2) Packages creation is run in multiple threads via thread pools. This is most beneficial when
>> a recipe produces a large amount of small packages.
>>
>> Some not very scientific benchmarks for time and .rpm sizes
>> (time is measured for do_package_write_rpm tasks only):
>>
>
> Tried v2 again and I am getting this problem (segmentation faults):
>
> http://errors.yoctoproject.org/Errors/Build/38812/
>
>
> The idea I have is to get some numbers from buildstats and have better
> insight of the impact of this series. BTW, I tried core-image-sato.

Now I see the issue locally, even though it does not crash, but I think 
it's the same issue :) Bear with me, it's my first openmp adventure ever.

Alex


