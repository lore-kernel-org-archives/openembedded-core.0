Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F005176FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 17:14:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t83HEEA1001436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Sep 2015 10:14:14 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Thu, 3 Sep 2015 10:14:14 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
	<82a9dc6d0c430ec44a9a7cf4e2499bdd5bffeb1f.1441291646.git.joshua.lock@collabora.co.uk>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55E87FE5.8050406@windriver.com>
Date: Thu, 3 Sep 2015 12:14:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <82a9dc6d0c430ec44a9a7cf4e2499bdd5bffeb1f.1441291646.git.joshua.lock@collabora.co.uk>
Subject: Re: [PATCH 8/9] nfs-utils: don't force use of /sbin as sbindir
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
X-List-Received-Date: Thu, 03 Sep 2015 17:14:15 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 9/3/15 9:58 AM, Joshua Lock wrote:
> In a system with a merged /usr /sbin isn't packaged.

This sounds like an error to me if /sbin doesn't exist at all. It should exist
either as a link to /usr/sbin (or the reverse).. but it should be there as lots
of things expect the directory (or link) to exist.

(It's also required by the FHS, even though that probably isn't enough of a
concern.)

> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> index 6da8509..42101de 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> @@ -90,6 +90,14 @@ RDEPENDS_${PN}-stats = "python"
>  
>  FILES_${PN} += "${systemd_unitdir}"
>  
> +do_configure_prepend() {
> +        sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
> +            ${S}/utils/mount/Makefile.am
> +
> +        sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
> +            ${S}/utils/osd_login/Makefile.am
> +}
> +
>  # Make clean needed because the package comes with
>  # precompiled 64-bit objects that break the build
>  do_compile_prepend() {
> 

So my concern is simply with the commit msg -- not the actual implementation.
What you have above looks correct to me.

