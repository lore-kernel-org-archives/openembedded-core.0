Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 39D0B78508
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 15:59:08 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 07:59:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173425971"
Received: from $_hostname.zpn.intel.com (HELO lsandov1-mobl2.zpn.intel.com)
	([10.219.128.134])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 07:59:09 -0800
Date: Tue, 14 Nov 2017 10:09:39 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20171114100939.12d4c1df@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <1510647870.5979.4.camel@intel.com>
References: <20171113181721.79781-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1510647870.5979.4.camel@intel.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] scripts/oe-selftest: oe-selftest-internal wrapper scripts that isolates execution
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
X-List-Received-Date: Tue, 14 Nov 2017 15:59:09 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Nov 2017 09:24:30 +0100
Patrick Ohly <patrick.ohly@intel.com> wrote:

> On Mon, 2017-11-13 at 10:17 -0800,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > 
> > The main idea is to isolate the oe-selftest execution so neither the
> > current build dir nor the configuration data is touch/polluted. This
> > approach uses a wrapper script (which is the one presented on this
> > commit) which creates a unique directory and inside it copies all
> > scripts and metadata, re-initializes the enviroment (re-sources oe-
> > init-build-env) and finally launches the oe-selftest-internal (which
> > used to be oe-selftest) command, passing command arguments to the
> > latter.  
> 
> This mode of operation may or may not be desirable. Can it be made
> optional?

good idea. However, you can call the oe-selftest-internal for the this purpose.

> 
> In refkit CI testing, several selftests run tests on build artifacts
> (primarily the images) produced during the previous build and only
> build them if needed, i.e. they run "bitbake some-image" and that is
> usually fast because the image already exists. Reusing sstate and
> download dir also is important for speed.

oe-selftest creates a new build/conf folder, with the same conf files as the ones present in your current build/conf, so this means that you can set there DL_DIR and SSTATE_DIR (for example) on your main local.conf and these will be used by oe-selftest, effectively reusing these folders.

> 
> Forcing all tests to run in a clean environment would make the overall
> CI run slower.

Agree. better to start with a 'hot cache' scenario, and this can be accomplished the way I mentioned before.



> 
> -- 
> Best Regards, Patrick Ohly
> 
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
> 
> 

