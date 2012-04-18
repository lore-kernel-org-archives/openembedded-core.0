Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jonas.danielsson@lundinova.se>) id 1SKbct-0003GQ-1c
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 22:37:19 +0200
Received: from jkd-desktop (unknown [10.240.22.76])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mailhost.lundinova.se (Postfix) with ESMTP id AD2F2B94016
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 22:27:50 +0200 (CEST)
Date: Wed, 18 Apr 2012 22:27:49 +0200
From: Jonas Danielsson <jonas.danielsson@lundinova.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120418202749.GA7480@jkd-desktop>
References: <1334765562-27101-1-git-send-email-jonas.danielsson@lundinova.se>
	<1334768201.24091.152.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1334768201.24091.152.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] opkg-utils: extend to nativesdk
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
X-List-Received-Date: Wed, 18 Apr 2012 20:37:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 18, 2012 at 05:56:41PM +0100, Richard Purdie wrote:
> On Wed, 2012-04-18 at 18:12 +0200, Jonas Danielsson wrote:
> > Signed-off-by: Jonas Danielsson <jonas.danielsson@lundinova.se>
> > ---
> >  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > index 4fe4038..eb42eae 100644
> > --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> >                      file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
> >  RDEPENDS_${PN} = "python"
> >  RDEPENDS_${PN}_virtclass-native = ""
> > +RDEPENDS_${PN}_virtclass-nativesdk = "python-nativesdk"
>
> Doesn't this happen automatically?
>

I am not a terribly experienced oe developer so I had an hard time figuring
that out :) Maybe someone here can help me with it.

When I did not have it and did 'bitbake -g opkg-utils-nativesdk' then
used grep on the resulting pn-depends.dot file I got:
"opkg-utils-nativesdk" -> "python" [style=dashed]

And doing the same procedure without it I got:
"opkg-utils-nativesdk" -> "python-nativesdk" [style=dashed]

But my toolchain works either way because python-nativesdk gets in
through: "gdb-cross-canadian-arm" -> "python-nativesdk"

So I'm not sure, is it needed or not?

> >  SRCREV = "16665959c330b5958c0f0f4624a9ca7f823f98de"
> >  PV = "0.1.8+git${SRCPV}"
> >  PR = "r1"
> > @@ -27,5 +28,5 @@ do_install() {
> >     oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> >  }
> >
> > -BBCLASSEXTEND = "native"
> > +BBCLASSEXTEND = "native nativesdk"
> >  TARGET_CC_ARCH += "${LDFLAGS}"
>
> Cheers,
>
> Richard
>

Thanks!
Jonas

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



