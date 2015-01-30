Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 486976AC1E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 23:06:16 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t0UN6Hkg007108 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 17:06:17 -0600
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015013017061715-573363 ;
	Fri, 30 Jan 2015 17:06:17 -0600 
Date: Fri, 30 Jan 2015 17:06:09 -0600
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150130230609.GA13593@bshelton-desktop>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 01/30/2015 05:06:17 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 01/30/2015 05:06:17 PM,
	Serialize complete at 01/30/2015 05:06:17 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-01-30_06:, , signatures=0
Subject: opkg intercept for ldconfig on oe-core
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
X-List-Received-Date: Fri, 30 Jan 2015 23:06:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I was looking at the opkg intercept functionality, and if I'm understanding this
properly, it looks like it changes the PATH so that e.g. ldconfig is redirected
to the script under /usr/share/opkg/intercept/ldconfig when running postinst
scripts.  That way, when installing a bunch of libraries, ldconfig can be run
once at the end rather than once for every package.

However, the postinst scripts for libraries are generated with
ldconfig_postinst_fragment() in meta/classes/package.bbclass, which looks like
this:

ldconfig_postinst_fragment() {
if [ x"$D" = "x" ]; then
	if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
fi
}

Because this script uses the full absolute path to ldconfig, the opkg intercept
ldconfig script isn't being invoked.  I verified this by putting an echo in
/usr/share/opkg/intercept/ldconfig, which I saw only when I changed my package's
postinst script to

ldconfig_postinst_fragment() {
if [ x"$D" = "x" ]; then
	ldconfig
fi
}

In the history of package.bbclass, it originally used to look like this, but was
changed in 2008 in a sync from OE.dev.

Is this expected behavior?  Is opkg intercept still supported?  Should we fix
this, and if so, what would be a safe way to do it?

Thanks,
Ben

