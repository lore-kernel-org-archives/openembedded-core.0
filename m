Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1Rb9LM-0002ZS-5Y
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 12:19:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFBCMwe002788
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 11:12:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02440-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 11:12:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFBCCgT002782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 11:12:13 GMT
Message-ID: <1323947533.4568.5.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2011 11:12:13 +0000
In-Reply-To: <54c5ffb66f2e947b81d7cdbb8e8c34c51b38770f.1323911699.git.sgw@linux.intel.com>
References: <cover.1323911699.git.sgw@linux.intel.com>
	<54c5ffb66f2e947b81d7cdbb8e8c34c51b38770f.1323911699.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/7] sstate: Add SSTATE_SCAN_FILES
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
X-List-Received-Date: Thu, 15 Dec 2011 11:19:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-14 at 17:50 -0800, Saul Wold wrote:
> This allows recipes to specify files that may be outside the normal set
> for inclusion when there are hardcoded paths that need to be fixmepathed
> to work correctly.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/sstate.bbclass |   11 ++++++++++-
>  1 files changed, 10 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 504b099..5452a43 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -10,7 +10,8 @@ SSTATE_PKGSPEC    = "sstate-${PN}-${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}-$
>  SSTATE_PKGNAME    = "${SSTATE_PKGSPEC}${BB_TASKHASH}"
>  SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
>  
> -SSTATE_SCAN_CMD ?= "find ${SSTATE_BUILDDIR} \( -name "*.la" -o -name "*-config" \) -type f"
> +SSTATE_SCAN_FILES ?= "*.la *-config"
> +SSTATE_SCAN_CMD ?= "find ${SSTATE_BUILDDIR} \( ${SSTATE_FIND_CMD_FILES} \) -type f"
>  
>  BB_HASHFILENAME = "${SSTATE_PKGNAME}"
>  
> @@ -33,6 +34,13 @@ python () {
>      else:
>          d.setVar('SSTATE_MANMACH', bb.data.expand("${MACHINE}", d))
>  
> +    find_cmd_files = ""
> +    for file in d.getVar('SSTATE_SCAN_FILES', True).split():
> +        find_file = "-o -name \"" + file + "\""
> +        find_cmd_files = find_cmd_files + " " + find_file
> +    d.setVar('SSTATE_FIND_CMD_FILES', find_cmd_files.replace("-o ", "", 1))
> +    bb.note("FIND_CMD_FILES = %s" % find_cmd_files)
> +
>      # These classes encode staging paths into their scripts data so can only be
>      # reused if we manipulate the paths
>      if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d) or bb.data.inherits_class('crosssdk', d):

We could just do:

SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'

which would save some of the anonymous python overhead and the temporary
variable.

Cheers,

Richard




