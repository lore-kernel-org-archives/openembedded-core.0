Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 719FF6D290
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 09:31:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA49VVBk005056; Mon, 4 Nov 2013 09:31:31 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pPt2ccPlR_qe; Mon,  4 Nov 2013 09:31:31 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA49VNXT005037
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Nov 2013 09:31:25 GMT
Message-ID: <1383557479.6271.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
Date: Mon, 04 Nov 2013 09:31:19 +0000
In-Reply-To: <33115ABC4887814E8A92A08FBC93416B0A1AA0B0@IRSMSX103.ger.corp.intel.com>
References: <1383329028-24348-1-git-send-email-corneliux.stoicescu@intel.com>
	<1383329237.6271.62.camel@ted>
	<33115ABC4887814E8A92A08FBC93416B0A1A9E54@IRSMSX103.ger.corp.intel.com>
	<1383556582.6271.98.camel@ted>
	<33115ABC4887814E8A92A08FBC93416B0A1AA0B0@IRSMSX103.ger.corp.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Modify buildstats to be merged inside buildhistory
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
X-List-Received-Date: Mon, 04 Nov 2013 09:31:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-04 at 09:24 +0000, Stoicescu, CorneliuX wrote:
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Sent: Monday, November 04, 2013 11:16 AM
> > To: Stoicescu, CorneliuX
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] Modify buildstats to be merged inside
> > buildhistory
> > 
> > On Sun, 2013-11-03 at 11:37 +0000, Stoicescu, CorneliuX wrote:
> > > > > +BUILDSTATS_BASE = "${BUILDHISTORY_DIR}/buildstats"
> > > > >  BNFILE = "${BUILDSTATS_BASE}/.buildname"
> > > > >  DEVFILE = "${BUILDSTATS_BASE}/.device"
> > > >
> > > > so when buildhistory is used, buildstats automatically becomes part of it?
> > > >
> > > > > @@ -33,7 +33,7 @@ def set_bn(e):
> > > > >
> > > > >  def get_bn(e):
> > > > >      with open(e.data.getVar('BNFILE', True)) as f:
> > > > > -        bn = f.readline()
> > > > > +        bn = str(f.readline()).split("/")[0]
> > > > >      return bn
> > > > >
> > > > >  def set_device(e):
> > > > > @@ -175,6 +175,10 @@ python run_buildstats () {
> > > > >          # set the buildname
> > > > >
> > > >
> > ##############################################################
> > > > ##########
> > > > >          try:
> > > > > +            bb.utils.remove(e.data.getVar('BUILDSTATS_BASE',
> > > > > + True),
> > > > > + recurse=True)
> > > >
> > > >
> > > > Do we need to remove this?
> > > >
> > >
> > > By reworking the buildstats directory structure to not use the build
> > > date to separate builds, if we don't remove buildstats each time we
> > > make a new build the information from multiple builds will merge and
> > > tools like bybootchartguy.py will not work anymore with buildstats.
> > 
> > I'd have expected that separate directories for each build are still
> > maintained. Testing locally here, I can use pybootchartgui in the form:
> > 
> > scripts/pybootchartgui/pybootchartgui.py build/tmp/buildstats/core-image-
> > sato-qemux86/201309302155/
> > 
> > and I'd have thought a similar command would still work in buildhistory since
> > we'd still have the timestamped directory there?
> > 
> 
> The timestamped directory was removed in order to reduce buildhistory git noise. 
> Creating a new directory for each build will also increase the git repo size dramatically
> In time.
> 
> If we choose to not use the timestamped directory, we need to delete the buildstats 
> data each build because, in contrast to buildhistory, buildstats data is relevant when
> compiled as a whole. This is also how pybootchart interprets it.

I hadn't realised you'd removed the timestamps. If you do that there is
a problem, yes. Paul, how do you think we should handle this? I'd have
thought it would be ok to save the historical data in there side by side
since the size of the git repo will be the same, the size of the
checkout will just be different. We do need to save something into the
timestamped directory saying which revision(s) a given build happened
against though so we have some kind of historical context.

Paul: Any thoughts on this?

Cheers,

Richard





