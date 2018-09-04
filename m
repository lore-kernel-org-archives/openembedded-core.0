Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AE1997550F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 11:19:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w84BJTZG024269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 4 Sep 2018 12:19:30 +0100
Message-ID: <57b7ac2a8b41e1c54460989cd27231330bb6cc33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Robert Yang
	<liezhi.yang@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Sep 2018 12:19:29 +0100
In-Reply-To: <8db3e1637d3c4714aa90df95492b2f84@XBOX02.axis.com>
References: <cover.1536042978.git.liezhi.yang@windriver.com>
	<ea8e96b3f2b09db17ecf9a28765b709433febe9b.1536042978.git.liezhi.yang@windriver.com>
	<8db3e1637d3c4714aa90df95492b2f84@XBOX02.axis.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] bitbake.conf: Make BUILD_OPTIMIZATION respect	to DEBUG_BUILD
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
X-List-Received-Date: Tue, 04 Sep 2018 11:19:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-09-04 at 08:15 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Robert Yang
> > Sent: den 4 september 2018 08:37
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 1/1] bitbake.conf: Make
> > BUILD_OPTIMIZATION
> > respect to DEBUG_BUILD
> > 
> > We may also need debug native tools, so make BUILD_OPTIMIZATION
> > respect to
> > DEBUG_BUILD, otherwise, we need set CFLAGS in the recipe which
> > isn't
> > convenient.
> > 
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 1941633..df62445 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -612,7 +612,7 @@ FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
> >  DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS}
> > -pipe"
> >  SELECTED_OPTIMIZATION = "${@d.getVar(['FULL_OPTIMIZATION',
> > 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD') == '1'])}"
> >  SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION
> > DEBUG_OPTIMIZATION"
> > -BUILD_OPTIMIZATION = "-O2 -pipe"
> > +BUILD_OPTIMIZATION = "${@['-O2', '-O -g -feliminate-unused-debug-
> > types -fno-omit-frame-pointer'][d.getVar('DEBUG_BUILD') == '1']}
> > -pipe"
> 
> Can we make that more readable:
> 
> BUILD_OPTIMIZATION = "${@'-O -g -feliminate-unused-debug-types -fno-
> omit-frame-pointer' if d.getVar('DEBUG_BUILD') == '1' else '-O2'}
> -pipe"
> 
> Should probably do the same for SELECTED_OPTIMIZATION while at it:
> 
> SELECTED_OPTIMIZATION = "${@d.getVar('DEBUG_OPTIMIZATION' if
> d.getVar('DEBUG_BUILD') == '1' else 'FULL_OPTIMIZATION')}"

If we're going to deal with readability and usability we could add
something like:

def vartrue(var, iftrue, iffalse, d):
    if oe.types.boolean(d.getVar(var)):
        return iftrue
    else:
        return iffalse

to lib/oe/utils and then:

BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-O -g -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)}"

Cheers,

Richard


