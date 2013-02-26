Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UA8iM-0006IO-1V
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 01:48:20 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Feb 2013 16:31:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,736,1355126400"; d="scan'208";a="291715698"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2013 16:31:54 -0800
Message-ID: <512C027A.4010400@linux.intel.com>
Date: Mon, 25 Feb 2013 16:31:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1361522961-5673-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1361522961-5673-1-git-send-email-constantinx.musca@intel.com>
Cc: peachj@lexmark.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] log_srcrev.bbclass: add a bbclass for logging SRCREVs
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
X-List-Received-Date: Tue, 26 Feb 2013 00:48:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/22/2013 12:49 AM, Constantin Musca wrote:
> - add a task which creates a file for each package with the following
> format:
>
> BB_FILENAME: ${BB_FILENAME}
> SRC_URI: ${SRC_URI}
> SRCREV: ${SRCREV}
> FROM AUTOREV: no/yes
>
Would it be better to have the format more as a CSV

bbfilename,src_uri,srcrev,autorev?

This would make it easier to parse for scripts

Jerrod, you are the requester on this, do you have any comments on the 
format?


> [YOCTO #3041]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   meta/classes/log_srcrev.bbclass | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644 meta/classes/log_srcrev.bbclass
>
> diff --git a/meta/classes/log_srcrev.bbclass b/meta/classes/log_srcrev.bbclass
> new file mode 100644
> index 0000000..b319e7b
> --- /dev/null
> +++ b/meta/classes/log_srcrev.bbclass
> @@ -0,0 +1,20 @@
> +SRCREV_LOGFILE ??= 'srcrev_log'
> +
> +python do_log_srcrev () {
> +    srcrev = d.getVar('SRCREV', True)
> +    if srcrev:
> +        bbfile = d.getVar('BB_FILENAME', True)
> +        src_uri = d.getVar('SRC_URI', True)
> +        from_autorev = 'yes' if d.getVar('SRCREV', False) == 'AUTOINC' else 'no'
> +
> +        srcrevdir = d.expand('${TMPDIR}/srcrevs/${MULTIMACH_TARGET_SYS}/${PN}-${PV}/')
> +        srcrevfile = os.path.join(srcrevdir, d.getVar('SRCREV_LOGFILE', True))
> +        bb.utils.mkdirhier(os.path.dirname(srcrevfile))
> +
Do we really need the extra level of directory here?  Can the data be 
contained in a ${PN}-${PV} file instead?  Also this might be better to 
be ${BP} (base package & version).

You already have the mulitlib info in the ${MULTIMACH_TARGET_SYS} info.


Thanks
	Sau!


> +        with open(srcrevfile, 'w') as f:
> +            f.write("BB_FILENAME: %s\nSRC_URI: %s\nSRCREV: %s\nFROM AUTOREV: %s\n"
> +                    % (bbfile, src_uri, srcrev, from_autorev))
> +}
> +
> +addtask do_log_srcrev after do_fetch
> +do_log_srcrev[cleandirs] = "${TMPDIR}/srcrevs/${MULTIMACH_TARGET_SYS}/${PN}-${PV}/"
>


