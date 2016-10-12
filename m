Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id C411960190
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 07:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id C85A931A58BF;
	Wed, 12 Oct 2016 09:00:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id hpJ98kwA8mfd; Wed, 12 Oct 2016 09:00:18 +0200 (CEST)
Received: from [172.22.22.61] (55d4421b.access.ecotel.net [85.212.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BBB7531A5D3D;
	Wed, 12 Oct 2016 09:00:17 +0200 (CEST)
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
References: <1476120925-26574-1-git-send-email-jkrishnanjanappa@mvista.com>
	<defce586-6033-baed-bf70-bdbe1659922c@opendreambox.org>
	<CAD3vsf5zv87RLAN70WF06Jxr1qq2=5-ctDekdA_0o1Cr1nmBhQ@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <7e33af3a-b88b-fc8f-32d1-3f743fea2ac3@opendreambox.org>
Date: Wed, 12 Oct 2016 09:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAD3vsf5zv87RLAN70WF06Jxr1qq2=5-ctDekdA_0o1Cr1nmBhQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 07:00:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Jagadeesh,

On 11.10.2016 14:11, Jagadeesh Krishnanjanappa wrote:
> Hi Andreas,
> 
> Thanks for reviewing the patch.
> 
> 
>     I think this is too fragile to land in OE-Core. What happens if a
>     network driver prints "device=eth0"? Or if other kernel messages make
>     the string disappear from dmesg and connman gets restarted later?
> 
>  
> True. If device=eth0 gets disappeared/corrupted, then we may have problem.
> 
> 
>     FWIW, I'm attaching my current wrapper script for connmand. I don't
>     think it's perfect, but at least it doesn't depend on any init manager
>     and works across restarts.
> 
> The wrapper script attached by you, takes care of the missing scenarios.
> Seems to be more complete.
> 
>      
> 
>     Add these lines to connman's do_install, in case you'd like to test
>     and/or submit it:
> 
>     mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real
>     install -m 755 ${WORKDIR}/connmand-nfsroot.in
>     <http://connmand-nfsroot.in> ${D}${sbindir}/connmand
>     sed -e 's,@sbindir@,${sbindir},g' -i ${D}${sbindir}/connmand
> 
> I think it would be good idea to integrate your changes into the already
> existing OE-core's connman script, instead of a calling original connman
> script from the wrapper script.

please keep in mind that you'd need to implement the same logic for systemd.

Considering that the execution of connman on nfsroots without
appropriate parameters immediately hangs the system, a wrapper script
offers an additional level of protection compared to an init script or
systemd unit, especially for people debugging connman.

Regards,
Andreas

> 
> Regards,
> Jagadeesh
> 
>     >
>     > Signed-off-by: Jagadeesh Krishnanjanappa
>     <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>>
>     > ---
>     >  meta/recipes-connectivity/connman/connman/connman | 35
>     +++++++++++++----------
>     >  1 file changed, 20 insertions(+), 15 deletions(-)
>     >
>     > diff --git a/meta/recipes-connectivity/connman/connman/connman
>     b/meta/recipes-connectivity/connman/connman/connman
>     > index c64fa0d..aae2ca6 100644
>     > --- a/meta/recipes-connectivity/connman/connman/connman
>     > +++ b/meta/recipes-connectivity/connman/connman/connman
>     > @@ -29,23 +29,28 @@ done
>     >  do_start() {
>     >       EXTRA_PARAM=""
>     >       if test $nfsroot -eq 1 ; then
>     > -         NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9
>     ]*\):.*$/\1/p'`
>     > -         NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^
>     :]*\).*$/\1/p'`
>     > +         ethn_from_dmesg=`dmesg | grep "device="| sed
>     "s|\(.*\)device=\(.*\), hwaddr=\(.*\)|\2|g"`
>     > +         if [ ! -z "$ethn_from_dmesg" ]; then
>     > +             EXTRA_PARAM="-I $ethn_from_dmesg"
>     > +         else
>     > +             NET_DEVS=`cat /proc/net/dev | sed -ne
>     's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
>     > +             NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^
>     :]*\).*$/\1/p'`
>     >
>     > -         if [ ! -z "$NET_ADDR" ]; then
>     > -             if [ "$NET_ADDR" = dhcp ]; then
>     > -                 ethn=`ifconfig | grep "^eth" | sed -e
>     "s/\(eth[0-9]\)\(.*\)/\1/"`
>     > -                 if [ ! -z "$ethn" ]; then
>     > -                     EXTRA_PARAM="-I $ethn"
>     > -                 fi
>     > -             else
>     > -                 for i in $NET_DEVS; do
>     > -                     ADDR=`ifconfig $i | sed 's/addr://g' | sed
>     -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
>     > -                     if [ "$NET_ADDR" = "$ADDR" ]; then
>     > -                         EXTRA_PARAM="-I $i"
>     > -                         break
>     > +             if [ ! -z "$NET_ADDR" ]; then
>     > +                 if [ "$NET_ADDR" = dhcp ]; then
>     > +                     ethn=`ifconfig | grep "^eth" | sed -e
>     "s/\(eth[0-9]\)\(.*\)/\1/"`
>     > +                     if [ ! -z "$ethn" ]; then
>     > +                         EXTRA_PARAM="-I $ethn"
>     >                       fi
>     > -                 done
>     > +                 else
>     > +                     for i in $NET_DEVS; do
>     > +                         ADDR=`ifconfig $i | sed 's/addr://g' |
>     sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
>     > +                         if [ "$NET_ADDR" = "$ADDR" ]; then
>     > +                             EXTRA_PARAM="-I $i"
>     > +                             break
>     > +                         fi
>     > +                     done
>     > +                 fi
>     >               fi
>     >           fi
>     >       fi
>     >
> 
> 
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 


