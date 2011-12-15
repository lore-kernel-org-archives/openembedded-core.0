Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rb6wJ-0004f0-IB
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 09:45:19 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2011 00:38:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="87571660"
Received: from unknown (HELO [10.255.12.219]) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2011 00:38:20 -0800
Message-ID: <4EE9B1FC.4090503@linux.intel.com>
Date: Thu, 15 Dec 2011 00:38:20 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323911699.git.sgw@linux.intel.com>
	<54c5ffb66f2e947b81d7cdbb8e8c34c51b38770f.1323911699.git.sgw@linux.intel.com>
In-Reply-To: <54c5ffb66f2e947b81d7cdbb8e8c34c51b38770f.1323911699.git.sgw@linux.intel.com>
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
X-List-Received-Date: Thu, 15 Dec 2011 08:45:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/2011 05:50 PM, Saul Wold wrote:
> This allows recipes to specify files that may be outside the normal set
> for inclusion when there are hardcoded paths that need to be fixmepathed
> to work correctly.
>
> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> ---
>   meta/classes/sstate.bbclass |   11 ++++++++++-
>   1 files changed, 10 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 504b099..5452a43 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -10,7 +10,8 @@ SSTATE_PKGSPEC    = "sstate-${PN}-${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}-$
>   SSTATE_PKGNAME    = "${SSTATE_PKGSPEC}${BB_TASKHASH}"
>   SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
>
> -SSTATE_SCAN_CMD ?= "find ${SSTATE_BUILDDIR} \( -name "*.la" -o -name "*-config" \) -type f"
> +SSTATE_SCAN_FILES ?= "*.la *-config"
> +SSTATE_SCAN_CMD ?= "find ${SSTATE_BUILDDIR} \( ${SSTATE_FIND_CMD_FILES} \) -type f"
>
>   BB_HASHFILENAME = "${SSTATE_PKGNAME}"
>
> @@ -33,6 +34,13 @@ python () {
>       else:
>           d.setVar('SSTATE_MANMACH', bb.data.expand("${MACHINE}", d))
>
> +    find_cmd_files = ""
> +    for file in d.getVar('SSTATE_SCAN_FILES', True).split():
> +        find_file = "-o -name \"" + file + "\""
> +        find_cmd_files = find_cmd_files + " " + find_file
> +    d.setVar('SSTATE_FIND_CMD_FILES', find_cmd_files.replace("-o ", "", 1))
> +    bb.note("FIND_CMD_FILES = %s" % find_cmd_files)
> +
Just realized I left some debugging stuff here and below, this is fixed 
in the bracnh
>       # These classes encode staging paths into their scripts data so can only be
>       # reused if we manipulate the paths
>       if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d) or bb.data.inherits_class('crosssdk', d):
> @@ -299,6 +307,7 @@ def sstate_hardcode_path(d):
>   	# Need to remove hardcoded paths and fix these when we install the
>   	# staging packages.
>   	sstate_scan_cmd = d.getVar('SSTATE_SCAN_CMD', True)
> +        bb.note("SCAN_CMD = %s" % sstate_scan_cmd)
Bad Sau! left debugging!

Sau!

>   	p = os.popen("%s" % sstate_scan_cmd)
>   	file_list = p.read()
>


