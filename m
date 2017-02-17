Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 45F5B6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 15:21:19 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id lrMG1u0030BmcFC01rMHQG; Fri, 17 Feb 2017 15:21:19 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=QoEu5R6d c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=n2v9WMKugxEA:10 a=VstMSg-w4vT6cWokx0gA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1cekLU-00059o-8U; Fri, 17 Feb 2017 15:21:16 +0000
Date: Fri, 17 Feb 2017 15:21:16 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20170217152116.GA19114@mcrowe.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
	<ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
	<20170208115042.GA21576@mcrowe.com>
	<1486559082.13854.12.camel@intel.com>
	<20170208134810.GA29105@mcrowe.com>
	<1486657479.13854.85.camel@intel.com>
	<20170210183213.GA10017@mcrowe.com>
	<1486983272.13854.223.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1486983272.13854.223.camel@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Running task for all recipes required by an image (was Re: [PATCH v2 3/3] rm_work.bbclass: clean up sooner)
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
X-List-Received-Date: Fri, 17 Feb 2017 15:21:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 13 February 2017 at 11:54:32 +0100, Patrick Ohly wrote:
> On Fri, 2017-02-10 at 18:32 +0000, Mike Crowe wrote:
> > On Thursday 09 February 2017 at 17:24:39 +0100, Patrick Ohly wrote:
> > > On Wed, 2017-02-08 at 13:48 +0000, Mike Crowe wrote:
> > > > On Wednesday 08 February 2017 at 14:04:42 +0100, Patrick Ohly wrote:
> > The part I'd missed is the all-important line in source-release-world.bb:
> > 
> >  do_source_release[depends] += "core-image-sato:do_build"
> 
> Okay, that explains it.
> 
> IMHO this do_build dependency should trigger do_rm_work. Your "bitbake
> -c all_source_releases source-release-world" intentionally includes a
> real world build, not just executing the source release tasks. Cleaning
> up while building is the goal of rm_work.bbclass. It's arguably a
> deficiency in the previous rm_work.bbclass that it wasn't active in your
> case.
> 
> Now we just need to find a way to combine these without breaking the
> extra tasks.

Now I think about this further, we're only depending on do_build in order
to ensure that we get all the dependencies included in the source release
via the recrdeps task. If there were a better way to do that then perhaps
rm_work wouldn't cause any problems, and we also wouldn't waste time
building stuff that we aren't going to use.

I've tried:

 ALL_DEPENDENCIES = "${RDEPENDS} ${DEPENDS}"
 do_source_release[depends] = "${@' '.join([s+':do_source_release ' for s in d.getVar('ALL_DEPENDENCIES', True).split()])}"

in the bbclass (which is still inherited by all recipes) and then just
running the source_release task on the final images.

Unfortunately this fails when IMAGE_INSTALL contains package names that are
generated using PACKAGES_DYNAMIC such as gstreamer plugins. :(

ERROR: Nothing PROVIDES 'gstreamer1.0-plugins-good-audioparsers'. Close matches:
  gstreamer1.0-plugins-good
  gstreamer1.0-plugins-base
  gstreamer1.0-plugins-bad
  gstreamer1.0-plugins-good RPROVIDES gstreamer1.0-plugins-good-audioparsers

Is there a correct way to get a task to run for every recipe that is
required by an image?

Thanks.

Mike.

