Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id A6A6D761AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 14:45:08 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 4EB12F811D8; Fri, 24 Jul 2015 08:45:08 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id BB904F811D8;
	Fri, 24 Jul 2015 08:45:07 -0600 (MDT)
Message-ID: <55B24F78.6020405@mlbassoc.com>
Date: Fri, 24 Jul 2015 08:45:12 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1437610956-27049-1-git-send-email-gary@mlbassoc.com>	<CAJTo0Lb41pKOft88tttTNE-47wDekSbSUbYyUWT12WydtKgaCw@mail.gmail.com>	<55B16CF0.80405@mlbassoc.com>	<CAJTo0Lb9npwcdNkLbifoaR6P+QgAX76d0go8pq7ozCpEiW7k-w@mail.gmail.com>	<55B171F3.4010009@mlbassoc.com>	<1437692801.821.140.camel@linuxfoundation.org>	<55B17599.1000608@mlbassoc.com>
	<1437724353.821.149.camel@linuxfoundation.org>
In-Reply-To: <1437724353.821.149.camel@linuxfoundation.org>
Subject: Re: [PATCH] libepoxy: Use native python3
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
X-List-Received-Date: Fri, 24 Jul 2015 14:45:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-24 01:52, Richard Purdie wrote:
> On Thu, 2015-07-23 at 17:15 -0600, Gary Thomas wrote:
>> On 2015-07-23 17:06, Richard Purdie wrote:
>>> On Thu, 2015-07-23 at 17:00 -0600, Gary Thomas wrote:
>>>> It's an old host (Fedora 13) that I am unable to upgrade, but it still
>>>> works quite well.  I get around most of the Yocto/bitbake worries by
>>>> using a Yocto-built meta-toolchain to fill in the blanks (correct make,
>>>> python2, etc), but python3 is not part of the meta-toolchain :-(
>>>
>>> You could likely build a customised meta-toolchain which did contain
>>> python3 though?
>>
>> Do you know how I would make that happen?  For me, meta-toolchain is
>> a black box - I know very little of the internals.
>
> Personally, I'd probably use "buildtools-tarball" for this so I'd go and
> edit the buildtools-tarball.bb file and add nativesdk-python3-modules to
> it which should pull in the bulk of python3 (not sure if you'd need
> nativesdk-python3-core too, I'd hope that would be automatic from the
> other).

Sadly, this failed:
| Objects/obmalloc.o: In function `_PyObject_DebugMallocStats':
| obmalloc.c:(.text+0x1793): undefined reference to `pool_is_in_list'
| collect2: error: ld returned 1 exit status
| make: *** [Parser/pgen] Error 1
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at 
/local/p0382-cutting-edge_2014-11-21/tmp/work/i686-nativesdk-amltdsdk-linux/nativesdk-python3/3.4.3-r1.0/temp/log.do_compile.27165)
ERROR: Task 163 (virtual:nativesdk:/local/poky-cutting-edge/meta/recipes-devtools/python/python3_3.4.3.bb, do_compile) failed with exit code '1'

>
> You prefer your meta-toolchain? Then set:
> TOOLCHAIN_HOST_TASK_append = " nativesdk-python3-modules"
> in local.conf and it should add python3 to all meta-toolchain builds.
>
>> Question about policy: it seems that a good many "native" packages
>> are built, many just to "level the playing field".   I just checked
>> and one of my average builds has 148 native packages sitting there.
>> For example, why build bison-native when my host's bison is even the
>> same vintage and hence just as adequate?  Why then, draw the line
>> over python3 in this one recipe?  (Just asking, I'll figure out how
>> to fix this anyway)
>
> The line is drawn over python. Bitbake is built with python (2 at the
> moment, 3 in the future) and since we need python to run bitbake,
> rebuilding it seems silly. Yes, we do need to build a python-native to
> be able to build python (target) which is sad but such is the nature of
> cross compiling. We therefore tend to assume the provided python(s) are
> sane.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

