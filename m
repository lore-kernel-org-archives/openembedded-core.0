Return-Path: <naresh.bhat@linaro.org>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id B7EE865C88
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 07:46:46 +0000 (UTC)
Received: by lbvp9 with SMTP id p9so19446852lbv.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 23:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=umUu7VviZ73z3Z0zQ3oxg40reyo67M4d92V/yx8cB1E=;
	b=jWj9rg85LZiKl+j2tZ5KGNoZpnGnmp+bQI9Jolu7RHfvflo9XY6fVLKBGnfrjs5RvB
	QpMIisXIpxCsam/meSFbIIFziP8LfHelM7ran9UwWydTU5tl8JLhzeyGmdmwsdggTHbS
	psSH7+ViBIY/xqm+761N5u9TjTbE+g1lnQaAFKFngjTAaBVgvqz0QpHz089byfa8D4/T
	hLnVP4UlHCS9/I6DgFl9K5D+JKdwPNnUzQAQBNTWZ1LHk5PNp2kWxXX0EVA1SOE9bQSY
	A7qgjUn2lIltf1llAhodxDA7ulorOuzC5wrEFlD0XUtG5FpZx3lmCdOKfkXEbcEZK5if
	4fJg==
X-Gm-Message-State: ALoCoQmZWDas/uQIxQg1nCcv+fi0uAONS/cI+EFwNGOkhTIdTQTzOSl2jieesQBno080cI6juFCd
MIME-Version: 1.0
X-Received: by 10.112.11.136 with SMTP id q8mr2286915lbb.30.1425455207793;
	Tue, 03 Mar 2015 23:46:47 -0800 (PST)
Received: by 10.112.225.172 with HTTP; Tue, 3 Mar 2015 23:46:47 -0800 (PST)
In-Reply-To: <CAC1BbcS_ZWC38KgLUQceEL6hWt2jz0JE8W09Sjku8zCV5QJJng@mail.gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-5-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcS_ZWC38KgLUQceEL6hWt2jz0JE8W09Sjku8zCV5QJJng@mail.gmail.com>
Date: Wed, 4 Mar 2015 13:16:47 +0530
Message-ID: <CAFoFrHa7TdpNSo25q21BO+SOtaqVkJw26Vz3dK+ntGAtKkMd=g@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 4/4] grub: Update grub git recipe
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
X-List-Received-Date: Wed, 04 Mar 2015 07:46:53 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 23:33, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On 3 March 2015 at 16:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>> Update the grub git recipe with the following actions for native and non-native
>> - Base class extend to native
>> - do_configure_prepand
>
> s/prepand/prepend/
Thanks, I will make the change.
>
>> - do_install_append
>> - do_mkimage native
>> - do_deploy
>>
>> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
>> Reviewed-by: Graeme Gregory <graeme.gregory@linaro.org>
>> Reviewed-by: Matt Fleming <matt.fleming@intel.com>
>> ---
>>  meta/recipes-bsp/grub/grub_git.bb |   51 ++++++++++++++++++++++++++++++++-----
>>  1 file changed, 45 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
>> index 3ab675b..a2abe01 100644
>> --- a/meta/recipes-bsp/grub/grub_git.bb
>> +++ b/meta/recipes-bsp/grub/grub_git.bb
>> @@ -8,6 +8,7 @@ DEFAULT_PREFERENCE_arm = "1"
>>  PV = "2.00+${SRCPV}"
>>  SRCREV = "87de66d9d83446ecddb29cfbdf7369102c8e209e"
>>  SRC_URI = "git://git.savannah.gnu.org/grub.git \
>> +           file://cfg \
>>             file://grub-2.00-fpmath-sse-387-fix.patch \
>>             file://autogen.sh-exclude-pc.patch \
>>             file://grub-2.00-add-oe-kernel.patch \
>> @@ -18,7 +19,7 @@ S = "${WORKDIR}/git"
>>
>>  COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
>>
>> -inherit autotools gettext texinfo
>> +inherit autotools gettext texinfo deploy
>>
>>  PACKAGECONFIG ??= ""
>>  PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
>> @@ -31,24 +32,62 @@ GRUBPLATFORM_arm = "uboot"
>>  GRUBPLATFORM_aarch64 = "efi"
>>  GRUBPLATFORM ??= "pc"
>>
>> +CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
>>  EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
>>                  --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
>>
>> +B = "${S}"
>> +
>> +export ac_cv_path_HELP2MAN=""
>> +
>>  do_configure_prepend() {
>> -    ( cd ${S}
>> -      ${S}/autogen.sh )
>> +      ./autogen.sh
>> +}
>
> I did not follow the recentish B / S changes so i'm curious if the
> part(s) above are an improvement?
As far as I understand, when autotools is inherited, it jumps to ${B}
to build, and B is assigned with ${WORKDIR}/build
>
>> +
>> +do_install_append_class-native() {
>> +        install -d ${D}${bindir}
>> +        install -m 755 grub-mkimage ${D}${bindir}
>
> again, cut down on forks, use install -D
ok,  I will do the change
>
>>  }
>>
>> -do_install_append () {
>> +do_install_append_class-target() {
>> +    # Search for the grub.cfg on the local boot media by using the
>> +    # built in cfg file provided via this recipe
>> +    grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
>> +        -O ${GRUB_TARGET}-${GRUBPLATFORM} -o ./${GRUB_IMAGE} \
>> +        boot linux ext2 fat serial part_msdos part_gpt \
>> +        normal efi_gop iso9660 search efinet tftp all_video chain \
>> +        gfxmenu jpeg gfxterm
>> +
>>      install -d ${D}${sysconfdir}/grub.d
>> -
>> +    install -m 0755 ${B}/${GRUB_IMAGE} ${D}${bindir}
>
> install -D, again?
yes, I will change it.
>
>> +}
>> +
>> +GRUB_TARGET_aarch64 = "arm64"
>> +GRUB_IMAGE_aarch64 = "grubaa64.efi"
>> +
>> +do_mkimage_class-native() {
>> +        :
>> +}
>> +
>> +do_deploy() {
>> +    install -d ${DEPLOYDIR}
>> +    install -m 0755 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
>
> .. and again.
I will do the change.
>
> PS: Sorry, I seem to be in nitpicking mood right now ;)
> thanks,
Thank you very much for reviewing all the patches.
>
>>  }
>>
>> +do_deploy_class-native() {
>> +        :
>> +}
>> +
>> +addtask deploy after do_install before do_build
>> +
>>  # debugedit chokes on bare metal binaries
>>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>
>> -RDEPENDS_${PN} = "diffutils freetype"
>> +RDEPENDS_${PN}_class-target = "diffutils freetype"
>>  FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
>>
>>  INSANE_SKIP_${PN} = "arch"
>>  INSANE_SKIP_${PN}-dbg = "arch"
>> +
>> +DEPENDS_class-target += "grub-native"
>> +BBCLASSEXTEND = "native"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

