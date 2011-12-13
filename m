Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RaRhX-000258-JA
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 13:43:19 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RaRas-0001Kt-AV
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 13:36:26 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 12:36:25 +0000
In-Reply-To: <1323779213.2731.63.camel@ted>
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>
	<1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>
	<1323779213.2731.63.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323779786.24417.140.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH v2] initscripts: fix timestamp check at bootmisc.sh
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
X-List-Received-Date: Tue, 13 Dec 2011 12:43:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 12:26 +0000, Richard Purdie wrote:
> On Tue, 2011-12-13 at 08:58 +0200, Lauri Hintsala wrote:
> >  # Set the system clock from hardware clock
> > -# If the timestamp is 1 day or more recent than the current time,
> > +# If the timestamp is more recent than the current time,
> >  # use the timestamp instead.
> >  /etc/init.d/hwclock.sh start
> >  if test -e /etc/timestamp
> >  then
> > -	SYSTEMDATE=`date  -u +%2m%2d%2H%2M%4Y`
> > -	read TIMESTAMP < /etc/timestamp
> > -        NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE + 10000 \)`
> > -        if [ $NEEDUPDATE -eq 1 ]; then 
> > -		date -u $TIMESTAMP
> > +	SYSTEMDATE=`date -u +%4Y%2m%2d`
> > +	TIMESTAMP=`cat /etc/timestamp | awk '{ print substr($0,9,4) substr($0,1,4); }'`
> > +	NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE \)`
> > +	if [ $NEEDUPDATE -eq 1 ]; then
> > +		date -u `cat /etc/timestamp`
> >  		/etc/init.d/hwclock.sh stop
> >  	fi
> >  fi
> 
> 
> For reference, the code in the boot process is trying not to cause
> fork/exec calls. This is why it does:
> 
> read TIMESTAMP < /etc/timestamp
> 
> since this is faster than forking to run cat. Could we fix this in a
> different way to avoid the fork/execs?

For the same reason it would probably be nice to replace that call to
"expr" (which was in the old version too) with a shell expansion.

p.




