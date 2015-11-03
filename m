Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8725775A31
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 09:22:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA39MnX0024839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Nov 2015 01:22:49 -0800 (PST)
Received: from [128.224.163.183] (128.224.163.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 3 Nov 2015 01:22:49 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <1446445418-31492-1-git-send-email-jian.liu@windriver.com>
	<CAMKF1sqBfdSMphfZJ_O3nEd3cMA7A=5tKa2Xu0wGUsSr-HtuNg@mail.gmail.com>
From: Jian Liu <jian.liu@windriver.com>
Message-ID: <56387CE7.5040907@windriver.com>
Date: Tue, 3 Nov 2015 17:22:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqBfdSMphfZJ_O3nEd3cMA7A=5tKa2Xu0wGUsSr-HtuNg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver.bbclass: do checkout for kernel
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
X-List-Received-Date: Tue, 03 Nov 2015 09:22:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I test linux-dummy linux-yocto-dev linux-yocto-rt linux-yocto-tiny and 
the result is as follows,

linux-dummy: this package just meets some dependency and there is no 
source code for it.
                       The patch does not impact it
linux-yocto, linux-yocto-dev, linux-yocto-rt, linux-yocto-tiny: The S 
variable of all packages is set to STAGING_KERNEK_DIR.
                        do_fetch and do_unpack just leave a bare git 
repo of kernel and do_kernel_checkout gets the source code

Thanks!
Jian

On 2015年11月03日 05:30, Khem Raj wrote:
> On Sun, Nov 1, 2015 at 10:23 PM, Jian Liu <jian.liu@windriver.com> wrote:
>> The repo of kernel is bare git repository and we need to checkout to get
>> the source code.
> it should be linux-yocto I think, or do we have all kernels as bare git repos ?
>
>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>>
>> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
>> index 41a552c..7387fbf 100644
>> --- a/meta/classes/archiver.bbclass
>> +++ b/meta/classes/archiver.bbclass
>> @@ -66,6 +66,11 @@ python () {
>>       ar_recipe = d.getVarFlag('ARCHIVER_MODE', 'recipe', True)
>>
>>       if ar_src == "original":
>> +        # For kernel, it is bare repo, we need to checkout
>> +        if bb.data.inherits_class('kernel-yocto', d):
>> +            bb.build.addtask('do_ar_original', 'do_kernel_metadata', 'do_validate_branches', d)
>> +        else:
>> +            bb.build.addtask('do_ar_original', None, 'do_unpack', d)
>>           d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_original' % pn)
>>       elif ar_src == "patched":
>>           d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_patched' % pn)
>> @@ -113,6 +118,12 @@ python do_ar_original() {
>>
>>       ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
>>       bb.note('Archiving the original source...')
>> +    # For kernel, the source code is shared
>> +    if bb.data.inherits_class('kernel-yocto', d):
> is this linux-yocto specific
>
>> +        srcdir = d.getVar('S', True)
>> +        create_tarball(d, srcdir, 'original', ar_outdir)
>> +        return
>> +
>>       fetch = bb.fetch2.Fetch([], d)
>>       for url in fetch.urls:
>>           local = fetch.localpath(url).rstrip("/");
>> @@ -346,7 +357,6 @@ python do_deploy_archives_setscene () {
>>   do_deploy_archives[sstate-inputdirs] = "${ARCHIVER_TOPDIR}"
>>   do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
>>
>> -addtask do_ar_original after do_unpack
>>   addtask do_ar_patched after do_unpack_and_patch
>>   addtask do_ar_configured after do_unpack_and_patch
>>   addtask do_dumpdata
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


