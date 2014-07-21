Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 3249E7057A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 10:59:14 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8B2E7F811E4; Mon, 21 Jul 2014 04:59:15 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 21504F811DB;
	Mon, 21 Jul 2014 04:59:12 -0600 (MDT)
Message-ID: <53CCF28B.1050804@mlbassoc.com>
Date: Mon, 21 Jul 2014 04:59:23 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1405583236.git.Qi.Chen@windriver.com>
	<1405931246.22985.89.camel@ted>
In-Reply-To: <1405931246.22985.89.camel@ted>
Subject: Re: [PATCH V5 0/2] shadow: upgrade from 4.1.4.3 to 4.2.1
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
X-List-Received-Date: Mon, 21 Jul 2014 10:59:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-07-21 02:27, Richard Purdie wrote:
> On Thu, 2014-07-17 at 15:53 +0800, Chen Qi wrote:
>> The following changes since commit 846bc50fde11bbb36c8eb5b2e3ae6bb644c037f3:
>>
>>    ltp: use "foreign" automake strictness (2014-07-16 10:27:16 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib ChenQi/shadow-4.2.1
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/shadow-4.2.1
>>
>> Chen Qi (2):
>>    shadow: upgrade from 4.1.4.3 to 4.2.1
>>    oeqa: fix return status in pam.py to match shadow-4.2.1
>
> I think but am not 100% sure this has introduced another regression:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-oecore/builds/177
>
> The issue is that X doesn't start in oe-core built images. It does work
> correctly in poky. The issue is that the /etc/init.d/xserver-nodm script
> returns:
>
> root@qemuarm:/etc# /etc/init.d/xserver-nodm start
> Starting Xserver
> su: applet not found
>
> or to be more specific:
>
> root@qemuarm:/etc# su -l -c '/etc/X11/Xserver&' xuser
> su: applet not found
>
>
> The poky images appear to work since we install bash. If you remove bash
> from packagegroup-core-device-devel.bb, the poky images will show the
> same error.
>
> I think this is something to do with the none-suid busybox binary not
> containing su support, but why su is being called there, I don't know.
> su is being provided by shadow in the image. If I make su provided by
> busybox the problem also goes away.

The problem (reported last week on the Yocto list) is su.shadow
changed how it behaves.  The old version would end up passing
the script off by
   6761  execve("/bin/sh", ["/bin/sh", "-c", "/etc/X11/Xserver"], [/* 7 vars */]) = 0
whereas the new version does
   961   execve("/bin/sh", ["-su", "-c", "/etc/X11/Xserver"], [/* 7 vars */]) = 0

I still haven't figured out why su.shadow now behaves this way.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

