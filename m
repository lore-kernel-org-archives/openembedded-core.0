Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id D9F1171951
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 07:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id AD9AE31A5D75;
	Wed, 12 Oct 2016 09:31:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Dero9zpbQx7G; Wed, 12 Oct 2016 09:31:00 +0200 (CEST)
Received: from [172.22.22.61] (55d4421b.access.ecotel.net [85.212.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0902B31A5D7B;
	Wed, 12 Oct 2016 09:30:59 +0200 (CEST)
To: Christopher Larson <clarson@kergoth.com>,
	Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
References: <1476120925-26574-1-git-send-email-jkrishnanjanappa@mvista.com>
	<defce586-6033-baed-bf70-bdbe1659922c@opendreambox.org>
	<CAD3vsf5zv87RLAN70WF06Jxr1qq2=5-ctDekdA_0o1Cr1nmBhQ@mail.gmail.com>
	<CABcZANkt+TbuEkTCGmqEQZG+Nw+MardZR4Jj+9FNDXFHbZysEg@mail.gmail.com>
	<CAD3vsf6muVV_NNP=rTGNo-4gMz_Q0SNojJ-qJui8_j9eW-gmZQ@mail.gmail.com>
	<CABcZANnDjD7MAU-8EU1CmRxZKDAZtB3E6JHiPCwo1q77oNjc1A@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <f31d192a-c54f-6aa2-be9b-beeb4bdd4462@opendreambox.org>
Date: Wed, 12 Oct 2016 09:30:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CABcZANnDjD7MAU-8EU1CmRxZKDAZtB3E6JHiPCwo1q77oNjc1A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: get the correct network interface name from dmesg during NFS booting
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
X-List-Received-Date: Wed, 12 Oct 2016 07:31:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Chistopher,

On 11.10.2016 21:34, Christopher Larson wrote:
> 
> On Tue, Oct 11, 2016 at 12:03 PM, Jagadeesh Krishnanjanappa
> <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>> wrote:
> 
>     On Tue, Oct 11, 2016 at 9:06 PM, Christopher Larson
>     <clarson@kergoth.com <mailto:clarson@kergoth.com>> wrote:
> 
> 
>         On Tue, Oct 11, 2016 at 5:11 AM, Jagadeesh Krishnanjanappa
>         <jkrishnanjanappa@mvista.com
>         <mailto:jkrishnanjanappa@mvista.com>> wrote:
> 
>             Thanks for reviewing the patch.
> 
> 
>                 I think this is too fragile to land in OE-Core. What
>                 happens if a
>                 network driver prints "device=eth0"? Or if other kernel
>                 messages make
>                 the string disappear from dmesg and connman gets
>                 restarted later?
> 
>              
>             True. If device=eth0 gets disappeared/corrupted, then we may
>             have problem.
> 
> 
>                 FWIW, I'm attaching my current wrapper script for
>                 connmand. I don't
>                 think it's perfect, but at least it doesn't depend on
>                 any init manager
>                 and works across restarts.
> 
>             The wrapper script attached by you, takes care of the
>             missing scenarios. Seems to be more complete.
> 
>                  
> 
>                 Add these lines to connman's do_install, in case you'd
>                 like to test
>                 and/or submit it:
> 
>                 mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real
>                 install -m 755 ${WORKDIR}/connmand-nfsroot.in
>                 <http://connmand-nfsroot.in> ${D}${sbindir}/connmand
>                 sed -e 's,@sbindir@,${sbindir},g' -i ${D}${sbindir}/connmand
> 
>             I think it would be good idea to integrate your changes into
>             the already existing OE-core's connman script, instead of a
>             calling original connman script from the wrapper script.
> 
> 
>         I threw
>         together https://github.com/openembedded/openembedded-core/compare/master...kergoth:connman-systemd-nfs
>         <https://github.com/openembedded/openembedded-core/compare/master...kergoth:connman-systemd-nfs> last
>         night, only limited testing. I think using a script in
>         libexecdir is rather cleaner than wrapping connmand in place,
>         for something like this, personally.
> 
>      
>     In the above commit,  the last line of connman/connman/start-connman
>     file, should be exec @SBINDIR@/connmand "$@" instead of exec
>     @SBINDIR@/connman "$@" ; as the actual binary file name is connmand.
> 
> 
> Thanks, didn’t notice that. Obviously it needs polish and testing before
> submission, I mainly linked it to solicit thoughts on the approach :)

your proposal adds some complexity to the recipe, which I tried to
avoid, because this wrapper script is something we'll probably have to
maintain forever.

For example, your recipe might break without notice if upstream is going
to ship another binary as ${sbindir}/connmand-something in the future;
or if upstream decides to change the systemd unit to use a variable
instead of a hardcoded path to connmand.

Besides that, I don't have a strong opinion on the location of the
wrapper script.

Regards,
Andreas

