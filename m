Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1SyRGH-0000fB-B6
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 19:38:37 +0200
Received: by yhjj56 with SMTP id j56so2477074yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 10:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=F1LY0QHU9iJ5R7LamWFE/Zken+RTFatnJGEQr5EFWmc=;
	b=LQwnGO2MUu54O72Lur+zCCfPjSo0hyUL6X5DYKa0HsTZW/+ZoTgUzsnUnKLHhZ76zH
	0VvHQ6QdZEQIpXQzTVOvM72rQAE2lZgDLYveApvRj+C/tieS5KbsGbCBmCXjaTuYPZ0f
	zb3aA0jxb3KylzH2r8a+xFeeCAxgxDJnSucfBJ69fqMSRydj2Z1XoX2onwiLMnRx6WwE
	rYpYrjESMxR9o2THdz9wydy5DY1ZC3icNA+nhDRTKX0O5+Fhg8fKc486DgrLc5kSWLtz
	kZczWhZlMD5CuAZlLh9imvNai2ry4oYCCF6Jm8IjrflnBg7Cvdx5VbuvQgjOGzeb8KAk
	gZ6Q==
MIME-Version: 1.0
Received: by 10.60.27.6 with SMTP id p6mr19776831oeg.37.1344274011951; Mon, 06
	Aug 2012 10:26:51 -0700 (PDT)
Received: by 10.60.33.129 with HTTP; Mon, 6 Aug 2012 10:26:51 -0700 (PDT)
X-Originating-IP: [95.23.159.17]
In-Reply-To: <501FED7B.6050309@linux.intel.com>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
	<1344196136-7643-17-git-send-email-javier@dowhile0.org>
	<501FED7B.6050309@linux.intel.com>
Date: Mon, 6 Aug 2012 19:26:51 +0200
Message-ID: <CABxcv=nbR7hBSrMDXc4roZz=BS73B+BrE2m2BdXMKVVN_UrZpw@mail.gmail.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Darren Hart <dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQmxSYcayiFkJxZEbk80MqdlzkOn7H2/GtoET2A+8eiggo6jvHcLFYnmXeepH4tBktstHeIa
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 16/28] kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib and /etc
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
X-List-Received-Date: Mon, 06 Aug 2012 17:38:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 6, 2012 at 6:14 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> On 08/05/2012 12:48 PM, Javier Martinez Canillas wrote:
>
> Hi Javier,
>
>> It is considered good practice to use the build system provided
>> variables instead of directly specify hardcoded paths.
>
> Have you tested this with a build using a base_libdir other than /lib ?
>
>> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
>> ---
>>  meta/classes/kernel.bbclass |   12 ++++++------
>>  1 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 1d8dff9..b434093 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -109,10 +109,10 @@ kernel_do_install() {
>>       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>>       if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>>               oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
>
> The install doesn't specify base_libdir, so does the kernel make system
> honor it?
>
>> -             rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
>> -             rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
>> -             rm "${D}/lib/modules/${KERNEL_VERSION}/build"
>> -             rm "${D}/lib/modules/${KERNEL_VERSION}/source"
>> +             rm -f "${D}${base_libdir}/modules/${KERNEL_VERSION}/modules.order"
>> +             rm -f "${D}${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>> +             rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/build"
>> +             rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/source"
>
> if not, these will fail.
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Technical Lead - Linux Kernel

Hi Darren,

Yes, you are right I didn't think about it.

The kernel is a special case since you just specify the root of the
file system with INSTALL_MOD_PATH the kernel build system will
*always* create lib/modules/${KERNEL_VERSION}.

In fact now that I think about it, I don't know if you can even change
the path were the kernel modules gets installed.

So, yes the kernel is a special case and using a ${base_libdir} other
than /lib will definitely break loadable kernel modules installation.

Richard, Darren is correct and this patch is wrong, this is one of the
cases which is acceptable (and necessary) to hardcode /lib.

Thanks a lot for pointing me out this and sorry for not realizing this
before sending the patch-set.

Best regards,
Javier


