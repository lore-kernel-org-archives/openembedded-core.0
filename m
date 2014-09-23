Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-05.prod.phx3.secureserver.net
	(p3plsmtpa08-05.prod.phx3.secureserver.net [173.201.193.106])
	by mail.openembedded.org (Postfix) with ESMTP id 853F365DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 17:06:11 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-05.prod.phx3.secureserver.net with 
	id uh671o00X0BVjqb01h68sD; Tue, 23 Sep 2014 10:06:11 -0700
Message-ID: <5421A87F.1080000@pabigot.com>
Date: Tue, 23 Sep 2014 12:06:07 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1411297735-12300-1-git-send-email-dv@pseudoterminal.org>
	<20140923163827.GB2480@denix.org>
In-Reply-To: <20140923163827.GB2480@denix.org>
Subject: Re: [PATCH] kernel.bbclass: use one package split for all firmware filename extensions
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
X-List-Received-Date: Tue, 23 Sep 2014 17:06:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2014 11:38 AM, Denys Dmytriyenko wrote:
> On Sun, Sep 21, 2014 at 01:08:55PM +0200, Carlos Rafael Giani wrote:
>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>> ---
>>   meta/classes/kernel.bbclass | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 4710719..78b33ce 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -384,10 +384,7 @@ pkg_postrm_kernel-image () {
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>   
>>   python split_kernel_packages () {
>> -    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>> -    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>> -    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>> -    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.dsp$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>> +    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
> Can we also add .elf to the list? Thanks!

Related to that: I noticed that the meta-ti kernel adds a firmware blob 
am335x-pm-firmware.elf.  This causes QA errors when building that kernel 
with linux-yocto because the .elf file is stripped and the unstripped 
debug version isn't packaged.

The existing linux-firmware repository doesn't include any elf format 
files.  Perhaps the TI module could be updated to load the .bin version 
of the file instead.

Peter


