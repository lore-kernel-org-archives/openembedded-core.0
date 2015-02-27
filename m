Return-Path: <openembedded-devel@urbanec.net>
Received: from mail14.tpgi.com.au (mail14.tpgi.com.au [203.12.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1F466737CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:27:13 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Fri, 27 Feb 2015 23:27:08 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail14.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t1RCR6en022866
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Fri, 27 Feb 2015 23:27:08 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YRK0Y-0007FX-5V; Fri, 27 Feb 2015 23:27:06 +1100
Message-ID: <54F0629A.9080700@urbanec.net>
Date: Fri, 27 Feb 2015 23:27:06 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1424973442-24727-1-git-send-email-openembedded-devel@urbanec.net>	<CAJTo0La5_Wdf537Ct-ZkLqsx7=5KrYsCCpG9fH8g-hdWNjDQpw@mail.gmail.com>	<54EFDF33.2000609@urbanec.net>
	<54F03A47.8020208@opendreambox.org>
In-Reply-To: <54F03A47.8020208@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0*git: Update to build current AUTOREV from master branch.
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
X-List-Received-Date: Fri, 27 Feb 2015 12:27:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/15 20:35, Andreas Oberritter wrote:
> as far as I remember, OE-Core policy forbids AUTOREV in recipes, because
> it would make network access mandatory.

Fair enough. If that is the policy, it would probably be appropriate to 
move the gstreamer1.01-*_git.bb recipes out of oe-core or at least fix 
them so that it is possible to use ${AUTOREV} from another layer.

> The syntax for enabling it from local.conf is:
> SRCREV_pn-gstreamer1.0 = "${AUTOREV}"

This only works for the main gstreamer1.0 recipe. It fails with infinite 
recursion on any of the gstreamer1.0-plugins-*.bb recipes as I mentioned 
before. This is because the plugins use a python method for SRC_URI 
which references PV. This blows up when you try to use SRCREV="${AUTOREV}"

I guess the question is what next? Should I just drop this and leave the 
oe-core gstreamer1.0*git.bb recipes as they are (referencing git commits 
from circa 2013) or should I put a bit more effort into cleaning up the 
issues with infinite recursion when used with AUTOREV? I suspect that 
the cleanup will just involve removing the current code and inserting a 
bunch of conditionals that translate "gstreamer1.0-" to "gst-"

In my opinion the current version of the recipes is of limited value. I 
understand that there has recently been some activity on implementing 
something that could deliver the functionality of gitpkgv at the oe-core 
level. Should I perhaps just wait and see how that pans out? 
gstreamer1.0*git.bb could be a good test case. ;-)

Cheers and beers,

	Peter


