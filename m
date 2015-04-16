Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE6173D5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 17:56:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2015 10:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,589,1422950400"; d="scan'208";a="710351455"
Received: from pbrao1-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.13.156])
	by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2015 10:56:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Date: Thu, 16 Apr 2015 18:56:31 +0100
Message-ID: <3282189.xUS47EJLep@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <BN3PR0501MB1090F9B31066CC3E7AB72B5EBBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB10906F787AE8EB17CD7558C6BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<BN3PR0501MB1090F9B31066CC3E7AB72B5EBBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: sysvinit upgrade woes
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
X-List-Received-Date: Thu, 16 Apr 2015 17:56:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bryan,

On Thursday 16 April 2015 13:53:14 Bryan Evenson wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Bryan Evenson
> > Sent: Tuesday, April 14, 2015 11:26 AM
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] sysvinit upgrade woes
> > 
> > I am using opkg for package management and sysvinit for init.  I am
> > testing a large jump on an upgrade and I have been having a few issues. 
> > One issue I have traced to sysvinit's upgrade, but I'm unsure how to
> > remedy the solution.
> > 
> > At some point during the upgrade process, opkg records what the new
> > version is of all the packages getting installed.  However, when I upgrade
> > sysvinit causes sysvinit to restart before opkg has recorded which
> > packages
> > were just installed.  So opkg thinks that it didn't upgrade anything even
> > though all packages were upgraded.  I verified that if I call "opkg
> > upgrade" for all packages that require upgrade except for sysvinit that
> > opkg correctly records which packages were upgraded.  However, the end
> > user doesn't have that kind of control, so upgrading in this manner is
> > not an option.
> > 
> > Has anyone else seen a similar issue?  Any ideas on how to hold off
> > sysvinit from restarting until after opkg has finished recording its
> > information?
>
> I've found the problem but don't yet have a good solution.  At the end of
> the sysvinit-inittab pkg_postinst script is the line:
> 
> 	kill -HUP 1
> 
> This kills init before opkg has finished doing its job.  On my system, I've
> added a .bbappend with a pk_postinst script as follows for items that
> require a reboot after installation:
> 
>     touch /var/run/reboot-required
>     echo "${PN}" >>/var/run/reboot-required.pkgs
> 
> After my system performs firmware upgrade, it checks if
> /var/run/reboot-required exists and then reboots the system.  So on my
> system, I changed the pkg_postinst script for sysvinit-inittab to replace
> the "kill -HUP 1" with the reboot required notations.
> 
> Is there some suitable solution that would be reasonable to change in the
> sysvinit-inittab recipe that would work for other people?

SIGHUP is supposed to make sysvinit re-read inittab, not kill it. Can you tell 
what is actually happening?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

