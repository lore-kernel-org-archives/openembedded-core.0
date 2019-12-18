Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 124817FFE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 01:19:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBI1JMc3011043
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 17 Dec 2019 17:19:22 -0800
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 17 Dec 2019 17:19:21 -0800
To: Mike Crowe <mac@mcrowe.com>
References: <20191217080225.897186-1-mac@mcrowe.com>
	<0cfbd853-0ad2-e010-5ee6-6277be55db9b@windriver.com>
	<20191217135548.GA1639@mcrowe.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <983ec762-e2ad-4127-00c4-dec513486695@windriver.com>
Date: Wed, 18 Dec 2019 09:19:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20191217135548.GA1639@mcrowe.com>
X-Originating-IP: [128.224.162.184]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] multilib.conf: Ensure that RECIPE_SYSROOT is unchanged for native
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
X-List-Received-Date: Wed, 18 Dec 2019 01:19:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/2019 09:55 PM, Mike Crowe wrote:
> On Tuesday 17 December 2019 at 16:56:11 +0800, ChenQi wrote:
>> On 12/17/2019 04:02 PM, Mike Crowe via Openembedded-core wrote:
>>> Ensure that RECIPE_SYSROOT is the same for -native recipes whether
>>> multilib.conf is included or not.
>>>
>>> Without this change task signatures for -native recipes change when
>>> switching between MACHINEs that require multilib.conf and those that
>>> don't.
>>>
>>> This fix was one of the ones suggested by Khem Raj in
>>> http://lists.openembedded.org/pipermail/openembedded-core/2019-December/290303.html
>>>
>>> Add test_sstate_multilib_or_not_native_samesigs test case to
>>> sstatetests.py to ensure that this stays fixed.
>>>
>>> Signed-off-by: Mike Crowe <mac@mcrowe.com>
>>> ---
>>>    meta/conf/multilib.conf                     |  1 +
>>>    meta/lib/oeqa/selftest/cases/sstatetests.py | 40 +++++++++++++++++++++
>>>    2 files changed, 41 insertions(+)
>>>
>>> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
>>> index cfed3fbbd0..58f2ac5c86 100644
>>> --- a/meta/conf/multilib.conf
>>> +++ b/meta/conf/multilib.conf
>>> @@ -9,6 +9,7 @@ MULTILIBS ??= "multilib:lib32"
>>>    STAGING_DIR_HOST = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
>>>    STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
>>>    RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
>>> +RECIPE_SYSROOT_class-native = "${WORKDIR}/recipe-sysroot"
>> How about just removing MLPREFIX?
> I'm afraid that I don't understand what you are suggesting. The above
> change does remove MLPREFIX for -native only.
>
> Thanks.
>
> Mike.
>
I mean removing all these MLPREFIX, so that STAGING_DIR_HOST, 
STAGING_DIR_TARGET and RECIPE_SYSROOT will all be ${WORKDIR}/recipe-sysroot.

Best Regards,

Chen Qi


