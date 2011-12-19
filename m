Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Rcckz-0007EA-EC for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 13:55:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RcceC-000656-Cb for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 13:48:52 +0100
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 13:48:52 +0100
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 13:48:52 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Mon, 19 Dec 2011 16:47:10 +0400
Message-ID: <4EEF324E.8060203@gmail.com>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
	<5C0105D4-44BE-4584-9ED9-36970B91A34C@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:8.0) Gecko/20111109 Icedove/8.0
In-Reply-To: <5C0105D4-44BE-4584-9ED9-36970B91A34C@dominion.thruhere.net>
Cc: Koen Kooi <public-koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@lo.gmane.org>
Subject: Re: [PATCH 1/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Mon, 19 Dec 2011 12:55:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/2011 12:13 AM, Koen Kooi wrote:
>
> Op 18 dec. 2011, om 20:47 heeft Dmitry Eremin-Solenikov het volgende geschreven:
>
>> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
>> separate task from do_deploy. This way the do_install task can also
>> benefit from generated uImage.
>>
>> The only major feature of oe-core's version (not to recreate uImage
>> if it exists) is retained in this patch.
>
> I still don't agree with that behaviour. The in-kernel uImage code is just like the in-kernel defconfigs: useless for people who aren't kernel developers.

Koen, that was addressed with KERNEL_RECREATE_UIMAGE variable.
Probably I should document it somewhere (in the commit message?
documentation.conf? smwh. else?). Would you agree with this patch + docs?

>
>> On the contra, as this version
>> was merged from meta-oe/org.oe.dev, new function has another feature:
>> it permits overriding the u-boot entrypoint via u-boot symbol.
>
> No it doesn't, since it doesn't recreate uImage.

It does.

BTW: I don't have much experience of uImage usage on ARM SoCs (I used
them only on Atmel boards, where things usually 'just worked' regarding 
Kernel load address & Ko). On PowerPC I also didn't have too much 
problems with upstream kernels (both from Linus'es tree and from 
Freescale's one).

I understand your concern, that for your tasks, you have to recreate 
uImage using your sane values. However for some people sane values are 
ones present in upstream tree. Moreover, if you care about history, it 
was specially changed in oe-core not to recreate uImage, as it caused 
problems for some of the users.

-- 
With best wishes
Dmitry



