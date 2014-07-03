Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D41016AC7E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 08:29:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s638TgmY027759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Jul 2014 01:29:42 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 3 Jul 2014 01:29:41 -0700
Message-ID: <53B51474.4020403@windriver.com>
Date: Thu, 3 Jul 2014 16:29:40 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1404292676.git.liezhi.yang@windriver.com>
	<170029dfcde1cb5c69c5e8c82efa9f223deaf797.1404292676.git.liezhi.yang@windriver.com>
	<53B51215.7060605@gmail.com>
In-Reply-To: <53B51215.7060605@gmail.com>
Subject: Re: [RFC - WIP PATCH 1/1] image.bbclass: create binary pkg for image recipe
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
X-List-Received-Date: Thu, 03 Jul 2014 08:29:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit



On 07/03/2014 04:19 PM, David Nyström wrote:
> On 2014-07-02 11:25, Robert Yang wrote:
>> * Benefits
>>    We can known the image's RDEPENDS outside the build environment, and
>>    can use a third part installer such as anaconda to install the packages.
>>    It's hard to get the ROOTFS_POSTPROCESS_COMMAND outside the build
>>    environment, now the shell function can be added to postinst, and will
>>    show a warning for the python function. We have two python functions
>>    atm: write_package_manifest and write_image_manifest, we don't need them
>>    in the binary pkg.
>>
>> * Brief design:
>>    - Set the RDEPENDS and create the package as other regular recipes.
>>
>>    - Translate the ROOTFS_POSTPROCESS_COMMAND to postinst
>>      do_install[postfuncs] += "get_rootfs_postprocess_command"
>>
>>      The get_rootfs_postprocess_command() will emit the shell script to
>>      /usr/share/${PN}, and the pkg_postinst_${PN} will run it when do the
>>      install.
>>
>> * Fixed:
>>    RDEPENDS -> RDEPENDS_${PN}, the similar to RRECOMMENDS
>>
>> * Tested on rpm, dep and ipk
>>
>> * TODO:
>>    - Create the binary pkg optionally rather than default ?
>> [YOCTO #6463]
>
> Interesting approach.
>
> Image binaries were created before
> poky-commit:6706c7bdd2de6e0e447d90062e74a718a8d31778,
> but this feature was removed.
>
> A similiar approach has been rejected before:
> http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087474.html
>
> I ended up with a fork of image.bbclass for images I needed available as
> meta-packages.
>

Thanks for the comment, I didn't know that you had done such things before.
I'd like to add another bbclass to do this if this isn't accepted.

>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/image.bbclass                   |   91 +++++++++++++++++++++++---
>>   meta/recipes-core/meta/buildtools-tarball.bb |    2 +-
>>   2 files changed, 83 insertions(+), 10 deletions(-)
>
> <SNIP>
>
>> +
>> +        bb.note('Fix build path in %s' % postinst)
>> +        # Remove the IMAGE_ROOTFS prefix
>> +        fix_cmd = "sed -i -e 's:%s::g'" % d.getVar('IMAGE_ROOTFS', True)
>> +        # Remove the STAGING_DIR_TARGET prefix
>> +        fix_cmd += " -e 's:%s::g'" % d.getVar('STAGING_DIR_TARGET', True)
>> +        # Comment out the STAGING_DIR_NATIVE related lines
>> +        fix_cmd += " -e 's:\(^.*%s\):#\\1:'" % d.getVar('STAGING_DIR_NATIVE',
>> True)
>> +        # Comment out the PSEUDO related lines
>> +        fix_cmd += " -e 's:\(^export .*PSEUDO\):#\\1:'"
>> +        # Comment out the username related lines
>> +        fix_cmd += " -e 's:\(^export .*%s\):#\\1:'" % d.getVar('USER', True)
>> +
>
> Why are you commenting out these vars ?
> Perhaps it would be better to fix the ROOTFS_POSTPROCESS_COMMANDs, and rely on a
> sane environment ?

They are not available when outside the build env, for example, when you run the
smart install core-image-minimal.rpm on the target.

>
>
>> +        fix_cmd += " %s" % postinst
>> +        subprocess.call(fix_cmd, shell=True)
>> +
>> +        os.chmod(postinst, 0755)
>> +
>> +        with open(postinst_list, 'a') as plist:
>> +            plist.write("%s\n" % postinst.replace(d.getVar('D', True), ''))
>> +}
>> +
>> +pkg_postinst_${PN} () {
>
> You need to check if your running on target here.
>
>> +    listfile = "${datadir}/${PN}/postinst_list"
>> +    if [ -s $listfile ]; then
>> +        for script in `cat $listfile`; do
>> +            echo "Running $script..."
>> +            /bin/sh $script
>> +            if [ $? -ne 0 ]; then
>> +                # Allow the failure rather than re-install the package
>> +                # since the script can be manualy run
>> +                echo "ERROR: failed to run $script" >&2
>> +                echo "ERROR: please fix $script and manually run it" >&2
>
> If the ROOTFS_POSTPROCESS_COMMANDs do follow the same rules as other
> postinstalls, you could potentially defer executing to first boot when errors
> occur. (run-postinst)

Yes, we need fix here a little.

// Robert

>
>> +                true
>> +            fi
>> +        done
>> +    fi
>> +}
>> +
>>   do_fetch[noexec] = "1"
>>   do_unpack[noexec] = "1"
>>   do_patch[noexec] = "1"
>>   do_configure[noexec] = "1"
>>   do_compile[noexec] = "1"
>> -do_install[noexec] = "1"
>>   do_populate_sysroot[noexec] = "1"
>> -do_package[noexec] = "1"
>> -do_packagedata[noexec] = "1"
>> -do_package_write_ipk[noexec] = "1"
>> -do_package_write_deb[noexec] = "1"
>> -do_package_write_rpm[noexec] = "1"
>>
>>   addtask rootfs before do_build
>>   # Allow the kernel to be repacked with the initramfs and boot image file as
>> a single file
>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb
>> b/meta/recipes-core/meta/buildtools-tarball.bb
>> index 62e1e0b..7501525 100644
>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>> @@ -45,7 +45,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>>
>>   TOOLCHAIN_OUTPUTNAME ?=
>> "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
>>
>> -RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
>> +RDEPENDS_${PN} = "${TOOLCHAIN_HOST_TASK}"
>>
>>   EXCLUDE_FROM_WORLD = "1"
>>
>>
>
>
>

