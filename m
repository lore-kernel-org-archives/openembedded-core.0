Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8278260EE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 02:47:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9H2lxNA025250
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Oct 2013 19:47:59 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 16 Oct 2013 19:47:59 -0700
Message-ID: <525F5002.6050404@windriver.com>
Date: Thu, 17 Oct 2013 10:48:34 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Randy MacLeod <randy.macleod@windriver.com>
References: <cover.1380172958.git.Qi.Chen@windriver.com>	<d46d403192a73aaf1a5d61aefb890dcc03e41b25.1380172958.git.Qi.Chen@windriver.com>	<345142465.cI7Ru9Zzi7@helios>
	<524B062E.7010901@windriver.com> <525D9E59.6010107@windriver.com>
In-Reply-To: <525D9E59.6010107@windriver.com>
X-Originating-IP: [128.224.162.213]
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] buildhistory.bbclass: always record PKG, PKGE, PKGV and PKGR
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
X-List-Received-Date: Thu, 17 Oct 2013 02:47:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/2013 03:58 AM, Randy MacLeod wrote:
> On 13-10-01 01:28 PM, Mark Hatle wrote:
>> On 9/30/13 11:26 AM, Paul Eggleton wrote:
>>> On Thursday 26 September 2013 13:23:32 Qi.Chen@windriver.com wrote:
>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>
>>>> The buildhistory.bbclass always records PV instead of PKGV. However,
>>>> the buildhistory-diff script treats PKGV as a monitored variable
>>>> instead of PV.
>>>>
>>>> If a recipe's PV changes, for example, hello_1.0.bb is renamed to
>>>> hello_2.0.bb, then buildhistory-diff reports nothing because PV is
>>>> not monitored and PKGV is not recorded.
>>>>
>>>> So the buildhistory.bbclass should always record PKGV no matter it
>>>> equals to PV or not.
>>>>
>>>> The same logic applies to PKG, PKGE and PKGR.
>>>>
>>>> [YOCTO #5263]
>>>>
>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> ---
>>>>   meta/classes/buildhistory.bbclass |    8 ++++----
>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/meta/classes/buildhistory.bbclass
>>>> b/meta/classes/buildhistory.bbclass index 3da03c8..cea917c 100644
>>>> --- a/meta/classes/buildhistory.bbclass
>>>> +++ b/meta/classes/buildhistory.bbclass
>>>> @@ -277,10 +277,10 @@ def write_pkghistory(pkginfo, d):
>>>>           f.write("PR = %s\n" %  pkginfo.pr)
>>>>
>>>>           pkgvars = {}
>>>> -        pkgvars['PKG'] = pkginfo.pkg if pkginfo.pkg != pkginfo.name
>>>> else ''
>>>> -        pkgvars['PKGE'] = pkginfo.pkge if pkginfo.pkge != pkginfo.pe
>>>> else
>>>> '' -        pkgvars['PKGV'] = pkginfo.pkgv if pkginfo.pkgv != 
>>>> pkginfo.pv
>>>> else '' -        pkgvars['PKGR'] = pkginfo.pkgr if pkginfo.pkgr !=
>>>> pkginfo.pr else '' +        pkgvars['PKG'] = pkginfo.pkg
>>>> +        pkgvars['PKGE'] = pkginfo.pkge
>>>> +        pkgvars['PKGV'] = pkginfo.pkgv
>>>> +        pkgvars['PKGR'] = pkginfo.pkgr
>>>>           for pkgvar in pkgvars:
>>>>               val = pkgvars[pkgvar]
>>>>               if val:
>>>
>>> Please see my comment on the bug (just added):
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5263
>>
>> Already added to the bug, but here so people not watching the bug can 
>> see:
>>
>> I believe this change is requested because otherwise there is no way to
>> detect a package upgrade/uprev when using buildhistory.  This type of
>> upgrade can happy when comparing no-GPLv3 and GPLv3 builds -- or just
>> simple software updates when a layer gets updated.
>>
>> We want to use the buildhistory from one build to the next to look for
>> changes that have occurred that may be unexpected.
>>
>> --Mark
>
> Paul,
> Any comments?
> Qi replied to your comment in bugzilla.
>
> Qi,
> Perhaps you need to post an example showing how this change
> helps for a package upgrade and compare it to what happens when
> the patch is not applied.
>
> // Randy
>
>
Hi All,

Use the following steps to test the buildhistory.

1. bitbake chown-example
2. mv ../meta-local/recipes-core/chown-example/chown-example_1.0.bb 
../meta-local/recipes-core/chown-example/chown-example_2.0.bb
3. bitbake chown-example
4. buildhistory-diff

Testing Result
-------------------
*) Without the patch
    <No Output for buildhistory-diff>
*) With the patch
<Below is the output.>
chenqi@pek-qchen1-u12u4:~/poky/build$ buildhistory-diff
packages/i586-poky-linux/chown-example/chown-example-dbg: PKGV changed 
from 1.0 to 2.0
   * PV changed from "1.0" to "2.0"
packages/i586-poky-linux/chown-example/chown-example-dev: PKGV changed 
from 1.0 to 2.0
   * PV changed from "1.0" to "2.0"
packages/i586-poky-linux/chown-example/chown-example-doc: PKGV changed 
from 1.0 to 2.0
   * PV changed from "1.0" to "2.0"
packages/i586-poky-linux/chown-example/chown-example-locale: PKGV 
changed from 1.0 to 2.0
   * PV changed from "1.0" to "2.0"
packages/i586-poky-linux/chown-example/chown-example-staticdev: PKGV 
changed from 1.0 to 2.0
   * PV changed from "1.0" to "2.0"
packages/i586-poky-linux/chown-example/chown-example: PKGV changed from 
1.0 to 2.0
   * PV changed from "1.0" to "2.0"

Best Regards,
Chen Qi

>>
>>> Cheers,
>>> Paul
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>
>


