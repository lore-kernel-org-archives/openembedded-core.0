Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C902E60616
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 08:51:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 06 Oct 2016 01:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,453,1473145200"; d="scan'208";a="769470215"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Oct 2016 01:51:43 -0700
Message-ID: <1475743775.13655.55.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Oct 2016 11:49:35 +0300
In-Reply-To: <b32b7b2f-68cc-31d6-d687-2eeb12aa196a@opendreambox.org>
References: <1475676667-24280-1-git-send-email-markus.lehtonen@linux.intel.com>
	<b32b7b2f-68cc-31d6-d687-2eeb12aa196a@opendreambox.org>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH] update-rc.d.bbclass: check that init script exists before running it
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
X-List-Received-Date: Thu, 06 Oct 2016 08:51:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-10-05 at 16:51 +0200, Andreas Oberritter wrote:
> Hello Markus,
> 
> On 05.10.2016 16:11, Markus Lehtonen wrote:
> > Check that the init script that is going to be called in the prerm()
> > script really exists. There might be a packaging bug or the script
> > might've been removed already earlier in prerm().
> 
> isn't it called prerm in the first place because it's not supposed to
> remove any packaged files?

In the case of this bug it does not remove any packaged files. Update
-alternatives removes a symlink (created by itself)


> And if there's a packaging bug, we should IMO better add a sanity check
> there and abort the build.

First of all, this does not fix a build-time, but a run-time problem. And,
I think that the pre post etc scripts should basically never fail.


[YOCTO #10299]
> > 
> > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > ---
> >  meta/classes/update-rc.d.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update
> > -rc.d.bbclass
> > index dfef2a2..24da547 100644
> > --- a/meta/classes/update-rc.d.bbclass
> > +++ b/meta/classes/update-rc.d.bbclass
> > @@ -37,7 +37,7 @@ fi
> >  }
> >  
> >  updatercd_prerm() {
> > -if [ -z "$D" ]; then
> > +if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
> >  	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> >  fi
> >  }
> > 
> 


