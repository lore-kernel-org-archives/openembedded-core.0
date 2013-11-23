Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6056C73B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 07:21:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAN7Lgmj021553
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Nov 2013 23:21:42 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 22 Nov 2013 23:21:41 -0800
Message-ID: <5290577B.8010107@windriver.com>
Date: Sat, 23 Nov 2013 15:21:31 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1384943898.git.hongxu.jia@windriver.com>
	<1673532.sZIipt1mGd@helios> <528EF449.5000507@windriver.com>
	<1882168.P1fbh48jv2@helios>
In-Reply-To: <1882168.P1fbh48jv2@helios>
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
X-List-Received-Date: Sat, 23 Nov 2013 07:21:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

I have done as your suggestions:

--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -68,15 +68,16 @@ license_create_manifest() {
          if [ "${COPY_LIC_DIRS}" = "1" ]; then
              for pkg in ${INSTALLED_PKGS}; do
                  mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
-                for lic in `ls ${LICENSE_DIRECTORY}/${pkg}`; do
+                pkged_pn="$(oe-pkgdata-util lookup-recipe 
${PKGDATA_DIR} ${pkg})"
+                for lic in `ls ${LICENSE_DIRECTORY}/${pkged_pn}`; do
                      # Really don't need to copy the generics as they're
                      # represented in the manifest and in the actual 
pkg licenses
                      # Doing so would make your image quite a bit larger
                      if [ "${lic#generic_}" = "${lic}" ]; then
-                        cp ${LICENSE_DIRECTORY}/${pkg}/${lic} 
${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
+                        cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} 
${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
                      else
                          if [ ! -f 
${IMAGE_ROOTFS}/usr/share/common-licenses/${lic} ]; then
-                            cp ${LICENSE_DIRECTORY}/${pkg}/${lic} 
${IMAGE_ROOTFS}/usr/share/common-licenses/
+                            cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} 
${IMAGE_ROOTFS}/usr/share/common-licenses/
                          fi
                          ln -s ../${lic} 
${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
                      fi

//Hongxu


On 11/22/2013 05:54 PM, Paul Eggleton wrote:
> On Friday 22 November 2013 14:06:01 Hongxu Jia wrote:
>> Hi Paul,
>>
>> On 11/22/2013 12:41 AM, Paul Eggleton wrote:
>>> Hi Hongxu,
>>>
>>> On Wednesday 20 November 2013 18:39:02 Hongxu Jia wrote:
>>>> For each recipe, it populated license files to
>>>> ${LICENSE_DIRECTORY}/${PN},
>>>> such as kernel's license dir was
>>>> ${LICENSE_DIRECTORY}/kernel-3.10.17-yocto-standard;
>>>>
>>>> In do_rootfs task, it copied license directories from
>>>> ${LICENSE_DIRECTORY}/
>>>> ${pkg}, and ${pkg} was listed in ${INSTALLED_PKGS};
>>>>
>>>> We got ${INSTALLED_PKGS} by rpm query, such as the kernel were
>>>> 'kernel-*',
>>>> but the kernel's PN was linux-yocto, so searching ${LICENSE_DIRECTORY}/
>>>> kernel-* failed.
>>>>
>>>> Copied license directories from ${LICENSE_DIRECTORY}/${PN} fixed this
>>>> issue.
>>>>
>>>> [YOCTO #5572]
>>>>
>>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> ---
>>>>
>>>>    meta/classes/license.bbclass | 9 ++++++---
>>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
>>>> index 6d7ee94..32605ff 100644
>>>> --- a/meta/classes/license.bbclass
>>>> +++ b/meta/classes/license.bbclass
>>>> @@ -68,15 +68,18 @@ license_create_manifest() {
>>>>
>>>>    		if [ "${COPY_LIC_DIRS}" = "1" ]; then
>>>>    		
>>>>    			for pkg in ${INSTALLED_PKGS}; do
>>>>    			
>>>>    				mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
>>>>
>>>> -				for lic in `ls ${LICENSE_DIRECTORY}/${pkg}`; do
>>>> +				pkged_pn="$(sed -n "/^PACKAGE NAME: ${pkg}$/,/^$/ \
>>>> +                                           {s/^RECIPE NAME: //;
>>>> /^PACKAGE
>>>> NAME:/d; /^PACKAGE VERSION:/d; /^LICENSE:/d; p}" \ +
>>>>
>>>>                      ${LICENSE_MANIFEST})"
>>>>
>>>> +				for lic in `ls ${LICENSE_DIRECTORY}/${pkged_pn}`; do
>>> This isn't the right way to do this. If you need to look up the recipe
>>> name
>>>
>>> from the target package name, in master you can now use:
>>>     oe-pkgdata-util lookup-recipe ${PKGDATA_DIR} "<list of packages>"
>> I am afraid to use oe-pkgdata-util here is not a good idea:
>>
>> - everything we need has been listed in ${LICENSE_MANIFEST},
>>     we just need to sort them out;
>>
>> - the oe-pkgdata-util utility only support to search the specific
>>     ${PKGDATA_DIR} directory which was  ${TMPDIR}/pkgdata/
>>     ${MULTIMACH_TARGET_SYS}, but we need to search multiple
>>     ${MULTIMACH_TARGET_SYS} directories;
> Note that in 1.5 the pkgdata structure changed - it is now under the machine-
> specific sysroot, so there is only one directory to look in.
>
> Cheers,
> Paul
>


