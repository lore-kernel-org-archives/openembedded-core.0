Return-Path: <kamensky@cisco.com>
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
	by mail.openembedded.org (Postfix) with ESMTP id 87E0478DC0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 22:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4451; q=dns/txt; s=iport;
	t=1533335865; x=1534545465;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=8eWA7j6b/WP0NVA4G9Z7jKriodBqIzrrGuCgWUGSkQE=;
	b=bRgtLGXvztl8UKafJGciEo5jb4wOat7XWraPYfEgzHSldk+P+G/DH/8q
	yBE5Wpz4dAF3i6h51PUb7QMhw944RlcnGqgM3tWwklDBJuyZQkGsYNc7h
	MpZ35MPrKkw2cCwV6I469JVfB76S7ZTEecwJuaFsOlTkCrd1WxoSF8m3R s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CRAQBi2GRb/4wNJK1cGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNOY38ojGaNTyWXWAsYDYQBRgKDDiE4FAECAQECAQECbRw?=
	=?us-ascii?q?MhTYBAQEDAQEBNgI0CwUHBAsRAQMBAQEnBycBHgMGCAYTgyGBdwgPsxyKU4k?=
	=?us-ascii?q?JF4IAgUWCX4MbAQMBAYczAodahgSMTwmGGYJvBYJHhTpFhkyFPopkh0sCBAs?=
	=?us-ascii?q?CFIFYIYE+DAhNIxU7gmkJghkDF4hZUYUNHzABAQSQHgEB?=
X-IronPort-AV: E=Sophos;i="5.51,440,1526342400"; d="scan'208";a="152735426"
Received: from alln-core-7.cisco.com ([173.36.13.140])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Aug 2018 22:37:44 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id w73Mbhnb027444
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 3 Aug 2018 22:37:43 GMT
Date: Fri, 3 Aug 2018 15:37:43 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: "Ocampo Coronado, Omar" <omar.ocampo.coronado@intel.com>
In-Reply-To: <0D62475714C01347BCA118AE7A61400376B38D06@FMSMSX109.amr.corp.intel.com>
Message-ID: <alpine.LRH.2.00.1808031527440.50550@sjc-ads-6991.cisco.com>
References: <20180803230955.104596-1-omar.ocampo.coronado@intel.com>
	<alpine.LRH.2.00.1808031320270.50550@sjc-ads-6991.cisco.com>
	<0D62475714C01347BCA118AE7A61400376B38D06@FMSMSX109.amr.corp.intel.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.218.111, sjc-ads-6991.cisco.com
X-Outbound-Node: alln-core-7.cisco.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package: skip strip on signed kernel modules
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
X-List-Received-Date: Fri, 03 Aug 2018 22:37:43 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Fri, 3 Aug 2018, Ocampo Coronado, Omar wrote:

> Yes, we would like to keep the symbols on a signed kernel module.
>
> Andre shared this link:  https://www.kernel.org/doc/html/v4.17/admin-guide/module-signing.html#signed-modules-and-stripping , from conversation topic: Re: [OE-core] Strip kernel modules and signatures

Thank you for the pointer. I did not expect that KLM signing
will be outside of ELF. Too bad that it is so brittle.

Ideally, it would be nice if one could disable KLM signing in
kernel makefile machinery and have mechanism to sign KLMs in OE
itself, just before packaging but after they got stripped.
IMO it would be more practical. I could not imagine if one
would want to ship KLMs with debug symbols inside. But even
if that is implemented, your code would still should stand ok -
if module signed already, it cannot be touched.

> -28 are the last 28 bytes of the file. The same amount of bytes are being read by dracut to check if a module is signed.
> And you are correct Victor, I'm unsure if this would work outside x86 arch.

I've checked that by building mips64 kernel with KLM signing
enabled and I looked at scripts/sign-file.c source, you are
fine: magic_number = "~Module signature appended~\n" will be
always at the end after KLM signing regardless of architecture.

Thanks,
Victor

> Two pending fixes:
>    1) This patch also needs to fix the mode of the file as the original may not be preserved.
>    2)  Seems like 'return' is not accepted by oe.utils.multiprocess, still getting familiar with OE
>
> -----Original Message-----
> From: Victor Kamensky [mailto:kamensky@cisco.com]
> Sent: Friday, August 3, 2018 3:28 PM
> To: Ocampo Coronado, Omar <omar.ocampo.coronado@intel.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] package: skip strip on signed kernel modules
>
>
>
> On Fri, 3 Aug 2018, omar.ocampo.coronado@intel.com wrote:
>
>> From: foocampo <omar.ocampo.coronado@intel.com>
>>
>> Executing strip action on kernel modules removes the signature.
>> Is not possible to strip and keep the signature, therefore avoid strip
>> signed kernel modules.
>>
>> Signed-off-by: foocampo <omar.ocampo.coronado@intel.com>
>> ---
>> meta/lib/oe/package.py | 10 ++++++++++
>> 1 file changed, 10 insertions(+)
>>
>> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py index
>> fa3428ad61..f7d2d3b7c4 100644
>> --- a/meta/lib/oe/package.py
>> +++ b/meta/lib/oe/package.py
>> @@ -24,6 +24,9 @@ def runstrip(arg):
>>
>>     # kernel module
>>     if elftype & 16:
>> +        if is_kernel_module_signed(file):
>> +            bb.debug(1, "Skip strip on signed module %s" % file)
>> +            return
>
> It does not look right to me. Above means that signed KLM will go into image with symbols. Or I don't read code correctly?
>
> Where is signature stored? Is it some kind of an ELF NOTE? In this case you would just need to drop only "--remove-section=.note"
> from strip command. Wondering why .notes were stripped in the first place.
>
>>         stripcmd.extend(["--strip-debug", "--remove-section=.comment",
>>             "--remove-section=.note", "--preserve-dates"])
>
> I suggest split above into two invocations and do second
> stripcmd.extend(["--remove-section=.note"]) only for non signed modules.
> Assuming that signature is in the .note section. If it is not .comment, do that with "--remove-section=.comment" instead.
>
>>     # .so and shared library
>> @@ -46,6 +49,13 @@ def is_kernel_module(path):
>>     with open(path) as f:
>>         return mmap.mmap(f.fileno(), 0,
>> prot=mmap.PROT_READ).find(b"vermagic=") >= 0
>>
>> +# Detect if .ko module is signed
>> +def is_kernel_module_signed(path):
>> +    with open(path, "rb") as f:
>> +        f.seek(-28, 2)
>
> Where magic -28 comes from? Is it true for all cases, all CPU arches?
> I think it could be done more cleanly here.
>
> Thanks,
> Victor
>
>> +        module_tail = f.read()
>> +        return "Module signature appended" in "".join(chr(c) for c in
>> + bytearray(module_tail))
>> +
>> # Return type (bits):
>> # 0 - not elf
>> # 1 - ELF
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

