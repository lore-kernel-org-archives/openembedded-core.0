Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1USql7-0000ik-TV
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 17:28:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3IFAqfb012484
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 08:10:52 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 18 Apr 2013 08:10:51 -0700
Message-ID: <51700CF8.5030600@windriver.com>
Date: Thu, 18 Apr 2013 10:10:48 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1366295248-7766-1-git-send-email-bogdan.a.marinescu@intel.com>
	<51700760.7000204@windriver.com>
In-Reply-To: <51700760.7000204@windriver.com>
Subject: Re: [PATCH] package_rpm.bbclass: fix /etc/rpm/platform generation
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
X-List-Received-Date: Thu, 18 Apr 2013 15:28:35 -0000
X-List-Received-Date: Thu, 18 Apr 2013 15:28:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/13 9:46 AM, Mark Hatle wrote:
> On 4/18/13 9:27 AM, Bogdan Marinescu wrote:
>> For some platforms (for example emenlow) the RPM installer prefers
>> an invalid package architecture (for example i586 over core2) because
>> /etc/rpm/platform is not properly generated (for example, i586 is
>> listed before core2 in /etc/rpm/platform).
>>
>> [YOCTO #3864]
>>
>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>>    meta/classes/package_rpm.bbclass |    1 -
>>    1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
>> index 3a29976..1bee4b1 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -276,7 +276,6 @@ package_install_internal_rpm () {
>>    		# Setup base system configuration
>>    		echo "Note: configuring RPM platform settings"
>>    		mkdir -p ${target_rootfs}/etc/rpm/
>> -		echo "$INSTALL_PLATFORM_RPM" > ${target_rootfs}/etc/rpm/platform
>
> I think this is wrong.  The /etc/rpm/platform file's first line is supposed to
> be the equivalent of: [uname -m]-vendor-os.   While uname -m doesn't match our
> tune namings, the concept is the same.  The first line simply defines the "tune"
> of the platform, subsequent lines define alternative names that will run on this
> system.
>
> The INSTALL_PLATFORM_RPM value should be the expected value for the platform as
> a whole, as it's the default tune value.  (Default tune value is expected to be
> the most accurate value.
>
> Looking at the defect:
>
> i586-poky-linux
> emenlow-.*-linux
> core2-.*-linux
> i686-.*-linux
> i586-.*-linux
> i486-.*-linux
> i386-.*-linux
> x86-.*-linux
> noarch-.*-linux.*
> any-.*-linux.*
> all-.*-linux.*
>
> The default tune value for that machine was set to i586 by "something".
>
> INSTALL_PLATFORM_RPM="$(echo ${TARGET_ARCH} | tr - _)${TARGET_VENDOR}-${TARGET_OS}"
>
> ${TARGET_ARCH} is similar to the output of uname -m.  The error is that this
> particular BSP should have returned 'core2' as the TARGET_ARCH from what I can tell.
>
> Default for TARGET_ARCH is: TARGET_ARCH = "${TUNE_ARCH}"
>
> So the TUNE_ARCH is being set to i586.  So the end result is..  Is 'TUNE_ARCH'
> set to i586 appropriate?  It probably is, because the majority of the system
> seems to have a limited set of expected values for TARGET_ARCH.
>
> So, perhaps the right fix is instead of using 'TARGET_ARCH' in
> INSTALL_PLATFORM_RPM, 'TUNE_PKGARCH_${DEFAULTTUNE}' may be more appropriate.
>
> I'd suggest trying that.  (But the first line is the system architecture,
> following lines are alternative packages that are considered compatible.)

Forgot one thing.  The first line must be fully expanded.  Subsequent lines are 
regex matched by the system.

--Mark

>>
>>    		if [ ! -z "$INSTALL_PLATFORM_EXTRA_RPM" ]; then
>>    			for pt in $INSTALL_PLATFORM_EXTRA_RPM ; do
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



