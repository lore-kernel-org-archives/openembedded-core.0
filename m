Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SMLdt-0006iR-Ip
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 17:57:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2012 08:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="132881826"
Received: from unknown (HELO envy.home) ([10.7.199.64])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2012 08:47:59 -0700
Message-ID: <4F957991.8090800@linux.intel.com>
Date: Mon, 23 Apr 2012 08:47:29 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334940120.git.sgw@linux.intel.com>
	<086fa62c043e3cd4b9bc8d2377507ed842a3097b.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <086fa62c043e3cd4b9bc8d2377507ed842a3097b.1334940120.git.sgw@linux.intel.com>
X-Enigmail-Version: 1.4.1
Cc: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>
Subject: Re: [CONSOLIDATED PULL 29/43] package.bbclass: Ensure kernel modules get stripped
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
X-List-Received-Date: Mon, 23 Apr 2012 15:57:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/20/2012 09:45 AM, Saul Wold wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Kernel modules are not marked as executable but we do expect to strip them.
> This patch adds in missing code to ensure we do this. Without this images
> are getting sigificantly bloated in size.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package.bbclass |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 99c945d..71bd3a6 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -870,6 +870,14 @@ python split_and_strip_files () {
>  				elf_file = int(file_list[file][5:])
>  				#bb.note("Strip %s" % file)
>  				runstrip(file, elf_file, d)
> +
> +
> +	if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):	<- white space at end

Note: Whitespace at end of line.

I understand it's common practice with bitbake recipes to compare to '1'
as a string. However, this isn't documented in the usae of
INHIBIT_PACKAGE_STRIP, and it seems reasonable that someone might try
setting "True" or "yes" or some other common affirmative label.

Scott, can we update the ref manual glossary to indicate that assigning
to the string "1" is the way to set this to true?


> +		for root, dirs, files in os.walk(dvar):
> +			for f in files:
> +				if not f.endswith(".ko"):
> +					continue
> +				runstrip(os.path.join(root, f), None, d)

Not a big deal, but you can drop the "not" and the "continue" and only
runtstrip if the file ends with ".ko" since there isn't anything else
done in the loop.

>  	#
>  	# End of strip
>  	#

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


