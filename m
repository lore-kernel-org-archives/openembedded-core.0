Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnEyk-0002as-RZ
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:45:59 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 11:38:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57371483"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 11:38:00 -0800
Message-ID: <4F15CE18.1080002@linux.intel.com>
Date: Tue, 17 Jan 2012 11:38:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326385824-32201-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1326385824-32201-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] package.bbclass: quote pathname given to objdump
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
X-List-Received-Date: Tue, 17 Jan 2012 19:45:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 08:30 AM, Enrico Scholz wrote:
> Packaging will fail with executable files containing spaces in their
> names. Patch quotes the parameter passed to 'objdump'.
>
> Signed-off-by: Enrico Scholz<enrico.scholz@sigma-chemnitz.de>
> ---
>   meta/classes/package.bbclass |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index f8f0a12..1088470 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1205,7 +1205,7 @@ SHLIBSDIR = "${STAGING_DIR_HOST}/shlibs"
>   SHLIBSWORKDIR = "${WORKDIR}/shlibs"
>
>   python package_do_shlibs() {
> -	import re
> +	import re, pipes
>
>   	exclude_shlibs = d.getVar('EXCLUDE_FROM_SHLIBS', 0)
>   	if exclude_shlibs:
> @@ -1234,7 +1234,7 @@ python package_do_shlibs() {
>   	lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))
>
>   	def linux_so(root, path, file):
> -		cmd = d.getVar('OBJDUMP', True) + " -p " + os.path.join(root, file) + " 2>/dev/null"
> +		cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(os.path.join(root, file)) + " 2>/dev/null"
>   		cmd = "PATH=\"%s\" %s" % (d.getVar('PATH', True), cmd)
>   		fd = os.popen(cmd)
>   		lines = fd.readlines()

Merged into OE-Core

Thanks	
	Sau!


