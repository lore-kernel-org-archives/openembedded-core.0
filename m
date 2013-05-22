Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2424C6065C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 00:43:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2013 17:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,717,1363158000"; d="scan'208";a="317452655"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by orsmga001.jf.intel.com with ESMTP; 21 May 2013 17:43:22 -0700
Message-ID: <519C14AA.2040604@linux.intel.com>
Date: Tue, 21 May 2013 17:43:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <1369180475-31178-1-git-send-email-sgw@linux.intel.com>
	<519C0F5E.8050807@windriver.com> <519C1005.6000205@windriver.com>
In-Reply-To: <519C1005.6000205@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] patch: diable xattr as default
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
X-List-Received-Date: Wed, 22 May 2013 00:43:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2013 05:23 PM, Mark Hatle wrote:
> On 5/21/13 7:20 PM, Mark Hatle wrote:
>> On 5/21/13 6:54 PM, Saul Wold wrote:
>>> There is a optional dependency on xattr (and thus the attr package),
>>> disable it by default, to ensure it builds correctly.
>>>
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> ---
>>>    meta/recipes-devtools/patch/patch_2.7.1.bb |    2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/patch/patch_2.7.1.bb
>>> b/meta/recipes-devtools/patch/patch_2.7.1.bb
>>> index 38df034..b131204 100644
>>> --- a/meta/recipes-devtools/patch/patch_2.7.1.bb
>>> +++ b/meta/recipes-devtools/patch/patch_2.7.1.bb
>>> @@ -9,3 +9,5 @@ SRC_URI[sha256sum] =
>>> "c05f28668c3474bc63adcd48abae921d15e71c254fbebdbaeda40456d6
>>>    LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>>
>>>    acpaths = "-I ${S}/m4 "
>>> +
>>> +EXTRA_OECONF += "--disable-xattr"
>>
>> There is an xattr distro feature.  It would be better to use:
>>
>> ENABLE_XATTR = "${@base_contains('DISTRO_FEATURES', 'xattr',
>> '--enable-xattr',
>> '--disable-xattr', d)}"
>>
>> EXTRA_OECONF += "${ENABLE_XATTR}"
>>
>> (Might need a -native/-nativesdk version?)
>
> I forgot, PACKAGECONFIG might be better to use....  then the attr
> package dependencies can more easily be added.
>
> PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'xattr', 'xattr',
> '', d)}"
> PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
>

Yup, this is more correct and slap my hand for forgetting the xattr 
DISTO_FEATURE!

V2 coming after some tests.

Sau!

> --Mark
>
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

