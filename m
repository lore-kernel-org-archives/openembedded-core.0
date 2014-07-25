Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 47C4F70870
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 18:35:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6PIXVO1003601; Fri, 25 Jul 2014 19:35:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4yIpAV5pG29k; Fri, 25 Jul 2014 19:35:34 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6PIZVoL003623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 25 Jul 2014 19:35:32 +0100
Message-ID: <1406313325.27697.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Fri, 25 Jul 2014 19:35:25 +0100
In-Reply-To: <53D2930C.8090709@mlbassoc.com>
References: <cover.1406085105.git.hongxu.jia@windriver.com>
	<d36bfea1e3c7402098ff8913d473900c8b11eb71.1406085105.git.hongxu.jia@windriver.com>
	<53D2930C.8090709@mlbassoc.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane: add checking to standardize how .bbappend files do FILESEXTRAPATHS
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
X-List-Received-Date: Fri, 25 Jul 2014 18:35:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-25 at 11:25 -0600, Gary Thomas wrote:
> On 2014-07-22 21:33, Hongxu Jia wrote:
> > When adding patches or config files from bbappend files, it requires
> > the use of FILESEXTRAPATHS, which has been an issue and failure point
> > for people starting to work with bitbake and oe-core.
> >
> > We add checking to standardize how to use FILESEXTRAPATHS. Only the
> > format of:
> >    FILESEXTRAPATHS_append := ":${THISDIR}/Your_Files_Path" or
> >    FILESEXTRAPATHS_prepend := "${THISDIR}/Your_Files_Path:"
> > is acceptable.
> >
> > [YOCTO #5412]
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >   meta/classes/insane.bbclass | 13 +++++++++++++
> >   meta/classes/utils.bbclass  |  2 ++
> >   meta/conf/bitbake.conf      |  2 ++
> >   3 files changed, 17 insertions(+)
> >
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index b26216e..6b1c9ad 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -1022,6 +1022,19 @@ python () {
> >       # Check various variables
> >       ###########################################################################
> >
> > +    # Checking ${FILESEXTRAPATHS}
> > +    extrapaths = (d.getVar("FILESEXTRAPATHS", True) or "")
> > +    if '__default' not in extrapaths.split(":"):
> > +        msg = "FILESEXTRAPATHS-variable, must always use _prepend (or _append)\n"
> > +        msg += "type of assignment, and don't forget the colon.\n"
> > +        msg += "Please assign it with the format of:\n"
> > +        msg += "  FILESEXTRAPATHS_append := \":${THISDIR}/Your_Files_Path\" or\n"
> > +        msg += "  FILESEXTRAPATHS_prepend := \"${THISDIR}/Your_Files_Path:\"\n"
> > +        msg += "in your bbappend file\n\n"
> > +        msg += "Your incorrect assignment is:\n"
> > +        msg += "%s\n" % extrapaths
> > +        bb.fatal(msg)
> 
> It sure would have been nice (even polite?) to make this a warning when first
> added.  As is, it's going to break a lot of builds and it will be very tedious
> to fix since the parser will die on the first one it finds :-(

Agreed, I'll change this to a warning.

Cheers,

Richard


