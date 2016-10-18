Return-Path: <vesa.jaaskelainen@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6ECC06E666
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 12:56:24 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CwBgB/GwZY/+EBGKxcHAEBBAEBCgEBgzwBAQEBAXQqUqQ6lDiCCCyFdgKCOBIBAgEBAQEBAQGBBYRiAQEEIw8BBVEJAhgCAiYCAlcTBgIBAYhcmEWdMYxoAQEIAQEBASSBB4czCIJQhGUugjiCWwWPM4pThiiTRYYMiSmDUoQAJQiFaW8BAYhUAQEB
X-IPAS-Result: A2CwBgB/GwZY/+EBGKxcHAEBBAEBCgEBgzwBAQEBAXQqUqQ6lDiCCCyFdgKCOBIBAgEBAQEBAQGBBYRiAQEEIw8BBVEJAhgCAiYCAlcTBgIBAYhcmEWdMYxoAQEIAQEBASSBB4czCIJQhGUugjiCWwWPM4pThiiTRYYMiSmDUoQAJQiFaW8BAYhUAQEB
X-IronPort-AV: E=Sophos;i="5.31,362,1473109200"; d="scan'208";a="32264815"
Received: from hel-smtp.corp.vaisala.com ([172.24.1.225])
	by hel-mailgw-01.vaisala.com with ESMTP; 18 Oct 2016 15:56:25 +0300
Received: from [172.24.65.135] ([172.24.65.135]) by HEL-SMTP.corp.vaisala.com
	over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384);
	Tue, 18 Oct 2016 15:56:24 +0300
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>
To: openembedded-core@lists.openembedded.org
References: <35a67fa817544a4fa1a59f5ceef6b8db@HEL-EXCH-02.corp.vaisala.com>
	<CA+aJhH16Z9trr9TgQfd1S8sVRorLcJds1Wrrf6vDWTYF8bf2FQ@mail.gmail.com>
Message-ID: <f16484e1-ffb3-0102-fab6-01c0572a2b02@vaisala.com>
Date: Tue, 18 Oct 2016 15:56:24 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+aJhH16Z9trr9TgQfd1S8sVRorLcJds1Wrrf6vDWTYF8bf2FQ@mail.gmail.com>
X-OriginalArrivalTime: 18 Oct 2016 12:56:24.0940 (UTC)
	FILETIME=[087F3AC0:01D2293F]
Subject: Re: Two kmeta's not allowed for master?
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
X-List-Received-Date: Tue, 18 Oct 2016 12:56:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2016-10-11 16:38, Nathan Rossi wrote:
> On Tue, Oct 11, 2016 at 11:15 PM,  <vesa.jaaskelainen@vaisala.com> wrote:
>> Hi,
>>
>> I was trying out how well 'master' branch compiles in our environment.
>>
>> We are using meta-xilinx and then we have custom BSP layer which bbappends linux-xlnx.
>>
>> When using meta-xilinx as standalone (w/o our BSP layer) I can get it tocompile.
>>
>> However when using it with combo meta-xilinx and our BSP we get failure on do_kernel_metadata due to missing scc files.
>>
>> It seems that there can no longer be two kmeta entries in SRC_URI.
>>
>> meta-xilinx's linux-xlnx.inc has:
>> file://xilinx-base;type=kmeta;destsuffix=xilinx-base
> linux-xlnx has multiple kmeta sources. The one you mention here:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/recipes-kernel/linux/linux-xlnx.inc#n13
>
> And two more (added by a separate include):
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/recipes-kernel/linux/linux-xilinx-configs.inc#n8
>
> So I don't think this is an issue due to the number of type=kmeta sources.
>
> Regards,
> Nathan
>
>> our bbappend has:
>> file://meta;type=kmeta;destsuffix=meta
>>
>> In krogoth this works fine.
>>
>> Is this expected change?

I had to remove 'meta' from paths in KERNEL_FEATURES:

-KERNEL_FEATURES_append += "meta/cfg/net/netfilter.scc"
+KERNEL_FEATURES_append += "cfg/net/netfilter.scc"

After this it seems to compile nicely with master.

Thanks,
Vesa Jääskeläinen

