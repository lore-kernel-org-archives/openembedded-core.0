Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R3qh6-0002j0-5w
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 16:44:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8EEcvQn001221
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 07:38:57 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 14 Sep 2011 07:38:56 -0700
Message-ID: <4E70BC80.3080503@windriver.com>
Date: Wed, 14 Sep 2011 09:38:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1315980095.git.dongxiao.xu@intel.com>
	<d993fc546f234117bc751192e17b46e9dfc1e249.1315980095.git.dongxiao.xu@intel.com>
In-Reply-To: <d993fc546f234117bc751192e17b46e9dfc1e249.1315980095.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 2/3] rootfs_rpm: Use specific MACHINE_ARCH for multilib recipes
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
X-List-Received-Date: Wed, 14 Sep 2011 14:44:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This looks fine.  The do_archgen() function within the libzypp_git.bb will need
to be updated to look for the multilib machine type as well.

--Mark

On 9/14/11 1:08 AM, Dongxiao Xu wrote:
> Currently MACHINE_ARCH deploy folder is unique in multilib system, thus
> a lib32 version of rpm package will override a normal rpm package if its
> PACKAGE_ARCH is ${MACHINE_ARCH}.
> 
> Take netbase as an example, which the PACKAGE_ARCH = MACHINE_ARCH. Both
> the normal version of netbase package and the lib32 version are named as
> "netbase-4.45-r1.qemux86_64.rpm" putting in tmp/deploy/rpm/qemux86-64
> directory, so we need to differentiate them.
> 
> Here we define spedific MACHINE_virtclass-multilib-lib(xx) to override
> the default MACHINE value, thus got different MACHINE_ARCH to fix this
> issue.
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  meta/classes/rootfs_rpm.bbclass |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
> index 135ca75..56c1a85 100644
> --- a/meta/classes/rootfs_rpm.bbclass
> +++ b/meta/classes/rootfs_rpm.bbclass
> @@ -218,6 +218,9 @@ python () {
>              default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
>              if default_tune:
>                  localdata.setVar("DEFAULTTUNE", default_tune)
> +            machine = localdata.getVar("MACHINE_virtclass-multilib-" + eext[1], False)
> +            if machine:
> +                localdata.setVar("MACHINE", machine)
>              ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
>              #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
>      bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)



