Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B7465766B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:35:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 10 Nov 2015 07:35:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,271,1444719600"; d="scan'208";a="816357564"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Nov 2015 07:35:36 -0800
Message-ID: <56420F08.1050209@linux.intel.com>
Date: Tue, 10 Nov 2015 17:36:40 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com>
In-Reply-To: <5641FFD4.1050506@windriver.com>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 15:35:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2015 04:31 PM, Mark Hatle wrote:
> Is there a way that the qemu calls can be replaced by calls to an actual running
> board (via SSH perhaps) to get the necessary information?  While inconvenient
> this might be a valid workaround.

Theoretically, yes. Copy the sysroot and the build tree to the board (to 
some safe location, obviously), then execute the arch-dependent bits of 
the process remotely, then copy the output files back. Slow, but doable. 
The executable wrapper mechanism for that is already provided by the 
patchset.

I would however first seriously look into reengineering g-o so that it's 
architecture-independent, and doesn't require such awful contortions. 
Primarily, two things:
1) It should be easy to build transient introspection binaries for the 
native architecture, instead of building them for the target together 
with the rest of the package. Those binaries produce textual output 
(essentially a list of classes/signals/properties) which is 
architecture-independent.
2) The binary introspection database in .typelib files should not be a 
raw dump of a C structure, and should be actually the same on all 
architectures.

> Also is there any facility to caching the gobject responses (other then standard
> sstate-cache) so for machine that do not have QEMU support we can used a cached
> set of responses?  (I'm not sure if these responses could be considered to be a
> global cache, or if they are distribution specific in configuration.  Likely the
> later.)

This requires custom bitbake support I'm afraid, a specialist needs to 
answer this.



Alex

