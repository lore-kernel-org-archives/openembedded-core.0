Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5E1EC601A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 14:38:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jun 2014 07:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1009,1392192000"; d="scan'208";a="526240849"
Received: from unknown (HELO [10.255.12.194]) ([10.255.12.194])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2014 07:38:53 -0700
Message-ID: <53971878.5090300@linux.intel.com>
Date: Tue, 10 Jun 2014 07:38:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>	
	<1402013345-24930-2-git-send-email-sgw@linux.intel.com>
	<1402401428.10715.132.camel@phil-desktop.brightsign>
In-Reply-To: <1402401428.10715.132.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] update-rc.d/useradd: Add additional dependecies
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
X-List-Received-Date: Tue, 10 Jun 2014 14:38:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2014 04:57 AM, Phil Blundell wrote:
> On Thu, 2014-06-05 at 17:09 -0700, Saul Wold wrote:
>> These dependcies are needed to ensure that thier packages are created
>> correctly since these classes have runtime dependiences in their packages
>> but they are not actually created yet at rootfs time.
>
> Can you be more specific about why these
> dependecies/dependcies/dependiences are required?  I can't, offhand,
> think of any reason why update-rc.d requires initscripts for example.
>
It's more about having initscripts-funtions package built so that it's 
available for the dynamic addition to the RDEPENDS later in 
populate_pacakges_updatercd().  If initscripts is not built and we add 
initscripts-functions to the RDEPENDS, the final rootfs will fail with 
an unsatisfied dependency.

> Also, what's going on with the PACKAGESPLITFUNCS_remove_class-nativesdk?
>
We don't need to run that funtion to create the nativesdk sysroot, so 
don't run it.

Sau!

> thanks
>
> p.
>
>>
>> [YOCTO #6072]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta/classes/update-rc.d.bbclass | 2 ++
>>   meta/classes/useradd.bbclass     | 2 +-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
>> index 56eef4e..ca9486b 100644
>> --- a/meta/classes/update-rc.d.bbclass
>> +++ b/meta/classes/update-rc.d.bbclass
>> @@ -1,6 +1,7 @@
>>   UPDATERCPN ?= "${PN}"
>>
>>   DEPENDS_append = " update-rc.d-native"
>> +DEPENDS_append_class-target = " initscripts"
>>   UPDATERCD = "update-rc.d"
>>   UPDATERCD_class-cross = ""
>>   UPDATERCD_class-native = ""
>> @@ -67,6 +68,7 @@ python __anonymous() {
>>   }
>>
>>   PACKAGESPLITFUNCS_prepend = "populate_packages_updatercd "
>> +PACKAGESPLITFUNCS_remove_class-nativesdk = "populate_packages_updatercd "
>>
>>   populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_preinst updatercd_postinst"
>
>
>
>

