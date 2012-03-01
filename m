Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S38Qj-0002Ht-PW
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 17:00:34 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 9BF59F812EF; Thu,  1 Mar 2012 08:52:02 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 44A96F812EE;
	Thu,  1 Mar 2012 08:52:01 -0700 (MST)
Message-ID: <4F4F9B21.3000407@mlbassoc.com>
Date: Thu, 01 Mar 2012 08:52:01 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1330612994-26329-1-git-send-email-gary@mlbassoc.com>
	<1330613948.31767.12.camel@ted> <4F4F918B.4010404@mlbassoc.com>
	<4F4F9552.8040107@mlbassoc.com> <1330616672.31767.23.camel@ted>
In-Reply-To: <1330616672.31767.23.camel@ted>
Subject: Re: [PATCH] initscripts: Properly handle new timestamp format
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
X-List-Received-Date: Thu, 01 Mar 2012 16:00:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-01 08:44, Richard Purdie wrote:
> On Thu, 2012-03-01 at 08:27 -0700, Gary Thomas wrote:
>> On 2012-03-01 08:11, Gary Thomas wrote:
>>> On 2012-03-01 07:59, Richard Purdie wrote:
>>>> On Thu, 2012-03-01 at 07:43 -0700, Gary Thomas wrote:
>>>>> Recent changes have attempted to make consistant use of /etc/timestamp
>>>>> In particular
>>>>> 5aab665 initscripts: Make /etc/timestamp consistent again.
>>>>> 173a48f image.bbclass: Ensure timestamp matches format used in initscripts after recent changes
>>>>>
>>>>> This new format can cause problems as the value is too large for
>>>>> most [32 bit] machines. Work around this by only comparing the
>>>>> YYYYMMDD portion (which does fit in 32 bits). Also, the new format
>>>>> is not directly compatible with the 'date' command line, so it
>>>>> must be reformatted for use.
>>>>>
>>>>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>
>>>>> ---
>>>>> .../initscripts/initscripts-1.0/bootmisc.sh | 4 ++--
>>>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> I merged the changes to busybox in relation to this. Is this patch still
>>>> needed?
>>>
>>> Let me check - I didn't see the related busybox change.
>>>
>>
>> I missed the busybox change because there was no PR bump :-(
>>
>> The problem with the change turning off CONFIG_FEATURE_DATE_COMPAT is that
>> now 'date' from busybox works one way and 'date' from coreutils works another.
>>
>> Using coreutils:
>>
>> root@cobra8148p81:~# date 201203011520
>> date: invalid date `201203011520'
>> root@cobra8148p81:~# date 030115202012
>> Thu Mar  1 15:20:00 UTC 2012
>> root@cobra8148p81:~# ls -l /bin/date
>> lrwxrwxrwx 1 root root 14 Mar  1 15:14 /bin/date ->  date.coreutils
>>
>> Using busybox:
>>
>> root@cobra8148p81:~# ln -s /bin/busybox /tmp/date
>> root@cobra8148p81:~# /tmp/date 201203011520
>> Thu Mar  1 15:20:00 UTC 2012
>>
>> I think the best thing would be to turn CONFIG_FEATURE_DATE_COMPAT back
>> on along with my reformatting change.
>>
>> I can make an updated patch if you agree.
>
> Is this going to cause us a problem in real world usage? I'd hope in the
> general case we use standard formatting?
>
> I have to admit I'm getting more than a little frustrated with what
> seems like a continual set of changes bouncing this format around in
> different directions :(.

I agree and I'm sorry I missed this in my first change - I was just
trying to make the time stamps be consistent.

As far as I can recall (which is a really long time), 'date' has always
wanted the format MMDDHHmm[YYYY], so I think that's what we should expect.
That format doesn't compare easily which is why the timestamp was changed
(not by me) to a more ISO standard YYYYMMDDHHmm.  If busybox has 64-bit
math enabled, then this can be compared with no problems, it just has
to be munged into the format 'date' wants.


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


