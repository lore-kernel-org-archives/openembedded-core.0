Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Sxfj1-0005Se-Ar
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 16:53:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q74EfNbX010675
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 4 Aug 2012 07:41:23 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sat, 4 Aug 2012 07:41:23 -0700
Message-ID: <501D3492.4080007@windriver.com>
Date: Sat, 4 Aug 2012 09:41:22 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<c8630bc519bcb2d6671e5bd30f9b11ccb9d768b2.1344022584.git.laurentiu.palcu@intel.com>
	<501C33D4.6070409@windriver.com> <501CD352.7080908@intel.com>
	<501CE48C.9090202@intel.com>
In-Reply-To: <501CE48C.9090202@intel.com>
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
X-List-Received-Date: Sat, 04 Aug 2012 14:53:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/12 3:59 AM, Laurentiu Palcu wrote:
>
>
> On 08/04/2012 10:46 AM, Laurentiu Palcu wrote:
>>
>>
>> On 08/03/2012 11:25 PM, Mark Hatle wrote:
>>> On 8/3/12 3:19 PM, Laurentiu Palcu wrote:
>>>> Some postinst scriptlets test for the existence of certain files but
>>>> have the paths hardcoded to the target's rootfs. This patch will allow
>>>> us to run postinst scriptlets at do_rootfs time by calling native
>>>> binaries.
>>>>
>>>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>>> ---
>>>>    meta/classes/package_rpm.bbclass |    1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
>>>> index 50e9b31..113b19c 100644
>>>> --- a/meta/classes/package_rpm.bbclass
>>>> +++ b/meta/classes/package_rpm.bbclass
>>>> @@ -443,6 +443,7 @@ export D="${target_rootfs}"
>>>>    export OFFLINE_ROOT="\$D"
>>>>    export IPKG_OFFLINE_ROOT="\$D"
>>>>    export OPKG_OFFLINE_ROOT="\$D"
>>>> +export NATIVE_DIR="${STAGING_DIR_NATIVE}"
>>>
>>> Why is this needed?  Normally the host items run from the path (and should know
>>> how to access any related files they need), and ${D} points to the target rootfs
>>> directory for things needing full paths.
>> Hmm, I think you're perfectly right... I needed it because the
>> gdk-pixbuf postinst scriplet tested the existence of
>> gtk-update-icon-cache binary but, now that you mentioned it, I realized
>> it might work without it. Test the existence of the binary on target
>> rootfs but run the native one from PATH.
> However, I just remembered that the rpm packages are not installed in
> dependency order... So, there might be packages, that need
> gtk-update-icon-cache, installed before libgtk+ is installed. In this
> case, the postinst scriptlets that test the existence of the binary on
> the target rootfs will fail at do_roofts time... Unless a solution is
> found to install the rpm packages in dependency order. BTW, is this
> planned to be fixed?

Install order vs scriptlet order are different.  The package dependencies 
indicate when the transaction is complete all dependent packages will be 
installed.  The scriptlets can be delayed or run during the install process. 
I'm not sure what controls when they run, but that is a separate action from the 
actual install process itself.

I have not has the time to investigate the control of the scriptlets, but it's 
on my list.

Back to the issue at hand though.  Two solutions, the first is simply run the 
program and if it fails, ignore the failure or "stage" it for later (or fail), 
whichever is appropriate.  The only thing that checking for the binary 
accomplishes is knowing if it might fail or not, it's likely just as easy to 
check for a failure trying to run the binary.

For the cross install case, you can check for the existence of the ${D} 
variable.  If it doesn't exist then you are on the target, and you can do 
whatever checks are necessary -- but on the host side you will have to assume 
the binary exists and is available [based on the recipe requirements.]

--Mark

> Laurentiu
>>
>> Thanks for the tip,
>> Laurentiu
>>>
>>> --Mark
>>>
>>>>
>>>>    \$2 \$1/\$3 \$4
>>>>    if [ \$? -ne 0 ]; then
>>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



