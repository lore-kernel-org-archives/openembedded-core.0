Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 760A97017B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 15:04:41 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w44F4ch7025728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 4 May 2018 16:04:39 +0100
Message-ID: <1525446278.3857.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chin Huat Ang <chin.huat.ang@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 04 May 2018 16:04:38 +0100
In-Reply-To: <1524643213-5505-1-git-send-email-chin.huat.ang@intel.com>
References: <1524643213-5505-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v3] toolchain-scripts: preserve host path in environment setup script
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
X-List-Received-Date: Fri, 04 May 2018 15:04:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-04-25 at 16:00 +0800, Chin Huat Ang wrote:
> The environment setup script generated in the build directory sets
> the PATH
> variable by expanding ${PATH} which would have host paths filtered.
> Sourcing
> this script to run runqemu will not work as it complains host stty
> (/bin/stty)
> cannot be found.
> 
> To resolve this, the script no longer expands ${PATH} during
> generation time,
> instead it will now source oe-init-build-env to initialize the build
> environment so that all host paths will be preserved. Also be sure to
> prepend
> STAGING_BINDIR_TOOLCHAIN to the PATH variable so that the toolchain
> from the
> build directory can be found.
> 
> [YOCTO #12695]
> 
> Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
> ---
>  meta/classes/toolchain-scripts.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

This didn't work as expected on machines which have /bin/sh pointing to
dash, the oe-selftests showed failures.

I've added a followup patch which addresses that problem which allowed
me to merge the patches.

Cheers,

Richard

