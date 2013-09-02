Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D941B6BD13
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 02:00:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8220S3a027956
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Sep 2013 19:00:28 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 1 Sep 2013 19:00:27 -0700
Message-ID: <5223F118.3010007@windriver.com>
Date: Mon, 2 Sep 2013 09:59:52 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1377781793.git.liezhi.yang@windriver.com>
	<454944e7bd4c831bea934852393d8e16abe1d5ff.1377781793.git.liezhi.yang@windriver.com>
	<1377795605.1059.20.camel@ted> <521FF438.5040702@windriver.com>
	<1377876563.1059.100.camel@ted> <5221CAA0.60601@windriver.com>
	<CAP9ODKpEmUuuKs5DiozesCAsU0xCKeZGcs6soBQ=BuvB2=+iTA@mail.gmail.com>
In-Reply-To: <CAP9ODKpEmUuuKs5DiozesCAsU0xCKeZGcs6soBQ=BuvB2=+iTA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sstate.bbclass: check before open the manifest
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
X-List-Received-Date: Mon, 02 Sep 2013 02:00:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/01/2013 06:07 AM, Otavio Salvador wrote:
> On Sat, Aug 31, 2013 at 7:51 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Hi RP,
>>
>> Thanks, I've made a draft patch for fixing why make-3.82 is being built,
>> the problem is that when we run "bitbake make-3.81":
>> - For 'make' itself, it will build make_3.81.bb
>> - But for make-dev/dbg, it will build make_3.82.bb since there is no
>> PREFERRED_VERSION and it will use the highest version.
>>
>> This draft patch sets the PREFERRED_VERSION for the pkg and will fix the
>> problem, I will send it to bitbake-devel later.
>
> Nice discovery :-) This does seem to address a core issue.
>
>> diff --git a/bitbake/lib/bb/taskdata.py b/bitbake/lib/bb/taskdata.py
>> index 58fe199..fc8ee6d 100644
>> --- a/bitbake/lib/bb/taskdata.py
>> +++ b/bitbake/lib/bb/taskdata.py
>> @@ -429,6 +429,22 @@ class TaskData:
>>               return
>>
>>           all_p = dataCache.providers[item]
>> +        logger.warn("pppreferred: %s" % dataCache.preferred)
>> +
>> +        # Check whether item has the one of following formats and set the
>> +        # PREFERRED_VERSION if it does:
>> +        # - <pn>-<pv>
>> +        # - <pn>-<pv>-<pr> (when no PE)
>> +        # - <pn>_<pe>-<pv>-<pr> (when PE)
>> +        for fn in all_p:
>> +            pn = dataCache.pkg_fn[fn]
>> +            pe = dataCache.pkg_pepvpr[fn][0]
>> +            pv = dataCache.pkg_pepvpr[fn][1]
>> +            pr = dataCache.pkg_pepvpr[fn][2]
>> +            if not pe and (item == "%s-%s" % (pn, pv) or item == "%s-%s-%s"
>> % (pn, pv, pr)):
>> +                cfgData.setVar("PREFERRED_VERSION_" + pn, pv)
>> +            elif pe and item == "%s_%s-%s-%s" % (pn, pe, pv, pr):
>> +                cfgData.setVar("PREFERRED_VERSION_" + pn, pv)
>
> I understand the problem here but maybe this should be checked in
> bitbake and avoid iterate in all packages?
>

Yes, you are right, it should be sent to bitbake-devel mailing list,
and I'm trying to avoid iterating in all packages.

// Robert




