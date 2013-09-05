Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id ED6616B068
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 11:37:44 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VHXsf-0001rA-1Q; Thu, 05 Sep 2013 13:37:45 +0200
Message-ID: <1378381064.6940.75.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 05 Sep 2013 12:37:44 +0100
In-Reply-To: <20130905111155.GB17481@lpalcu-linux>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<728bbce2f20eefd81accfbbe48c6f5f4e85aabb2.1378366233.git.laurentiu.palcu@intel.com>
	<20130905081516.GI11500@jama>
	<1378377834.6940.66.camel@phil-desktop.brightsign>
	<20130905111155.GB17481@lpalcu-linux>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 05 Sep 2013 11:37:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 14:11 +0300, Laurentiu Palcu wrote:
> This solution is the most decent I could find in order to address this:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4484
> in this stage of 1.5 release. Other ideas are always welcome.

I couldn't quite follow the long and complicated history of that bug,
but based on the description and the contents of comment #1 it sounds as
though the bug is at best tangentially related to this issue.

In the case where you have postinsts on the target but package
management is disabled, rootfs_ipk should be installing run-postinsts
(not opkg) and in that case it doesn't seem like this patch will help.

It looks as though this breakage was probably introduced by
928df79cd3964f775c4c6e4283ef84b8882f9328 which moved the call to
remove_packaging_data_files() from rootfs_ipk (which was only calling it
if it knew that all postinsts had already been completed) to
image.bbclass (which doesn't have that knowledge and will call it
irrespective of what state the postinsts are in).

p.



