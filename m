Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D5F007830A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 16:13:26 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 09:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="112668491"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 13 Jun 2017 09:13:27 -0700
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170612145805.11599-1-alexander.kanavin@linux.intel.com>
	<1497295764.26945.217.camel@linux.intel.com>
	<1497370534.23013.3.camel@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7f117fed-029a-56e9-b7cd-f342a1f377e6@linux.intel.com>
Date: Tue, 13 Jun 2017 19:13:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1497370534.23013.3.camel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rpm: run binary package generation via thread pools
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
X-List-Received-Date: Tue, 13 Jun 2017 16:13:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/13/2017 07:15 PM, Leonardo Sandoval wrote:
> On Mon, 2017-06-12 at 14:29 -0500, Leonardo Sandoval wrote:
>> On Mon, 2017-06-12 at 17:58 +0300, Alexander Kanavin wrote:
>>> This greatly reduces build times when there is a large amount of small
>>> rpm packages to produce. The patches are rather invasive,
>>> and so will be submitted upstream.
>>>
>>
>> What is the buildstat value (those from /proc/[PID]) you think this
>> patch would make a considerable performance burst?
>>
>> These are the top most consuming recipes just for the task of interested
>> (do_package_write_rpm)
>>
>> without this patch:
>>
>> do_package_write_rpm glibc-locale-2.25-r0 268.87 seconds
>> do_package_write_rpm perl-5.24.1-r0 85.87 seconds
>> do_package_write_rpm python3-3.5.3-r1.0 38.01 seconds
>> do_package_write_rpm gtk+3-3.22.8-r0 30.10 seconds
>> do_package_write_rpm libxml2-2.9.4-r0 25.97 seconds
>> do_package_write_rpm glibc-2.25-r0 25.67 seconds
>> do_package_write_rpm db-1_5.3.28-r1 23.80 seconds
>> do_package_write_rpm binutils-2.28-r0 22.92 seconds
>> do_package_write_rpm util-linux-2.29.1-r0 20.86 seconds
>> do_package_write_rpm mesa-2_17.0.6-r0 20.32 seconds
>>
>> with this patch:
>>
>>
>> do_package_write_rpm perl-5.24.1-r0 68.77 seconds
>> do_package_write_rpm glibc-locale-2.25-r0 53.59 seconds
>> do_package_write_rpm python3-3.5.3-r1.0 30.88 seconds
>> do_package_write_rpm libxml2-2.9.4-r0 30.51 seconds
>> do_package_write_rpm glibc-2.25-r0 29.99 seconds
>> do_package_write_rpm glib-2.0-1_2.52.2-r0 29.24 seconds
>> do_package_write_rpm db-1_5.3.28-r1 24.47 seconds
>> do_package_write_rpm coreutils-8.27-r0 23.93 seconds
>> do_package_write_rpm gettext-0.19.8.1-r0 23.88 seconds
>> do_package_write_rpm gtk+3-3.22.15-r0 23.48 seconds
>>
>> times are not wall-times, these are times coming from the bitbake
>> scheduler but I believe this provide us some insight.
>
> Just one minor correction after briefly discussing with RP: these are
> indeed wall times (real times), which is the delta between the starting
> and finishing times for the relevant tasks.

Have you ran these all at once? If so, then the wall times aren't very 
meaningful: if the CPU is already saturated by having a lot of bitbake 
tasks running, then adding further threads to these tasks isn't going to 
make anything finish faster than before.


Alex


