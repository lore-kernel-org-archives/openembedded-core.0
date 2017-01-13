Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E4E2871DB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 15:36:31 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Jan 2017 07:36:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,222,1477983600"; d="scan'208";a="52902629"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.24.83])
	by fmsmga005.fm.intel.com with ESMTP; 13 Jan 2017 07:36:30 -0800
Message-ID: <1484321789.3828.7.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jan 2017 15:36:29 +0000
In-Reply-To: <7e7e15bd-9481-efa8-80af-60300016575e@linux.intel.com>
References: <20170105163423.8776-1-joshua.g.lock@intel.com>
	<35878aed-24bd-6129-54bb-f1dd68bf09a8@linux.intel.com>
	<1b59a012-5943-d763-975f-764a6247121b@linux.intel.com>
	<1484315514.3828.2.camel@intel.com>
	<7e7e15bd-9481-efa8-80af-60300016575e@linux.intel.com>
X-Mailer: Evolution 3.22.3 (3.22.3-1.fc25) 
Mime-Version: 1.0
Subject: Re: [PATCH] zlib: update SRC_URI to fix fetching
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
X-List-Received-Date: Fri, 13 Jan 2017 15:36:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-01-13 at 16:18 +0200, Alexander Kanavin wrote:
> On 01/13/2017 03:51 PM, Lock, Joshua G wrote:
> 
> > Noted, thanks. Do we maintain a list of things we'd like people to
> > check, and how to do it, when making updates to recipes?
> 
> I don't think there's such a list, perhaps we should make one and
> place 
> it in patch guidelines wiki.

I think we should, yes please.

> > checkpkg isn't available by default (had to add distrodata to
> > INHERITS)
> > and it took me a while to realise the results are written to a file
> > I
> > have to check. If we expect people to run these checks before
> > submitting updates we'd best make it as easy as possible to know
> > what
> > the checks are and how to run them.
> 
> I think this particular check should be automated and run in
> package_qa, 
> if it's okay to access the network in that step. Is it?

I don't think we should be accessing the network during package_qa.

> Alternatively, if checkuri is regularly run somewhere, then checkpkg 
> should be as well.

We run checkuri on the autobuilders and checkpkg is used by the recipe
report tool, though that's run less frequently. 

Running checkpkg on the autobuilders won't really help as the
autobuilders rely on the bitbake invocation returning a non-zero exit
code to determine whether to mark the build step as failed, and that's
not the case when checkpkg doesn't find an update version.

If we regularly run checkpkg on the autobuilders how should we detect
that a SRC_URI change has caused the upstream version check to fail?

Joshua

