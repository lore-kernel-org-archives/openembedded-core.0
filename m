Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BF68C60F50
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 10:45:08 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1Aj4Gl027143; Fri, 1 Nov 2013 10:45:04 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yOMVfv04cFAO; Fri,  1 Nov 2013 10:45:04 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1Aiv1h027130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Nov 2013 10:44:59 GMT
Message-ID: <1383302692.25877.135.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>
Date: Fri, 01 Nov 2013 10:44:52 +0000
In-Reply-To: <526FAB30.9070600@windriver.com>
References: <cover.1380189657.git.Qi.Chen@windriver.com>
	<936abdfba1f8b3edf2f5dbfc6be803354798c4d2.1380189657.git.Qi.Chen@windriver.com>
	<526FAB30.9070600@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] sysvinit: fix missing of boot log
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
X-List-Received-Date: Fri, 01 Nov 2013 10:45:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-10-29 at 20:33 +0800, ChenQi wrote:
> ping
> 
> Any comment on this one?

Yes, shouldn't the boot ordering be tweaked to ensure the tmpfs is
available rather than force mounting it within this init script? This
looks like a hack around the problem rather than fixing a real issue.

The -c part is ok so please resend without the mount.

Cheers,

Richard


> Best Regards,
> Chen Qi
> 
> On 09/26/2013 06:02 PM, Qi.Chen@windriver.com wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> >
> > Previously, our system had no boot log even if the bootlogd daemon was
> > started correctly. The root cause is that the log file doesn't exist
> > when starting the bootlogd.
> >
> > Add '-c' option to bootlogd so that it will create the boot log if
> > it doesn't exist.
> >
> > Besides, we need to make sure that tmpfs has been mounted. Otherwise,
> > the boot log will still be missing.
> >
> > [YOCTO #5273]
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >   meta/recipes-core/sysvinit/sysvinit/bootlogd.init |    5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
> > index 7b87827..3a10a3c 100755
> > --- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
> > +++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
> > @@ -42,14 +42,15 @@ esac
> >   
> >   case "$ACTION" in
> >   	start)
> > +		mount -a -t tmpfs 2>/dev/null
> >   		echo -n "Starting $DESC: "
> >   		if [ -d /proc/1/. ]
> >   		then
> >   			umask 027
> >   			start-stop-daemon --start --quiet \
> > -				--exec $DAEMON -- -r
> > +				--exec $DAEMON -- -r -c
> >   		else
> > -			$DAEMON -r
> > +			$DAEMON -r -c
> >   		fi
> >   		echo "$NAME."
> >   		;;
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



