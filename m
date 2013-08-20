Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 47F8E6B882
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 16:47:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2013 09:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,921,1367996400"; d="scan'208";a="389228753"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2013 09:46:59 -0700
Message-ID: <52139D83.5000307@linux.intel.com>
Date: Tue, 20 Aug 2013 09:46:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <cover.1377014441.git.cristian.iorga@intel.com>
	<7e1d9bb3b42c08f4337e717e959326014f0144c5.1377014441.git.cristian.iorga@intel.com>
	<52139B76.4090608@linux.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16C16FE2@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16C16FE2@IRSMSX105.ger.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] builder: register directories with pcmanfm
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
X-List-Received-Date: Tue, 20 Aug 2013 16:47:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2013 09:41 AM, Iorga, Cristian wrote:
> Sould I remove PR entirely?
> Or just leave it at version 6?
> That's no mistake, I did change the PR because there are no external sources in this case, so there is not really a new version.
> Just an evolution.
>
Please try to do inline replies, as we prefer them to keep the context.

It should stay at PR="r6" to preserve the package version and 
upgradability. Removing PR would cause the package version to go backwards.

Sau!

> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, August 20, 2013 7:38 PM
> To: Iorga, Cristian
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 3/3] builder: register directories with pcmanfm
>
> On 08/20/2013 09:05 AM, Cristian Iorga wrote:
>> Register directories to be opened with PCManFM filemanager using
>> xdg-open in Build Appliance.
>>
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> ---
>>    meta/recipes-graphics/builder/builder_0.1.bb             | 2 +-
>>    meta/recipes-graphics/builder/files/builder_hob_start.sh | 9 +++++++++
>>    2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/builder/builder_0.1.bb
>> b/meta/recipes-graphics/builder/builder_0.1.bb
>> index 78d41e5..1e8c977 100644
>> --- a/meta/recipes-graphics/builder/builder_0.1.bb
>> +++ b/meta/recipes-graphics/builder/builder_0.1.bb
>> @@ -1,7 +1,7 @@
>>    SUMMARY = "New user to do specific job"
>>    DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
>>    SECTION = "x11"
>> -PR = "r6"
>> +PR = "r7"
> No PR Bumps!
>
>>    LICENSE = "MIT"
>>    LIC_FILES_CHKSUM = "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
>>
>> diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh
>> b/meta/recipes-graphics/builder/files/builder_hob_start.sh
>> index 40616f5..b3a0540 100644
>> --- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
>> +++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
>> @@ -9,6 +9,15 @@ export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo
>>    export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64
>>    export GIT_PROXY_COMMAND=/home/builder/poky/scripts/oe-git-proxy
>>
>> +#start pcmanfm in daemon mode to allow asynchronous launch pcmanfm
>> +-d&
>> +
>> +#register folders to open with PCManFM filemanager if [ ! -d
>> +/home/ubik/tmp/.local/share/applications ]; then
>                     ^^^^^
> What's that user?  Should it be builder?
>
>> +    mkdir -p /home/builder/.local/share/applications/
>> +    xdg-mime default pcmanfm.desktop inode/directory fi
>> +
>>    cd /home/builder/poky
>>    . ./oe-init-build-env
>>
>>
>
>

