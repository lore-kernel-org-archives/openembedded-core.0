Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F2AA060110
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 07:53:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9Q7ruH2020480
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Oct 2018 00:53:56 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 26 Oct 2018 00:53:27 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1539876421.git.kai.kang@windriver.com>
	<8de5585c10d806d15ba4550d05c3c8fbcab26990.1539876421.git.kai.kang@windriver.com>
	<e7a1a326-ce51-2b1b-eadb-c1c650f3fcbe@windriver.com>
	<5ca5c33e-42e1-9a14-2b60-ff84d6f5774e@windriver.com>
	<3325dc5675228ef92e512aa4c39d4c2480fb88b7.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <7f3512fb-4bbd-2d05-0722-a447be367f64@windriver.com>
Date: Fri, 26 Oct 2018 15:52:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <3325dc5675228ef92e512aa4c39d4c2480fb88b7.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] udev-hwdb: fix postinstall scripts failures when multilib enabled
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
X-List-Received-Date: Fri, 26 Oct 2018 07:53:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/10/24 上午5:17, richard.purdie@linuxfoundation.org wrote:
> On Tue, 2018-10-23 at 14:43 +0800, Kang Kai wrote:
>> On 2018/10/22 下午11:11, Kang Kai wrote:
>>> On 2018/10/18 下午11:28, kai.kang@windriver.com wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> When multilib is enabled and both udev-hwdb and ${MLPREFIX}udev-
>>>> hwdb are
>>>> installed to image, it fails to run one of their postinstall
>>>> scripts
>>>> that they both call ${base_bindir}/udevadm with same user mode
>>>> qemu.
>>>>
>>>> Duplicate udevadm and add postinst-intercept update_udev_hwdb to
>>>> fix the
>>>> failures.
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>    meta/recipes-core/systemd/systemd_239.bb     | 13 ++++++-------
>>>>    meta/recipes-core/udev/eudev_3.2.5.bb        | 11 +++++------
>>>>    scripts/postinst-intercepts/update_udev_hwdb |  6 ++++++
>>>>    3 files changed, 17 insertions(+), 13 deletions(-)
>>>>    create mode 100644 scripts/postinst-intercepts/update_udev_hwdb
>>>>
>>>> diff --git a/meta/recipes-core/systemd/systemd_239.bb
>>>> b/meta/recipes-core/systemd/systemd_239.bb
>>>> index 7ed932141d..44e972ebce 100644
>>>> --- a/meta/recipes-core/systemd/systemd_239.bb
>>>> +++ b/meta/recipes-core/systemd/systemd_239.bb
>>>> @@ -284,6 +284,10 @@ do_install() {
>>>>                chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>>>>            fi
>>>>        fi
>>>> +
>>>> +    # duplicate udevadm for postinst script
>>>> +    install -d ${D}${libexecdir}
>>>> +    ln ${D}${base_bindir}/udevadm
>>>> ${D}${libexecdir}/${MLPREFIX}udevadm
>>>>    }
>>>>      @@ -542,6 +546,7 @@ FILES_udev += "${base_sbindir}/udevd \
>>>>                   ${systemd_unitdir}/system/*udev* \
>>>>                   ${systemd_unitdir}/system/*.wants/*udev* \
>>>>                   ${base_bindir}/udevadm \
>>>> +               ${libexecdir}/${MLPREFIX}udevadm \
>>>>                   ${datadir}/bash-completion/completions/udevadm \
>>>>                  "
>>>>    @@ -580,13 +585,7 @@ pkg_prerm_${PN} () {
>>>>    PACKAGE_WRITE_DEPS += "qemu-native"
>>>>    pkg_postinst_udev-hwdb () {
>>>>        if test -n "$D"; then
>>>> -        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-
>>>> usermode',
>>>> 'true','false', d)}; then
>>>> -            ${@qemu_run_binary(d, '$D',
>>>> '${base_bindir}/udevadm')}
>>>> hwdb --update \
>>>> -                --root $D
>>>> -            chown root:root $D${sysconfdir}/udev/hwdb.bin
>>>> -        else
>>>> -            $INTERCEPT_DIR/postinst_intercept
>>>> delay_to_first_boot
>>>> ${PKG} mlprefix=${MLPREFIX}
>>>> -        fi
>>>> +        $INTERCEPT_DIR/postinst_intercept update_udev_hwdb
>>>> ${PKG}
>>>> mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
>>>>        else
>>>>            udevadm hwdb --update
>>>>        fi
>>>> diff --git a/meta/recipes-core/udev/eudev_3.2.5.bb
>>>> b/meta/recipes-core/udev/eudev_3.2.5.bb
>>>> index efd62c6495..592dd8f22a 100644
>>>> --- a/meta/recipes-core/udev/eudev_3.2.5.bb
>>>> +++ b/meta/recipes-core/udev/eudev_3.2.5.bb
>>>> @@ -50,6 +50,10 @@ do_install_append() {
>>>>          # hid2hci has moved to bluez4. removed in udev as of
>>>> version 169
>>>>        rm -f ${D}${base_libdir}/udev/hid2hci
>>>> +
>>>> +    # duplicate udevadm for postinst script
>>>> +    install -d ${D}${libexecdir}
>>>> +    ln ${D}${bindir}/udevadm
>>>> ${D}${libexecdir}/${MLPREFIX}udevadm
>>>>    }
>>>>      do_install_prepend_class-target () {
>>>> @@ -81,12 +85,7 @@ RPROVIDES_eudev-hwdb += "udev-hwdb"
>>>>    PACKAGE_WRITE_DEPS += "qemu-native"
>>>>    pkg_postinst_eudev-hwdb () {
>>>>        if test -n "$D"; then
>>>> -        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-
>>>> usermode',
>>>> 'true','false', d)}; then
>>> Hi Richard,
>>>
>>> It seems check for 'qemu-usermode' should not be removed. And it
>>> also
>>> need to check for other intercept scripts.
>> I just realize that intercept scripts have been handled well in
>> lib/oe/package_manager.py. So please ignore my last reply.
> I'm now confused, which version of this patch do we need?

Sorry for missing your comment and made you inconvenient.

I received some inner comments that remove check 'qemu-usermode' may 
cause problem. I was convinced and it has been merged to master-next 
already,
so I sent a reply that 'will send V2'. But after build without machine 
feature  'qemu-usermode', it turns out that the guardian of 
'qemu-usermode' has been
handled well by package_manager.py. Then I sent the last reply and not 
V2 patch sent.

Regards,
Kai


>
> Cheers,
>
> Richard
>
>

-- 
Regards,
Neil | Kai Kang


