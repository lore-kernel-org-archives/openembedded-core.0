X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <a85296ab-4bf4-1c07-a8a9-d5bbeb0bba7f@pr.hu>
Date: Wed, 29 Sep 2021 19:46:53 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] kernel.bbclass: Allow using update-alternatives for the kernel image
References: <20210929053353.600644-1-zboszor@pr.hu>
 <20210929053353.600644-3-zboszor@pr.hu>
 <CADkTA4OW6i-VPn2zp_esDXkjgTe-hYfTFzOE7hQZgQ=E9pw0AA@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <CADkTA4OW6i-VPn2zp_esDXkjgTe-hYfTFzOE7hQZgQ=E9pw0AA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>

On 2021. 09. 29. 18:07, Bruce Ashfield wrote:
> On Wed, Sep 29, 2021 at 1:34 AM Zoltán Böszörményi <zboszor@pr.hu> wrote:
>>
>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>
>> When using dnf to install new kernel versions and installonly_limit
>> is reached, dnf automatically removes the oldest kernel version.
>>
>> For the dnf.conf documentation on installonlypkgs, installonly_limit
>> and others settings, see:
>> https://dnf.readthedocs.io/en/latest/conf_ref.html
>>
>> However, the /boot/bzImage symlink (or whatever image type is used)
>> is removed unconditionally.
>>
>> Allow using the alternative symlink machinery so the highest
>> kernel version takes precedence and the symlink stays in place.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>> v2: Mention dnf.conf documentation link
>>      Protect against "IndexError: list index out of range"
> 
> There were other comments / questions on v1 that were missed. I'll add them
> in this reply again (at least in short form).
> 
> We also need to document the new variable that is controlling the functionality
> 
> As you mentioned in the RFC cover letter, If this only works with rpm
> then that needs to be checked, and we shouldn't allow the enablement
> to do anything if it doesn't work or if what update-alternatives + the
> package manager of choice isn't fully understood in all cases.
> 
>>
>>   meta/classes/kernel.bbclass | 27 +++++++++++++++++++++++++--
>>   1 file changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 882858e22e..47a78f0dd2 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -43,9 +43,23 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION')
>>   KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>
>>   python __anonymous () {
>> +    import re
>>       pn = d.getVar("PN")
>>       kpn = d.getVar("KERNEL_PACKAGE_NAME")
>>
>> +    # KERNEL_VERSION cannot be used here as it would cause
>> +    # "basehash value changed" issues.
>> +    kver =  d.getVar("PV")
>> +    kverp = re.compile('[\.-]')
>> +    kvparts = kverp.split(kver)
>> +    # It seems PV is unset or empty for early recipe parsing
>> +    # but __anonymous functions are run nevertheless.
>> +    # Protect against "IndexError: list index out of range".
>> +    if len(kvparts) >= 3:
>> +        kverstr = str(kvparts[0])+str(kvparts[1]).zfill(2)+str(kvparts[2]).zfill(3)
>> +    else:
>> +        kverstr = '000000'
>> +
> 
> I was asking about using something else than PV, since we are now up
> to about three different variables being used to check versions. The
> basehash question / issue is valid, but at this point we are packaging
> based on something parsed out of the Makefile and then doing postinst
> / update alternatives steps based on PV. It is just going to cause a
> lot of pain. And as you mentioned in your cover letter, it isn't
> consistently used .. and hence we can't rely on it in this common
> code.

That's why the series is RFC because the added inconsistency was painful to me.

> I've asked around a bit, and we need to consider getting this code out
> of the anonymous python completely. See how classes/fontcache.bbclass
> uses PACKAGEFUNCS to create the postfunc steps. Since this isn't used
> until packaging time, then it does need to move something that is run
> in the proper context and we can avoid basehash and other issues.

I will look at it, thanks.

>>       # XXX Remove this after bug 11905 is resolved
>>       #  FILES:${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
>>       if kpn == pn:
>> @@ -117,6 +131,9 @@ python __anonymous () {
>>           d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>           d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
>>           d.setVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set +e
>> +if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" != "0" ]; then
>> +    update-alternatives --install ${KERNEL_IMAGEDEST}/%s %s %s-${KERNEL_VERSION_NAME} %s
>> +else
> 
> Here is where I was asking about why this isn't checking $D like the
> previous code block.  Unless we want this running on both the host and
> the target, it needs a check.

The update-alternatives intercept script is installed for
for the image (to allow packages work that have "inherit
update-alternatives") and it's doing the right thing during
do_rootfs, internally dealing with $D.

Well, except for one thing, which is my fault here that
I discovered today after inspecting the resulting image.

The symlink path must be "/${KERNEL_IMAGEDEST}/%s".
The starter "/" is missing in v2, I will have to send a v3.

Well, here's "release often, release early" for you, with bugs and all.

> 
>>   if [ -n "$D" ]; then
> 
> And now this block of code isn't indented and is in a big 'else'
> block. Sure it is just a scriptlet, but it is getting hard to read and
> follow.

I will fix the indentation.

Thanks for your comments,
Zoltán

> 
> Cheers,
> 
> Bruce
> 
>>       ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
>>   else
>> @@ -126,14 +143,19 @@ else
>>           install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s
>>       fi
>>   fi
>> +fi
>>   set -e
>> -""" % (type, type, type, type, type, type, type))
>> +""" % (type, type, type, kverstr, type, type, type, type, type, type, type))
>>           d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
>> +if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" != "0" ]; then
>> +    update-alternatives --remove %s %s-${KERNEL_VERSION_NAME}
>> +else
>>   if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
>>       rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
>>   fi
>> +fi
>>   set -e
>> -""" % (type, type, type))
>> +""" % (type, type, type, type, type))
>>
>>
>>       image = d.getVar('INITRAMFS_IMAGE')
>> @@ -214,6 +236,7 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
>>   # The directory where built kernel lies in the kernel tree
>>   KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
>>   KERNEL_IMAGEDEST ?= "boot"
>> +KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES ?= "0"
>>
>>   #
>>   # configuration
>> --
>> 2.31.1
>>
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 

