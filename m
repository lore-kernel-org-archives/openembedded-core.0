Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E88C6058D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 21:33:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5GLXn2H002994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 16 Jun 2018 22:33:51 +0100
Message-ID: <60a306a33463bd9b20631b61e17884012237588b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2018 22:33:49 +0100
In-Reply-To: <20180613115053.28394-1-ross.burton@intel.com>
References: <20180613115053.28394-1-ross.burton@intel.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] libdrm: port to Meson
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
X-List-Received-Date: Sat, 16 Jun 2018 21:33:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-06-13 at 12:50 +0100, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...ac-Allow-explicit-enabling-of-cunit-tests.patch | 53 ------------
> ----------
>  .../recipes-graphics/drm/libdrm/installtests.patch | 25 ----------
>  meta/recipes-graphics/drm/libdrm_2.4.92.bb         | 23 ++++------
>  3 files changed, 9 insertions(+), 92 deletions(-)
>  delete mode 100644 meta/recipes-graphics/drm/libdrm/0001-
> configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
>  delete mode 100644 meta/recipes-
> graphics/drm/libdrm/installtests.patch

Fails generally on x86[1] until you add:

EXTRA_OEMESON_append_x86 = " -Dintel=true"
EXTRA_OEMESON_append_x86-64 = " -Dintel=true"

since the arch detection in cross builds is obviously not quite
functioning correctly.

[1] https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/1068/steps/BuildImages/logs/stdio

after the above 'fix', it still fails on musl:

https://autobuilder.yocto.io/builders/nightly-musl/builds/1095
https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/541

Cheers,

Richard



