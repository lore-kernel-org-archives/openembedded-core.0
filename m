Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SxZFS-0000DF-G2
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 09:58:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Aug 2012 00:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="202190710"
Received: from unknown (HELO [10.252.121.74]) ([10.252.121.74])
	by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2012 00:46:27 -0700
Message-ID: <501CD352.7080908@intel.com>
Date: Sat, 04 Aug 2012 10:46:26 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<c8630bc519bcb2d6671e5bd30f9b11ccb9d768b2.1344022584.git.laurentiu.palcu@intel.com>
	<501C33D4.6070409@windriver.com>
In-Reply-To: <501C33D4.6070409@windriver.com>
Subject: Re: [PATCH 3/5] package_rpm: export the native directory to the postinst scriptlets
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
X-List-Received-Date: Sat, 04 Aug 2012 07:58:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/03/2012 11:25 PM, Mark Hatle wrote:
> On 8/3/12 3:19 PM, Laurentiu Palcu wrote:
>> Some postinst scriptlets test for the existence of certain files but
>> have the paths hardcoded to the target's rootfs. This patch will allow
>> us to run postinst scriptlets at do_rootfs time by calling native
>> binaries.
>>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> ---
>>   meta/classes/package_rpm.bbclass |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
>> index 50e9b31..113b19c 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -443,6 +443,7 @@ export D="${target_rootfs}"
>>   export OFFLINE_ROOT="\$D"
>>   export IPKG_OFFLINE_ROOT="\$D"
>>   export OPKG_OFFLINE_ROOT="\$D"
>> +export NATIVE_DIR="${STAGING_DIR_NATIVE}"
> 
> Why is this needed?  Normally the host items run from the path (and should know 
> how to access any related files they need), and ${D} points to the target rootfs 
> directory for things needing full paths.
Hmm, I think you're perfectly right... I needed it because the
gdk-pixbuf postinst scriplet tested the existence of
gtk-update-icon-cache binary but, now that you mentioned it, I realized
it might work without it. Test the existence of the binary on target
rootfs but run the native one from PATH.

Thanks for the tip,
Laurentiu
> 
> --Mark
> 
>>
>>   \$2 \$1/\$3 \$4
>>   if [ \$? -ne 0 ]; then
>>
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


