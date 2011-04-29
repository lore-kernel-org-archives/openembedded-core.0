Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QFdhN-0008Fz-DR
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 04:44:53 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 7B9EC16600D7; Thu, 28 Apr 2011 20:42:20 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4F20A16600D3;
	Thu, 28 Apr 2011 20:42:17 -0600 (MDT)
Message-ID: <4DBA2588.6010900@mlbassoc.com>
Date: Thu, 28 Apr 2011 20:42:16 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1300731672.git.raj.khem@gmail.com>	<c9c4958668d457bef286c0c1e4038db23fc099c2.1300731672.git.raj.khem@gmail.com>	<4D87C5EA.1040602@mentor.com>
	<4DBA11F0.8090409@mlbassoc.com>
	<BANLkTim=Jqkp=0REY1OPyQcmJJkwWtr4pw@mail.gmail.com>
In-Reply-To: <BANLkTim=Jqkp=0REY1OPyQcmJJkwWtr4pw@mail.gmail.com>
Subject: Re: [PATCH 1/1] perl-native_5.12.2.bb: Fix compliation on ubuntu 11.04-alpha
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
X-List-Received-Date: Fri, 29 Apr 2011 02:44:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/28/2011 08:10 PM, Khem Raj wrote:
> On Thu, Apr 28, 2011 at 6:18 PM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> On 03/21/2011 03:40 PM, Tom Rini wrote:
>>>
>>> On 03/21/2011 11:23 AM, Khem Raj wrote:
>>>>
>>>> Ubuntu has moved eglibc to /usr/lib/${arch}-linux-gnu and
>>>> /lib/${arch}-linux-gnu so we need that to be added to glibpth in
>>>> Configure.
>>>>
>>>> Currently we set LD=ld in environment for recipes inheriting native
>>>> class. This overrides the LD settings in the Makefiles of perl and
>>>> it tries to link by calling ld which does not work since its using
>>>> -l<x>  on commandline and ubuntu linker seems not to look into
>>>> the new location for these libraries. Its better to use gcc for linking
>>>> here anyway
>>>>
>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>> ---
>>>> .../perl/files/Configure-multilib.patch | 10 +++++++---
>>>> meta/recipes-devtools/perl/perl-native_5.12.2.bb | 4 +++-
>>>> 2 files changed, 10 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/perl/files/Configure-multilib.patch
>>>> b/meta/recipes-devtools/perl/files/Configure-multilib.patch
>>>> index d3948a9..b561b6a 100644
>>>> --- a/meta/recipes-devtools/perl/files/Configure-multilib.patch
>>>> +++ b/meta/recipes-devtools/perl/files/Configure-multilib.patch
>>>> @@ -1,11 +1,15 @@
>>>> ---- perl-5.8.7/Configure.orig 2006-01-30 10:50:04.000000000 +0000
>>>> -+++ perl-5.8.7/Configure 2006-01-30 10:51:18.000000000 +0000
>>>> -@@ -1240,7 +1240,7 @@
>>>> +Index: perl-5.12.2/Configure
>>>> +===================================================================
>>>> +--- perl-5.12.2.orig/Configure
>>>> ++++ perl-5.12.2/Configure
>>>> +@@ -1316,8 +1316,9 @@ loclibpth="/usr/local/lib /opt/local/lib
>>>> loclibpth="$loclibpth /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib"
>>>>
>>>> : general looking path for locating libraries
>>>> -glibpth="/lib /usr/lib $xlibpth"
>>>> +glibpth="/lib /usr/lib /lib64 /usr/lib64 $xlibpth"
>>>> glibpth="$glibpth /usr/ccs/lib /usr/ucblib /usr/local/lib"
>>>> ++test -f /usr/lib/`uname -m`-linux-gnu/libc.so&&
>>>> glibpth="/usr/lib/`uname -m`-linux-gnu $glibpth"
>>>> test -f /usr/shlib/libc.so&&  glibpth="/usr/shlib $glibpth"
>>>> test -f /shlib/libc.so&&  glibpth="/shlib $glibpth"
>>>> + test -d /usr/lib64&&  glibpth="$glibpth /lib64 /usr/lib64
>>>> /usr/local/lib64"
>>>> diff --git a/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>>>> b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>>>> index 9af7b06..6776aed 100644
>>>> --- a/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>>>> +++ b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
>>>> @@ -4,7 +4,7 @@ SECTION = "libs"
>>>> LICENSE = "Artistic|GPL"
>>>> LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>>>> file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
>>>> -PR = "r7"
>>>> +PR = "r8"
>>>>
>>>> LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>>>> file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
>>>> @@ -28,6 +28,8 @@ S = "${WORKDIR}/perl-${PV}"
>>>>
>>>> inherit native
>>>>
>>>> +export LD="${CC}"
>>>
>>> We have CCLD for when we want to use CC as our LD (and yes, this usually
>>> just ends up as CC, but lets be clear please).
>>>
>>
>> This change is not working for me on Ubuntu 11.04 {released}.
>> The libraries are found in /lib/i386-linux-gnu and /usr/lib/i386-linux-gnu
>> At least on the machine where it fails, uname -m gives i686, so the test
>>   >>  ++test -f /usr/lib/`uname -m`-linux-gnu/libc.so&&
>> glibpth="/usr/lib/`uname -m`-linux-gnu $glibpth"
>> fails.
>>
>> I hard coded the i386-linux-gnu paths and was able to build perl-native on
>> Ubuntu 11.04
>
> I used uname since I thought that was way to make it common for both x86_64
> and x86 but it seems they made life harder than that. I did not have
> 32bit installation to verify

Note: no criticism intended :-)

Perhaps some sort of wildcard could work?  Just replace `uname -m` with "*"?
I just tried this here and it seems to work on my x86 system.
   $ test -f /usr/lib/*-linux-gnu/libc.so && glibpth="/usr/lib/*-linux-gnu $glibpth"
   $ echo $glibpth
   /usr/lib/i386-linux-gnu

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


