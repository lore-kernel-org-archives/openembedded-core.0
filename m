Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D02946D4ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 06:06:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAM66C6w027821
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 22:06:12 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 21 Nov 2013 22:06:11 -0800
Message-ID: <528EF449.5000507@windriver.com>
Date: Fri, 22 Nov 2013 14:06:01 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1384943898.git.hongxu.jia@windriver.com>
	<e3569e31c54d36354b5c702b7b95ecda26884a18.1384943898.git.hongxu.jia@windriver.com>
	<1673532.sZIipt1mGd@helios>
In-Reply-To: <1673532.sZIipt1mGd@helios>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
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
X-List-Received-Date: Fri, 22 Nov 2013 06:06:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

On 11/22/2013 12:41 AM, Paul Eggleton wrote:
> Hi Hongxu,
>
> On Wednesday 20 November 2013 18:39:02 Hongxu Jia wrote:
>> For each recipe, it populated license files to ${LICENSE_DIRECTORY}/${PN},
>> such as kernel's license dir was
>> ${LICENSE_DIRECTORY}/kernel-3.10.17-yocto-standard;
>>
>> In do_rootfs task, it copied license directories from ${LICENSE_DIRECTORY}/
>> ${pkg}, and ${pkg} was listed in ${INSTALLED_PKGS};
>>
>> We got ${INSTALLED_PKGS} by rpm query, such as the kernel were 'kernel-*',
>> but the kernel's PN was linux-yocto, so searching ${LICENSE_DIRECTORY}/
>> kernel-* failed.
>>
>> Copied license directories from ${LICENSE_DIRECTORY}/${PN} fixed this issue.
>>
>> [YOCTO #5572]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/license.bbclass | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
>> index 6d7ee94..32605ff 100644
>> --- a/meta/classes/license.bbclass
>> +++ b/meta/classes/license.bbclass
>> @@ -68,15 +68,18 @@ license_create_manifest() {
>>   		if [ "${COPY_LIC_DIRS}" = "1" ]; then
>>   			for pkg in ${INSTALLED_PKGS}; do
>>   				mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
>> -				for lic in `ls ${LICENSE_DIRECTORY}/${pkg}`; do
>> +				pkged_pn="$(sed -n "/^PACKAGE NAME: ${pkg}$/,/^$/ \
>> +                                           {s/^RECIPE NAME: //; /^PACKAGE
>> NAME:/d; /^PACKAGE VERSION:/d; /^LICENSE:/d; p}" \ +
>>                     ${LICENSE_MANIFEST})"
>> +				for lic in `ls ${LICENSE_DIRECTORY}/${pkged_pn}`; do
> This isn't the right way to do this. If you need to look up the recipe name
> from the target package name, in master you can now use:
>
>    oe-pkgdata-util lookup-recipe ${PKGDATA_DIR} "<list of packages>"

I am afraid to use oe-pkgdata-util here is not a good idea:

- everything we need has been listed in ${LICENSE_MANIFEST},
   we just need to sort them out;

- the oe-pkgdata-util utility only support to search the specific
   ${PKGDATA_DIR} directory which was  ${TMPDIR}/pkgdata/
   ${MULTIMACH_TARGET_SYS}, but we need to search multiple
   ${MULTIMACH_TARGET_SYS} directories;

   Such as "base-passwd in x86_64" and "base-files in qemux86_64";

//Hongxu

> Cheers,
> Paul
>


