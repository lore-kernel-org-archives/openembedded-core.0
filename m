Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id B554165CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 20:28:05 +0000 (UTC)
Received: by wmpp66 with SMTP id p66so76902811wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WrULf90qa7WZFZ0YehkTNnsAQqj9CLlDpcFHvRjE/NM=;
	b=V1siiyNs1VbpmB28e5IQ3tPxZWzozRDAxZCl+YKkDWsQLZy1cf9IxmLOIC6qMXPfeV
	nd9gwuh49TCNjCSxJDMTVhumwKJeYQ3fI1qc/gzrleWbf2aKBxc3/CsvJiE3+TwmzJqw
	NpYTn0Z5H36aqIwDUu9hV9p7fJ14MQFtMPyXay9VUvF5sjWUo6eDzRuTRrkfPhsT3bF5
	b5fpy+eOh1xp+JcGd3vtLw5f5VctCMd8L2DA1aR6mGF3VZlkSQ4cyRh/gBBfd+ogo/zQ
	FXhEWA3LyGMU7tuMD+h9Th1z9QpuTnIEZYcJ8dpaDKIorN+eyXAyBn5vt7cUdcpQ0JE2
	wIyw==
MIME-Version: 1.0
X-Received: by 10.28.173.133 with SMTP id w127mr109038wme.61.1450124886419;
	Mon, 14 Dec 2015 12:28:06 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Mon, 14 Dec 2015 12:28:06 -0800 (PST)
In-Reply-To: <87io40dc8g.fsf@email.parenteses.org>
References: <1450123490-3438-1-git-send-email-armccurdy@gmail.com>
	<1450123490-3438-2-git-send-email-armccurdy@gmail.com>
	<87io40dc8g.fsf@email.parenteses.org>
Date: Mon, 14 Dec 2015 12:28:06 -0800
Message-ID: <CAJ86T=U5hK8YMWStqCBorKB4x+AAD4FBWGY9skJdeVhXO+d0WA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel-yocto.bbclass: move do_kernel_link_vmlinux() into kernel.bbclass
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
X-List-Received-Date: Mon, 14 Dec 2015 20:28:06 -0000
Content-Type: text/plain; charset=UTF-8

Hi Mario,

On Mon, Dec 14, 2015 at 12:08 PM, Mario Domenech Goulart
<mario@ossystems.com.br> wrote:
> Hello Andre,
>
> On Mon, 14 Dec 2015 12:04:50 -0800 Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> Move do_kernel_link_vmlinux() from kernel-yocto.bbclass into
>> kernel.bbclass so that it's available to any kernel recipe.
>>
>> Note that the task is not enabled by default in kernel-yocto.bbclass,
>> so don't enable by default in kernel.bbclass either. To enable, see
>> the example in linux-yocto.inc, ie:
>>
>>   addtask kernel_link_vmlinux after do_compile before do_install
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/classes/kernel-yocto.bbclass | 12 ------------
>>  meta/classes/kernel.bbclass       | 12 ++++++++++++
>>  2 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
>> index 3762d1d..558515e 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -348,18 +348,6 @@ do_validate_branches() {
>>       fi
>>  }
>>
>> -# Many scripts want to look in arch/$arch/boot for the bootable
>> -# image. This poses a problem for vmlinux based booting. This
>> -# task arranges to have vmlinux appear in the normalized directory
>> -# location.
>> -do_kernel_link_vmlinux() {
>> -     if [ ! -d "${B}/arch/${ARCH}/boot" ]; then
>> -             mkdir ${B}/arch/${ARCH}/boot
>> -     fi
>> -     cd ${B}/arch/${ARCH}/boot
>> -     ln -sf ../../../vmlinux
>> -}
>> -
>>  OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
>>  KBUILD_OUTPUT = "${B}"
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 4ce1611..2e60139 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -408,6 +408,18 @@ python split_kernel_packages () {
>>      do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>>  }
>>
>> +# Many scripts want to look in arch/$arch/boot for the bootable
>> +# image. This poses a problem for vmlinux based booting. This
>> +# task arranges to have vmlinux appear in the normalized directory
>> +# location.
>> +do_kernel_link_vmlinux() {
>> +     if [ ! -d "${B}/arch/${ARCH}/boot" ]; then
>> +             mkdir ${B}/arch/${ARCH}/boot
>> +     fi
>
> Wouldn't "mkdir -p ${B}/arch/${ARCH}/boot" be better here?

This patch is just about moving an existing task, so any clean-up
should be addressed in a separate patch.

Using mkdir -p looks fine to me in this case, but the existing code
has been around for 5 years, so it doesn't seem urgent to change it:

  http://git.openembedded.org/openembedded-core/commit/?id=149f2262135ca87608783a8801c9c2d978d8c8ef


>> +     cd ${B}/arch/${ARCH}/boot
>> +     ln -sf ../../../vmlinux
>> +}
>> +
>>  do_strip() {
>>       if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
>>               if [ "${KERNEL_IMAGETYPE}" != "vmlinux" ]; then
>> --
>> 1.9.1
>
> --
> http://www.ossystems.com.br

