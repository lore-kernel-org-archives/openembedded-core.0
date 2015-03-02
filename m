Return-Path: <bruno.bottazzini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A106B73820
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 20:21:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 02 Mar 2015 12:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,677,1418112000"; d="scan'208";a="535045416"
Received: from unknown (HELO [10.218.99.51]) ([10.218.99.51])
	by orsmga003.jf.intel.com with ESMTP; 02 Mar 2015 12:21:22 -0800
Message-ID: <1425327675.2707.24.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Date: Mon, 02 Mar 2015 17:21:15 -0300
In-Reply-To: <54D50BD3.8020608@linux.intel.com>
References: <bruno.bottazzini@intel.com>
	<1423069496-25819-1-git-send-email-bruno.bottazzini@intel.com>
	<1423069496-25819-3-git-send-email-bruno.bottazzini@intel.com>
	<54D50BD3.8020608@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] systemd: split modules into packages
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
X-List-Received-Date: Mon, 02 Mar 2015 20:21:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello Randy,

On Sex, 2015-02-06 at 10:45 -0800, Randy Witt wrote:
> On 02/04/2015 09:04 AM, Bruno Bottazzini wrote:
> > It wil be able to choose what systemd module to be installed.
> > The final result may get smaller, if the user wanted to.
> > By default it will install the whole systemd which may be big.
> > ---
> >   meta/recipes-core/systemd/systemd_218.bb | 1059 ++++++++++++++++++++++++++----
> >   1 file changed, 914 insertions(+), 145 deletions(-)
> 
> This patch will push a lot of maintenance work onto the Yocto systemd maintainer 
> every time there is an upgrade. It's also easy to miss dependencies because of 
> the inter-dependencies that can exist between services.

This is not a problem, we can give this maintenance.

> 
> For items such as systemd-cgls and the tools, a change like this would be 
> maintainable since those items are self-contained. But yanking out the services 
> into separate packages means the maintainer will have to inspect them on each 
> upgrade to make sure they still work.
> 
> Would it be sufficient to use PACKAGECONFIG for each of the items that can be 
> disabled via configure? That way the granularity configuration is done by the 
> systemd maintainers rather than the Yocto maintainer.

With PACKAGECONFIG, we may not get everything "for free" as some data files 
will be installed regardless as well as some components from systemd cannot 
be disabled by their build system but we can run without them, for instance 
we can run without journald.

The problem is understanding that although systemd is a single repository 
it contains multiple services and daemons in it that can run even without the 
core PID1, udev or the many helpers used to configure the system such as resolved, 
timedated, localed... 

All of these components are runtime independent, we can install or remove them and 
they should not create problems.

Even Ubuntu is shipping with some of these daemons even if systemd is not used (yet).
If they were different GIT repos then it would be clear that they are separate daemons, 
but as they are all in a single repository people can make a confusion about it.

I see that in the master branch it has already the version 219.

I will make a split packages for the newest version that was just released.

Best Regards,

Bruno Bottazzini

> 
> 
> 




