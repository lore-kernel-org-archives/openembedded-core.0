Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.15726.1625262381724992700
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 14:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C820BE0005;
	Fri,  2 Jul 2021 21:46:18 +0000 (UTC)
Date: Fri, 2 Jul 2021 23:46:18 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Einar Gunnarsson <tolvupostur@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [update-rc.d][PATCH] update-rc.d: Fix enable/disable command
Message-ID: <YN+JKnHwZ1WCkArT@piout.net>
References: <168DFB55CCAE8B91.30759@lists.openembedded.org>
 <CABhNV22NUYR0EU4Dr4zPKoNPcEK-QcOPZNWaTe8fWsGZrJnKFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABhNV22NUYR0EU4Dr4zPKoNPcEK-QcOPZNWaTe8fWsGZrJnKFQ@mail.gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 02/07/2021 15:57:03+0200, Einar Gunnarsson wrote:
> I forgot the third error in this line:
> Links numbered 91 or higher will create a single digit link.
> 
> # update-rc.d -v  -n smack disable
> rename /etc/rc2.d/S91smack -> /etc/rc2.d/K9smack
> 
> I guess this fixes all three:
> 
> printf -v newnn "%02d" $((100-${oldnn#0}))
> 
> How do I resubmit a patch?
> 

Simply send the new patch with [PATCH v2] instead of [PATCH].

> 
> On Fri, 2 Jul 2021 at 15:10, Einar Gunnarsson via lists.openembedded.org
> <tolvupostur=gmail.com@lists.openembedded.org> wrote:
> 
> > $[] is a bashism and does not work on POSIX shells
> >
> > enable/disable on links numbered 08 and 09 gives the error:
> > 'bash: 100-08: value too great for base (error token is "08")'
> >
> > Signed-off-by: Einar Gunnarsson <tolvupostur@gmail.com>
> > ---
> >  update-rc.d | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/update-rc.d b/update-rc.d
> > index c9355d7..24ac752 100644
> > --- a/update-rc.d
> > +++ b/update-rc.d
> > @@ -114,7 +114,7 @@ renamelink()
> >          # or stop link to start link with a sequence number equal to the
> > difference of 100 minus the original sequence number.
> >         if ls ${etcd}${lev}.d/${oldstartstop}*${bn} >/dev/null 2>&1; then
> >                 oldnn=`basename ${etcd}${lev}.d/${oldstartstop}*${bn}|cut
> > -c2-3`
> > -               newnn=$[100-$oldnn]
> > +               newnn=$((100-${oldnn#0}))
> >                 [ $verbose -eq 1 ] && echo "rename
> > ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} ->
> > ${etcd}${lev}.d/${newstartstop}${newnn}${bn}"
> >                 if [ $notreally -eq 0 ];then
> >                         mv ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn}
> > ${etcd}${lev}.d/${newstartstop}${newnn}${bn}
> > --
> > 2.17.1
> >
> >
> > 
> >
> >
> 
> -- 
> Regards
> Einar Jón
> +31 610 957234

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
