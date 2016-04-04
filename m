Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 39A0360670
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 22:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u34MhYQc027163; Mon, 4 Apr 2016 23:43:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VjTlpM28m55P; Mon,  4 Apr 2016 23:43:33 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u34MhVtt027160
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 4 Apr 2016 23:43:32 +0100
Message-ID: <1459809810.7348.160.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>, Max
	Krummenacher <max.oss.09@gmail.com>
Date: Mon, 04 Apr 2016 23:43:30 +0100
In-Reply-To: <CALbNGRTBWN37Y5vfhVxChSkUSU49oGQv1x9iug-zpZ2epn--4A@mail.gmail.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
	<CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
	<1459724450.7348.146.camel@linuxfoundation.org>
	<CAMKF1spSnyYGJWZOG6vs8kW7y3JjZBo7J843jWhOZzq-RYCeww@mail.gmail.com>
	<CALbNGRS7NEOTpCdV+Y-ZFzwTk-k9w2DPV_t9_VMP_4J6zM5CaQ@mail.gmail.com>
	<CAEHkU3XvFjr8dCV48E7zvtWPDwJ1Vht=Q02MdM9C+KM0-N=s9g@mail.gmail.com>
	<CALbNGRTvQBVetdm7ty8RQLviYijSP0GadUNUUycAepYWX8iCjw@mail.gmail.com>
	<CALbNGRTBWN37Y5vfhVxChSkUSU49oGQv1x9iug-zpZ2epn--4A@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Mon, 04 Apr 2016 22:43:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-04-04 at 23:12 +0200, Andreas Müller wrote:
> On Mon, Apr 4, 2016 at 10:46 AM, Andreas Müller
> <schnitzeltony@googlemail.com> wrote:
> > On Mon, Apr 4, 2016 at 10:00 AM, Max Krummenacher <
> > max.oss.09@gmail.com> wrote:
> > > Hi Andreas
> > > 
> > > I guess Richard refers to this one:
> > > http://cgit.openembedded.org/openembedded-core/commit/meta/classe
> > > s/package.bbclass?h=master
> > > -next&id=ecb56a6ae0c870af680da03db9d39703b525fc98
> > > Max
> > > 
> Hi Max,
> 
> * your patch fixes my warnings
> * with Richard's comments I reduced your patch to
> 
> diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> index bdbe96d..64bbeb4 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -410,6 +410,13 @@ def copydebugsources(debugsrcdir, d):
>          if retval:
>              bb.fatal("debugsrc symlink fixup failed with exit code
> %s
> (cmd was %s)" % (retval, cmd))
> 
> +        # cpio --no-preserve-owner does not create the destination
> files with
> +        # owner root even when run under pseudo, chown them
> explicitely.
> +        cmd = "find '%s%s' -not -uid 0 -exec chown 0:0 {} \;" %
> (dvar, debugsrcdir)
> +        (retval, output) = oe.utils.getstatusoutput(cmd)
> +        if retval:
> +            bb.fatal("cpio --no-preserve-owner fixup failed with
> exit
> code %s (cmd was %s)" % (retval, cmd))
> +
>          # The copy by cpio may have resulted in some empty
> directories!  Remove these
>          cmd = "find %s%s -empty -type d -delete" % (dvar,
> debugsrcdir)
>          (retval, output) = oe.utils.getstatusoutput(cmd)
> 
> and incremental build logs still look quiet (need a scratch build to
> be sure). Could you try if that one works for you?
> 
> Somehow cpio turns suspicious: my fedora 23 ships 2.11 which is 6
> years old. Have checked cpio's (git) logs but did not find something
> (there was a matching bugfix 2.10 -> 2.11 - ....)
> 
> So how about a survey:
> 
> * Which version of cpio does your build host distribution ship
> * do you see floods of host contamination warnings for shipped source
> files?

You could install a copy of our buildtools tarball, see if the problem
goes away with that installed?

Cheers,

Richard

