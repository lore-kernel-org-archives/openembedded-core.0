Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A22BD6E3BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 16:27:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2013 08:23:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,479,1384329600"; d="scan'208";a="424295270"
Received: from unknown (HELO [10.255.12.47]) ([10.255.12.47])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2013 08:27:41 -0800
Message-ID: <52AB357D.3040805@linux.intel.com>
Date: Fri, 13 Dec 2013 08:27:41 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Matthieu Crapet <Matthieu.Crapet@ingenico.com>, 
	openembedded-core@lists.openembedded.org
References: <1386946865-18483-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1386946865-18483-1-git-send-email-Matthieu.Crapet@ingenico.com>
Subject: Re: [PATCH] bash-completion: add recipe
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
X-List-Received-Date: Fri, 13 Dec 2013 16:27:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Needs more comment as to why we need this along with a Signed-off-by: 
tag.  Can you include where you brought this in from.



On 12/13/2013 07:01 AM, Matthieu Crapet wrote:
> ---
>   .../bash-completion/bash-completion_2.0.bb         | 31 ++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 meta/recipes-support/bash-completion/bash-completion_2.0.bb
>
> diff --git a/meta/recipes-support/bash-completion/bash-completion_2.0.bb b/meta/recipes-support/bash-completion/bash-completion_2.0.bb
> new file mode 100644
> index 0000000..f08988a
> --- /dev/null
> +++ b/meta/recipes-support/bash-completion/bash-completion_2.0.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "Programmable Completion for Bash 4"
> +HOMEPAGE = "http://bash-completion.alioth.debian.org/"
> +BUGTRACKER = "https://alioth.debian.org/projects/bash-completion/"
> +
> +SECTION = "console/utils"
> +RDEPENDS_${PN} = "bash"
> +PR = "r1"
> +
Did you bump PR here or is it coming over with a PR already = "r1"  If 
this is truly a new recipe, then we can drop the PR, but we might need a 
PE since the classic recipe had a PV of 20040711 which is greater than 
this new PV of 2.0.

> +SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "0d903f398be8c8f24bc5ffa6f86127f8"
> +SRC_URI[sha256sum] = "e5a490a4301dfb228361bdca2ffca597958e47dd6056005ef9393a5852af5804"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +
These belong above after Section

> +inherit allarch autotools
> +
> +do_configure() {
> +	oe_runconf
> +}
> +
> +do_install_append() {
> +	install -d ${D}${sysconfdir}/bash_completion.d/
> +	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_completion
> +}
> +
> +# Some recipes are providing ${PN}-bash-completion packages
> +PACKAGES_prepend += "${PN}-extra "
> +FILES_${PN}-extra = "${datadir}/${BPN}/completions/ \
> +    ${datadir}/${BPN}/helpers/"
>

