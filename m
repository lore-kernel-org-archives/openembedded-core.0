Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 023296AC33
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Mar 2015 05:04:11 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D133CF811E6; Sat,  7 Mar 2015 22:04:11 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2CFF4F811E5;
	Sat,  7 Mar 2015 22:04:10 -0700 (MST)
Message-ID: <54FBD854.8060509@mlbassoc.com>
Date: Sat, 07 Mar 2015 22:04:20 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.11.1503070902110.16088@Device-040570>
	<F503D67F-FDF9-49B6-BBC9-149D56AA3EE4@gmail.com>
In-Reply-To: <F503D67F-FDF9-49B6-BBC9-149D56AA3EE4@gmail.com>
Subject: Re: what's with the loop with "in in" in u-boot.inc?
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
X-List-Received-Date: Sun, 08 Mar 2015 05:04:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-03-07 10:48, Bernhard Reutner-Fischer wrote:
> On March 7, 2015 3:04:52 PM GMT+01:00, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
>>
>>   based on a recent post to this(?) list, i was curious about the
>> following loop construct in u-boot.inc:
>>
>>         for config in ${UBOOT_MACHINE}; do
>>             for type in in ${UBOOT_CONFIG}; do
>>                 if [ "${type}"x = "in"x ]
>>                 then
>>                     continue
>>                 fi
>>
>>   the words "in in" above don't appear to be a typo, as the next
>> condition explicitly checks for the value "in" and skips it. what's
>> the rationale for that? i used "git blame" to examine the commit that
>
> for may barf on empty iteration input.
> One usually uses for i in ${foo} '';
> and skips i with zero length. Any other is obviously fine, too though so nothing wrong or odd here.

But this code is only executed if ${UBOOT_CONFIG} is non-empty
so this test is nonsense.

My guess is that the code originally tested for ${UBOOT_CONFIG}
being empty this way, then the if/then/else was added (look at
the indentation) and the original test was never removed (which
does no harm)

>
> HTH,
>
>> introduced that, but it says nothing about that curiosity.
>>
>> rday
>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

