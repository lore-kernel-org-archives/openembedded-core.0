Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UPpsm-0005kJ-FO
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 09:56:27 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Apr 2013 00:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,444,1363158000"; d="scan'208";a="225412257"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Apr 2013 00:38:28 -0700
Message-ID: <516516F3.5000401@intel.com>
Date: Wed, 10 Apr 2013 10:38:27 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1365522831-17183-1-git-send-email-laurentiu.palcu@intel.com>
	<1365544739.12407.115.camel@ted>
In-Reply-To: <1365544739.12407.115.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] postinst-intercepts, qemu.bbclass: fix segfaults in postinstalls
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
X-List-Received-Date: Wed, 10 Apr 2013 07:56:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/10/2013 12:58 AM, Richard Purdie wrote:
> On Tue, 2013-04-09 at 18:53 +0300, Laurentiu Palcu wrote:
>> Postinstalls that use qemu are throwing a segmentation fault when
>> building for qemux86-64 on a 64bit host (it might also happen for
>> qemux86 if building on a 32bit host but I didn't test). It looks like
>> qemu looks for ld.so.cache which is not found because it is generated
>> after rootfs_(rpm|ipk|deb)_do_rootfs is called and then it tries to load
>> libraries from the default paths (which are the host's). In order to
>> avoid this, pass the LD_LIBRARY_PATH explicitly to the target's dynamic
>> loader.
>>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> ---
>>  meta/classes/qemu.bbclass                       |    4 +++-
>>  scripts/postinst-intercepts/update_font_cache   |    3 ++-
>>  scripts/postinst-intercepts/update_pixbuf_cache |    3 ++-
>>  3 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
>> index 0e71d6a..6881826 100644
>> --- a/meta/classes/qemu.bbclass
>> +++ b/meta/classes/qemu.bbclass
>> @@ -29,4 +29,6 @@ def qemu_run_binary(data, rootfs_path, binary):
>>      if qemu_binary == "qemu-allarch":
>>          qemu_binary = "qemuwrapper"
>>  
>> -    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -L " + rootfs_path + " " + rootfs_path + binary
>> +    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -L " + rootfs_path\
>> +            + " -E LD_LIBRARY_PATH=" + rootfs_path + "/lib:" + rootfs_path\
>> +            + "/usr/lib " + rootfs_path + binary
> 
> This isn't going to work with multilibs. Can we reorder the rootfs code
> so the ld.so.cache piece happens before the intercepts?
I keep forgetting about multilib... :( I'll find another way.
Unfortunately, it's not enough to generate ld.so.cache before running
the intercept hooks because there are other package postinstalls that
need qemu and those will be run before that. What if, instead of
hardcoding, we use ${libdir} and ${base_libdir}?. These should always
point to the right locations even when working with multilib.

Thanks,
Laurentiu
> 
> Cheers,
> 
> Richard
> 
>> diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
>> index ad1bab3..fa2c0ef 100644
>> --- a/scripts/postinst-intercepts/update_font_cache
>> +++ b/scripts/postinst-intercepts/update_font_cache
>> @@ -1,5 +1,6 @@
>>  #!/bin/sh
>>  
>> -PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${bindir}/fc-cache --sysroot=$D >/dev/null 2>&1
>> +PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/lib:$D/usr/lib\
>> +					$D${bindir}/fc-cache --sysroot=$D >/dev/null 2>&1
>>  
>>
>> diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
>> index 9134529..fbb6fd1 100644
>> --- a/scripts/postinst-intercepts/update_pixbuf_cache
>> +++ b/scripts/postinst-intercepts/update_pixbuf_cache
>> @@ -2,7 +2,8 @@
>>  
>>  export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
>>  
>> -PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${bindir}/gdk-pixbuf-query-loaders \
>> +PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/lib:$D/usr/lib\
>> +    $D${bindir}/gdk-pixbuf-query-loaders \
>>      >$GDK_PIXBUF_MODULEDIR/../loaders.cache 2>/dev/null && \
>>      sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
>>  
> 
> 


