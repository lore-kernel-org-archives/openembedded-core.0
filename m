Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A3736B7CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 03:28:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAD3S63e021664
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Nov 2014 19:28:07 -0800 (PST)
Received: from [128.224.163.132] (128.224.163.132) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 12 Nov 2014 19:28:06 -0800
Message-ID: <54642543.9010709@windriver.com>
Date: Thu, 13 Nov 2014 11:28:03 +0800
From: zhangxiao <xiao.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Peter A. Bigot" <pab@pabigot.com>
References: <1414861479-5493-1-git-send-email-pab@pabigot.com>
	<1414861479-5493-3-git-send-email-pab@pabigot.com>
	<54630E02.3070500@windriver.com> <5463413B.3050902@pabigot.com>
	<54641802.6070509@windriver.com> <54641FD1.5070108@pabigot.com>
In-Reply-To: <54641FD1.5070108@pabigot.com>
X-Originating-IP: [128.224.163.132]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] pseudo: provide fallback passwd and group files
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
X-List-Received-Date: Thu, 13 Nov 2014 03:28:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年11月13日 11:04, Peter A. Bigot wrote:
> On 11/12/2014 08:31 PM, zhangxiao wrote:
>> On 2014年11月12日 19:15, Peter A. Bigot wrote:
>>> On 11/12/2014 01:36 AM, zhangxiao wrote:
>>>> On 2014年11月02日 01:04, Peter A. Bigot wrote:
>>>>> Normally pseudo is built with --without-passwd-fallback, which
>>>>> requires
>>>>> that somebody provide target passwd and group files.  Those come from
>>>>> base-passwd in OE, but base-passwd cannot be built without first
>>>>> invoking operations under pseudo that require getpw*/getgr*.
>>>>>
>>>>> Provide the absolute minimum stub files, matching in content what will
>>>>> eventually be on the target, that can be used in the cases where the
>>>>> target files are not yet available.  The requirements for minimum stub
>>>>> are the usernames and groups identified in meta/files/fs-perms.txt.
>>>>>
>>>>> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
>>>>> ---
>>>>>   meta/recipes-devtools/pseudo/files/fallback-group  | 2 ++
>>>>>   meta/recipes-devtools/pseudo/files/fallback-passwd | 1 +
>>>>>   meta/recipes-devtools/pseudo/pseudo_1.6.2.bb       | 8 ++++++++
>>>>>   3 files changed, 11 insertions(+)
>>>>>   create mode 100644 meta/recipes-devtools/pseudo/files/fallback-group
>>>>>   create mode 100644
>>>>> meta/recipes-devtools/pseudo/files/fallback-passwd
>>>>>
>>>>> diff --git a/meta/recipes-devtools/pseudo/files/fallback-group
>>>>> b/meta/recipes-devtools/pseudo/files/fallback-group
>>>>> new file mode 100644
>>>>> index 0000000..81bf732
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-devtools/pseudo/files/fallback-group
>>>>> @@ -0,0 +1,2 @@
>>>>> +root:*:0:
>>>>
>>>> How about adding those two lines below?
>>>>
>>>> daemon:*:1:
>>>> bin:*:2:
>>>
>>> What's the rationale for adding these?
>>>
>>> My intent is for pseudo to provide the absolute minimum required for the
>>> default fs-perms.txt, not to attempt to provide everything that's in
>>> base-passwd.  If you override fs-perms.txt somehow and need those extra
>>> groups in early build stages, I think the right approach is to also
>>> provide your own fallback-group and fallback-passwd at the same time.
>>>
>>> If too much gets added to these fallback specifications, we're back in
>>> the same position of getting target files that don't match the
>>> configuration used during build/packaging.  In most cases, adding
>>> DEPENDS += "base-passwd" is going to be the right approach to things not
>>> being in the fallback files.
>>>
>> In fact, that is the reason I want those two lines above. I know it is
>> not
>> nice. :-(
>>
>> From my point of view, base-files and base-passwd is so important and
>> basic
>> that they should be installed at very beginning. Almost all packages
>> should
>> R-depends on them, so can we find a method to install them at very
>> beginning
>> thus avoid adding "DEPENDS" in those bb files?
>
> I agree in theory, but I tried pretty hard and couldn't make it work,
> for reasons (circular dependencies) described in the 0/3 that introduced
> this series.  I think the current solution is very clean.  Either an
> explicit DEPENDS in a few recipes that reference groups daemon and bin
> or an override of the fallback files in one of your layers (or by
> setting a custom PSEUDO_PASSWD in the recipes that needs them) would
> probably solve your problem,  but I don't have enough information about
> the context to be completely sure of that.
>

I believe your patches are valuable and necessary. They can avoid host
contamination on the pseudo level.

For several years, there are so many packages and recipes in OE-core, and
maybe more packages in customized layers. Detect and fix them one by
one will be very painful. :-(

Anyway, thank you!

BRs
Xiao

> Peter
>
>>
>> Thanks
>> Xiao
>>
>>> Peter
>>>
>>>>
>>>> Thanks
>>>> Xiao
>>>>
>>>>> +mail:*:8:
>>>>> diff --git a/meta/recipes-devtools/pseudo/files/fallback-passwd
>>>>> b/meta/recipes-devtools/pseudo/files/fallback-passwd
>>>>> new file mode 100644
>>>>> index 0000000..c1458dc
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-devtools/pseudo/files/fallback-passwd
>>>>> @@ -0,0 +1 @@
>>>>> +root::0:0:root:/home/root:/bin/sh
>>>>> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
>>>>> b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
>>>>> index fb85f89..95fd2b8 100644
>>>>> --- a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
>>>>> +++ b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
>>>>> @@ -5,9 +5,17 @@ SRC_URI = " \
>>>>> file://0001-pseudo_client.c-protect-pwd_lck-against-magic.patch \
>>>>> file://0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch \
>>>>> file://0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch
>>>>> \
>>>>> +    file://fallback-passwd \
>>>>> +    file://fallback-group \
>>>>>   "
>>>>>
>>>>>   SRC_URI[md5sum] = "4d7b4f9d1b4aafa680ce94a5a9a52f1f"
>>>>>   SRC_URI[sha256sum] =
>>>>> "c72be92689511ced7c419149c6aaa1b1a9e4dfc6409d1f16ab72cc35bc1e376a"
>>>>>
>>>>>   PSEUDO_EXTRA_OPTS ?= "--enable-force-async
>>>>> --without-passwd-fallback"
>>>>> +
>>>>> +do_install_append_class-native () {
>>>>> +    install -d ${D}${sysconfdir}
>>>>> +    install -m 644 ${WORKDIR}/fallback-passwd
>>>>> ${D}${sysconfdir}/passwd
>>>>> +    install -m 644 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
>>>>> +}
>>>>>
>>>
>>>
>>>
>
>
>

