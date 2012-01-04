Received: from out5.smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1RiGfd-00076G-9L
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 03:33:41 +0100
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 4878320E62
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2012 21:20:45 -0500 (EST)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute5.internal (MEProxy); Tue, 03 Jan 2012 21:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:date:in-reply-to
	:references:content-type:content-transfer-encoding:message-id
	:mime-version; s=smtpout; bh=eUMejAfFHWk/WtrcdPnikw636Z8=; b=ev+
	jH8xF1ZaaX8nHrcbH8QxbL+vTHcpTV2Kd5pdrHxb3kr0RXp3hv3l8jwEimBbgktt
	O9wdpMZcWWfdY6RZp+g7KoUkguCqXGWeGlpmeLWEvSPtYc2yOeQN8OaWC8iKzQuH
	HIRaa3X8HNPPFe+ufZ9Rw0vROnjQY4ED4/P97Yek=
X-Sasl-enc: W1njpsTqtsGZ4bmH91wdhyP9eky4SZpl1ud9ow9A2zSu 1325643645
Received: from [192.168.1.6] (c-65-96-60-117.hsd1.ct.comcast.net
	[65.96.60.117])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0AAC948255E;
	Tue,  3 Jan 2012 21:20:45 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 03 Jan 2012 21:20:27 -0500
In-Reply-To: <4F03A316.2070305@linux.intel.com>
References: <1325634627.24646.0.camel@lenny> <4F03A316.2070305@linux.intel.com>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1325643628.24646.13.camel@lenny>
Mime-Version: 1.0
Cc: poky <poky@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH] flex/bison: Don't hardcode M4 path
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
X-List-Received-Date: Wed, 04 Jan 2012 02:33:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-03 at 16:53 -0800, Saul Wold wrote:
> > The flex and bison configure scripts use AC_PATH_PROG to get a
> > full path to m4 and embed this in config.h (and then to the
> > generated binary), but this blows up when the m4 binary is in a
> > temporary staging directory.
> >
> > Since we are always shipping GNU m4, just set M4=m4 at configure
> > time so we don't use a hardcoded path.
> >
> > This is an equivalent to what already exists in autoconf.bb.
> >
> >
> This should really be posted to openembedded-core@lists.openembedded.org.

I CC'd, hopefully won't be rejected as I'm not yet a subscriber.

> Don't you loose the setting of BISON_PKGDATADIR in this case?  Does that 
> need to be poart of the EXTRA_OECONF?

Good catch - I'll double check, but I doubt it's necessary.  From the
bison source:

char const *
compute_pkgdatadir (void)
{
  char const *pkgdatadir = getenv ("BISON_PKGDATADIR");
  return pkgdatadir ? pkgdatadir : PKGDATADIR;
}

For us though PKGDATADIR should be enough I think.





