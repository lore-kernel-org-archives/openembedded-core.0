Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB23731A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 16:00:46 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 1DA2668A01B; Thu, 10 Mar 2016 16:00:46 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 4D8C568A019;
	Thu, 10 Mar 2016 16:00:44 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 0724B6740554;
	Thu, 10 Mar 2016 17:00:44 +0100 (CET)
To: Jens Rehsack <rehsack@gmail.com>
References: <56E1028C.6080605@mlbassoc.com>
	<E219D57B-2F63-40DE-9C33-161AE6F738CC@gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56E19A2B.60002@mlbassoc.com>
Date: Thu, 10 Mar 2016 17:00:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <E219D57B-2F63-40DE-9C33-161AE6F738CC@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Problems with perl 5.22
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
X-List-Received-Date: Thu, 10 Mar 2016 16:00:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-03-10 16:54, Jens Rehsack wrote:
>
>> Am 10.03.2016 um 06:13 schrieb Gary Thomas <gary@mlbassoc.com>:
>>
>> I'm working on a package (amanda - the Advanced Maryland Archiving
>> system) that is written heavily in perl with swig interfaces to C.
>> This code ran great until the update to perl 5.22; it now dies a
>> horrible death on almost every activity.  These failures seem to
>> always be in the swig generated wrappers, but that may just be
>> where most of the work gets done.
>>
>> I've narrowed this down to exactly the change to perl 5.22 from
>> 5.20. Using bisect as well as experimentation (e.g. trying all
>> the compiler combinations that have occurred since a last good
>> version) and I can go from working to failing by only the change
>> in perl.
>>
>> The interesting (scary) thing is that I've built amanda for my
>> target natively on my board running debian, including perl 5.22.
>> This means I can't say definitively  that perl 5.22 is the culprit
>> as on debian it runs fine.  So, it's got something to do with the
>> OE environment/porting/packaging of perl and not just the revision.
>>
>> I've also tested this on multiple architectures (ARM, PowerPC) with
>> the same results - with perl 5.20 amanda works, with perl 5.22 it fails.
>>
>> I've compared the actual 5.22.1 sources used by OE-core and debian
>> and they are subtly different, although I can't pinpoint any change
>> that might be responsible.
>>
>> For the moment, I can just fall back to perl 5.20 for my target
>> that needs to run amanda, but this isn't a real solution (e.g.
>> in this state I can't propose my recipe to any layer as it's
>> totally broken with the current OE-core).  I'd like to see this
>> fixed but the amanda code (swig wrappers) are horribly complex
>> which makes debugging quite the challenge, not to mention they
>> may be about the only way to uncover the bug, whether it's in
>> amanda or perl.
>>
>> Any suggestions on how to move forward?
>
> Since I have no clue what's wrong and how it fails (backtrace
> would point in some directions), several ideas might work:

The problem here is that the failures happen in the swig generated
files which are very difficult to debug (and don't really track
in the -dbg packages)

>
> How clean is your build location (we realize that often between
> updates some files remain in our target images until we wipe
> tmp/ - cleansstate for image doesn't help ...)?

100% clean, I've started from scratch many times

>
> Did you prove the library path's of your *.so's? Perl does
> almost everything within libperl.so - build against wrong version
> causes in weird crashes (scan DBI mailing list for admin's
> build issues of DBI on AIX/HP-UX ...).

As I said, this all works fine when I build [from scratch] with
perl-5.20 and not [from scratch] with perl 5.22

>
> Maybe share your recipe can help to reproduce the problem
> elsewhere and debug locally.
>

I'd be happy to share, perhaps privately if you're inclined?
It's a complicated setup and testing can be a bit tedious, but
I'm happy for any help.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

