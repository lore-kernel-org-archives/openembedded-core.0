Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TsKbh-0007qa-3D
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 22:51:48 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Jan 2013 13:36:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,425,1355126400"; d="scan'208";a="188626947"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Jan 2013 13:36:33 -0800
Message-ID: <50EB3FE1.6020803@linux.intel.com>
Date: Mon, 07 Jan 2013 13:36:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <cover.1357461730.git.hongxu.jia@windriver.com>
	<3dad51b86a16d1bc44a8ac69c8a0efac870768e1.1357461730.git.hongxu.jia@windriver.com>
In-Reply-To: <3dad51b86a16d1bc44a8ac69c8a0efac870768e1.1357461730.git.hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] apt-native: fix the creation of apt.conf.sample
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
X-List-Received-Date: Mon, 07 Jan 2013 21:51:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2013 12:43 AM, Hongxu Jia wrote:
> The file of apt.conf.sample is kept in outdir, and outdir is assigned
> by "os.path.join" with the params of ${D}, ${sysconfdir} and "apt". But
> ${sysconfdir} is an absolute dir and that is not allowed by "os.path.join".
>
> The following is the help on function os.path.join(a, *p):
>      Join two or more pathname components, inserting '/' as needed.
>      If any component is an absolute path, all previous path components
>      will be discarded.
>
> So remove "/" in ${sysconfdir} to create "apt.conf.sample" if it doesn't
> exist, not by the existance of prefix dir.
>
> [YOCTO #3677]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-devtools/apt/apt-native.inc |    7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
> index ab89f71..0de159a 100644
> --- a/meta/recipes-devtools/apt/apt-native.inc
> +++ b/meta/recipes-devtools/apt/apt-native.inc
> @@ -20,14 +20,17 @@ python do_install_config () {
>
>       data = d.expand(data)
>
> -    outdir = os.path.join(d.getVar('D', True), d.getVar('sysconfdir', True), 'apt')
> +    # os.path.join does not allow sysconfdir to be a absolute dir
> +    outdir = os.path.join(d.getVar('D', True), d.getVar('sysconfdir', True)[1:], 'apt')
>       if not os.path.exists(outdir):
>           os.makedirs(outdir)
> -        outpath = os.path.join(outdir, 'apt.conf.sample')
>
> +    outpath = os.path.join(outdir, 'apt.conf.sample')
> +    if not os.path.exists(outpath):
>           outfile = file(outpath, 'w')
>           outfile.write(data)
>           outfile.close()
> +        bb.note("create %s" %outpath)
Do we need to keep this debug message around?

Sau!

>   }
>
>   do_install_base () {
>


