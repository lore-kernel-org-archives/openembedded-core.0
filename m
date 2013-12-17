Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 28C0D6088D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 14:22:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBHEMSdv002775
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 06:22:29 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 17 Dec 2013 06:22:28 -0800
Message-ID: <52B05E23.4010402@windriver.com>
Date: Tue, 17 Dec 2013 08:22:27 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1387270422.git.Qi.Chen@windriver.com>
	<e2ef71afaed27a2ea2d295132b725fe687da7b62.1387270422.git.Qi.Chen@windriver.com>
In-Reply-To: <e2ef71afaed27a2ea2d295132b725fe687da7b62.1387270422.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] rootfs_rpm.bbclass: make complementary packages not attempt-only
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
X-List-Received-Date: Tue, 17 Dec 2013 14:22:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/13, 2:54 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Installing complementary packages should not be attempt-only, otherwise,
> errors would be hidden. For example, if we enable ptest distro feature,
> and we add 'ptest-pkgs' to IMAGE_FEATRUES, then building a minimal image
> would succeed without reporting any error. However, the systemd-ptest
> is not installed because of lack of the perl package.

Actually that was intentional under the original system design.  Any of the 
complementary packages were just that, complementary and not required for the 
system to function properly.

If dependencies, installation issues, etc caused problems, we could happily skip 
them and continue on.  There are places (fairly few these days) where the 
complementary packages are known to introduce a failure, if not ignored.

This happens primarily when the complementary set introduces a package that has 
a conflict (RCONFLICT or a file level conflict) with something installed in the 
required set.

--Mark

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/rootfs_rpm.bbclass |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
> index 1a0c225..9a88330 100644
> --- a/meta/classes/rootfs_rpm.bbclass
> +++ b/meta/classes/rootfs_rpm.bbclass
> @@ -170,8 +170,8 @@ rpm_setup_smart_target_config() {
>
>   rootfs_install_packages() {
>   	# Note - we expect the variables not set here to already have been set
> -	export INSTALL_PACKAGES_RPM=""
> -	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="`cat $1`"
> +	export INSTALL_PACKAGES_RPM="`cat $1`"
> +	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
>   	export INSTALL_PROVIDENAME_RPM=""
>   	export INSTALL_TASK_RPM="rootfs_install_packages"
>   	export INSTALL_COMPLEMENTARY_RPM="1"
>


