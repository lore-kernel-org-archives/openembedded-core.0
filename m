Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F24116D726
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 02:03:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAD23BgM024925
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Nov 2013 18:03:11 -0800 (PST)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 12 Nov 2013 18:03:10 -0800
Message-ID: <5282DDDB.4030709@windriver.com>
Date: Wed, 13 Nov 2013 10:03:07 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1384244230-30541-1-git-send-email-ming.liu@windriver.com>
	<CADkTA4OqaxJyRp-T298LG-Jm36tUNkZXvKawoWGtKOCETARTvA@mail.gmail.com>
In-Reply-To: <CADkTA4OqaxJyRp-T298LG-Jm36tUNkZXvKawoWGtKOCETARTvA@mail.gmail.com>
X-Originating-IP: [128.224.162.145]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: handles symbolic KERNEL_OUTPUT in bundle_initramfs task
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
X-List-Received-Date: Wed, 13 Nov 2013 02:03:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2013 11:07 PM, Bruce Ashfield wrote:
> On Tue, Nov 12, 2013 at 3:17 AM, Ming Liu <ming.liu@windriver.com> wrote:
>> In many cases, KERNEL_OUTPUT is a symbolic link to the real bootable image,
>> but in bundle_initramfs task, it's not considered so that the KERNEL_OUTPUT
>> is being renamed/restored as a regular file, this leads it finally point to
>> a incorrect target, or even worse, break the bundle_initramfs task for
>> KERNEL_OUTPUT is not going to be regenerated in case it is a symbolic link
>> to vmlinux.
>>
>> Also, we need move bundle_initramfs after kernel_link_vmlinux.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/classes/kernel.bbclass | 24 ++++++++++++++++++++----
>>   1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index a4db9f5..2ec09ae 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -123,13 +123,29 @@ do_bundle_initramfs () {
>>          if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
>>                  echo "Creating a kernel image with a bundled initramfs..."
>>                  copy_initramfs
>> -               if [ -e ${KERNEL_OUTPUT} ] ; then
>> +               # Backuping kernel image relies on its type(regular file or symbolic link)
>> +               linkpath=""
>> +               realpath=""
>> +               if [ -h ${KERNEL_OUTPUT} ] ; then
>> +                       linkpath=`readlink -n ${KERNEL_OUTPUT}`
>> +                       realpath=`readlink -fn ${KERNEL_OUTPUT}`
>> +                       mv -f $realpath $realpath.bak
>> +               elif [ -f ${KERNEL_OUTPUT} ]; then
>>                          mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak
>>                  fi
>>                  use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>>                  kernel_do_compile
>> -               mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
>> -               mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
>> +               # Restoring kernel image
>> +               if [ ! -z $realpath ]; then
> Why not  if [ -n "$realpath" ] ? I always find that reads easier.
OK, that would be better.
>
>> +                       mv -f $realpath $realpath.initramfs
>> +                       mv -f $realpath.bak $realpath
>> +                       cd ${B}/$(dirname ${KERNEL_OUTPUT})
>> +                       ln -sf $linkpath
>> +                       ln -sf $linkpath.initramfs
> Won't the links just follow .. they are symbolic after all. Since things are
> being put back in place. Or are the names changing underneath ?
Indeed, 'ln -sf $linkpath' is unnecessary, I can remove it, but for the 
initramfs link, we must create it here for it doesn't exist before this.
>
>> +               else
>> +                       mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
>> +                       mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
>> +               fi
>>                  # Update install area
>>                  echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
>>                  install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
>> @@ -152,7 +168,7 @@ python do_devshell_prepend () {
>>       os.environ["LDFLAGS"] = ''
>>   }
>>
>> -addtask bundle_initramfs after do_compile before do_build
>> +addtask bundle_initramfs after do_kernel_link_vmlinux before do_build
> This isn't explained in the commit log.
So, I will put it into another commit, I will send the V1 soon including 
all the changes discussed above.

//Ming Liu

>
> Bruce
>
>>   kernel_do_compile() {
>>          unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>> --
>> 1.8.4.1
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


