Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4D514600E2;
	Fri, 21 Oct 2016 12:57:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 21 Oct 2016 05:57:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,376,1473145200"; d="scan'208";a="892464671"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 21 Oct 2016 05:57:19 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <03b5e98b-0724-daa2-8f78-ab4624f52752@linux.intel.com>
Date: Fri, 21 Oct 2016 15:55:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
Subject: Attention all: patches for upstream source will be applied with stricter criteria for context
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
X-List-Received-Date: Fri, 21 Oct 2016 12:57:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

while updating gnutls to a newer version I came across a rather serious 
issue: the way we patch source code is very lenient about the context 
for the lines to be changed. Basically, it's enough for one line before 
and after the changed line to match, because patch command's default 
setting for 'fuzz factor' allows it. If these lines happen to be 
whitespace or braces, then there's nothing to prevent the patch from 
being applied incorrectly.

Here's a particularly nasty example of this happening completely 
silently (compile step works fine too), with security implications:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450

I think this absolutely needs to be fixed. The downside is that this 
will break a lot of patches across all layers - after setting the fuzz 
to zero in oe-core we have 87 recipes that fail to be patched. Maxin and 
I are currently going through them one by one and getting them fixed.

Regards,
Alex

