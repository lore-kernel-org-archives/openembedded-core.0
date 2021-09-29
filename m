X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <3cd4d928-5a7f-5a5c-b14b-f3d76e1ddb58@pr.hu>
Date: Wed, 29 Sep 2021 06:02:16 +0200
MIME-Version: 1.0
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: Re: [OE-core] [PATCH 2/2] kernel.bbclass: Allow using update-alternatives for the kernel image
References: <20210928141048.576425-1-zboszor@pr.hu>
 <20210928141048.576425-3-zboszor@pr.hu>
 <CADkTA4Pd5_wDttx4WsR8VHXExUNv3gaArvjo0PDwxmeqA-5u_A@mail.gmail.com>
In-Reply-To: <CADkTA4Pd5_wDttx4WsR8VHXExUNv3gaArvjo0PDwxmeqA-5u_A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>

Resending from the subscribed address.

On 2021. 09. 28. 22:27, Bruce Ashfield wrote:
> On Tue, Sep 28, 2021 at 10:16 AM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>
>> When using dnf to install new kernel versions and installonly_limit
>> is reached, dnf automatically removes the oldest kernel version.
> What about other package managers ? Is there a similar limit ? And
> does the fallback still work the same ?

opkg definitely doesn't know about "install-only" entities.

I think apt has something like dnf, otherwise Debian and Ubuntu
wouldn't be able to offer a boot menu with fallback kernels.

> I can't say that I'm aware of exactly what this dnf limit is, can we
> either link to it, or document the value in the commit message ?

It's a konfiguration knob in /etc/dnf/dnf.conf:

[main]
...
installonly_limit=3
...

> And just so I understand, this is on the install (not the removal)
> that dnf is removing the oldest kernel (by its versioning checks) when
> the limit is hit ?

Yes.

One thing I didn't pursue is that on Fedora (and presumably RHEL)
the currently running kernel is exempted from removal. There may
be cases when you upgrade/install but not reboot with the latest
and it may occur that the currently running kernel is the oldest one.
In this case on Fedora, dnf removes the oldest version that's not
running. I think there's a complete kernel version check including
EXTRAVERSION (from the kernel toplevel Makefile) vs "uname -r".
In Yocto, the toplevel Makefile is not patched with the fully formed
PR value.

>> However, the /boot/bzImage symlink (or whatever image type is used)
>> is removed unconditionally.
> And this removal, that's on the package uninstall ? or is that also a
> dnf install quirk ?

That's on package uninstall and controlled by the postrm script
that the kernel.bbclass adds to the kernel-image-bzimage-<version>
package, i.e. explicit
     ln -sf ... /boot/bzImage
to postinst and
     rm -f /boot/bzImage
to postrm.

This is modified to update-alternatives --install/--remove
if the newly added knob is set to 1. dnf can have multiple
kernel versions installed and the implicit ln -sf/rm -f is also
there for package managers that can keep only one version
from every package.

Now I also have a question. Is it only me, or this [PATCH 2/2]
didn't actually reach everyone? I didn't receive the cover mail
and [PATCH 1/2] back from the mailing list, although I can see
them in the web archive:

https://lists.openembedded.org/g/openembedded-core/message/156420
https://lists.openembedded.org/g/openembedded-core/message/156419

>> Allow using the alternative symlink machinery so the highest
>> kernel version takes precedence and the symlink stays in place.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>    meta/classes/kernel.bbclass | 21 +++++++++++++++++++--
>>    1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index deccc0e58c..a687e5259d 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -43,9 +43,17 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION')
>>    KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>
>>    python __anonymous () {
>> +    import re
>>        pn = d.getVar("PN")
>>        kpn = d.getVar("KERNEL_PACKAGE_NAME")
>>
>> +    # KERNEL_VERSION cannot be used here as it would cause
>> +    # "basehash value changed" issues.
>> +    kver =  d.getVar("PV")
>> +    kverp = re.compile('[\.-]')
>> +    kvparts = kverp.split(kver)
>> +    kverstr = str(kvparts[0])+str(kvparts[1]).zfill(2)+str(kvparts[2]).zfill(3)
> It would be really nice to avoid this logic, since in my years of
> suffering, PV cannot be trusted on this front.
>
> Why can't this use KERNEL_VERSION_PACKAGE_NAME ? It is already used in
> this anonymous python code, and as the vardepexclude (which may just
> be what you need to use KERNEL_VERSION directly).
>
>> +
>>        # XXX Remove this after bug 11905 is resolved
>>        #  FILES:${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
>>        if kpn == pn:
>> @@ -117,6 +125,9 @@ python __anonymous () {
>>            d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>            d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
>>            d.setVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set +e
>> +if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" != "0" ]; then
>> +    update-alternatives --install ${KERNEL_IMAGEDEST}/%s %s %s-${KERNEL_VERSION_NAME} %s
>> +else
> I know it is just an inline postinst, but this is starting to get
> unreadable quickly.
>
> Shouldn't $D come into play here ? i.e. the existing postinst snippet
> is taking it into account for doing the install, update alternatives
> should also know if it is defined as well. Shouldn't this be in the
> else block of the [ -n "$D" ] test ? if it shouldn't, can the entire
> else block be indented to show that it is conditional on the variable
> you are introducing.
>
> Are there any situations where update-alternatives isn't available ?
> kind of like how we test for ln -sf, and do a fallback if it fails. Is
> there a similar case for update-alternatives ?
>
>>    if [ -n "$D" ]; then
>>        ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
>>    else
>> @@ -126,14 +137,19 @@ else
>>            install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s
>>        fi
>>    fi
>> +fi
>>    set -e
>> -""" % (type, type, type, type, type, type, type))
>> +""" % (type, type, type, kverstr, type, type, type, type, type, type, type))
>>            d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
>> +if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" != "0" ]; then
>> +    update-alternatives --remove %s %s-${KERNEL_VERSION_NAME}
>> +else
>>    if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
>>        rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
>>    fi
>> +fi
>>    set -e
>> -""" % (type, type, type))
>> +""" % (type, type, type, type, type))
>>
>>
>>        image = d.getVar('INITRAMFS_IMAGE')
>> @@ -214,6 +230,7 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
>>    # The directory where built kernel lies in the kernel tree
>>    KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
>>    KERNEL_IMAGEDEST ?= "boot"
>> +KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES ?= "0"
> We should add documentation around the new variable as well, even if
> the existing variables aren't fully documented .. we can start a trend
> of being better.
>
> Cheers,
>
> Bruce
>
>
>>    #
>>    # configuration
>> --
>> 2.31.1
>>
>>
>> 
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


