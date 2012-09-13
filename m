Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCIKZ-0008PK-Mu
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 00:56:19 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Sep 2012 15:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,419,1344236400"; d="scan'208";a="192534232"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by azsmga001.ch.intel.com with ESMTP; 13 Sep 2012 15:43:10 -0700
Message-ID: <5052617D.7080206@linux.intel.com>
Date: Thu, 13 Sep 2012 15:43:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
	<22844638.2V3OiWsK3u@helios>
In-Reply-To: <22844638.2V3OiWsK3u@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] license: Ensure we find multilib packages also
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 22:56:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 03:31 PM, Paul Eggleton wrote:
> On Thursday 13 September 2012 12:26:19 Saul Wold wrote:
>> Make sure to find -package, this was causing a failure
>> in the multi-lib build license generation during rootfs.
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta/classes/license.bbclass |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
>> index 29fe938..b29067c 100644
>> --- a/meta/classes/license.bbclass
>> +++ b/meta/classes/license.bbclass
>> @@ -88,7 +88,7 @@ license_create_manifest() {
>>   	# list of installed packages is broken for deb
>>   	for pkg in ${INSTALLED_PKGS}; do
>>   		# not the best way to do this but licenses are not arch dependant iirc
>> -		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
>> +		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/*${pkg}| head -1`
>>   		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
>>
>>   		# exclude locale recipes
>
> Surely this could end up matching a the wrong file when one package name is a
> substring of another?
>
I am open to ideas here, I tried the ${MLPREFIX}, but it seems to be 
empty when rootfs runs, that did not help, I thought about adding the 
'-', but that would fail in the non-multilib case, how can I determine 
what the prefix will be to get a more accurate match?

Sau!

> Cheers,
> Paul
>


