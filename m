Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QJjn7-0003Br-SX for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 12:03:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AA0tiL004511;
	Tue, 10 May 2011 11:00:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03424-03-6; Tue, 10 May 2011 11:00:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4A9xb1a004340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 May 2011 10:59:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <491cfc546a2843493cf466c1e1af11ec8ac2dcee.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
	<491cfc546a2843493cf466c1e1af11ec8ac2dcee.1305004776.git.sgw@linux.intel.com>
Date: Tue, 10 May 2011 09:54:09 +0100
Message-ID: <1305017649.30391.255.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 03/30] conf/layer.conf: Use .= to append to BBPATH and =+ for BBFILES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 10:03:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-09 at 22:26 -0700, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Appending to BBPATH gives a definite order to BBLAYERS which
> means paths are preferred in order from left to right.
> 
> [sgw: merged in comment]
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/layer.conf |   10 +++++++++-
>  1 files changed, 9 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 3f63c7d..10a6948 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -2,7 +2,15 @@ BBPATH ?= ""
>  # We have a conf and classes directory, add to BBPATH
>  BBPATH .= ":${LAYERDIR}"
>  # We have a packages directory, add to BBFILES
> -BBFILES += "${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
> +# packages is still there because metadata_scm.bbclass still uses
> +# it to deduce the repo directory and thats the reason to prepend
> +# to BBFILES here because this class uses the first entry in
> +# BBFILES to calculate the scm base.
> +# since the order of BBFLILES is not that important its acted upon
> +# using BBFILES_PRIORITY we are ok to keep the oe-core BBFILES dir
> +# at top

Er, how about we actually fix metadata_scm.bbclass instead of making the
world more complicated and fragile? :)

I suspect metadata_scm could use the COREBASE variable and be much nicer
code...

Cheers,

Richard




