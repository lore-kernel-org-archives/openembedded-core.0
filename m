Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 6EFBA609C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 20:04:08 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id E0ECCF811F9; Wed, 30 Jul 2014 14:04:09 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 800EAF811F9;
	Wed, 30 Jul 2014 14:04:07 -0600 (MDT)
Message-ID: <53D94FC7.30309@mlbassoc.com>
Date: Wed, 30 Jul 2014 14:04:23 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <53D91F3C.3050107@mlbassoc.com>
	<CAMKF1srm+0up4YsN2u6UQrmO948NHqk1YZAwhx_kaX22e-h=zQ@mail.gmail.com>
	<53D93220.4030901@mlbassoc.com> <20140730193351.GU16445@jama>
In-Reply-To: <20140730193351.GU16445@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: freetype-config broken?
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
X-List-Received-Date: Wed, 30 Jul 2014 20:04:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-07-30 13:33, Martin Jansa wrote:
> On Wed, Jul 30, 2014 at 11:57:52AM -0600, Gary Thomas wrote:
>> On 2014-07-30 11:32, Khem Raj wrote:
>>> On Wed, Jul 30, 2014 at 9:37 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>>>> The behaviour of 'freetype-config' (from freetype-native) has
>>>> changed since this commit:
>>>>     commit 3476a49b10093c58b2f89e3d9a8527224f1bd7f6
>>>>     Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>     Date:   Thu May 22 10:59:33 2014 +0100
>>>>       binconfig-disabled: Add class and use
>>>>
>>>> This is breaking my build of mplayer which uses freetype-config
>>>> to determine how to use the freetype library (in ./configure)
>>>>
>>>> The comment in the commit indicates that this is an improvement
>>>> and the path forward, but I don't see how to change the recipes
>>>> (and scripts, etc) that rely on this functionality to work in
>>>> this new mode.
>>>>
>>>> Any suggestions?
>>>>
>>> add AM_INIT_AUTOMAKE([foreign]) to the configure.in or configure.ac
>>
>> I don't see how your suggestion helps.  This package (mplayer) doesn't
>> use autotools - it has a hand coded configure script, so there is
>> no configure.{in,ac}
>>
>> I also looked through the logs and didn't see any recipe which uses
>> a package that is now marked as binconfig-disabled as to how it
>> solves the problem.  A pointer/example would really be appreciated.
>
> meta-oe:
> 6898dae64e79fa81c3b032cb314e3c2d6f2c6e0d
> d7363984b83c938db6f0a16ca8732bed69ca8acb
> 141aedb403e4bb91dac6ffb109ee74dfaee59f81
> 18ccf18ee4949b785e240d9f8f8983c6554dd4e9
> 09566d518a56a413303d7d13d496254b467c635b
> 6cc47fb2b007504be3e32698ed14b1bebc981526
>
> oe-core:
> b550572bdad318aed02230496721430eec89c937
> d2457880e7bb08b9c2f8d60e70b1d59ed84e9da9
> fe277bf0a61d5d7787dba699ee1ed4d979ba5cff
> 4a971a90988435902a4a8dd9c721d440cd80c0bd
> ffffc627b21a3cf8b407d16a437793b5fddf7127
> 74d73cf1e4607cb313b5e4c7138b555d5999a46d
> f0479e60b660778ab27b946d426daa17a08a28ea
> 437ad15de308769c9251a37ed41dabed5653fc96
> 17e5793847601d2aeb497ffe14871df65543abfb
> ff573270f7e87296840911189fd2087a1bc597f7
>
> It's really not so hard to search for "-config" in git log.
>

Not every change in these lists was relevant (in fact most
were not).  However, I did find an example which worked
for me.

Bottom line - change 'freetype-config XXX' to 'pkg-config freetype2 XXX'

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

