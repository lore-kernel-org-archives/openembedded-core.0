Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C4CEE7868B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 15:09:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w11F9qMY008883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 1 Feb 2018 15:09:53 GMT
Message-ID: <1517497791.3090.50.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr Lewicki <piotr.lewicki@elfin.de>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 01 Feb 2018 15:09:51 +0000
In-Reply-To: <a7dc8b5e-b277-27c7-b879-4405c1bb04ac@elfin.de>
References: <8c548149-e116-4b1f-8bfc-86099ac32e93@elfin.de>
	<CAJTo0Lbb8jH_uyoiD4OsBgf8xsMOdz8a1CjCkoBmKmTwF_3q+g@mail.gmail.com>
	<a7dc8b5e-b277-27c7-b879-4405c1bb04ac@elfin.de>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: recipe using environment variable does not refresh / rebuild
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
X-List-Received-Date: Thu, 01 Feb 2018 15:09:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-02-01 at 16:00 +0100, Piotr Lewicki wrote:
> Hi Ross,
> Good idea, but I'm using gitlab to perform autobuilds and I want to
> set the variable there (the "ADD_UBOOT_TO_UPDATE" variable) so that
> it's propagated to the image recipe.
> I'm want to differentiate the image with and without u-boot only by
> setting this one environment variable and without additional mangling
> with local.conf.
> 
> If that's not possible- I'll use your idea with setting it in
> local.conf, but before that I'm trying to understand- why my recipe
> is not rebuilt?

It isn't rebuilt as bitbake isn't psychic!

Bitbake doesn't understand what anonymous python fragments do, so it
can't know that ADD_UBOOT_TO_UPDATE is being changed.

I have a suspicion that it might rebuild, *if* it knew it had to
reparse the recipe since it probably does know which tasks use that
variable. It doesn't know you're poking into BB_ORIGENV which you
really shouldn't be doing.

To make this work as you'd want, you could add ADD_UBOOT_TO_UPDATE to
BB_PRESERVE_ENV. That might be enough to cause it to re-parse each time
you change the value and in turn, if the tasks change based on that,
they might rebuild. I'd at least start there (and stop poking into
BB_ORIGENV).

Cheers,

Richard



