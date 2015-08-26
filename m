Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70A1676DB0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 16:42:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7QGgD1I014944
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Aug 2015 09:42:13 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Wed, 26 Aug 2015 09:42:12 -0700
To: Patrick Ohly <patrick.ohly@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <f1fe5d98cb0737847778531368eab04778076750.1440603928.git.patrick.ohly@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55DDEC63.7050707@windriver.com>
Date: Wed, 26 Aug 2015 11:42:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <f1fe5d98cb0737847778531368eab04778076750.1440603928.git.patrick.ohly@intel.com>
Subject: Re: [PATCH 1/1] mtd-utils: add xattr PACKAGECONFIG and fix acl dependency
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
X-List-Received-Date: Wed, 26 Aug 2015 16:42:18 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

While I haven't tried this, it is exactly what I would have expected.

Acked-by: Mark Hatle <mark.hatle@windriver.com>

On 8/26/15 11:10 AM, Patrick Ohly wrote:
> The unconditional removal of -DWITHOUT_XATTR accidentally introduced a
> compile-time dependency on "acl", because "sys/acl.h" gets
> included. This caused random compile failures.
> 
> To fix this, we introduce a proper PACKAGECONFIG for the "xattr"
> support, with the distro's "xattr" feature determining the
> default. Setting the define must be done with custom code because
> PACKAGECONFIG can only influence configure parameters.
> 
> The "acl" distro feature is not checked because although enabling
> "xattr" support now triggers a build of acl, nothing from it will not
> get included in the resulting target image. This seems more suitable
> than not enabling xattr support in mtd-utils when acl support in the
> distro is disabled.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 8d4892a..17dca77 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -19,7 +19,13 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
>  
>  S = "${WORKDIR}/git/"
>  
> -EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include' 'BUILDDIR=${S}'"
> +# xattr support creates an additional compile-time dependency on acl because
> +# the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
> +# regardless whether acl is enabled or disabled in the distro should be okay.
> +PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)}"
> +PACKAGECONFIG[xattr] = ",,acl,"
> +
> +EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
>  
>  do_install () {
>  	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> 


