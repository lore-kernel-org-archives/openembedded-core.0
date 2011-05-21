Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNaQk-0002Iq-VM
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 02:52:35 +0200
Received: by pvc30 with SMTP id 30so1955567pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 17:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=YjHGiN19bNLqwpan2vhuNU++rBsBdTnioVelF9n4Nig=;
	b=ELZZ072RZsRQ9sWPW5fLBfVLT/OndTy4SRaH+GCJB0TDv+ODR/avnW0Zlg0hP7m2Zn
	KfWJfJ/z3yj90PcJ/riquYZuJlt5ARhKNPvPV8d2h/5Vu36rJNpJX8TirlCfQLGK/phP
	bYtJKT+tvcdPPsT1oT1faMan1F0cpTbc2IBNc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aKhhd+hX8koSdINuSbVKlQdb9oGvRiFkQrQHFITBR9VXEmJEj5iRvVi2t0V+UMsoum
	HwMv7umT7CmfjU2eWU3wlKGNJo51IuWZtgykvbTe74hqLpC8zr0eboKIZwwXipABAfr3
	MSVmQyNX66CrgQjnPN7lB+3EdTGz19Mtu8LHA=
Received: by 10.142.249.9 with SMTP id w9mr41731wfh.2.1305938975413;
	Fri, 20 May 2011 17:49:35 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x12sm3673503wfd.18.2011.05.20.17.49.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 17:49:34 -0700 (PDT)
Date: Fri, 20 May 2011 17:48:22 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110521004822.GA7533@sakrah.homelinux.org>
References: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
	<63425ea09b30c9cca10c25bc559ed6f22022c4b6.1305933509.git.raj.khem@gmail.com>
	<1305934302.3424.679.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1305934302.3424.679.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/2] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Sat, 21 May 2011 00:52:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/05/11 00:31), Richard Purdie wrote:
> On Fri, 2011-05-20 at 16:19 -0700, Khem Raj wrote:
> > We enable gtk/gnome in distcc that code uses loadavg()
> > a function unimplemented in uclibc. Therefore for uclibc
> > we disable gnome and gtk+ features in distcc
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/distcc/distcc_2.18.3.bb |   17 ++++++++++++-----
> >  1 files changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> > index 1f5c2af..a15858c 100644
> > --- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> > +++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> > @@ -6,7 +6,10 @@ LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> >  PR = "r6"
> >  
> > -DEPENDS = "avahi gtk+"
> > +DEPENDS = "avahi ${GTKDEP}"
> > +GTKDEP-libc-uclibc = ""
> > +GTKDEP = "gtk+"
> 
> return -ENOTTESTED;

OK I have refreshed it with typo fix in the pull request

> 
> ;-)
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


