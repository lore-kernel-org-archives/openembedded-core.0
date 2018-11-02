Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 634176074F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 15:43:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wA2FhAvI003325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 2 Nov 2018 15:43:11 GMT
Message-ID: <8897ab754bea0fda7195a851b2d19695dd7553e9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>
Date: Fri, 02 Nov 2018 15:43:10 +0000
In-Reply-To: <8ba204af82c54d23805deefb5197dd6f@XBOX04.axis.com>
References: <20181102143927.15387-1-matthias.schiffer@ew.tq-group.com>
	<8ba204af82c54d23805deefb5197dd6f@XBOX04.axis.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: avoid 'find -ignore_readdir_race	-delete'
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
X-List-Received-Date: Fri, 02 Nov 2018 15:43:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-11-02 at 15:19 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of
> > matthias.schiffer@ew.tq-group.com
> > Sent: den 2 november 2018 15:39
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] base.bbclass: avoid 'find -
> > ignore_readdir_race -delete'
> > 
> > From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > 
> > Until recent versions of findutils, -ignore_readdir_race did not
> > work
> > correctly with -delete. This led to spurious build failures when
> > files
> > disappeared; specifically this was seen due to do_configure and
> > do_populate_lic running concurrently for packages with ${B} ==
> > ${WORKDIR}:
> > 
> >    find: '.../sstate-build-populate_lic': No such file or directory
> > 
> > As the find command of the host system is used here, we can't
> > ensure that
> > the used version contains the fix. Work around the issue by passing
> > the
> > output of find to 'rm -f' instead of using -delete.
> > 
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com
> > >
> > ---
> > 
> > It would be great if this patch could be backported to all versions
> > back to Rocko, as our current setup is still based on Rocko.
> > 
> >  meta/classes/base.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index df11c8b270..5ffd8396e3 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -303,7 +303,7 @@ base_do_configure() {
> >  			if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile
> > -o -e makefile -o -e GNUmakefile \) ]; then
> >  				oe_runmake clean
> >  			fi
> 
> You might want to include a comment here explaining why rm -f is
> used instead of -delete, or someone might come along and optimize the
> code...

We should detail which versions of findutils have the issue as
ultimately it would be nice to use the simpler command. I'm curious how
many of the distros we support have the problem.

Cheers,

Richard


