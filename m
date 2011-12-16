Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RbXFL-00010q-6n for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 13:50:43 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RbX8Y-0003W2-Fd for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 13:43:42 +0100
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 13:43:42 +0100
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 13:43:42 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Fri, 16 Dec 2011 16:42:08 +0400
Message-ID: <4EEB3CA0.1080603@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-4-git-send-email-dbaryshkov@gmail.com>
	<1323961117.4568.41.camel@ted>
	<8A9F3915-1804-4B78-A84C-5721FFD6E5FB@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:8.0) Gecko/20111109 Icedove/8.0
In-Reply-To: <8A9F3915-1804-4B78-A84C-5721FFD6E5FB@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 4/9] consolekit: fix sdk generation issues
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
X-List-Received-Date: Fri, 16 Dec 2011 12:50:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen,

On 12/15/2011 07:06 PM, Koen Kooi wrote:
>
> Op 15 dec. 2011, om 15:58 heeft Richard Purdie het volgende geschreven:
>
>> On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
>>> Currently sdk generation might fail with the following error:
>>> | Collected errors:
>>> |  * extract_archive: Cannot create symlink from ./var/log to
>>> 'volatile/log': File exists.
>>> ERROR: Function 'do_populate_sdk' failed
>>>
>>> This happens as consolekit package will include both /var/log/ConsoleKit
>>> and /var/volatile/log/ConsoleKit files:
>>> lumag@fangorn:~/OE-scripts$ dpkg-deb -c build/tmp--eglibc/deploy/ipk/core2/consolekit_0.4.5-r7_core2.ipk  | grep var
>>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/
>>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/log/
>>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/log/ConsoleKit/
>>> lrwxrwxrwx root/root         0 2011-12-07 22:12 ./var/run ->  volatile/run
>>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/
>>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/log/
>>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/log/ConsoleKit/
>>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/run/
>>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/run/ConsoleKit/
>>>
>>> Inclusion of both log directories causes this error. Drop the
>>> /var/log/ConsoleKit
>>> in favour of /var/volatile/log
>>>
>>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>>
>> This effectively reverts:
>> http://git.openembedded.org/openembedded-core/commit/?id=5608a748af2c754f60137ab7c3010ccce6bf9e40
>> so I think this fixes one problem at the expense of causing another.
>> Koen: Any comments?
>
> If you revert it consolekit won't work at runtime because it fails to start.

In your usecase, do you have a /var/volatile? 
/var/volatile/log/ConsoleKit? Could you please be more specific in the 
layout of your /var and in the error/trace of consolekit on your side?

I'd really like to solve this somehow as for now I have a broken SDK 
generation (at it seems it's not my fault as other people on ML 
suggested that they experienced errors with meta-toolchain-gmae).

-- 
With best wishes
Dmitry



