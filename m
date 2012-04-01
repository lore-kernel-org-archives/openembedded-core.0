Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>)
	id 1SEAsU-0007ZQ-7S; Sun, 01 Apr 2012 04:50:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q312fd8S018450
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 31 Mar 2012 19:41:39 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sat, 31 Mar 2012 19:41:40 -0700
Message-ID: <4F77C061.7060208@windriver.com>
Date: Sun, 1 Apr 2012 10:41:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20120224000137.466F310330@opal>
	<20120327110632.GA3969@jama.jama.net>
	<20120327113304.GB3969@jama.jama.net>
	<4F71C069.30205@windriver.com>
	<20120327133512.GC3969@jama.jama.net>
	<4F71C570.4020703@windriver.com>
	<20120327151933.GD3969@jama.jama.net>
In-Reply-To: <20120327151933.GD3969@jama.jama.net>
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : A script to clean obsolete sstate cache files
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
X-List-Received-Date: Sun, 01 Apr 2012 02:50:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Martin,

The fixes have been merged into oe-core, and it changed a lot.

// Robert

On 03/27/2012 11:19 PM, Martin Jansa wrote:
> On Tue, Mar 27, 2012 at 09:49:36PM +0800, Robert Yang wrote:
>>
>>
>> On 03/27/2012 09:35 PM, Martin Jansa wrote:
>>> On Tue, Mar 27, 2012 at 09:28:09PM +0800, Robert Yang wrote:
>>>>
>>>> Hi Martin,
>>>>
>>>> Thanks for reporting this, and I'm very sorry for the inconvenience,
>>>> please see my comment inline ...
>>>>
>>>> On 03/27/2012 07:33 PM, Martin Jansa wrote:
>>>>> On Tue, Mar 27, 2012 at 01:06:33PM +0200, Martin Jansa wrote:
>>>>>> On Fri, Feb 24, 2012 at 12:01:37AM +0000, git@git.openembedded.org wrote:
>>>>>>> Module: openembedded-core.git
>>>>>>> Branch: master
>>>>>>> Commit: 7c99ef6d2173b14e1109a540ee5ae47b56d707e7
>>>>>>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=7c99ef6d2173b14e1109a540ee5ae47b56d707e7
>>>>>>>
>>>>>>> Author: Robert Yang<liezhi.yang@windriver.com>
>>>>>>> Date:   Wed Feb 22 20:38:30 2012 +0800
>>>>>>>
>>>>>>> A script to clean obsolete sstate cache files
>>>>>>>
>>>>>>
>>>>>>> +# Use the "_" to substitute "-", e.g., x86-64 to x86_64
>>>>>>> +all_archs=`grep -r DEFAULTTUNE $tunedir | \
>>>>>>> +    sed -e 's/.*\"\(.*\)\"/\1/' -e 's/-/_/g' | sort -u`
>>>>>>> +# Add the qemu archs
>>>>>>> +all_archs="$all_archs qemuarm qemux86 qemumips qemuppc"
>>>>>>
>>>>>> This doesn't list any thumb variants, current list is:
>>>>>>
>>>>>> arm1136jfs arm920t arm926ejs arm9tdmi armv4 armv5 armv6 armv7 armv7a
>>>>>> core2 cortexa8_neon cortexa9_neon cortexm1 cortexm3 cortexr4 ep9312 i586
>>>>>> iwmmxt mips mips32 powerpc powerpc64 ppc603e ppce300c2 ppce500 ppce500mc
>>>>>> ppce500v2 ppce5500 strongarm x86 x86_64 xscale
>>>>>>
>>>>>> so thumb versions (e.g. armv4t) are not found in
>>>>>>
>>>>>>> +for arch in $all_archs; do
>>>>>>> +    ls | grep -q -w $arch
>>>>>>> +    [ $? -eq 0 ]&&    ava_archs="$ava_archs $arch"
>>>>>>> +done
>>>>>>
>>>>>> Cheers,
>>>>>
>>>>> And after extending list of machines in all_archs with armv4t and my
>>>>> machines I got only one file in sstate-cache left :/
>>>>>
>>>>> First run without armv4t found:
>>>>> OE crespo@shr ~/shr-core $ du -hs sstate-cache/; openembedded-core/scripts/sstate-cache-management.sh --cache-dir=sstate-cache --remove-duplicated; du -hs sstate-cache/
>>>>> 14G     sstate-cache/
>>>>> Figuring out the archs in the sstate cache dir ...
>>>>> The following archs have been found in the sstate cache dir:
>>>>> armv7a x86_64
>>>>> Removing the sstate-xxx_deploy-rpm.tgz ... (0 files)
>>>>> Removing the sstate-xxx_deploy-ipk.tgz ... (58 files)
>>>>> Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
>>>>> Removing the sstate-xxx_deploy.tgz ... (0 files)
>>>>> Removing the sstate-xxx_package.tgz ... (62 files)
>>>>> Removing the sstate-xxx_populate-lic.tgz ... (46 files)
>>>>> Removing the sstate-xxx_populate-sysroot.tgz ... (102 files)
>>>>> 268 files have been removed
>>>>> 13G     sstate-cache/
>>>>>
>>>>> Second run with armv4t manually added
>>>>> -all_archs="$all_archs qemuarm qemux86 qemumips qemuppc"
>>>>> +all_archs="$all_archs qemuarm qemux86 qemumips qemuppc armv4t"
>>>>> OE crespo@shr ~/openembedded-core $ du -hs ../shr-core/sstate-cache/; scripts/sstate-cache-management.sh --cache-dir=../shr-core/sstate-cache --remove-duplicated; du -hs ../shr-core/sstate-cache/
>>>>> 13G     ../shr-core/sstate-cache/
>>>>> /OE/openembedded-core/meta/conf/machine/include
>>>>> Figuring out the archs in the sstate cache dir ...
>>>>> The following archs have been found in the sstate cache dir:
>>>>> armv4t armv7a x86_64
>>>>> Removing the sstate-xxx_deploy-rpm.tgz ... (0 files)
>>>>> Removing the sstate-xxx_deploy-ipk.tgz ... (460 files)
>>>>> Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
>>>>> Removing the sstate-xxx_deploy.tgz ... (0 files)
>>>>> Removing the sstate-xxx_package.tgz ... (454 files)
>>>>> Removing the sstate-xxx_populate-lic.tgz ... (456 files)
>>>>> Removing the sstate-xxx_populate-sysroot.tgz ... (468 files)
>>>>> 1838 files have been removed
>>>>> 6.2G    ../shr-core/sstate-cache/
>>>>>
>>>>> Third run with machines I'm building manually added
>>>>> -all_archs="$all_archs qemuarm qemux86 qemumips qemuppc armv4t"
>>>>> +all_archs="$all_archs qemuarm qemux86 qemumips qemuppc armv4t om_gta01 om_gta02 om_gta04 nokia900 palmpre palmpre2 crespo spitz"
>>>>
>>>> The script figures the archs according to the 'meta/conf/machine/include',
>>>> this is incorrect since it only searches the oe-core layer, I will fix it.
>>>
>>> The first issue is that armv4t and other thumb variants are also in
>>> oe-core layer.
>>>
>>>> And where can I get the "om_gta01 om_gta02 om_gta04 ..." archs? I mean which
>>>> layer are they in? So that I can test them.
>>>
>>> Those are machines from meta-smartphone sublayers
>>> http://git.shr-project.org/git/?p=meta-smartphone.git;a=summary
>>>
>>> Maybe add some param to add extra archs/machines or just list all used
>>> xxx variants from 'sstate-xxx_'.
>>>
>> Thanks, add some param is good choice. Figure out the used variants from
>> sstate-xxx is the best way, but it seems not easy since it uses the "-" as
>> the separator, and I had counted the number of field, it is not always the
>> same.
>
> I see, maybe add also param to specify stamps dir, which can be used to
> find all arch ever built if it's the same host which populated
> sstate-cache dir.
>
> That would include also all sdk and native variants etc.
>
> Cheers,
>


