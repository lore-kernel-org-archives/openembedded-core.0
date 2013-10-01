Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2428A6007B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 17:28:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r91HSGOV027394
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Oct 2013 10:28:16 -0700 (PDT)
Received: from msp-dhcp16.wrs.com (172.25.34.16) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 1 Oct 2013 10:28:14 -0700
Message-ID: <524B062E.7010901@windriver.com>
Date: Tue, 1 Oct 2013 12:28:14 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1380172958.git.Qi.Chen@windriver.com>
	<d46d403192a73aaf1a5d61aefb890dcc03e41b25.1380172958.git.Qi.Chen@windriver.com>
	<345142465.cI7Ru9Zzi7@helios>
In-Reply-To: <345142465.cI7Ru9Zzi7@helios>
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
X-List-Received-Date: Tue, 01 Oct 2013 17:28:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/13 11:26 AM, Paul Eggleton wrote:
> On Thursday 26 September 2013 13:23:32 Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> The buildhistory.bbclass always records PV instead of PKGV. However,
>> the buildhistory-diff script treats PKGV as a monitored variable
>> instead of PV.
>>
>> If a recipe's PV changes, for example, hello_1.0.bb is renamed to
>> hello_2.0.bb, then buildhistory-diff reports nothing because PV is
>> not monitored and PKGV is not recorded.
>>
>> So the buildhistory.bbclass should always record PKGV no matter it
>> equals to PV or not.
>>
>> The same logic applies to PKG, PKGE and PKGR.
>>
>> [YOCTO #5263]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/buildhistory.bbclass |    8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/buildhistory.bbclass
>> b/meta/classes/buildhistory.bbclass index 3da03c8..cea917c 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -277,10 +277,10 @@ def write_pkghistory(pkginfo, d):
>>           f.write("PR = %s\n" %  pkginfo.pr)
>>
>>           pkgvars = {}
>> -        pkgvars['PKG'] = pkginfo.pkg if pkginfo.pkg != pkginfo.name else ''
>> -        pkgvars['PKGE'] = pkginfo.pkge if pkginfo.pkge != pkginfo.pe else
>> '' -        pkgvars['PKGV'] = pkginfo.pkgv if pkginfo.pkgv != pkginfo.pv
>> else '' -        pkgvars['PKGR'] = pkginfo.pkgr if pkginfo.pkgr !=
>> pkginfo.pr else '' +        pkgvars['PKG'] = pkginfo.pkg
>> +        pkgvars['PKGE'] = pkginfo.pkge
>> +        pkgvars['PKGV'] = pkginfo.pkgv
>> +        pkgvars['PKGR'] = pkginfo.pkgr
>>           for pkgvar in pkgvars:
>>               val = pkgvars[pkgvar]
>>               if val:
>
> Please see my comment on the bug (just added):
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5263

Already added to the bug, but here so people not watching the bug can see:

I believe this change is requested because otherwise there is no way to detect a 
package upgrade/uprev when using buildhistory.  This type of upgrade can happy 
when comparing no-GPLv3 and GPLv3 builds -- or just simple software updates when 
a layer gets updated.

We want to use the buildhistory from one build to the next to look for changes 
that have occurred that may be unexpected.

--Mark

> Cheers,
> Paul
>


