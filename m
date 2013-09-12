Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A5C4460579
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 12:59:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8CDDEvG010888; Thu, 12 Sep 2013 14:13:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hXan5xf7CCsu; Thu, 12 Sep 2013 14:13:14 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8CDD75a010879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 12 Sep 2013 14:13:09 +0100
Message-ID: <1378990754.3484.220.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 12 Sep 2013 13:59:14 +0100
In-Reply-To: <2771628.zHcdCVtJ3y@helios>
References: <1378935481-592-1-git-send-email-sgw@linux.intel.com>
	<2771628.zHcdCVtJ3y@helios>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez4/5: Add EXCLUDE_FROM_WORLD = 1
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
X-List-Received-Date: Thu, 12 Sep 2013 12:59:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-12 at 10:29 +0100, Paul Eggleton wrote:
> On Wednesday 11 September 2013 14:38:01 Saul Wold wrote:
> > We can't build both recipes in the world build as there is a collision of
> > package name and PR values. Specificly the libasound-module-bluez which is
> > the same in both goes backwards from r5 (bluez4) -> r0 (bluez5) and the
> > subpackage_metadata check fails:
> > 
> > ERROR: Recipe lib32-bluez5 is trying to change PR from 'r0' to 'r5'. This
> > will cause do_package_write_* failures since the incorrect data will be
> > used and they will be unable to find the right workdir.
> > 
> > [YOCTO #5165]
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  meta/recipes-connectivity/bluez/bluez4.inc  | 1 +
> >  meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
> >  2 files changed, 3 insertions(+)
> > 
> > diff --git a/meta/recipes-connectivity/bluez/bluez4.inc
> > b/meta/recipes-connectivity/bluez/bluez4.inc index b540622..e4f6834 100644
> > --- a/meta/recipes-connectivity/bluez/bluez4.inc
> > +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> > @@ -43,3 +43,4 @@ EXTRA_OECONF = "\
> >    --with-udevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \
> >  "
> > 
> > +EXCLUDE_FROM_WORLD = "1"
> > diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> > b/meta/recipes-connectivity/bluez5/bluez5.inc index e5cb9e8..2e25d86 100644
> > --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> > +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> > @@ -82,3 +82,5 @@ FILES_${PN}-dbg += "\
> >  RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
> > 
> >  SYSTEMD_SERVICE_${PN} = "bluetooth.service"
> > +
> > +EXCLUDE_FROM_WORLD = "1"
> 
> Surely we don't need to exclude both from world, just one of them?

This way the right one gets selected by the dependency trees. If you do
it the other way, we'd have to revisit the problem and anyone choosing
an alternative would possibly end up with build issues. 

Cheers,

Richard


