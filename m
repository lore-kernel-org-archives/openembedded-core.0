Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBk7e-0007le-NI
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:47:54 +0200
Received: by fxm19 with SMTP id 19so3296379fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=QxRhfSJSRyOVA1l9NSO+7MxVxrG9bhDTwF8k5b2gygk=;
	b=iPpFdp/VwSBVRfcCFeP/UisK4zQyUfSGZuzf1aziiwPu37hOtVpahiqG77MMBRTnjQ
	rHhz6X8uDnO1TEGyXAoM6IRdc5nxUhoaVhbCqANE6dNHpNZyNtb49wQCi0uj54DkRma6
	J4bGLq+LxMuyUlk1zjNNuzQmlc8fplAhbEZtQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=t3I92UvKBNGEC5ZYB+b1ThS6h5T/TmrTt//0lV1yzaYdelM7Lsj8Th+Nhr5eV4HwsM
	/fduWnd8AiYFIT1d68lpnYRsIJGibv16nBL3NZV+bk9g4XfRd6z0VBb+YL2ZfUlkBlqW
	FHSdkmwUKwPD3klezjEA5RF4G84BGUGAAntOA=
Received: by 10.223.97.142 with SMTP id l14mr4719236fan.111.1303116327650;
	Mon, 18 Apr 2011 01:45:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b18sm1585727fak.32.2011.04.18.01.45.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 01:45:26 -0700 (PDT)
Date: Mon, 18 Apr 2011 10:45:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110418084520.GB24192@jama.jama.net>
References: <cover.1303113405.git.Martin.Jansa@gmail.com>
	<f78273c64ab21b1a0691585a2140d5fdf24f3f3a.1303113405.git.Martin.Jansa@gmail.com>
	<1303115695.5518.70.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1303115695.5518.70.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/4] task-base: allow distribution to define apm provider
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
X-List-Received-Date: Mon, 18 Apr 2011 08:47:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 18, 2011 at 09:34:55AM +0100, Richard Purdie wrote:
> On Mon, 2011-04-18 at 10:00 +0200, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/tasks/task-base.bb |    5 ++++-
> >  1 files changed, 4 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
> > index 138e617..10f3af4 100644
> > --- a/meta/recipes-core/tasks/task-base.bb
> > +++ b/meta/recipes-core/tasks/task-base.bb
> > @@ -179,8 +179,11 @@ RDEPENDS_task-base-acpi = "\
> >      acpid \
> >      libacpi "
> >  
> > +# Distro can override apm provider
> > +DISTRO_APM ?= "apm"
> > +
> >  RDEPENDS_task-base-apm = "\
> > -    apm \
> > +    ${DISTRO_APM} \
> >      apmd"
> 
> Can you explain a little more about why a distro would do this please?
> I'm a little worried this whole file could become a set of DISTRO_*
> variables :/.
> 
> Cheers,
> 
> Richard

For example in SHR we're using FSO which provides apm replacement called fso-apm which 
conflicts with standard apm.

We can rename it to VIRTUAL-RUNTIME_apm (like
VIRTUAL-RUNTIME_update-alternatives) if you prefer such namespace.

Cheers,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


