Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TgBVU-0004jl-Mq
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 10:43:15 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Dec 2012 01:28:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="257546990"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2012 01:28:43 -0800
Message-ID: <50BF13CA.1050808@intel.com>
Date: Wed, 05 Dec 2012 11:28:42 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
	<e5441f19f27ed7063c8bda010ea21bcf7af5a43a.1354626535.git.laurentiu.palcu@intel.com>
	<CAJTo0LbK78yAM1H3n7Sdra9y6dEo9VHHdx8L6Qp2zULLKgT7RQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbK78yAM1H3n7Sdra9y6dEo9VHHdx8L6Qp2zULLKgT7RQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] gdk-pixbuf: generate the pixbuf loader's cache ar rootfs time
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
X-List-Received-Date: Wed, 05 Dec 2012 09:43:15 -0000
X-List-Received-Date: Wed, 05 Dec 2012 09:43:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/04/2012 04:34 PM, Burton, Ross wrote:
> It's probably worth explaining why it's fine that only the loaders
> from gdk-pixbuf-native are used and for example librsvg-native doesn't
> need to be built.
First off, the librsvg postinstall scriptlet is still postponed to run
on target, at first boot. I didn't touch that one, yet. We will deal
with this one (and others) in subsequent patches. Secondly, the
gdk-pixbuf postinstall scriptlet will exit 1 if the command fails. So,
if one has librsvg built and the native one is not present, the
gdk-pixbuf scriptlet will fail on host because it will not find the
native SVG pixbuf loader and it will be postponed to run on target at
first boot. No harm done, this is the current behavior anyway.

However, if we want to be able to run all postinstall scriptlets on host
in order to support read-only rootfs, we might need to have
librsvg-native built too so that we generate the pixbuf loader cache on
host at rootfs install time.

Let's take it step-by-step though and see how the current changes
behave. What do you think?

Thanks,
Laurentiu


