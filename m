Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CE5A9601A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 08:18:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s458IZJT020968; Mon, 5 May 2014 09:18:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wX6CQ0quEtNF; Mon,  5 May 2014 09:18:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s458ISIl020964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 5 May 2014 09:18:30 +0100
Message-ID: <1399277902.12731.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Mon, 05 May 2014 09:18:22 +0100
In-Reply-To: <70f2774fe13948f7f044c202325762d48cd1369e.1399275082.git.Qi.Chen@windriver.com>
References: <cover.1399275082.git.Qi.Chen@windriver.com>
	<70f2774fe13948f7f044c202325762d48cd1369e.1399275082.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] populate_sdk_base: modify the recrdeptask of do_populate_sdk
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
X-List-Received-Date: Mon, 05 May 2014 08:18:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-05-05 at 16:11 +0800, Chen Qi wrote:
> If 'rm_work' is enabled, `bitbake core-image-xxx -c populate_sdk'
> doesn't clean things up for the nativesdk packages.
> 
> This patch modifies the 'recrdeptask' for do_populate_sdk to fix this
> problem.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/populate_sdk_base.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 10d04ed..278d1b7 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -333,5 +333,5 @@ populate_sdk_log_check() {
>  do_populate_sdk[dirs] = "${TOPDIR}"
>  do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}"
>  do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
> -do_populate_sdk[recrdeptask] += "do_packagedata do_package_write_rpm do_package_write_ipk do_package_write_deb"
> +do_populate_sdk[recrdeptask] += "do_packagedata do_${BB_DEFAULT_TASK}"

No. This task has no such dependency on do_build of the other tasks. We
don't create invalid dependencies just for the sake of it.

If you run "bitbake X -c populate_sysroot" or -c package_write_ipk or
101 other options, it will not run rm_work either. Are you proposing we
add do_${BB_DEFAULT_TASK} to every task in the system?

Cheers,

Richard


