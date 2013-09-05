Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9B361788
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 10:43:54 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VHX2Z-0001pB-97; Thu, 05 Sep 2013 12:43:55 +0200
Message-ID: <1378377834.6940.66.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 05 Sep 2013 11:43:54 +0100
In-Reply-To: <20130905081516.GI11500@jama>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<728bbce2f20eefd81accfbbe48c6f5f4e85aabb2.1378366233.git.laurentiu.palcu@intel.com>
	<20130905081516.GI11500@jama>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 05 Sep 2013 10:43:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 10:15 +0200, Martin Jansa wrote:
> On Thu, Sep 05, 2013 at 10:31:10AM +0300, Laurentiu Palcu wrote:
> >  rootfs_uninstall_unneeded () {
> > -	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
> > +	rpm_installed=${@base_contains("PACKAGE_INSTALL", "rpm",  "true", "false", d)}
> > +	opkg_installed=${@base_contains("PACKAGE_INSTALL", "opkg", "true", "false", d)}
> > +	dpkg_installed=${@base_contains("PACKAGE_INSTALL", "dpkg", "true", "false", d)}
> > +
> > +	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)} &&\
> 
> is this first condition still needed? Do we have some case where
> package-management is enabled without rpm/opkg/dpkg installed?

Yes, potentially.  It is quite legitimate to have package-management in
IMAGE_FEATURES (in order to have the metadata kept around for later
inspection) but not actually install any of the package managers.  In
fact, this is basically all that the package-management feature does,
and revoking support for it in favour of needing to specify something in
PACKAGE_INSTALL seems like it would be a retrograde step. 

Replacing the generic IMAGE_FEATURES test with something based on the
presence of one of three specific package managers also has a few other
minor downsides:

- it makes it harder for someone to maintain support for a different
package manager outside of oe-core;

- it means that mentioning rpm in PACKAGE_INSTALL for an opkg-based
image will still cause all the opkg metadata to be retained, which might
be surprising to some;

- it makes it impossible to install opkg or suchlike without its
metadata, which has occasionally been a useful thing to do.

I don't think any of the above are necessarily deal-breakers, but it
does seem to me that this patch is based on an erroneous premise.  If
the user wants package management then they should simply be adding that
flag to IMAGE_FEATURES.  I don't think it's necessary or desirable that
image.bbclass try to second-guess this by looking at the list of
packages to be installed and applying some heuristic.

p.



