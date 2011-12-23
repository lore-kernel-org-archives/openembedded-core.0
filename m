Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Re8Jv-0005Ba-Ub
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:50:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Dec 2011 08:42:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="90918557"
Received: from unknown (HELO helios.localnet) ([10.252.122.71])
	by orsmga002.jf.intel.com with ESMTP; 23 Dec 2011 08:42:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Dec 2011 16:42:46 +0000
Message-ID: <7983020.RR9YpPIx7m@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <3443259C5BCC4C21B2D92CD4C4B9AC73@gmail.com>
References: <3443259C5BCC4C21B2D92CD4C4B9AC73@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] buildhistory: avoid quoting issues with the layer list for build-id
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
X-List-Received-Date: Fri, 23 Dec 2011 16:50:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 23 December 2011 09:23:57 Christopher Larson wrote:
> The layer list is multiline, and includes quotes, so including it within
> quotes is problematic, particularly if the revision includes characters
> which are not valid outside of a quoted string in shell. To reproduce this
> failure: do a build with an scm layer not on a branch.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com
> (mailto:chris_larson@mentor.com)> ---
> meta/classes/buildhistory.bbclass | 5 ++++-
> 1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index 39f5ff6..6a08db4 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -325,7 +325,10 @@ buildhistory_get_imageinfo() {
> 
> # Add some configuration information
> echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO}
> ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id - echo
> "${@buildhistory_get_layers(d)}" >> ${BUILDHISTORY_DIR_IMAGE}/build-id +
> + cat >> ${BUILDHISTORY_DIR_IMAGE}/build-id <<END
> +${@buildhistory_get_layers(d)}
> +END
> }
> 
> # By prepending we get in before the removal of packaging files

Hmm, hadn't thought of this. Thanks!

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


