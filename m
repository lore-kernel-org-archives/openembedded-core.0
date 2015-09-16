Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2928073D13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 02:37:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G2b3g5007298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Sep 2015 19:37:03 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 19:37:02 -0700
To: "Reshetova, Elena" <elena.reshetova@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>
References: <2236FBA76BA1254E88B949DDB74E612B41976CB1@IRSMSX102.ger.corp.intel.com>
	<55EF9D64.8000601@windriver.com>
	<2236FBA76BA1254E88B949DDB74E612B41979490@IRSMSX102.ger.corp.intel.com>
	<55F70A07.20409@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <55F8D5CD.70606@windriver.com>
Date: Tue, 15 Sep 2015 22:37:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55F70A07.20409@windriver.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: How to put a correct dependency with regards to gcc?
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
X-List-Received-Date: Wed, 16 Sep 2015 02:37:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-14 01:55 PM, Randy MacLeod wrote:
> On 2015-09-09 12:09 PM, Reshetova, Elena wrote:
>>> Maybe we have to fix gcc-source after all rather than use the
>>> EXCLUDE_WORLD
>> change I made in:
>>>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=7878
>>
>> Should I file a bug about this for easy tracking? My problem really seems
>> that do_fetch on some related to gcc packages doesn't result in fetch of
>> sources.
>
> I'll send a fix early this week.
>
> ../Randy
>
>>
>>> Does your scheme work for the kernel source? See:
>>
>>> Search for "kernel-devsrc" here:
>>>   http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/68352
>>
>> There doesn't seem to be an issue with kernel source packages for my
>> task. I
>> think this is because the sources are correctly fetched by dependent
>> packages.
>>
>> Best Regards,
>> Elena.
>>
>

I haven't been able to come up with a scheme that works yet.
With the patch below, I get:

I'll need someone to explain the intent of the gcc-* pkgs
design or more time to dig though the files and history.

Robert tells me that my idea that I need a bitbake rule to:
  " call the parent implementation or
    if there isn't one, return success."
has been discussed before and it is not easy to do.

For me, this is "a nice to have" feature that could wait
for oe-core-2.1.

../Randy



diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc 
b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index c987ccb..1da7bda 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -5,12 +5,18 @@ LICENSE = "NCSA | MIT"
  LIC_FILES_CHKSUM = "\
      file://libsanitizer/LICENSE.TXT;md5=0249c37748936faf5b1efd5789587909 \
  "
+EXCLUDE_FROM_WORLD = "1"

  EXTRA_OECONF_PATHS = "\
      --with-sysroot=/not/exist \
      --with-build-sysroot=${STAGING_DIR_TARGET} \
  "

+# These stages are done by the sister gcc package:
+# do_unpack[noexec] = "1"
+# do_patch[noexec] = "1"
+
+
  do_configure () {
      mtarget=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
      target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
diff --git a/meta/recipes-devtools/gcc/gcc-source.inc 
b/meta/recipes-devtools/gcc/gcc-source.inc
index 794fd4d..ef4ff60 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -1,15 +1,16 @@
-deltask do_configure
-deltask do_compile
-deltask do_package
-deltask do_package_write_rpm
-deltask do_package_write_ipk
-deltask do_package_write_deb
-deltask do_install
-deltask do_populate_sysroot
-deltask do_populate_lic
-deltask do_package_qa
-deltask do_packagedata
-deltask do_rm_work
+# gcc-source should only be fetched, unpacked and patched.
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_package[noexec] = "1"
+do_package_write_rpm[noexec] = "1"
+do_package_write_ipk[noexec] = "1"
+do_package_write_deb[noexec] = "1"
+do_install[noexec] = "1"
+do_populate_sysroot[noexec] = "1"
+do_populate_lic[noexec] = "1"
+do_package_qa[noexec] = "1"
+do_packagedata[noexec] = "1"
+do_rm_work[noexec] = "1"

  PN = "gcc-source-${PV}"
  WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

