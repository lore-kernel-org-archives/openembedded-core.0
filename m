Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1D46BD18
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2013 10:51:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7VApijR012730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 31 Aug 2013 03:51:45 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 31 Aug 2013 03:51:44 -0700
Message-ID: <5221CAA0.60601@windriver.com>
Date: Sat, 31 Aug 2013 18:51:12 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1377781793.git.liezhi.yang@windriver.com>
	<454944e7bd4c831bea934852393d8e16abe1d5ff.1377781793.git.liezhi.yang@windriver.com>
	<1377795605.1059.20.camel@ted> <521FF438.5040702@windriver.com>
	<1377876563.1059.100.camel@ted>
In-Reply-To: <1377876563.1059.100.camel@ted>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sat, 31 Aug 2013 10:51:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi RP,

Thanks, I've made a draft patch for fixing why make-3.82 is being built,
the problem is that when we run "bitbake make-3.81":
- For 'make' itself, it will build make_3.81.bb
- But for make-dev/dbg, it will build make_3.82.bb since there is no
PREFERRED_VERSION and it will use the highest version.

This draft patch sets the PREFERRED_VERSION for the pkg and will fix the
problem, I will send it to bitbake-devel later.

diff --git a/bitbake/lib/bb/taskdata.py b/bitbake/lib/bb/taskdata.py
index 58fe199..fc8ee6d 100644
--- a/bitbake/lib/bb/taskdata.py
+++ b/bitbake/lib/bb/taskdata.py
@@ -429,6 +429,22 @@ class TaskData:
              return

          all_p = dataCache.providers[item]
+        logger.warn("pppreferred: %s" % dataCache.preferred)
+
+        # Check whether item has the one of following formats and set the
+        # PREFERRED_VERSION if it does:
+        # - <pn>-<pv>
+        # - <pn>-<pv>-<pr> (when no PE)
+        # - <pn>_<pe>-<pv>-<pr> (when PE)
+        for fn in all_p:
+            pn = dataCache.pkg_fn[fn]
+            pe = dataCache.pkg_pepvpr[fn][0]
+            pv = dataCache.pkg_pepvpr[fn][1]
+            pr = dataCache.pkg_pepvpr[fn][2]
+            if not pe and (item == "%s-%s" % (pn, pv) or item == "%s-%s-%s" % 
(pn, pv, pr)):
+                cfgData.setVar("PREFERRED_VERSION_" + pn, pv)
+            elif pe and item == "%s_%s-%s-%s" % (pn, pe, pv, pr):
+                cfgData.setVar("PREFERRED_VERSION_" + pn, pv)

          eligible, foundUnique = bb.providers.filterProviders(all_p, item, 
cfgData, dataCache)
          eligible = [p for p in eligible if not self.getfn_id(p) in 
self.failed_fnids]

// Robert

On 08/30/2013 11:29 PM, Richard Purdie wrote:
> On Fri, 2013-08-30 at 09:24 +0800, Robert Yang wrote:
>>
>> On 08/30/2013 01:00 AM, Richard Purdie wrote:
>>> On Thu, 2013-08-29 at 09:13 -0400, Robert Yang wrote:
>>>> The python stack trace would be printed if we:
>>>>
>>>> $ bitbake make (the make-3.82 will be built)
>>>> // Edit make.inc
>>>> $ bitbake make-3.81
>>>
>>> This is at best hiding the real problem. Why is bitbake building
>>> make-3.82 when you asked for make-3.81?
>>>
>>> I tried this here and also see the warning:
>>>
>>> ERROR: Multiple .bb files are due to be built which each provide make
>>> (/media/build1/poky/meta/recipes-devtools/make/make_3.81.bb /media/build1/poky/meta/recipes-devtools/make/make_3.82.bb).
>>>    This usually means one provides something the other doesn't and should.
>>>
>>> so bitbake is basically telling you there is a problem already. So there
>>> are two issues:
>>>
>>
>> What I thought was that let the user know the normal error, but we can do
>> more to fix it as you pointed out.
>>
>>> a) Why is make 3.82 being built?
>>
>> Ah, yes, that's problem, I will do more investigation.
>>
>>> b) If multiple identical PNs are being built we probably should hard
>>> error out since its not supported in the slightest. The sstate race you
>>> mention is the least of the problems :(.
>>>
>>
>> OK, I will try to fix such a case:
>>
>> bitbake make-3.81 make-3.82
>
> I think this should just give an error.
>
> Cheers,
>
> Richard
>
>
>

