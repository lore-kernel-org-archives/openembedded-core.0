Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A49797692A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 02:17:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7B2Ho2t024107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Aug 2015 19:17:50 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 10 Aug 2015 19:17:50 -0700
Message-ID: <55C95B4C.9080505@windriver.com>
Date: Tue, 11 Aug 2015 10:17:48 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1438269391.git.liezhi.yang@windriver.com>	<50edd6dd2fa86d9a51cc54ecdaa1599a1efc5a43.1438269391.git.liezhi.yang@windriver.com>
	<CAJ86T=W=_iETkpDyVJqUD0g6xkd_xhpXf_jtUCGmXe-Mt+fjxQ@mail.gmail.com>
In-Reply-To: <CAJ86T=W=_iETkpDyVJqUD0g6xkd_xhpXf_jtUCGmXe-Mt+fjxQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] base.bbclass/blacklist.bbclass: remove doc item when d.getVarFlags()
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
X-List-Received-Date: Tue, 11 Aug 2015 02:17:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/2015 10:00 AM, Andre McCurdy wrote:
> On Thu, Jul 30, 2015 at 8:18 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> The FOO[doc] is set in meta/conf/documentation.conf, we need remove it
>> from d.getVarFlags()'s return dict when it causes many loops.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/base.bbclass      |    2 ++
>>   meta/classes/blacklist.bbclass |    2 ++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index b7e22ad..9e33f44 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -336,6 +336,8 @@ python () {
>>       # PACKAGECONFIG ??= "<default options>"
>>       # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
>>       pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
>> +    # Remove PACKAGECONFIG[doc]
>> +    pkgconfigflags.pop('doc', None)
>
> This change breaks recipes which try to use 'doc' as a PACKAGECONFIG
> option. Nothing in oe-core tries to do that, but there are recipes in
> other layers which do (e.g. efl in meta-oe and lxc in
> meta-virtualization).
>
> Could this change we reworked somehow to allow 'doc' to continue to be
> used as a PACKAGECONFIG option (as it is in fido)?

Hi Andre,

I'm afraid that there isn't any other way to fix the issue (many
unneeded loops caused by PACKAGECONFIG[doc] which is set by
documentation.conf), maybe you can change 'doc' to such as 'docs' in
other layers ?

// Robert

>
>
>>       if pkgconfigflags:
>>           pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
>>           pn = d.getVar("PN", True)
>> diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
>> index a0141a8..39b3f82 100644
>> --- a/meta/classes/blacklist.bbclass
>> +++ b/meta/classes/blacklist.bbclass
>> @@ -28,6 +28,8 @@ python blacklist_multilib_eventhandler() {
>>               prefixes.append(eext[1])
>>
>>       blacklists = e.data.getVarFlags('PNBLACKLIST') or {}
>> +    # Remove PNBLACKLIST[doc]
>> +    blacklists.pop('doc', None)
>>       for pkg, reason in blacklists.items():
>>           if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in pkg:
>>               continue
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

