Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8CC97207F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 11:57:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA6BvaCS016587
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 03:57:36 -0800 (PST)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 6 Nov 2014 03:57:35 -0800
Message-ID: <545B629B.5000900@windriver.com>
Date: Thu, 6 Nov 2014 19:59:23 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1415258952.git.Qi.Chen@windriver.com>
	<a66c9ed9fe8f4b1524803dd814e62fa606a1c34c.1415258952.git.Qi.Chen@windriver.com>
	<51B83ADF-EF5F-40FF-B4F5-BFDEF0305051@dominion.thruhere.net>
	<545B2A5F.5040208@windriver.com>
	<745681A3-F15C-4D06-93C6-3342E014B672@dominion.thruhere.net>
In-Reply-To: <745681A3-F15C-4D06-93C6-3342E014B672@dominion.thruhere.net>
X-Originating-IP: [128.224.162.187]
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 06 Nov 2014 11:57:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/06/2014 06:33 PM, Koen Kooi wrote:
>> Op 6 nov. 2014, om 08:59 heeft ChenQi <Qi.Chen@windriver.com> het volgende geschreven:
>>
>> On 11/06/2014 03:48 PM, Koen Kooi wrote:
>>> Op 6 nov. 2014, om 08:32 heeft Chen Qi <Qi.Chen@windriver.com> het volgende geschreven:
>>>
>>>> In systemd, /etc/sysctl.conf is actually ignored by systemd-sysctl,
>>>> because this command only examine *.conf files under a bunch of directories
>>>> like /etc/sysctl.d or /usr/lib/sysctl.d.
>>>>
>>>> The problem is we are used to configuring kernel parameters in /etc/sysctl.conf,
>>>> so it would be really strange if the configuration in that file doesn't have any
>>>> effect.
>>>>
>>>> This patch reference Fedora's solution to this problem, creating a symlink to
>>>> /etc/sysctl.conf under /etc/sysctl.d/.
>>> Shouldn't this be done in procps instead?
>>>
>> Actually, the problem is not about `sysctl' command.
>> procps provides `sysctl', but busybox also provides this command.
>> It's very possible that on our generated image, procps is not installed but `sysctl' command is available.
>> Both busybox's and procps's `sysctl' command takes /etc/sysctl.conf into consideration.
> Right, but only procps installs that file.

As busybox provides `sysctl' utility, is it reasonable that it also 
provides a corresponding configuration file (/etc/sysctl.conf)? Should 
we make a patch for busybox?


>> Now, systemd provides a similar utility called `systemd-sysctl' which is executed at boot time via systemd-sysctl.service.
>>
>> So our actually problem is that systemd-sysctl ignores /etc/sysctl.conf, which makes it somewhat strange, especially to users who are used to configuring parameters in sysctl.conf.
>> And this patch solves this problem by adding a symlink under /etc/sysctl.d/.
>>
>> That's why I think we should put this in systemd.
> You're adding a symlink to a file which only exists if you install procps, which isn't in RDEPENDS.
>

As I said before, procps is *not* necessary for the sysctl mechanism to 
have effect.
(Think about systemd-based core-image-minimal image.)

Busybox provides `sysctl', systemd provides `systemd-sysctl'.
(It's an easy program, there might exist other packages that provide it 
too.)

/etc/sysctl.conf is a configuration file which is very likely to be 
modified or created by administrators to configure kernel parameters.
(You can't expect administrators to all start learning systemd, trying 
to understand the gap and differences. In addition, they may have 
scripts that edit /etc/sysctl.conf to automate their work.)

The point of the symlink is to ensure that when users edit 
/etc/sysctl.conf (or create one), configurations in that file will have 
effect at boot time.

Just think about this problem from a standpoint of user experience.

Best Regards,
Chen Qi

