Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 673F2606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 21:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2HL2dRi008607; Thu, 17 Mar 2016 21:02:39 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 21OhxYbu7EhF; Thu, 17 Mar 2016 21:02:39 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2HL2X23008604
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Mar 2016 21:02:34 GMT
Message-ID: <1458248553.7615.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Mar 2016 21:02:33 +0000
In-Reply-To: <CAJ86T=X=amcjcvmsUidKYTsUYHMO+LHEE5znv-t0Qv8KGZLyjA@mail.gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-2-git-send-email-armccurdy@gmail.com>
	<CAJTo0LZ_9NTAMLo9eYGKYa+W4L_QQWQXrROog2Bwn89pbxmRng@mail.gmail.com>
	<CAJ86T=X=amcjcvmsUidKYTsUYHMO+LHEE5znv-t0Qv8KGZLyjA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] bitbake.conf: remove 'gobject-introspection-data' from DISTRO/MACHINE_FEATURES_BACKFILL
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
X-List-Received-Date: Thu, 17 Mar 2016 21:02:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-03-17 at 11:17 -0700, Andre McCurdy wrote:
> On Thu, Mar 17, 2016 at 10:31 AM, Burton, Ross <ross.burton@intel.com
> > wrote:
> > 
> > On 17 March 2016 at 17:19, Andre McCurdy <armccurdy@gmail.com>
> > wrote:
> > > 
> > > -DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5
> > > gobject-introspection-data"
> > > -MACHINE_FEATURES_BACKFILL = "rtc gobject-introspection-data"
> > > +DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5"
> > > +MACHINE_FEATURES_BACKFILL = "rtc"
> > 
> > So every BSP (apart from the qemu ones) would need to add the
> > feature to
> > MACHINE_FEATURES?
> > 
> > Maybe we should remove from DISTRO backfill but keep backfilling
> > for MACHINE
> > features?
> 
> Or don't control via a MACHINE feature at all (which would also solve
> the package PACKAGE_ARCH issue) ?
> 
> Each CPU tuning file would then instead need to somehow express "this
> tuning target creates binaries which can / can't be run with qemu",
> but maybe that's an improvement too - isn't it better to define and
> maintain that information centrally in files controlled by oe-core
> rather than leave it up to BSPs to get right?

MACHINE_FEATURES is a variable which represents the features the target
hardware has. There is nothing which says "this must be set in
MACHINE.conf". In fact there is significant precedent for setting up
common include files which define the hardware properties.

If you look at one of my patches, it alters a core common include file
to exclude introspection in a case where we can't use it (x32).

So I think we actually want the same thing which is for the common tune
files to setup the right data.

We have made a decision to defaulting to introspection, rightly or
wrongly. I'm also quite happy to disable it where we know qemu can't
work and tune files are likely the right place to that.

I don't think this patchset is right.

Cheers,

Richard


