Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4480B759CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:27:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H2RDVN000603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Aug 2015 19:27:13 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 16 Aug 2015 19:27:12 -0700
Message-ID: <55D1467F.6090807@windriver.com>
Date: Mon, 17 Aug 2015 10:27:11 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Mark Hatle
	<mark.hatle@windriver.com>
References: <cover.1439449078.git.liezhi.yang@windriver.com>	
	<529ac22ac47e062b63c4b3b8ce7c0f9def00f359.1439449078.git.liezhi.yang@windriver.com>
	<1439628950.1218.16.camel@linuxfoundation.org>
In-Reply-To: <1439628950.1218.16.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] populate_sdk_base.bbclass: help rpm to pull in multilib toolchain
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
X-List-Received-Date: Mon, 17 Aug 2015 02:27:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/15/2015 04:55 PM, Richard Purdie wrote:
> On Thu, 2015-08-13 at 00:37 -0700, Robert Yang wrote:
>> When configure multilib, "bitbake <image_bb> -c populate_sdk" should
>> install all arch toolchains (for example, 32 and 64bit), but rpm not
>> handle the multilib requires correctly, for example:
>> lib32-packagegroup-core-standalone-sdk-target requires lib32-libc6, rpm
>> may pull in libc6 rather than lib32-libc6, if we directly use something
>> like IMAGE_INSTALL_append = " lib32-libc6", then it works well, so
>> update TOOLCHAIN_TARGET_TASK to include the RDEPENDS packages will fix
>> the issue.
>
> Whilst I understand why you're doing this, its rather sad that as the
> rpm multilib code is broken, we have to hack the core sdk code like this
> to work around it.
>
> Could/should we not put this into the rpm sdk backend instead?

Sorry, I can't understand what did you mean, do you mean put this into rpm
sdk backend such as meta/lib/oe/sdk.py ?

// Robert

>
> I also can't help this is just a bandaid and that we'll likely find
> other ways this breaks in the future, its not a complete solution to the
> issue :/.
>
> Cheers,
>
> Richard
>
>> [YOCTO #8089]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/populate_sdk_base.bbclass |   32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>> index a9e9bd7..c2491ea 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -83,8 +83,40 @@ POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
>>   fakeroot python do_populate_sdk() {
>>       from oe.sdk import populate_sdk
>>       from oe.manifest import create_manifest, Manifest
>> +    import oe.packagedata
>>
>>       pn = d.getVar('PN', True)
>> +    # Help rpm to pull in multilib requires since it may not pull in
>> +    # them correctly, for example,
>> +    # lib32-packagegroup-core-standalone-sdk-target requires
>> +    # lib32-libc6, rpm may pull in libc6 rather than lib32-libc6, but
>> +    # directly use
>> +    # TOOLCHAIN_TARGET_TASK_append = " lib32-libc6" works well.
>> +    for pkg in (d.getVar('TOOLCHAIN_TARGET_TASK', True) or "").split():
>> +        sub_data = oe.packagedata.read_subpkgdata(pkg, d)
>> +        sub_rdep = sub_data.get("RDEPENDS_" + pkg)
>> +        if not sub_rdep:
>> +            continue
>> +        done = sub_rdep.split()
>> +        next = done
>> +        # Find all the rdepends on the dependency chain
>> +        while next:
>> +            new = []
>> +            for sub_pkg in next:
>> +                sub_data = oe.packagedata.read_subpkgdata(sub_pkg, d)
>> +                sub_pkg_rdep = sub_data.get("RDEPENDS_" + sub_pkg)
>> +                if not sub_pkg_rdep:
>> +                    continue
>> +                for p in sub_pkg_rdep.split():
>> +                    if p in done:
>> +                        continue
>> +                    if not p.startswith('(') and \
>> +                            oe.packagedata.has_subpkgdata(p, d):
>> +                        # It's a new rdep
>> +                        done.append(p)
>> +                        new.append(p)
>> +            next = new
>> +        d.appendVar('TOOLCHAIN_TARGET_TASK', ' ' + " ".join(done))
>>       runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
>>       runtime_mapping_rename("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", pn, d)
>>
>> --
>> 1.7.9.5
>>
>
>
>
>

