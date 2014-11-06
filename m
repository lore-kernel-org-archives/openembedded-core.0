Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F36187207F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 07:57:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA67vfCv029252
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Nov 2014 23:57:41 -0800 (PST)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 5 Nov 2014 23:57:40 -0800
Message-ID: <545B2A5F.5040208@windriver.com>
Date: Thu, 6 Nov 2014 15:59:27 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1415258952.git.Qi.Chen@windriver.com>
	<a66c9ed9fe8f4b1524803dd814e62fa606a1c34c.1415258952.git.Qi.Chen@windriver.com>
	<51B83ADF-EF5F-40FF-B4F5-BFDEF0305051@dominion.thruhere.net>
In-Reply-To: <51B83ADF-EF5F-40FF-B4F5-BFDEF0305051@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 06 Nov 2014 07:57:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2014 03:48 PM, Koen Kooi wrote:
> Op 6 nov. 2014, om 08:32 heeft Chen Qi <Qi.Chen@windriver.com> het volgende geschreven:
>
>> In systemd, /etc/sysctl.conf is actually ignored by systemd-sysctl,
>> because this command only examine *.conf files under a bunch of directories
>> like /etc/sysctl.d or /usr/lib/sysctl.d.
>>
>> The problem is we are used to configuring kernel parameters in /etc/sysctl.conf,
>> so it would be really strange if the configuration in that file doesn't have any
>> effect.
>>
>> This patch reference Fedora's solution to this problem, creating a symlink to
>> /etc/sysctl.conf under /etc/sysctl.d/.
> Shouldn't this be done in procps instead?
>

Actually, the problem is not about `sysctl' command.
procps provides `sysctl', but busybox also provides this command.
It's very possible that on our generated image, procps is not installed 
but `sysctl' command is available.
Both busybox's and procps's `sysctl' command takes /etc/sysctl.conf into 
consideration.

Now, systemd provides a similar utility called `systemd-sysctl' which is 
executed at boot time via systemd-sysctl.service.

So our actually problem is that systemd-sysctl ignores /etc/sysctl.conf, 
which makes it somewhat strange, especially to users who are used to 
configuring parameters in sysctl.conf.
And this patch solves this problem by adding a symlink under /etc/sysctl.d/.

That's why I think we should put this in systemd.

Best Regards,
Chen Qi

