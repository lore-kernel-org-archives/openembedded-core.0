Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CDADE713BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 11:36:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9GBal8E016044
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 04:36:48 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 16 Oct 2014 04:36:47 -0700
Message-ID: <543FAE1B.0@windriver.com>
Date: Thu, 16 Oct 2014 19:38:03 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1413451107.git.Qi.Chen@windriver.com>	<222ef849d28064ba0786fb5bf929554d6389c9cc.1413451107.git.Qi.Chen@windriver.com>
	<lyr3y8z32e.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyr3y8z32e.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Originating-IP: [128.224.162.187]
Subject: Re: [PATCH 1/1] systemd: fix runtime dependency
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
X-List-Received-Date: Thu, 16 Oct 2014 11:36:57 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/2014 07:06 PM, Enrico Scholz wrote:
> Chen Qi <Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:
>
>> Previously, if we set 'NO_RECOMMENDATIONS' to "1", we cannot reach login
>> in systemd systems.
> IMO, this is just a configuration issue and can be fixed much better in
> a higher level packagegroup recipe.  RRECOMMENDS for serial getty are
> fine; although a serial console is very common on embedded systems, it
> is not strictly necessary.
>

These serial-getty@.service is part of the systemd package. In our 
system, it's first removed from systemd package, then generated from a 
separate recipe.

That's just a configuration file which occupies almost no space in 
image. However, without it, you cannot use serial console in systemd system.

In sysvinit, the serial console configuration is in /etc/inittab.

I just can't see any advantage of not using serial-getty@.service.

>> This patch makes the following changes.
>> 1. Add util-linux-agetty as a runtime dependency.
>>     Otherwise, getty services in systemd cannot start correctly.
> afais, it would make more sense to move this dependency into
> systemd-serialgetty (and not systemd as in your patch). Or are there
> other units in systemd which call agetty?
>
>
> Enrico

getty@.service

util-linux-agetty is really a necessity, otherwise you just don't console.

//Chen Qi

