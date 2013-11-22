Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E9F536CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 09:54:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Nov 2013 01:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,751,1378882800"; d="scan'208";a="412945354"
Received: from pauljbro-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.218])
	by orsmga001.jf.intel.com with ESMTP; 22 Nov 2013 01:54:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 09:54:27 +0000
Message-ID: <1882168.P1fbh48jv2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <528EF449.5000507@windriver.com>
References: <cover.1384943898.git.hongxu.jia@windriver.com>
	<1673532.sZIipt1mGd@helios> <528EF449.5000507@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: Re: [PATCH 1/1] license.bbclass: fix copying license directories failed
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
X-List-Received-Date: Fri, 22 Nov 2013 09:54:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 22 November 2013 14:06:01 Hongxu Jia wrote:
> Hi Paul,
> 
> On 11/22/2013 12:41 AM, Paul Eggleton wrote:
> > Hi Hongxu,
> > 
> > On Wednesday 20 November 2013 18:39:02 Hongxu Jia wrote:
> >> For each recipe, it populated license files to
> >> ${LICENSE_DIRECTORY}/${PN},
> >> such as kernel's license dir was
> >> ${LICENSE_DIRECTORY}/kernel-3.10.17-yocto-standard;
> >> 
> >> In do_rootfs task, it copied license directories from
> >> ${LICENSE_DIRECTORY}/
> >> ${pkg}, and ${pkg} was listed in ${INSTALLED_PKGS};
> >> 
> >> We got ${INSTALLED_PKGS} by rpm query, such as the kernel were
> >> 'kernel-*',
> >> but the kernel's PN was linux-yocto, so searching ${LICENSE_DIRECTORY}/
> >> kernel-* failed.
> >> 
> >> Copied license directories from ${LICENSE_DIRECTORY}/${PN} fixed this
> >> issue.
> >> 
> >> [YOCTO #5572]
> >> 
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> ---
> >> 
> >>   meta/classes/license.bbclass | 9 ++++++---
> >>   1 file changed, 6 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> >> index 6d7ee94..32605ff 100644
> >> --- a/meta/classes/license.bbclass
> >> +++ b/meta/classes/license.bbclass
> >> @@ -68,15 +68,18 @@ license_create_manifest() {
> >> 
> >>   		if [ "${COPY_LIC_DIRS}" = "1" ]; then
> >>   		
> >>   			for pkg in ${INSTALLED_PKGS}; do
> >>   			
> >>   				mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
> >> 
> >> -				for lic in `ls ${LICENSE_DIRECTORY}/${pkg}`; do
> >> +				pkged_pn="$(sed -n "/^PACKAGE NAME: ${pkg}$/,/^$/ \
> >> +                                           {s/^RECIPE NAME: //;
> >> /^PACKAGE
> >> NAME:/d; /^PACKAGE VERSION:/d; /^LICENSE:/d; p}" \ +
> >> 
> >>                     ${LICENSE_MANIFEST})"
> >> 
> >> +				for lic in `ls ${LICENSE_DIRECTORY}/${pkged_pn}`; do
> > 
> > This isn't the right way to do this. If you need to look up the recipe
> > name
> > 
> > from the target package name, in master you can now use:
> >    oe-pkgdata-util lookup-recipe ${PKGDATA_DIR} "<list of packages>"
> 
> I am afraid to use oe-pkgdata-util here is not a good idea:
> 
> - everything we need has been listed in ${LICENSE_MANIFEST},
>    we just need to sort them out;
> 
> - the oe-pkgdata-util utility only support to search the specific
>    ${PKGDATA_DIR} directory which was  ${TMPDIR}/pkgdata/
>    ${MULTIMACH_TARGET_SYS}, but we need to search multiple
>    ${MULTIMACH_TARGET_SYS} directories;

Note that in 1.5 the pkgdata structure changed - it is now under the machine-
specific sysroot, so there is only one directory to look in.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

