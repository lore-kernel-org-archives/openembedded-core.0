Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiXG1-0004t9-JY
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 21:16:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Jan 2012 12:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92972235"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2012 12:08:58 -0800
Message-ID: <4F04B1DA.7020503@linux.intel.com>
Date: Wed, 04 Jan 2012 12:08:58 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F03FFB2.8040606@linux.intel.com>
	<20120104173930.GB32676@sakrah.homelinux.org>
	<4F04AC44.5000207@mlbassoc.com>
In-Reply-To: <4F04AC44.5000207@mlbassoc.com>
Subject: Re: Recent xserver-kdrive failure and util-macros update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2012 20:16:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2012 11:45 AM, Gary Thomas wrote:
> On 2012-01-04 10:39, Khem Raj wrote:
>> On (03/01/12 23:28), Saul Wold wrote:
>>>
>>> We seem to have a relatively new failure in xserver-kdrive, which
>>> appeared in the last set of change. I tried to run though a bisect
>>> but was not able to find the problem.
>>>
>>> The problem seems to be related to configure.ac setting of
>>> XSERVER_CFLAGS='$(CWARNFLAGS)' and then using -Werror=address, which
>>> is what causes the failure.
>>>
>>> This seems to be related to the util-macros update to 1.16, which
>>> adds more warnings to errors. Since we are still using the older
>>> xserver-kdrive, there are warnings that are now errors with the
>>> update.
>>
>> Fix xserver-kdrive
>
> In this case, I don't see why this is an error. All of the errors
> (that I've found so far) stem from lines like this:
> REGION_INIT(pGC->pScreen, &rgnDst, &box, 1);
>
Not all, the newer code has this snippet as a static inline and does not 
have the failure because it a function.

There's at least one place that it's called with a real pointer in a 
function.

Sau!

> where the macro REGION_INIT is defined as:
>
> #define REGION_INIT(_pScreen, _pReg, _rect, _size) \
> { \
> if ((_rect) != NULL) \
> { \
> (_pReg)->extents = *(_rect); \
> (_pReg)->data = (RegDataPtr)NULL; \
> } \
> else \
> { \
> (_pReg)->extents = miEmptyBox; \
> if (((_size) > 1) && ((_pReg)->data = \
> (RegDataPtr)xalloc(REGION_SZOF(_size)))) \
> { \
> (_pReg)->data->size = (_size); \
> (_pReg)->data->numRects = 0; \
> } \
> else \
> (_pReg)->data = &miEmptyData; \
> } \
> }
>
> This doesn't look like an error to me, but rather an opportunity
> (to remove never used code).
>


