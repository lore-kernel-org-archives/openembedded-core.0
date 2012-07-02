Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Slmn7-0001JH-0Z
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:00:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q62JnA6H009876
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Jul 2012 12:49:10 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 2 Jul 2012 12:49:10 -0700
Message-ID: <4FF1FB35.6000105@windriver.com>
Date: Mon, 2 Jul 2012 14:49:09 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1341032578.git.mark.hatle@windriver.com>
	<28adf5fdb58c3409ec2dcc1a8dfffaaf2a8eab2b.1341032578.git.mark.hatle@windriver.com>
	<4FF1FA29.8050209@linux.intel.com>
In-Reply-To: <4FF1FA29.8050209@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] image.bbclass: Add support to build the SDK in parallel with the image
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
X-List-Received-Date: Mon, 02 Jul 2012 20:00:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/12 2:44 PM, Saul Wold wrote:
> On 06/29/2012 10:07 PM, Mark Hatle wrote:
>> When building an image recipe, you can now build a companion SDK by
>> calling the populate_sdk task:
>>     bitbake -c populate_sdk core-image-minimal
>>
>> Note: there are still issues w/ the SDK not working completely with
>> multilibs.
>>
>> A lock is required between rootfs and populate_sdk activities to prevent
>> configuration file clashes and similar package management problems in ipk
>> and deb based systems.  (RPM already had a lock for a different reason.)
>>
>
> Mark this seems to have broken non-gplv3 builds.  I get the following
> error now:
>
>> NOTE: Resolving any missing task queue dependencies
>> ERROR: Nothing RPROVIDES 'binutils-cross-canadian-i586' (but /intel/poky/distro/meta/recipes-core/tasks/task-cross-canadian.bb RDEPENDS on or otherwise requires it)
>> ERROR: binutils-cross-canadian-i586 was skipped: incompatible with license GPLv3
>> NOTE: Runtime target 'binutils-cross-canadian-i586' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['binutils-cross-canadian-i586']
>> NOTE: Runtime target 'task-cross-canadian-i586' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['task-cross-canadian-i586', 'binutils-cross-canadian-i586']
>> ERROR: Required build target 'core-image-minimal' has no buildable providers.
>> Missing or unbuildable dependency chain was: ['core-image-minimal', 'task-cross-canadian-i586', 'binutils-cross-canadian-i586']
>>
>> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

As far as I know, this didn't work before either.  If you are running:

bitbake core-image-minimal (or similar) it should work -exactly- as it did 
before, it's only if you add the -c .... that it will change.

I forgot to mention, this does require the latest version of bitbake to avoid 
adding the SDK dependencies (unless you call the -c populate_sdk, where they are 
added and used.)

--Mark

>
> I am going to hold off on this patch set until this is resolved.
>
> Thanks
>
> 	Sau!
>
>
>> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
>> ---
>>    meta/classes/image.bbclass             |    5 +++++
>>    meta/classes/populate_sdk_base.bbclass |    1 +
>>    meta/classes/populate_sdk_deb.bbclass  |    2 ++
>>    meta/classes/populate_sdk_ipk.bbclass  |    2 ++
>>    meta/classes/rootfs_deb.bbclass        |    2 ++
>>    meta/classes/rootfs_ipk.bbclass        |    2 ++
>>    6 files changed, 14 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 4f50376..7e41982 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -3,6 +3,11 @@ inherit rootfs_${IMAGE_PKGTYPE}
>>    IMAGETEST ?= "dummy"
>>    inherit imagetest-${IMAGETEST}
>>
>> +inherit populate_sdk_base
>> +
>> +TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
>> +TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY} ${PACKAGE_GROUP_dev-pkgs} ${PACKAGE_GROUP_dbg-pkgs}"
>> +
>>    inherit gzipnative
>>
>>    LICENSE = "MIT"
>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>> index 6dc66fb..ed2dca0 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -120,6 +120,7 @@ populate_sdk_log_check() {
>>    	done
>>    }
>>
>> +do_populate_sdk[dirs] = "${TOPDIR}"
>>    do_populate_sdk[nostamp] = "1"
>>    do_populate_sdk[depends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}"
>>    do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
>> diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
>> index c3b3e0c..9e9e1e1 100644
>> --- a/meta/classes/populate_sdk_deb.bbclass
>> +++ b/meta/classes/populate_sdk_deb.bbclass
>> @@ -6,6 +6,8 @@ DEB_SDK_ARCH = "${@[d.getVar('SDK_ARCH', True), "i386"]\
>>                    [d.getVar('SDK_ARCH', True) in \
>>                    ["x86", "i486", "i586", "i686", "pentium"]]}"
>>
>> +do_populate_sdk[lockfiles] += "${WORKDIR}/deb.lock"
>> +
>>    populate_sdk_post_deb () {
>>
>>    	local target_rootfs=$1
>> diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
>> index aa3efde..4321afb 100644
>> --- a/meta/classes/populate_sdk_ipk.bbclass
>> +++ b/meta/classes/populate_sdk_ipk.bbclass
>> @@ -1,6 +1,8 @@
>>    do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
>>    do_populate_sdk[recrdeptask] += "do_package_write_ipk"
>>
>> +do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
>> +
>>    populate_sdk_ipk() {
>>
>>    	rm -f ${IPKGCONF_TARGET}
>> diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
>> index 6c9767f..4ea71da 100644
>> --- a/meta/classes/rootfs_deb.bbclass
>> +++ b/meta/classes/rootfs_deb.bbclass
>> @@ -8,6 +8,8 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
>>    do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
>>    do_rootfs[recrdeptask] += "do_package_write_deb"
>>
>> +do_rootfs[lockfiles] += "${WORKDIR}/deb.lock"
>> +
>>    DEB_POSTPROCESS_COMMANDS = "rootfs_install_all_locales; "
>>
>>    opkglibdir = "${localstatedir}/lib/opkg"
>> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
>> index 1580086..9732385 100644
>> --- a/meta/classes/rootfs_ipk.bbclass
>> +++ b/meta/classes/rootfs_ipk.bbclass
>> @@ -12,6 +12,8 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
>>    do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
>>    do_rootfs[recrdeptask] += "do_package_write_ipk"
>>
>> +do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
>> +
>>    IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite"
>>
>>    OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"




