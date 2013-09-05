Return-Path: <philb@brightsign.biz>
Received: from server505.appriver.com (server505b.appriver.com [98.129.35.5])
	by mail.openembedded.org (Postfix) with ESMTP id BAA666B068
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 11:40:31 +0000 (UTC)
X-Note-AR-ScanTimeLocal: 9/5/2013 6:40:30 AM
X-Policy: GLOBAL - brightsign.biz
X-Policy: GLOBAL - brightsign.biz
X-Policy: GLOBAL - brightsign.biz
X-Policy: GLOBAL - brightsign.biz
X-Primary: philb@brightsign.biz
X-Note: This Email was scanned by AppRiver SecureTide
X-Virus-Scan: V-
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-34/SG:2 9/5/2013 6:39:49 AM
X-GBUdb-Analysis: 0, 98.129.35.1, Ugly c=1 p=-0.961449 Source White
X-Signature-Violations: 0-0-0-4420-c
X-Note-419: 15.6004 ms. Fail:0 Chk:1348 of 1348 total
X-Note: SCH-CT/SI:0-1348/SG:1 9/5/2013 6:40:18 AM
X-Note: Spam Tests Failed: 
X-Country-Path: PRIVATE->UNITED STATES->UNITED STATES
X-Note-Sending-IP: 98.129.35.1
X-Note-Reverse-DNS: smtp.exg5.exghost.com
X-Note-Return-Path: philb@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G340 G341 G342 G343 G347 G348 G455 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [98.129.35.1] (HELO smtp.exg5.exghost.com)
	by server505.appriver.com (CommuniGate Pro SMTP 6.0.2)
	with ESMTPS id 405123267; Thu, 05 Sep 2013 06:40:30 -0500
Received: from [172.30.1.45] (86.30.57.232) by smtp.exg5.exghost.com
	(98.129.23.207) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 5 Sep 2013 06:40:29 -0500
Message-ID: <1378381226.6940.77.camel@phil-desktop.brightsign>
From: Phil Blundell <philb@brightsign.biz>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 5 Sep 2013 12:40:26 +0100
In-Reply-To: <1378381064.6940.75.camel@phil-desktop.brightsign>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<728bbce2f20eefd81accfbbe48c6f5f4e85aabb2.1378366233.git.laurentiu.palcu@intel.com>
	<20130905081516.GI11500@jama>
	<1378377834.6940.66.camel@phil-desktop.brightsign>
	<20130905111155.GB17481@lpalcu-linux>
	<1378381064.6940.75.camel@phil-desktop.brightsign>
Organization: BrightSign Digital Ltd
X-Mailer: Evolution 3.4.4-4+b1 
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: leave metadata in place if a PM is installed in the image
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
X-List-Received-Date: Thu, 05 Sep 2013 11:40:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 12:37 +0100, Phil Blundell wrote:
> On Thu, 2013-09-05 at 14:11 +0300, Laurentiu Palcu wrote:
> > This solution is the most decent I could find in order to address this:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=4484
> > in this stage of 1.5 release. Other ideas are always welcome.
> 
> I couldn't quite follow the long and complicated history of that bug,
> but based on the description and the contents of comment #1 it sounds as
> though the bug is at best tangentially related to this issue.
> 
> In the case where you have postinsts on the target but package
> management is disabled, rootfs_ipk should be installing run-postinsts
> (not opkg) and in that case it doesn't seem like this patch will help.
> 
> It looks as though this breakage was probably introduced by
> 928df79cd3964f775c4c6e4283ef84b8882f9328 which moved the call to
> remove_packaging_data_files() from rootfs_ipk (which was only calling it
> if it knew that all postinsts had already been completed) to
> image.bbclass (which doesn't have that knowledge and will call it
> irrespective of what state the postinsts are in).

Actually, that last sentence is slightly incorrect.  image.bbclass does
have the knowledge, it just seems to be failing to act on it.  So
perhaps the easiest fix for the time being is simply to move the
remove_packaging_data_files call in rootfs_uninstall_unneeded () a few
lines higher up so that it's inside the "if [ -z $(delayed_postinsts) ]"
block.

p.



