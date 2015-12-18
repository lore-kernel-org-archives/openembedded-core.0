Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D08C1731A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:39:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 18 Dec 2015 04:39:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="874240756"
Received: from lleszczu-mobl.igk.intel.com (HELO [10.252.17.67])
	([10.252.17.67])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2015 04:39:13 -0800
User-Agent: Microsoft-MacOutlook/0.0.0.151105
Date: Fri, 18 Dec 2015 14:39:12 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <19CCFDE4-E8FC-4B6A-BFD4-BCB6E14922C8@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 2/5] kernel.bbclass: copy .config instead of
	moving
References: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1450427985-12504-3-git-send-email-markus.lehtonen@linux.intel.com>
	<1450441360.8461.37.camel@linuxfoundation.org>
In-Reply-To: <1450441360.8461.37.camel@linuxfoundation.org>
Mime-version: 1.0
Subject: Re: [PATCH 2/5] kernel.bbclass: copy .config instead of moving
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
X-List-Received-Date: Fri, 18 Dec 2015 12:39:15 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

Hi Richard,



On 18/12/15 14:22, "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

>On Fri, 2015-12-18 at 10:39 +0200, Markus Lehtonen wrote:
>> Copy kernel .config from ${S} to ${B}, instead of moving it. This
>> prevents mangling the source tree, which is undesirable e.g. when
>> externalsrc is used.
>> 
>> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>> ---
>>  meta/classes/kernel.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/meta/classes/kernel.bbclass
>> b/meta/classes/kernel.bbclass
>> index 4ce1611..7de9f20 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -338,7 +338,7 @@ kernel_do_configure() {
>>  	touch ${B}/.scmversion ${S}/.scmversion
>>  
>>  	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f
>> "${B}/.config" ]; then
>> -		mv "${S}/.config" "${B}/.config"
>> +		cp "${S}/.config" "${B}/.config"
>>  	fi
>>  
>>  	# Copy defconfig to .config if .config does not exist. This
>> allows
>
>I'm not sure about this, doesn't this trigger the kernel to see ${S} as
>being 'dirty' and cause other issues when you try and do out of tree
>builds with it?

That shouldn't be a problem as the kernel .gitignore ignores .config (or '.*' to be more specific). There are other tasks that make changes to the kernel source tree, as well, like do_kernel_metadata.


>It also means we have two copies of "config" around which can end up
>being different and confuse users no end :(.

Yes, I must agree. What do you think if ${B}/.config would be a symlink to ${S}/.config? I.e.
+               ln -s "${S}/.config" "${B}/.config"




Thanks,
  Markus




