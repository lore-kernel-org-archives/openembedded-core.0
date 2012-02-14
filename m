Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RxNwZ-0007dt-9X
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 20:21:39 +0100
Received: by pbcum15 with SMTP id um15so579833pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 11:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RnMTj8W4GsgS54qDHmkxoN/KqlL80fvYCEAzi+fF1yA=;
	b=GWfGEhvoCD//t7ktfzG/Yd99eK+Rvdi8zdW+9wcwqgMhvEpMyI2pmhCYEahWul5Z0U
	jEvfijJ+H1sSLMj4bhx67t5Sqc5hqgILI3daMETDt7XCKR8eFTUE5Phc8n3l6dT5v7R2
	FRMUdnAcIxF/QX+vF1Nq6wXhiDOucNJW4Ia8s=
Received: by 10.68.73.105 with SMTP id k9mr58833109pbv.121.1329246807721;
	Tue, 14 Feb 2012 11:13:27 -0800 (PST)
Received: from sakrah.homelinux.org ([108.60.121.129])
	by mx.google.com with ESMTPS id q8sm5277409pbi.1.2012.02.14.11.13.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Feb 2012 11:13:26 -0800 (PST)
Date: Tue, 14 Feb 2012 11:13:17 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120214191231.GA12087@sakrah.homelinux.org>
References: <1328832372.10451.47.camel@ted>
	<CAMKF1soksEad4TP5upRjW2vG6_OjeQjyYTAL88PH_qgy9yyiug@mail.gmail.com>
	<1328881254.13434.10.camel@ted>
	<20120211015834.GB2095@sakrah.homelinux.org>
	<1328977465.26671.0.camel@ted>
	<CA+chaQeSjRw_OTPauSx5YBbiLGdgfkMYGYi_0E3Me-QCPS+Q8Q@mail.gmail.com>
	<20120214185506.GA11340@sakrah.homelinux.org>
	<20120214190800.GC23843@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120214190800.GC23843@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gcc-4.6: Some small performance tweaks
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
X-List-Received-Date: Tue, 14 Feb 2012 19:21:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/02/12 20:08), Martin Jansa wrote:
> On Tue, Feb 14, 2012 at 10:55:06AM -0800, Khem Raj wrote:
> > On (14/02/12 13:16), Martin Jansa wrote:
> > > On Sat, Feb 11, 2012 at 5:24 PM, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Fri, 2012-02-10 at 17:58 -0800, Khem Raj wrote:
> > > >> On (10/02/12 13:40), Richard Purdie wrote:
> > > >> > On Thu, 2012-02-09 at 16:39 -0800, Khem Raj wrote:
> > > >> > > On Thu, Feb 9, 2012 at 4:06 PM, Richard Purdie
> > > >> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >> > > >
> > > >> > > > +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
> > > >> > >
> > > >> > >
> > > >> > > note that we will need to ship zlib-nativesdk as well if we do this
> > > >> > > so hopefully that case is covered by this.
> > > >> >
> > > >> > Yes, zlib has a BBCLASSEXTEND on zlib-nativesdk so this should be fine.
> > > >>
> > > >> OK and this is bundled with meta-toolchain too right ?
> > > >
> > > > By anything that depends on it by the shlibs code in the usual way, yes.
> > > 
> > > But zlib is build time dependency, isn't it?
> > 
> > yes it must be added to target gcc recipe
> > 
> > > 
> > > Now it fails to build target gcc because it depends only on
> > > zlib-native not target zlib and zlib.h is not found.
> > 
> > whats the exact error? usually zlib is needed for gcj. are you building
> > gcj ?
> 
> I don't have that log anymore, but I'm building default gcc
> configuration from oe-core/meta-oe (iirc without gcj) and IIRC it was
> from lto (gcc/lto-compress.c:#include <zlib.h>).


ah yes forgot lto :) and we do enable it so zlib dep is needed all the
time.


