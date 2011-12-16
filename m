Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Rbc8S-0007Er-DY for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 19:03:56 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Rbc1g-0006Mp-71 for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 18:56:56 +0100
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 18:56:56 +0100
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 18:56:56 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Fri, 16 Dec 2011 21:55:22 +0400
Message-ID: <jcg0or$703$1@dough.gmane.org>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-4-git-send-email-dbaryshkov@gmail.com>
	<1323961117.4568.41.camel@ted>
	<1865303E0DED764181A9D882DEF65FB6EA436A83B6@shsmsx502.ccr.corp.intel.com>
	<jcfeeh$ub8$1@dough.gmane.org> <1324049140.4568.98.camel@ted>
	<jcfqe3$oif$1@dough.gmane.org> <1324054004.4568.112.camel@ted>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:8.0) Gecko/20111109 Icedove/8.0
In-Reply-To: <1324054004.4568.112.camel@ted>
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
X-List-Received-Date: Fri, 16 Dec 2011 18:03:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/2011 08:46 PM, Richard Purdie wrote:
> On Fri, 2011-12-16 at 20:07 +0400, Dmitry Eremin-Solenikov wrote:
>> On 12/16/2011 07:25 PM, Richard Purdie wrote:
>>> On Fri, 2011-12-16 at 16:42 +0400, Dmitry Eremin-Solenikov wrote:
>>>> On 12/15/2011 08:20 PM, Cui, Dexuan wrote:
>>>>> Richard Purdie wrote on 2011-12-15:
>>>>>> On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
>>>>>>> Currently sdk generation might fail with the following error:
>>>>>>> | Collected errors:
>>>>>>> |  * extract_archive: Cannot create symlink from ./var/log to
>>>>>>> 'volatile/log': File exists.
>>>>>>> ERROR: Function 'do_populate_sdk' failed
>>>>>>>
>>>>>>> This happens as consolekit package will include both
>>>>>>> /var/log/ConsoleKit and /var/volatile/log/ConsoleKit files:
>>>>>>> lumag@fangorn:~/OE-scripts$ dpkg-deb -c
>>>>>> build/tmp--eglibc/deploy/ipk/core2/consolekit_0.4.5-r7_core2.ipk  |
>>>>>> grep var
>>>>>>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/ drwxr-xr-x
>>>>>>> root/root         0 2011-12-07 22:12 ./var/log/ drwxr-xr-x root/root
>>>>>>>         0 2011-12-07 22:12 ./var/log/ConsoleKit/ lrwxrwxrwx root/root
>>>>>>>       0 2011-12-07 22:12 ./var/run ->    volatile/run drwxr-xr-x root/root
>>>>>>>         0 2011-12-07 22:12 ./var/volatile/ drwxr-xr-x root/root         0
>>>>>>> 2011-12-07 22:12 ./var/volatile/log/ drwxr-xr-x root/root         0
>>>>>>> 2011-12-07 22:12 ./var/volatile/log/ConsoleKit/ drwxr-xr-x root/root
>>>>>>>         0 2011-12-07 22:12 ./var/volatile/run/ drwxr-xr-x root/root
>>>>>>>     0 2011-12-07 22:12 ./var/volatile/run/ConsoleKit/
>>>>>>>
>>>>>>> Inclusion of both log directories causes this error. Drop the
>>>>>>> /var/log/ConsoleKit in favour of /var/volatile/log
>>>>> Hi Dmitry,
>>>>> Could you please explain how and where the extract_archive error is caused?
>>>>> Where is /var/log linked to /var/volatile/log?
>>>>
>>>> I have tried building meta-toolchain-qte... and I got exactly the error
>>>> from my original message.
>>>>
>>>>>
>>>>> Do you mean RP's patch "consolekit: Fix ${localstatedir} race" didn't fix the issue?
>>>>> (I suspect so)
>>>>
>>>> Yes, I still had the issues even after PR's patch.
>>>>
>>>>>
>>>>>> This effectively reverts:
>>>>>> http://git.openembedded.org/openembedded-core/commit/?id=5608a748
>>>>>> af2c754f60137ab7c3010ccce6bf9e40 so I think this fixes one problem at
>>>>>> the expense of causing another. Koen: Any comments?
>>>>>
>>>>> Thanks,
>>>>> -- Dexuan
>>>
>>> I believe this is an installation ordering problem in opkg. If you apply
>>> my opkg patch (and the nativesdk one I just posted), I don't see this
>>> problem with meta-toolchain-gmae.
>>
>> I still see one problem. Without my patch I have both
>> /var/volatile/log/ConsoleKit and /var/log/ConsoleKit in consolekit
>> package. Won't that cause troubles?
>
> No, that wasn't the problem opkg was reporting. The problem opkg was
> reporting was that base-files hadn't installed first and its responsible
> for setting up the var symlinks.

That is not the problem that was reported by opkg. That is what I saw in 
the built package - /var/volatile/log/ConsoleKit and /var/log/ConsoleKit.

BTW, Koen. I've just built a consolekit package in Angstrom environment
with my patch applied and here is the interesting part:
lumag@fangorn:~/OE-scripts$ dpkg-deb -c 
build/tmp-angstrom-eglibc/deploy/ipk/armv5te/consolekit_0.4.5-r8_armv5te.ipk 
  | grep var
drwxr-xr-x root/root         0 2011-12-16 21:32 ./var/
drwxr-xr-x root/root         0 2011-12-16 21:32 ./var/run/
drwxr-xr-x root/root         0 2011-12-16 21:32 ./var/run/ConsoleKit/
drwxr-xr-x root/root         0 2011-12-16 21:32 ./var/log/
drwxr-xr-x root/root         0 2011-12-16 21:32 ./var/log/ConsoleKit/

So the package does include the /var/log/ConsoleKit even without 
explicit note on it. Could you please recheck your environment and try 
building/checking consolekit package with my patch applied?


-- 
With best wishes
Dmitry



