Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAUvw-0008Rn-2N
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 01:32:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2013 16:15:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,743,1355126400"; d="scan'208";a="268134385"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2013 16:15:12 -0800
Message-ID: <512D5010.9080107@linux.intel.com>
Date: Tue, 26 Feb 2013 16:15:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1361891289-6777-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1361891289-6777-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] log_srcrev.bbclass: add a bbclass for logging SRCREVs
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
X-List-Received-Date: Wed, 27 Feb 2013 00:32:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2013 07:08 AM, Constantin Musca wrote:
> - add a task which creates a file for each package with the following
> format:
>
> ${BB_FILENAME},${SRC_URI},${SRCREV},${FROM_AUTOREV}
>
> [YOCTO #3041]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   meta/classes/log_srcrev.bbclass | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 meta/classes/log_srcrev.bbclass
>
> diff --git a/meta/classes/log_srcrev.bbclass b/meta/classes/log_srcrev.bbclass
> new file mode 100644
> index 0000000..a04702c
> --- /dev/null
> +++ b/meta/classes/log_srcrev.bbclass
> @@ -0,0 +1,15 @@
> +python do_log_srcrev () {
> +    srcrev = d.getVar('SRCREV', True)
> +    if srcrev:
> +        bbfile = d.getVar('BB_FILENAME', True)
> +        src_uri = d.getVar('SRC_URI', True)
> +        from_autorev = 'yes' if d.getVar('SRCREV', False) == 'AUTOINC' else 'no'
> +
> +        srcrevfile = d.expand('${TMPDIR}/srcrevs/${MULTIMACH_TARGET_SYS}/${BP}')
> +        bb.utils.mkdirhier(os.path.dirname(srcrevfile))
> +
> +        with open(srcrevfile, 'w') as f:
> +            f.write(','.join([bbfile, src_uri, srcrev, from_autorev]))
> +}
> +
> +addtask do_log_srcrev after do_fetch
>

Otavio makes a good point, this might be something to consider putting 
it in to the RecipeInfo in buildhistory.bbclass and extend the 
write_pkghistory(), but maybe write the file with a different name 
latest_srcrev

Sau!



