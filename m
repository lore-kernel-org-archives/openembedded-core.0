Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RiWt3-0003uK-I7
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 20:52:39 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B6D00F81288; Wed,  4 Jan 2012 12:45:16 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 489D5F81287;
	Wed,  4 Jan 2012 12:45:08 -0700 (MST)
Message-ID: <4F04AC44.5000207@mlbassoc.com>
Date: Wed, 04 Jan 2012 12:45:08 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F03FFB2.8040606@linux.intel.com>
	<20120104173930.GB32676@sakrah.homelinux.org>
In-Reply-To: <20120104173930.GB32676@sakrah.homelinux.org>
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
X-List-Received-Date: Wed, 04 Jan 2012 19:52:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-01-04 10:39, Khem Raj wrote:
> On (03/01/12 23:28), Saul Wold wrote:
>>
>> We seem to have a relatively new failure in xserver-kdrive, which
>> appeared in the last set of change.  I tried to run though a bisect
>> but was not able to find the problem.
>>
>> The problem seems to be related to configure.ac setting of
>> XSERVER_CFLAGS='$(CWARNFLAGS)' and then using -Werror=address, which
>> is what causes the failure.
>>
>> This seems to be related to the util-macros update to 1.16, which
>> adds more warnings to errors.  Since we are still using the older
>> xserver-kdrive, there are warnings that are now errors with the
>> update.
>
> Fix xserver-kdrive

In this case, I don't see why this is an error.  All of the errors
(that I've found so far) stem from lines like this:
	REGION_INIT(pGC->pScreen, &rgnDst, &box, 1);

where the macro REGION_INIT is defined as:

#define REGION_INIT(_pScreen, _pReg, _rect, _size) \
{ \
     if ((_rect) != NULL)				\
     { \
         (_pReg)->extents = *(_rect); \
         (_pReg)->data = (RegDataPtr)NULL; \
     } \
     else \
     { \
         (_pReg)->extents = miEmptyBox; \
         if (((_size) > 1) && ((_pReg)->data = \
                              (RegDataPtr)xalloc(REGION_SZOF(_size)))) \
         { \
             (_pReg)->data->size = (_size); \
             (_pReg)->data->numRects = 0; \
         } \
         else \
             (_pReg)->data = &miEmptyData; \
     } \
  }

This doesn't look like an error to me, but rather an opportunity
(to remove never used code).

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


