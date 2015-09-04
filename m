Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4D277050
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 20:19:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 04 Sep 2015 13:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,470,1437462000"; d="scan'208";a="782915432"
Received: from afshjern.zpn.intel.com (HELO [10.219.26.82]) ([10.219.26.82])
	by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2015 13:19:57 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <1441317404-6663-1-git-send-email-alejandro.franco@linux.intel.com>
	<1441351029.9573.47.camel@intel.com>
From: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <55E9FD10.6010403@linux.intel.com>
Date: Fri, 4 Sep 2015 15:20:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1441351029.9573.47.camel@intel.com>
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv4] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Fri, 04 Sep 2015 20:20:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I agree these operations should take place after those checks.

Alex

On 09/04/2015 02:17 AM, Patrick Ohly wrote:
> On Thu, 2015-09-03 at 16:56 -0500, Alex Franco wrote:
>> Removing recursive option from chmod -st on BUILDDIR as it would
>> take very long on existing build directories
> Okay, so this *is* a problem others are also seeing ;-}
>
>> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
>> index f5b7e4e..91bd86b 100755
>> --- a/scripts/oe-setup-builddir
>> +++ b/scripts/oe-setup-builddir
>> @@ -24,7 +24,10 @@ if [ -z "$BUILDDIR" ]; then
>>   fi
>>   
>>   mkdir -p "$BUILDDIR/conf"
>> -chmod -R -st "$BUILDDIR"
>> +
>> +# Attempting removal of sticky,setuid bits from BUILDDIR, BUILDDIR/conf
>> +chmod -st "$BUILDDIR" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR"
>> +chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR/conf"
>>   
>>   if [ ! -d "$BUILDDIR" ]; then
>>       echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
> What was the reasoning behind adding these operations on $BUILDDIR/conf
> before the check whether BUILDDIR exists and is a directory? Looks a bit
> fishy to me.
>


