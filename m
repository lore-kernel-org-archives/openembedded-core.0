Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Pvcom-00027z-8n
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 22:45:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Mar 2011 13:44:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,266,1297065600"; d="scan'208";a="716356311"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2011 13:44:16 -0800
Message-ID: <4D715D30.3030608@linux.intel.com>
Date: Fri, 04 Mar 2011 13:44:16 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1299267630.git.sgw@linux.intel.com>	<e807fc977770cb64a217768672c18437ea8f3057.1299267630.git.sgw@linux.intel.com>
	<A53A0FEC-74B3-483C-916C-EB87748A1AC8@dominion.thruhere.net>
In-Reply-To: <A53A0FEC-74B3-483C-916C-EB87748A1AC8@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org, poky@yoctoproject.org
Subject: Re: [poky] [PATCH 04/13] module: build hostprogs for each module
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Mar 2011 21:45:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2011 12:04 PM, Koen Kooi wrote:
>
> Op 4 mrt 2011, om 20:42 heeft Saul Wold het volgende geschreven:
>
>> From: Darren Hart<dvhart@linux.intel.com>
>>
>> This fixes [BUGID #241]
>>
>> The kernel hostprogs are built for the host architecture. They should not be
>> deployed to the target, and they should not be included in an sstate package
>> which might get reused on a host of a different architecture.
>>
>> As we don't build many out-of-tree modules, this patch takes the approach of
>> building the hostprogs as part of the module compile process with a
>> do_compile_prepend() routine in module.bbclass.
>>
>> We don't have to clean the hostprogs as modules depend on the kernel being
>> populate_staging, so its done with the staging directory by the time we run.
>>
>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>> CC: Gary Thomas<gary@mlbassoc.com>
>> ---
>> meta/classes/module.bbclass |   12 +++++++++++-
>> 1 files changed, 11 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
>> index d16d462..bbceaf7 100644
>> --- a/meta/classes/module.bbclass
>> +++ b/meta/classes/module.bbclass
>> @@ -3,6 +3,13 @@ DEPENDS += "virtual/kernel"
>>
>> inherit module-base
>>
>> +# Ensure the hostprogs are available for module compilation
>> +module_do_compile_prepend() {
>> +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>> +	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>> +	           -C ${STAGING_KERNEL_DIR} scripts
>> +}
>> +
>> module_do_compile() {
>> 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>> 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
>> @@ -15,7 +22,10 @@ module_do_compile() {
>
> Why not put it in do_compile itself?

My rationale was that a module recipe may override do_compile for one 
reason or another, but they will still need the hostprogs which we 
stripped in kernel.bbclass. This way, even if they override do_compile, 
the _prepend will still get run and prepare the hostprogs.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


