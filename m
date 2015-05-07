Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 02A6873F5C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 22:19:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 07 May 2015 15:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,386,1427785200"; d="scan'208";a="725594391"
Received: from bottazzini-thinkpad-t430 (HELO [10.218.98.31]) ([10.218.98.31])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2015 15:19:15 -0700
Message-ID: <1431037149.29137.2.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Thu, 07 May 2015 19:19:09 -0300
In-Reply-To: <554BB3D1.8050508@opendreambox.org>
References: <1431016840-26287-1-git-send-email-bruno.bottazzini@intel.com>
	<1431016840-26287-3-git-send-email-bruno.bottazzini@intel.com>
	<554BB3D1.8050508@opendreambox.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 2/3] systemd: Verify if journal-flush.service exists.
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
X-List-Received-Date: Thu, 07 May 2015 22:19:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Qui, 2015-05-07 at 20:49 +0200, Andreas Oberritter wrote:
> Hello Bruno,
> 
> On 07.05.2015 18:40, Bruno Bottazzini wrote:
> > If the users wants to enable networkd this file will not be generate and the
> > installation will fail.
> > 
> > Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
> > ---
> >  meta/recipes-core/systemd/systemd_219.bb | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> > index c196017..b4bff18 100644
> > --- a/meta/recipes-core/systemd/systemd_219.bb
> > +++ b/meta/recipes-core/systemd/systemd_219.bb
> > @@ -177,8 +177,11 @@ do_install() {
> >  	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
> >  	# its needed in 216 upstream has fixed it with 919699ec301ea507edce4a619141ed22e789ac0d
> >  	# don't order journal flushing afte remote-fs.target
> > -	sed -i -e 's/ remote-fs.target$//' ${D}${systemd_unitdir}/system/systemd-journal-flush.service
> > -	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
> > +	if [ -s ${D}${systemd_unitdir}/system/systemd-journal-flush.service ]; then
> > +                # this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
> > +                sed -i -e 's/ remote-fs.target$//' ${D}${systemd_unitdir}/system/systemd-journal-flush.service
> > +        fi
> > +
> 
> According to the comment above, this is a workaround specific to 216.
> Commit 919699ec301ea507edce4a619141ed22e789ac0d made it into 218. So
> maybe these lines should just get removed.

Andreas,

You are right.

I have checked and tested. It is upstreamed and It is not needed.

I will remove it and send another patch.

Best Regards,

> Regards,
> Andreas



