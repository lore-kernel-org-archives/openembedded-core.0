Received: from smtpout.karoo.kcom.com ([212.50.160.34])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1TPEse-0007oB-Hi
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 17:53:00 +0200
X-IronPort-AV: E=Sophos;i="4.80,613,1344207600"; d="scan'208";a="667306398"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 19 Oct 2012 16:38:35 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1TPEeh-0003ZU-1e
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 16:38:35 +0100
Date: Fri, 19 Oct 2012 16:38:35 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121019153834.GA13159@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Using SSTATE_MIRRORS with sstate subdirectories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Oct 2012 15:53:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm having trouble using SSTATE_MIRRORS as suggested at
https://wiki.yoctoproject.org/wiki/Enable_sstate_cache :

SSTATE_MIRRORS ?= "file://.* file:///private/sstate-cache/"

Since commit 5d45c7b025f6635b2232d7bf92b7c1aba350396b my sstate-cache
files are stored in two-letter subdirectories (and
9360fc318cec5c873b17f59b817dd6312c81ee27 adds the LSB prefix too.)
Although these components are present in the original URL they don't
make it into the rewritten one:

DEBUG: SState using premirror of: file://.* file:///private/sstate-cache/
DEBUG: SState: Attempting to fetch file://Debian-testing/b0/sstate-quilt-native-x86_64-linux-0.60-r0-x86_64-2-b0869ac9e0e74960018909e56a6822a1_populate-sysroot.tgz
DEBUG: Searching for Debian-testing/b0/sstate-quilt-native-x86_64-linux-0.60-r0-x86_64-2-b0869ac9e0e74960018909e56a6822a1_populate-sysroot.tgz in paths:   
DEBUG: Searching for Debian-testing/b0/sstate-quilt-native-x86_64-linux-0.60-r0-x86_64-2-b0869ac9e0e74960018909e56a6822a1_populate-sysroot.tgz in path: /vg0disk/mac/src/oe2/build-bcm7425/conf/.
DEBUG: Defaulting to /vg0disk/mac/src/oe2/build-bcm7425/sstate-cache/Debian-testing/b0/sstate-quilt-native-x86_64-linux-0.60-r0-x86_64-2-b0869ac9e0e74960018909e56a6822a1_populate-sysroot.tgz for Debian-testing/b0/sstate-quilt-native-x86_64-linux-0.60-r0-x86_64-2-b0869ac9e0e74960018909e56a6822a1_populate-sysroot.tgz
DEBUG: Testing URL file://Debian-testing/b0/sstate-quilt-native-x86_64-linux-0.60-r0-x86_64-2-b0869ac9e0e74960018909e56a6822a1_populate-sysroot.tgz
DEBUG: For url ['file', '', 'Debian-testing/b0/sstate-quilt-native-x86_64-linux-0.60-r0-x86_64-2-b0869ac9e0e74960018909e56a6822a1_populate-sysroot.tgz', '', '', {}] comparing ['file', '', '.*', '', '', {}] to ['file', '', '/private/sstate-cache/', '', '', {}]
DEBUG: For url file://Debian-testing/b0/sstate-quilt-native-x86_64-linux-0.60-r0-x86_64-2-b0869ac9e0e74960018909e56a6822a1_populate-sysroot.tgz returning file:///private/sstate-cache/sstate-quilt-native-x86_64-linux-0.60-r0-x86_64-2-b0869ac9e0e74960018909e56a6822a1_populate-sysroot.tgz
DEBUG: For url ['file', '', '/private/sstate-cache/sstate-quilt-native-x86_64-linux-0.60-r0-x86_64-2-b0869ac9e0e74960018909e56a6822a1_populate-sysroot.tgz', '', '', {}] comparing ['file', '', '.*', '', '', {}] to ['file', '', '/private/sstate-cache/', '', '', {}]
DEBUG: SState: Unsuccessful fetch test for file://Debian-testing/b0/sstate-quilt-native-x86_64-linux-0.60-r0-x86_64-2-b0869ac9e0e74960018909e56a6822a1_populate-sysroot.tgz

Inspired by 9360fc318cec5c873b17f59b817dd6312c81ee27 I tried:

SSTATE_MIRRORS ?= "file://(.*) file:///private/sstate-cache/\1"

But this just resulted in an infinite loop with progressively more
private/sstate-cache/ components added to the path name.

I've had a poke at fetch2's uri_replace but it isn't obvious to me how
to change this behaviour without risking breaking something else.

Any ideas?

Thanks.

Mike.




