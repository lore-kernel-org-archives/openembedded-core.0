Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 4155D6013D;
	Fri, 27 Mar 2015 21:21:34 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t2RLLYm9032476; Fri, 27 Mar 2015 16:21:34 -0500
Received: from us-aus-mail3.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015032716213465-523064 ;
	Fri, 27 Mar 2015 16:21:34 -0500 
In-Reply-To: <55119BD5.8060002@topic.nl>
References: <55119BD5.8060002@topic.nl>
To: Mike Looijmans <mike.looijmans@topic.nl>
MIME-Version: 1.0
X-KeepSent: A7360BB3:3C7D486A-86257E15:0053507A;
	type=4; flags=0; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP3 Septem 15, 2011
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <OFA7360BB3.3C7D486A-ON86257E15.0053507A-86257E15.007554A7@ni.com>
Date: Fri, 27 Mar 2015 16:21:34 -0500
X-MIMETrack: Serialize by Router on US-AUS-MAIL3/AUS/M/NIC(Release
	8.5.3FP6|November 21, 2013) at 03/27/2015 04:21:34 PM,
	Serialize complete at 03/27/2015 04:21:34 PM,
	Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 03/27/2015 04:21:34 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 03/27/2015 04:21:34 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-03-27_06:, , signatures=0
Cc: openembedded-core-bounces@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Not selecting <old version of package> as installing it would break existing dependencies
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
X-List-Received-Date: Fri, 27 Mar 2015 21:21:35 -0000
Content-Type: text/plain; charset="US-ASCII"

openembedded-core-bounces@lists.openembedded.org wrote on 03/24/2015 
12:16:05 PM:

> From: Mike Looijmans <mike.looijmans@topic.nl>
> To: openembedded-core@lists.openembedded.org, 
> Date: 03/24/2015 12:16 PM
> Subject: [OE-core] Not selecting <old version of package> as 
> installing it would break existing dependencies
> Sent by: openembedded-core-bounces@lists.openembedded.org
> 
> After upgrading a library to a newer version, for example, something 
> called libdvbsi++ from 0.3.6 to 0.3.7, running opkg upgrade outputs the 
> following cryptic error message:
> 
> Not selecting libdvbsi++1 0.3.6 as installing it would break existing 
> dependencies.

When opkg runs, it creates a list of all the available packages on the 
configured repos + all the installed packages. During an upgrade, it goes 
through the process of finding the best upgrade match for each installed 
package, searching on the master list. The process goes through a series 
of checks for each candidate, like making sure the archs are compatible, 
and making sure installing a candidate won't break existing installed 
packages. In your case, opkg determines there are 2 candidates, 
libdvbsi++0.3.6 and libdvbsi++0.3.7. While evaluating libdvbsi++0.3.6, the 
pkg_breaks_reverse_dep check fails, triggering the message shown above 
(and removing the candidate).
 
> Adding "-V2" to opkg upgrade expands that with the following message:
> 
> opkg_prepare_upgrade_pkg: Package libdvbsi++1 (0.3.7-r2.0) installed in 
> root is up to date.
> 
> So apparently it knows about the later version, so why complain about 
> the old one?

The function that returns the best candidate match correctly returns 
libdvbsi++1 0.3.7. It then compares it against what's already installed. 
The DEBUG message above shows that the best candidate found is already 
installed on the system.

 
> There is only one package that (r)depends on that lib (enigma2). Nothing 

> else needs it.
> 
> This often happens with other packages as well. Is this a bug in opkg, 
> or is it trying to tell us we're doing something wrong?

It is not a bug, the message is harmless as it is only pointing to the 
reason why one of the possible upgrade candidates was discarded. 

Hope this helps!

Alejandro del Castillo
 
> -- 
> Mike Looijmans
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


