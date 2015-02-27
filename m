Return-Path: <openembedded-devel@urbanec.net>
Received: from mail12.tpgi.com.au (mail12.tpgi.com.au [203.12.160.162])
	by mail.openembedded.org (Postfix) with ESMTP id 1ACDB718DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 03:06:37 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Fri, 27 Feb 2015 14:06:30 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail12.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t1R36SF7006567
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Fri, 27 Feb 2015 14:06:30 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YRBFz-0006Jb-Re; Fri, 27 Feb 2015 14:06:27 +1100
Message-ID: <54EFDF33.2000609@urbanec.net>
Date: Fri, 27 Feb 2015 14:06:27 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1424973442-24727-1-git-send-email-openembedded-devel@urbanec.net>
	<CAJTo0La5_Wdf537Ct-ZkLqsx7=5KrYsCCpG9fH8g-hdWNjDQpw@mail.gmail.com>
In-Reply-To: <CAJTo0La5_Wdf537Ct-ZkLqsx7=5KrYsCCpG9fH8g-hdWNjDQpw@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Feb 2015 03:06:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/15 08:52, Burton, Ross wrote:
>
> On 26 February 2015 at 17:57, Peter Urbanec
> <openembedded-devel@urbanec.net <mailto:openembedded-devel@urbanec.net>>
> wrote:
>
>     -SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
>     +SRCREV ?= "${AUTOREV}"
>
>
> I'd say that the git packages should track the tarball releases *and be
> tested as such* so that they actually work out of the box and don't
> break over time as upstream changes.

I disagree. There's no point in having a git version of a package that 
is exactly the same as a release version. Doing so would also bring in 
all the patches specific to that release, which may not be appropriate 
for a different git revision. If you want a tested release, you would 
stick to something like gstreamer1.0*1.4.5.bb instead of choosing a git 
version.

> If someone wants to make a bleeding-edge build then it's a simple change
> to set the SRCREV to AUTOREV at the distro level.

Well, as it's shaping up, that may actually not be possible in oe-core 
packages. It certainly does not work with the current gstreamer1.0*git 
recipes, because as soon as you do that you end up with infinite 
recursion when expanding SRC_URI.

I think there are two main use cases for git builds. Case one is keeping 
up with the bleeding edge, which implies SRCREV="${AUTOREV}". Case two 
is freezing at a particular revision that suits you, which implies 
SRCREV="git-hash". In case one, you will probably want to run a fairly 
lean set of patches (or even none) to track the upstream. In case two, 
you could potentially have a comprehensive set of patches that will only 
apply to that revision. Both cases will be a lot easier to manage if the 
*git.bb recipe gives you a clean git repository without patches.


