Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TLhCZ-0001oK-E2
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 23:18:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q99L5k5P000777
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2012 14:05:46 -0700 (PDT)
Received: from msp-dhcp13.wrs.com (172.25.34.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 9 Oct 2012 14:05:46 -0700
Message-ID: <507491AC.6020804@windriver.com>
Date: Tue, 9 Oct 2012 16:05:48 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1349815996-3767-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1349815996-3767-1-git-send-email-jslater@windriver.com>
Subject: Re: [PATCH] chkconfig: pass CFLAGS to Makefile
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
X-List-Received-Date: Tue, 09 Oct 2012 21:18:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/12 3:53 PM, Joe Slater wrote:
> The environment CFLAGS is not used by the chkconfig
> Makefile, so debug and optimization options are ignored.
> So, we use RPM_OPT_FLAGS to pass CFLAGS into Makefile.
>
> Upstream-Status:  Inappropriate [configuration]
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> index 17987a6..a9cf268 100644
> --- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> +++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> @@ -21,7 +21,10 @@ SRC_URI[sha256sum] = "18b497d25b2cada955c72810e45fcad8280d105f17cf45e2970f182712
>
>   inherit autotools gettext
>
> -EXTRA_OEMAKE += 'MANDIR="${mandir}" BINDIR="${base_sbindir}" SBINDIR="${sbindir}"'
> +# Makefile uses RPM_OPT_fLAGS to construct CFLAGS
> +#
> +EXTRA_OEMAKE += 'RPM_OPT_FLAGS="${CFLAGS}" MANDIR="${mandir}" \
> +                 BINDIR="${base_sbindir}" SBINDIR="${sbindir}"'
>
>   do_install_append() {
>       mkdir -p ${D}/etc/chkconfig.d
>

This can potentially impact what was built, so you need to update the PR.

Otherwise looks find.

--Mark


