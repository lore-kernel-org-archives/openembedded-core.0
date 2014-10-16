Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-08.prod.phx3.secureserver.net
	(p3plsmtpa08-08.prod.phx3.secureserver.net [173.201.193.109])
	by mail.openembedded.org (Postfix) with ESMTP id E43E8713BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 11:29:43 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-08.prod.phx3.secureserver.net with 
	id 3nVj1p0080BVjqb01nVjU2; Thu, 16 Oct 2014 04:29:44 -0700
Message-ID: <543FAC26.70002@pabigot.com>
Date: Thu, 16 Oct 2014 06:29:42 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1413451107.git.Qi.Chen@windriver.com>	<222ef849d28064ba0786fb5bf929554d6389c9cc.1413451107.git.Qi.Chen@windriver.com>
	<lyr3y8z32e.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyr3y8z32e.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Thu, 16 Oct 2014 11:29:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/2014 06:06 AM, Enrico Scholz wrote:
> Chen Qi <Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:
>
>> Previously, if we set 'NO_RECOMMENDATIONS' to "1", we cannot reach login
>> in systemd systems.
> IMO, this is just a configuration issue and can be fixed much better in
> a higher level packagegroup recipe.  RRECOMMENDS for serial getty are
> fine; although a serial console is very common on embedded systems, it
> is not strictly necessary.
>
>
>> This patch makes the following changes.
>> 1. Add util-linux-agetty as a runtime dependency.
>>     Otherwise, getty services in systemd cannot start correctly.
> afais, it would make more sense to move this dependency into
> systemd-serialgetty (and not systemd as in your patch). Or are there
> other units in systemd which call agetty?

There are other units that use getty.  OE's systemd has a patch to use 
getty not agetty but for some reason console-getty is not one of the 
units patched (maybe the unit was created after the patch was made); 
that probably needs to be reviewed.  There is at least one other oe-core 
provider of getty (viz. mingetty); at one point it was important to use 
one of them (I forget which) on gumstix Overo boards.

Peter


