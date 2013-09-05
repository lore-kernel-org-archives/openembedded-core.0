Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF1D461863
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:41:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r85CfvCw003168
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 05:41:57 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 5 Sep 2013 05:41:56 -0700
Message-ID: <52287C35.5050709@windriver.com>
Date: Thu, 5 Sep 2013 20:42:29 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<728bbce2f20eefd81accfbbe48c6f5f4e85aabb2.1378366233.git.laurentiu.palcu@intel.com>
	<20130905081516.GI11500@jama>
	<1378377834.6940.66.camel@phil-desktop.brightsign>
	<20130905111155.GB17481@lpalcu-linux>
In-Reply-To: <20130905111155.GB17481@lpalcu-linux>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH 1/1] image.bbclass: leave metadata in place if a PM is installed in the image
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
X-List-Received-Date: Thu, 05 Sep 2013 12:41:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2013 07:11 PM, Laurentiu Palcu wrote:
> On Thu, Sep 05, 2013 at 11:43:54AM +0100, Phil Blundell wrote:
>> On Thu, 2013-09-05 at 10:15 +0200, Martin Jansa wrote:
>>> On Thu, Sep 05, 2013 at 10:31:10AM +0300, Laurentiu Palcu wrote:
>>>>   rootfs_uninstall_unneeded () {
>>>> -	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
>>>> +	rpm_installed=${@base_contains("PACKAGE_INSTALL", "rpm",  "true", "false", d)}
>>>> +	opkg_installed=${@base_contains("PACKAGE_INSTALL", "opkg", "true", "false", d)}
>>>> +	dpkg_installed=${@base_contains("PACKAGE_INSTALL", "dpkg", "true", "false", d)}
>>>> +
>>>> +	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)} &&\
>>> is this first condition still needed? Do we have some case where
>>> package-management is enabled without rpm/opkg/dpkg installed?
>> Yes, potentially.  It is quite legitimate to have package-management in
>> IMAGE_FEATURES (in order to have the metadata kept around for later
>> inspection) but not actually install any of the package managers.  In
>> fact, this is basically all that the package-management feature does,
>> and revoking support for it in favour of needing to specify something in
>> PACKAGE_INSTALL seems like it would be a retrograde step.
> This patch does not revoke support for 'package-management' in
> IMAGE_FEATURES. It just makes sure not to remove anything if a PM is
> present in the image. Those packages will be, potentially, needed by
> postinstalls etc.
>> Replacing the generic IMAGE_FEATURES test with something based on the
>> presence of one of three specific package managers also has a few other
>> minor downsides:
>>
>> - it makes it harder for someone to maintain support for a different
>> package manager outside of oe-core;
> I agree here.
>
>> - it means that mentioning rpm in PACKAGE_INSTALL for an opkg-based
>> image will still cause all the opkg metadata to be retained, which might
>> be surprising to some;
> Also true, but we cannot really deal with all combinations... can we?
>
>> - it makes it impossible to install opkg or suchlike without its
>> metadata, which has occasionally been a useful thing to do.
> Is this a valid use case? Besides, right now, if you don't have
> 'package-management' in IMAGE_FEATURES but have opkg installed you will,
> indeed, have opkg installed without metadata but also update-rc.d,
> base-passwd and run-postinsts will be removed from the image. This means
> that opkg will be slightly useless since postinstalls might need
> update-rc.d to complete. Or, if there are delayed postinstalls,
> run-postinsts package has to be present too, in order to have those run
> at first boot.
>
>> I don't think any of the above are necessarily deal-breakers, but it
>> does seem to me that this patch is based on an erroneous premise.  If
>> the user wants package management then they should simply be adding that
>> flag to IMAGE_FEATURES.  I don't think it's necessary or desirable that
>> image.bbclass try to second-guess this by looking at the list of
>> packages to be installed and applying some heuristic.
> This solution is the most decent I could find in order to address this:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4484
> in this stage of 1.5 release. Other ideas are always welcome.

Hi Laurentiu,

I don't think run-postinst should rely on the presence of a PM.
Whether to delete the run-postinst should only be determined by whether 
there are some delayed postinst scripts.

So I think the logic in this remove function should be divided into two 
parts.
Part 1, remove package management related data if 'package-management' 
is not in IMAGE_FEATURES.
Part 2, remove the run-postinst if there's no delayed postisnt script.

Besides, I think that update-rc.d should not be removed, because it's 
actually useful to manage things in a system with a runlevel concept.

Best Regards,
Chen Qi

> Thanks,
> Laurentiu
>
>> p.
>>
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


