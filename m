Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 30B7A71998
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Oct 2016 14:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6A4F131A5B25;
	Sat,  8 Oct 2016 16:41:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id nblhZm3O9Svh; Sat,  8 Oct 2016 16:41:08 +0200 (CEST)
Received: from [172.22.22.61] (55d459eb.access.ecotel.net [85.212.89.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id A3D1831A5B23;
	Sat,  8 Oct 2016 16:41:07 +0200 (CEST)
To: Phil Blundell <pb@pbcl.net>,
	Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1475676667-24280-1-git-send-email-markus.lehtonen@linux.intel.com>
	<b32b7b2f-68cc-31d6-d687-2eeb12aa196a@opendreambox.org>
	<1475743775.13655.55.camel@linux.intel.com>
	<1475748742.16008.29.camel@pbcl.net>
	<1475761616.13655.59.camel@linux.intel.com>
	<1475766778.3605.22.camel@pbcl.net>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <c3ab9601-fa2a-1589-ebc8-d0444dca83c0@opendreambox.org>
Date: Sat, 8 Oct 2016 16:41:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475766778.3605.22.camel@pbcl.net>
Subject: Re: [PATCH] update-rc.d.bbclass: check that init script exists before running it
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
X-List-Received-Date: Sat, 08 Oct 2016 14:41:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06.10.2016 17:12, Phil Blundell wrote:
> On Thu, 2016-10-06 at 16:46 +0300, Markus Lehtonen wrote:
>>
> It was moved to prerm earlier to fix some other problems:
>> http://git.openembedded.org/openembedded-core/commit/meta/classes/upd
>> ate-al
>> ternatives.bbclass?id=2a5484a90513b58c829a916bfe5268a0fde3512a
> 
> The commit message for that checkin is a bit vague about exactly what
> problem it was solving.  It mentions that it "fixes deinstalling
> alternatives for programs needed by the postrm script, e.g. /bin/sh"
> but it's rather hard to see how that actually works.  If postrm
> requires /bin/sh and prerm has deleted it then it's not obvious how
> this is an improvement.

Sorry for the bad commit message back then.

If you had both busybox and bash installed and had /bin/sh pointing to
bash, then uninstalling bash failed, because the postrm script was
started with a dangling symlink of /bin/sh.

The commit cited above fixes it, because when the prerm script finishes,
/bin/sh will point to busybox, thus letting the postrm script of bash
succeed.

> 
>> So I think moving it back and forth between prerm and postrm doesn't
>> get us
>> anywhere :)
> 
> That is a fair point, though I am not entirely convinced that the
> commit you mentioned above is the correct solution to whatever problem
> it thinks it's solving.
> 
> As it stands, with both things in prerm, you will get essentially
> random behaviour depending on the order in which the two classes (u-
> rc.d and u-a) are inherited by the recipe.  If u-a comes first then u-
> rc.d will not be able to run the "stop" script (and the services will
> not be stopped on package uninstallation), and vice versa.
> 
> So maybe these two classes just need to be taught to play together
> better.

I think having update-alternatives manage an initscript is already a bug
on its own. I haven't seen such a thing in debian or anywhere else
before. Update-alternatives usually creates symlinks for programs which
can be installed side-by-side. If two system services provide the same
functionality, I guess the packages should better conflict with each
other or at least have different initscript names (like apache2 and
lighttpd for example), so they can both be started with adjusted
configurations (e.g. using different tcp ports).

Regards,
Andreas

