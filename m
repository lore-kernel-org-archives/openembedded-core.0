Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF32065D3C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Nov 2014 07:05:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA9755cb023062
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 8 Nov 2014 23:05:05 -0800 (PST)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sat, 8 Nov 2014 23:05:04 -0800
Message-ID: <545F1290.3060403@windriver.com>
Date: Sun, 9 Nov 2014 15:06:56 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1415258952.git.Qi.Chen@windriver.com>
	<a66c9ed9fe8f4b1524803dd814e62fa606a1c34c.1415258952.git.Qi.Chen@windriver.com>
	<51B83ADF-EF5F-40FF-B4F5-BFDEF0305051@dominion.thruhere.net>
	<545B2A5F.5040208@windriver.com>
	<745681A3-F15C-4D06-93C6-3342E014B672@dominion.thruhere.net>
	<545B629B.5000900@windriver.com>
	<648271BD-0C3E-4506-86C1-F416BC23EA22@dominion.thruhere.net>
	<545BF855.9030205@linux.intel.com>
	<545C3DD7.60308@windriver.com> <20141107142907.GD2444@jama>
In-Reply-To: <20141107142907.GD2444@jama>
X-Originating-IP: [128.224.162.187]
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: make /etc/sysctl.conf have real effect
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
X-List-Received-Date: Sun, 09 Nov 2014 07:05:15 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Martin & Koen,

I've sent out a new patch.
The title is '[OE-core] [PATCH 0/1] procps: install symlink under 
/etc/sysctl.d in case of systemd'.

Thanks for your reviewing.

Best Regards,
Chen Qi

On 11/07/2014 10:29 PM, Martin Jansa wrote:
> On Fri, Nov 07, 2014 at 11:34:47AM +0800, ChenQi wrote:
>> On 11/07/2014 06:38 AM, Randy Witt wrote:
>>> On 11/06/2014 05:29 AM, Koen Kooi wrote:
>>>> Op 6 nov. 2014, om 12:59 heeft ChenQi <Qi.Chen@windriver.com> het
>>>> volgende geschreven:
>>>>
>>>>>
>>>>> On 11/06/2014 06:33 PM, Koen Kooi wrote:
>>>>>>> Op 6 nov. 2014, om 08:59 heeft ChenQi <Qi.Chen@windriver.com> het
>>>>>>> volgende geschreven:
>>>>>>>
>>>>>>> On 11/06/2014 03:48 PM, Koen Kooi wrote:
>>>>>>>> Op 6 nov. 2014, om 08:32 heeft Chen Qi <Qi.Chen@windriver.com>
>>>>>>>> het volgende geschreven:
>>>>>>>>
>>>>>>>>> In systemd, /etc/sysctl.conf is actually ignored by systemd-sysctl,
>>>>>>>>> because this command only examine *.conf files under a bunch of
>>>>>>>>> directories
>>>>>>>>> like /etc/sysctl.d or /usr/lib/sysctl.d.
>>>>>>>>>
>>>>>>>>> The problem is we are used to configuring kernel parameters in
>>>>>>>>> /etc/sysctl.conf,
>>>>>>>>> so it would be really strange if the configuration in that file
>>>>>>>>> doesn't have any
>>>>>>>>> effect.
>>>>>>>>>
>>>>>>>>> This patch reference Fedora's solution to this problem, creating
>>>>>>>>> a symlink to
>>>>>>>>> /etc/sysctl.conf under /etc/sysctl.d/.
>>>>>>>> Shouldn't this be done in procps instead?
>>>>>>>>
>>>>>>> Actually, the problem is not about `sysctl' command.
>>>>>>> procps provides `sysctl', but busybox also provides this command.
>>>>>>> It's very possible that on our generated image, procps is not
>>>>>>> installed but `sysctl' command is available.
>>>>>>> Both busybox's and procps's `sysctl' command takes
>>>>>>> /etc/sysctl.conf into consideration.
>>>>>> Right, but only procps installs that file.
>>>>> As busybox provides `sysctl' utility, is it reasonable that it also
>>>>> provides a corresponding configuration file (/etc/sysctl.conf)?
>>>>> Should we make a patch for busybox?
>>>>>
>>>>>
>>>>>>> Now, systemd provides a similar utility called `systemd-sysctl'
>>>>>>> which is executed at boot time via systemd-sysctl.service.
>>>>>>>
>>>>>>> So our actually problem is that systemd-sysctl ignores
>>>>>>> /etc/sysctl.conf, which makes it somewhat strange, especially to
>>>>>>> users who are used to configuring parameters in sysctl.conf.
>>>>>>> And this patch solves this problem by adding a symlink under
>>>>>>> /etc/sysctl.d/.
>>>>>>>
>>>>>>> That's why I think we should put this in systemd.
>>>>>> You're adding a symlink to a file which only exists if you install
>>>>>> procps, which isn't in RDEPENDS.
>>>>>>
>>>>> As I said before, procps is *not* necessary for the sysctl mechanism
>>>>> to have effect.
>>>>> (Think about systemd-based core-image-minimal image.)
>>>>>
>>>>> Busybox provides `sysctl', systemd provides `systemd-sysctl'.
>>>>> (It's an easy program, there might exist other packages that provide
>>>>> it too.)
>>>>>
>>>>> /etc/sysctl.conf is a configuration file which is very likely to be
>>>>> modified or created by administrators to configure kernel parameters.
>>>>> (You can't expect administrators to all start learning systemd,
>>>>> trying to understand the gap and differences. In addition, they may
>>>>> have scripts that edit /etc/sysctl.conf to automate their work.)
>>>>>
>>>>> The point of the symlink is to ensure that when users edit
>>>>> /etc/sysctl.conf (or create one), configurations in that file will
>>>>> have effect at boot time.
>>>>>
>>>>> Just think about this problem from a standpoint of user experience.
>>>> You still haven't convinced me that shipping a broken symlink is a
>>>> good idea. I'm pretty sure it's not even allowed in out commit
>>>> guidelines.
>>>>
>>> I agree, even in Fedora's case, both /etc/sysctl.conf and
>>> /etc/sysctl.d/99-sysctl.conf come from the same package,
>>> initscripts-9.51-2.
>>>
>>>
>> Koen & Witt,
>>
>> When I started out to solve this problem, I basically came up with three
>> solutions. Please see details below. I chose to use solution 3 because I
>> think it's better than the other two. Please tell me which one you like,
>> or please tell me your solution.
>>
>> Solution 1:
>> Make 'sysctl.conf' managed by ALTERNATIVES mechanism in OE. Busybox,
>> procps and systemd all provide this file. And the symlink is still in
>> systemd.
>> (My opinion for this one: over engineering)
>>
>> Solution 2:
>> Make base-files provide sysctl.conf and /etc/sysctl.d/99-sysctl.conf (in
>> case of systemd). procps no longer provides sysctl.conf.
>> (My opinion for this one: sysctl.conf doesn't logically belong to
>> base-files.)
>>
>> Solution 3:
>> Let systemd provide a broken symlink '/etc/sysctl.d/99-sysctl.conf' and
>> don't change anything else.
>>
>> Which of the above three solutions do you like? Do you have any other
>> suggestion?
> Solution 4 (suggested by Koen and supported by me):
> Provide the systemd symlink by the same package which provides sysctl.conf in
> your image.
>
> If you want to get better user experience for admins with scripts to
> update their /etc/sysctl.conf then submit patch to systemd upstream to
> process that file, so that their experience will be the same on all
> systemd based systems they manage.
>


