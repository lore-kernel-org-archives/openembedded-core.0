Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAB7A7ED65
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 08:26:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6F8Pp8U005651
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Jul 2019 01:26:07 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 15 Jul 2019 01:25:45 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1563168887.git.Qi.Chen@windriver.com>
	<c383309fe15b52683ac90b50d4305922c338b470.1563168887.git.Qi.Chen@windriver.com>
	<20190715061729.GA21719@localhost>
	<936a85fa-4248-6d37-455e-0a3bbf82b363@windriver.com>
	<20190715064422.GC21719@localhost>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <d644e231-072e-5da0-1650-9d98bfe3e9dd@windriver.com>
Date: Mon, 15 Jul 2019 16:38:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190715064422.GC21719@localhost>
X-Originating-IP: [128.224.162.148]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] msmtp: fix postinstall to avoid do_rootfs failure
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
X-List-Received-Date: Mon, 15 Jul 2019 08:26:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2019 02:44 PM, Adrian Bunk wrote:
> On Mon, Jul 15, 2019 at 02:40:28PM +0800, ChenQi wrote:
>> On 07/15/2019 02:17 PM, Adrian Bunk wrote:
>>> On Mon, Jul 15, 2019 at 01:35:15PM +0800, Chen Qi wrote:
>>>> When lsb is enabled, that is, 'linuxstdbase' is in OVERRIDES,
>>>> do_rootfs would fail if both 'msmtp' and 'postfix' are installed.
>>>> This is because they both try to create /usr/lib/sendmail link if
>>>> it does not exist. So we need to fix the check to avoid non-zero
>>>> exit status.
>>>> ...
>>> This would make it random (depending on installation order) which is
>>> linked to, and it could also make ${sbindir}/sendmail and
>>> $D/usr/lib/sendmail point to different programs.
>>>
>>> It would be better to make $D/usr/lib/sendmail also an alternative in
>>> all packages that provide sendmail.
>>>
>>> cu
>>> Adrian
>>>
>> I don't think we should mix linuxstdbase and ALTERNATIVES setting. It makes
>> things complicated.
>> As ALTERNATIVES_PRIORITY is higher in postfix, I'll just remove the check in
>> postfix and use 'ln -sf' directly.
>> Can you accept this solution?
> I do not see how this solves your problem if msmtp gets installed
> after postfix.
>
> Is it actually required to have these packages installed at the same
> time in LSB?
>
> If not, something like
>    RCONFLICTS_linuxstdbase = "postfix"
> might work. (untested)
>
>> Regards,
>> Chen Qi
> cu
> Adrian
>
Hi Adrian,

I've sent out V2 using alternatives.

Best Regards,

Chen Qi


