Return-Path: <damien.riegel@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2B746771B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 02:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 90E1A9C3053;
	Thu, 21 Jun 2018 22:35:58 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id FFb_S7elIcCp; Thu, 21 Jun 2018 22:35:57 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D05819C3557;
	Thu, 21 Jun 2018 22:35:57 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id VNalyb1Mr67x; Thu, 21 Jun 2018 22:35:57 -0400 (EDT)
Received: from workotop.localdomain (modemcable073.90-22-96.mc.videotron.ca
	[96.22.90.73])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id ACE879C3053;
	Thu, 21 Jun 2018 22:35:57 -0400 (EDT)
Date: Thu, 21 Jun 2018 22:35:56 -0400
From: Damien Riegel <damien.riegel@savoirfairelinux.com>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20180622023556.4mzxbx534yfo4kpm@workotop.localdomain>
References: <20180621203549.6187-1-damien.riegel@savoirfairelinux.com>
	<e3c72d4c-57bd-a444-43c8-0796939089d8@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e3c72d4c-57bd-a444-43c8-0796939089d8@windriver.com>
User-Agent: NeoMutt/20180512
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: quote SYSTEMD_SERVICE in prerm and postinst
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
X-List-Received-Date: Fri, 22 Jun 2018 02:35:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Jun 22, 2018 at 09:29:37AM +0800, ChenQi wrote:
> Hi Damien,
> 
> If some recipe has more than one unit file, this patch will cause problem
> for it.

That's a good point, let me see if I can come up with a solution that
addresses that.

Regards,
-- 
Damien

> 
> Best Regards,
> Chen Qi
> 
> 
> On 06/22/2018 04:35 AM, Damien Riegel wrote:
> > Systemd mount configuration file must have a name that match the mount
> > point directory they control. So for instance, if a mount file contains
> > 
> >      [Mount]
> >      ...
> >      Where=/mnt/my-data
> > 
> > The file must be named `mnt-my\x2ddata.mount`, or systemd will refuse to
> > honour it.
> > 
> > If this config file contains an [Install] section, it will silently fail
> > because the unit file is not quoted when systemctl is called. To fix
> > that, quote `${SYSTEMD_SERVICE}` in prerm and postinst hooks.
> > 
> > Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> > ---
> >   meta/classes/systemd.bbclass | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> > index 1b134322fb..589e73c855 100644
> > --- a/meta/classes/systemd.bbclass
> > +++ b/meta/classes/systemd.bbclass
> > @@ -34,10 +34,10 @@ if type systemctl >/dev/null 2>/dev/null; then
> >   		systemctl daemon-reload
> >   	fi
> > -	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
> > +	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} "${SYSTEMD_SERVICE}"
> >   	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
> > -		systemctl --no-block restart ${SYSTEMD_SERVICE}
> > +		systemctl --no-block restart "${SYSTEMD_SERVICE}"
> >   	fi
> >   fi
> >   }
> > @@ -51,10 +51,10 @@ fi
> >   if type systemctl >/dev/null 2>/dev/null; then
> >   	if [ -z "$D" ]; then
> > -		systemctl stop ${SYSTEMD_SERVICE}
> > +		systemctl stop "${SYSTEMD_SERVICE}"
> >   	fi
> > -	systemctl $OPTS disable ${SYSTEMD_SERVICE}
> > +	systemctl $OPTS disable "${SYSTEMD_SERVICE}"
> >   fi
> >   }
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

