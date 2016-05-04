Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5995A6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:23:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2016 02:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="696650897"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 04 May 2016 02:21:30 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id EE17C6A4007;
	Wed,  4 May 2016 03:09:03 -0700 (PDT)
Date: Wed, 4 May 2016 10:01:39 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20160504070139.GB10864@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
	<9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
	<CABcZANkwedfVVu2cxREq2Qp2UECdtAfrcgZ5V9LfVPtkR5sjaA@mail.gmail.com>
	<CABcZANnwMhYwjVZwGGqrGERPbZoTrEaJ3P1WhGriG_RT9kUbtg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANnwMhYwjVZwGGqrGERPbZoTrEaJ3P1WhGriG_RT9kUbtg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 4/6] bmap-tools: generate standalone script
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
X-List-Received-Date: Wed, 04 May 2016 09:23:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2016 at 07:33:58PM +0000, Christopher Larson wrote:
> On Tue, May 3, 2016 at 7:31 PM, Christopher Larson <clarson@kergoth.com>
> wrote:
> 
> >
> >
> > On Mon, May 2, 2016 at 12:22 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
> > wrote:
> >
> >> Generated standalone bmaptool script that is more convenient
> >> to use than native script. It can be run straight from
> >> its location ./tmp/deploy/tools/bmaptool. The script doesn't
> >> depend on anything except Python.
> >>
> >> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> >>
> >
> > You're right that this is very handy, but we hit a problem when building
> > from shared state. This uses do_deploy to deploy bmaptool into
> > DEPLOY_DIR_IMAGE, but IMAGE_DEPENDS only depends on do_populate_sysroot,
> > not do_deploy, so an image build from sstate won't write this script out.
> >
> > I don't know the right way to fix this, but it's a problem. I just ran
> > into it :)
> >
> 
> Also, the convention is to add do_deploy before do_build, not before
> do_package, otherwise do_deploy's checksum is included int he checksums of
> do_package and subsequent tasks, even though its output isn't used by any
> subsequent tasks.

I also found this a bit unusual to put the tool into deploy/tools.
That's why I isolated this change. I think it requires some more
testing, but the rest of patchset can be accepted without it.

--
Regards,
Ed

