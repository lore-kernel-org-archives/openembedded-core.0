Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DFFC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 18:09:34 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.16446.1643220572994259257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 10:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=F1YAVAGf;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.8.145] (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1CA6620B6C61;
	Wed, 26 Jan 2022 10:09:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1CA6620B6C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1643220572;
	bh=T495smwwUTE66GGncBjX+dvUIE3hncJ1iSxaI3AMzD4=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=F1YAVAGfF+mQmTmfIkM4jENzBoazcFgeiqe4DIT01wujMVD9+b5kMNKbNLbtz8nAS
	 FfASVUvEVNWun2VfaHZmDMV9b+KKWNpcKayms1Ptmocuu46vXwAnvH5o0zGqluxYwi
	 Pd6y1QYm61Y+osY7xLcYGNAY734LFyZApbwm9Fvo=
Subject: Re: [OE-core] [PATCH] initramfs-framework: Add overlayroot module
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20220126072231.1749903-1-alhe@linux.microsoft.com>
 <CADkTA4OjQsH5hJPt9RuEVaVHCPf6YXOb5U+LkRqV_V7KEHcEPg@mail.gmail.com>
From: Alejandro Hernandez <alhe@linux.microsoft.com>
Message-ID: <3954c194-7d7f-9dd2-a1f2-54b088396009@linux.microsoft.com>
Date: Wed, 26 Jan 2022 11:09:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: 
 <CADkTA4OjQsH5hJPt9RuEVaVHCPf6YXOb5U+LkRqV_V7KEHcEPg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------98751025438DA4BE5C866844"
Content-Language: en-GB
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 18:09:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160990

This is a multi-part message in MIME format.
--------------98751025438DA4BE5C866844
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/26/22 7:11 AM, Bruce Ashfield wrote:
> On Wed, Jan 26, 2022 at 2:22 AM Alejandro Hernandez Samaniego
> <alhe@linux.microsoft.com> wrote:
>> When installed, this module mounts a read-write (RW) overlay on
>> top of a root filesystem, which is kept read-only (RO).
>>
>> It needs to be executed after the initramfs-module-rootfs since
>> it relies on it to mount the filesystem at initramfs startup but
>> before the finish module which normally switches root.
>>
>> It requires rootrw=<foo> to be passed as a kernel parameter to
>> specify the device/partition to be used as RW by the overlay and
>> has a dependency on overlayfs support being present in the
>> running kernel.
>>
>> It does not require the read-only IMAGE_FEATURE to be enabled.
> Alejandro,
>
> What's the higher level use case for this ? It would be worth capturing
> it in the commit log.  Is this filling a gap in existing functionality ? Is it
> for spinning up initramfs only configurations ? A security thing ?

Hi Bruce, thanks for reviewing this and pointing out what I missed, I'll be sending a v2 later today.

There may be several reasons why we'd want to have the possibility of keeping the original
rootfs unmodified, and keeping user customizations on a separate device, for example it
would make it easier to perform a factory reset on a device.

>> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
>> ---
>>   .../initramfs-framework/overlayroot           | 93 +++++++++++++++++++
>>   .../initrdscripts/initramfs-framework_1.0.bb  |  9 ++
>>   2 files changed, 102 insertions(+)
>>   create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
>>
>> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
>> new file mode 100644
>> index 0000000000..ec5700e8fc
>> --- /dev/null
>> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
>> @@ -0,0 +1,93 @@
>> +#!/bin/sh
>> +
> The new script should have a copyright and SPDX identifier .. Don't
> take this as great wisdom, it is something thatI always forget to to
> as well!
>
> On that note, is this completely from scratch or is it the assembly of
> other bits and pieces found elsewhere ? It would be good to document
> that as well.

Oops! completely forgot!, I'll add it.

This is loosely based on the overlay-etc.bbclass the difference is that
the class only works for overlaying /etc and it doesnt require an
initramfs, but, while its possible to tinker it in such a way that it
overlays /, its not possible to access the original (RO) / after booting the
system, this is the reason  why this has to be done from initramfs and why
this doesnt patch the overlay-etc.bbclass instead.

I believe Ubuntu has this feature, coming from the cloud-initramfs
package, functionally it should be similar although no code was borrowed
from there.

I'll add a note about the overlay-etc class though.

>> +# Simple initramfs module intended to mount a read-write (RW)
>> +# overlayfs on top of /, keeping the original root filesystem
>> +# as read-only (RO).
>> +#
>> +# NOTE: The read-only IMAGE_FEATURE is not required for this to work
>> +#
>> +# It relies on the initramfs-module-rootfs to mount the original
>> +# root filesystem, and requires 'rootrw=<foo>' to be passed as a
>> +# kernel parameter, specifying the device/partition intended to
>> +# use as RW.
>> +#
>> +# It also has a dependency on overlayfs being enabled in the
>> +# running kernel via KERNEL_FEATURES (kmeta) or any other means.
>> +#
>> +# The RO root filesystem remains accessible by the system, mounted
>> +# at /rofs
>> +
>> +PATH=/sbin:/bin:/usr/sbin:/usr/bin
>> +
>> +# We get OLDROOT from the rootfs module
>> +OLDROOT="/rootfs"
>> +
>> +NEWROOT="${RWMOUNT}/root"
>> +RWMOUNT="/overlay"
>> +ROMOUNT="${RWMOUNT}/rofs"
>> +UPPER_DIR="${RWMOUNT}/upper"
>> +WORK_DIR="${RWMOUNT}/work"
>> +
>> +MODULES_DIR=/init.d
>> +
>> +exit_gracefully() {
>> +    echo $1 >/dev/console
>> +    echo >/dev/console
>> +    echo "OverlayRoot mounting failed, starting system as read-only" >/dev/console
>> +    echo >/dev/console
>> +
>> +    # Make sure / is mounted as read only anyway.
>> +    # Borrowed from rootfs-postcommands.bbclass
>> +    # Tweak the mount option and fs_passno for rootfs in fstab
> For maintenance reasons, it would be a good idea to expand on (in
> words) what the tweak is, what the old value is, and the new.

Actually that comment (along with the next couple of lines) is coming
from the rootfs-postcommands.bbclass to mount the root filesystem RO.

>
>> +    if [ -f ${OLDROOT}/etc/fstab ]; then
>> +        sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${OLDROOT}/etc/fstab
>> +    fi
>> +
>> +    # Tweak the "mount -o remount,rw /" command in busybox-inittab inittab
>> +    if [ -f ${OLDROOT}/etc/inittab ]; then
>> +        sed -i 's|/bin/mount -o remount,rw /|/bin/mount -o remount,ro /|' ${OLDROOT}/etc/inittab
>> +    fi
>> +
>> +    # Continue as if the overlayroot module didn't exist
>> +    . $MODULES_DIR/99-finish
>> +    eval "finish_run"
>> +}
>> +
>> +
>> +if [ -z "$bootparam_rootrw" ]; then
>> +    exit_gracefully "rootrw= kernel parameter doesn't exist and its required to mount the overlayfs"
>> +fi
>> +
>> +mkdir -p ${RWMOUNT}
>> +
>> +# Mount RW device
>> +if mount -n -t ${bootparam_rootfstype:-ext4} -o ${bootparam_rootflags:-defaults} ${bootparam_rootrw} ${RWMOUNT}
>> +then
>> +    # Set up overlay directories
>> +    mkdir -p ${UPPER_DIR}
>> +    mkdir -p ${WORK_DIR}
>> +    mkdir -p ${NEWROOT}
>> +    mkdir -p ${ROMOUNT}
>> +
>> +    # Remount OLDROOT as read-only
>> +    mount -o bind ${OLDROOT} ${ROMOUNT}
>> +    mount -o remount,ro ${ROMOUNT}
>> +
>> +    # Mount RW overlay
>> +    mount -t overlay overlay -o lowerdir=${ROMOUNT},upperdir=${UPPER_DIR},workdir=${WORK_DIR} ${NEWROOT} || exit_gracefully "initramfs-overlayroot: Mounting overlay failed"
>> +else
>> +    exit_gracefully "initramfs-overlayroot: Mounting RW device failed"
>> +fi
>> +
>> +# Set up filesystems on overlay
>> +mkdir -p ${NEWROOT}/proc
>> +mkdir -p ${NEWROOT}/dev
>> +mkdir -p ${NEWROOT}/sys
>> +mkdir -p ${NEWROOT}/rofs
>> +
>> +mount -n --move ${ROMOUNT} ${NEWROOT}/rofs
>> +mount -n --move /proc ${NEWROOT}/proc
>> +mount -n --move /sys ${NEWROOT}/sys
>> +mount -n --move /dev ${NEWROOT}/dev
>> +
>> +exec chroot ${NEWROOT}/ ${bootparam_init:-/sbin/init} || exit_gracefully "Couldn't chroot into overlay"
> What's the boot flow in the end ? The r/w overlay is setup, and the rest of the
> initrams -> full boot happens as normal ?
>
> Bruce

In the initramfs-framework flow, this  would be the last module that is run, and "replaces" the finish module,
so the rest of the initramfs-modules that were installed should have been run already keeping the same boot
flow, although, instead of the finish module executing switch_root to the now mounted real root, this chroots
into the now mounted real RW root overlay.

This patch does not install (or create any rdepends to) the initramfs-module-overlayroot package on purpose,
the original flow using initramfs-framework is kept, it would only change to the above flow when a user manually
installs this module on their initramfs image.

Alejandro

>
>> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
>> index 9e8c1dc3ab..4e76e20026 100644
>> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
>> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
>> @@ -18,6 +18,7 @@ SRC_URI = "file://init \
>>              file://e2fs \
>>              file://debug \
>>              file://lvm \
>> +           file://overlayroot \
>>             "
>>
>>   S = "${WORKDIR}"
>> @@ -49,6 +50,9 @@ do_install() {
>>       # lvm
>>       install -m 0755 ${WORKDIR}/lvm ${D}/init.d/09-lvm
>>
>> +    # overlayroot needs to run after rootfs module but before finish
>> +    install -m 0755 ${WORKDIR}/overlayroot ${D}/init.d/91-overlayroot
>> +
>>       # Create device nodes expected by some kernels in initramfs
>>       # before even executing /init.
>>       install -d ${D}/dev
>> @@ -64,6 +68,7 @@ PACKAGES = "${PN}-base \
>>               initramfs-module-rootfs \
>>               initramfs-module-debug \
>>               initramfs-module-lvm \
>> +            initramfs-module-overlayroot \
>>              "
>>
>>   FILES:${PN}-base = "/init /init.d/99-finish /dev"
>> @@ -107,3 +112,7 @@ FILES:initramfs-module-debug = "/init.d/00-debug"
>>   SUMMARY:initramfs-module-lvm = "initramfs lvm rootfs support"
>>   RDEPENDS:initramfs-module-lvm = "${PN}-base"
>>   FILES:initramfs-module-lvm = "/init.d/09-lvm"
>> +
>> +SUMMARY:initramfs-module-overlayroot = "initramfs support for mounting a RW overlay on top of a RO root filesystem"
>> +RDEPENDS:initramfs-module-overlayroot = "${PN}-base initramfs-module-rootfs"
>> +FILES:initramfs-module-overlayroot = "/init.d/91-overlayroot"
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#160961): https://lists.openembedded.org/g/openembedded-core/message/160961
>> Mute This Topic: https://lists.openembedded.org/mt/88691930/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--------------98751025438DA4BE5C866844
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/26/22 7:11 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4OjQsH5hJPt9RuEVaVHCPf6YXOb5U+LkRqV_V7KEHcEPg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Jan 26, 2022 at 2:22 AM Alejandro Hernandez Samaniego
<a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
When installed, this module mounts a read-write (RW) overlay on
top of a root filesystem, which is kept read-only (RO).

It needs to be executed after the initramfs-module-rootfs since
it relies on it to mount the filesystem at initramfs startup but
before the finish module which normally switches root.

It requires rootrw=&lt;foo&gt; to be passed as a kernel parameter to
specify the device/partition to be used as RW by the overlay and
has a dependency on overlayfs support being present in the
running kernel.

It does not require the read-only IMAGE_FEATURE to be enabled.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Alejandro,

What's the higher level use case for this ? It would be worth capturing
it in the commit log.  Is this filling a gap in existing functionality ? Is it
for spinning up initramfs only configurations ? A security thing ?
</pre>
    </blockquote>
    <pre>Hi Bruce, thanks for reviewing this and pointing out what I missed, I'll be sending a v2 later today.</pre>
    <pre>There may be several reasons why we'd want to have the possibility of keeping the original
rootfs unmodified, and keeping user customizations on a separate device, for example it
would make it easier to perform a factory reset on a device.
</pre>
    <blockquote type="cite"
cite="mid:CADkTA4OjQsH5hJPt9RuEVaVHCPf6YXOb5U+LkRqV_V7KEHcEPg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Signed-off-by: Alejandro Enedino Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
---
 .../initramfs-framework/overlayroot           | 93 +++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb  |  9 ++
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/overlayroot

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
new file mode 100644
index 0000000000..ec5700e8fc
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
@@ -0,0 +1,93 @@
+#!/bin/sh
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The new script should have a copyright and SPDX identifier .. Don't
take this as great wisdom, it is something thatI always forget to to
as well!

On that note, is this completely from scratch or is it the assembly of
other bits and pieces found elsewhere ? It would be good to document
that as well.
</pre>
    </blockquote>
    <pre>Oops! completely forgot!, I'll add it.

This is loosely based on the overlay-etc.bbclass the difference is that
the class only works for overlaying /etc and it doesnt require an
initramfs, but, while its possible to tinker it in such a way that it
overlays /, its not possible to access the original (RO) / after booting the
system, this is the reason  why this has to be done from initramfs and why
this doesnt patch the overlay-etc.bbclass instead.

I believe Ubuntu has this feature, coming from the cloud-initramfs
package, functionally it should be similar although no code was borrowed
from there.

I'll add a note about the overlay-etc class though.
</pre>
    <blockquote type="cite"
cite="mid:CADkTA4OjQsH5hJPt9RuEVaVHCPf6YXOb5U+LkRqV_V7KEHcEPg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+# Simple initramfs module intended to mount a read-write (RW)
+# overlayfs on top of /, keeping the original root filesystem
+# as read-only (RO).
+#
+# NOTE: The read-only IMAGE_FEATURE is not required for this to work
+#
+# It relies on the initramfs-module-rootfs to mount the original
+# root filesystem, and requires 'rootrw=&lt;foo&gt;' to be passed as a
+# kernel parameter, specifying the device/partition intended to
+# use as RW.
+#
+# It also has a dependency on overlayfs being enabled in the
+# running kernel via KERNEL_FEATURES (kmeta) or any other means.
+#
+# The RO root filesystem remains accessible by the system, mounted
+# at /rofs
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+
+# We get OLDROOT from the rootfs module
+OLDROOT="/rootfs"
+
+NEWROOT="${RWMOUNT}/root"
+RWMOUNT="/overlay"
+ROMOUNT="${RWMOUNT}/rofs"
+UPPER_DIR="${RWMOUNT}/upper"
+WORK_DIR="${RWMOUNT}/work"
+
+MODULES_DIR=/init.d
+
+exit_gracefully() {
+    echo $1 &gt;/dev/console
+    echo &gt;/dev/console
+    echo "OverlayRoot mounting failed, starting system as read-only" &gt;/dev/console
+    echo &gt;/dev/console
+
+    # Make sure / is mounted as read only anyway.
+    # Borrowed from rootfs-postcommands.bbclass
+    # Tweak the mount option and fs_passno for rootfs in fstab
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
For maintenance reasons, it would be a good idea to expand on (in
words) what the tweak is, what the old value is, and the new.</pre>
    </blockquote>
    <pre>Actually that comment (along with the next couple of lines) is coming
from the rootfs-postcommands.bbclass to mount the root filesystem RO.
</pre>
    <blockquote type="cite"
cite="mid:CADkTA4OjQsH5hJPt9RuEVaVHCPf6YXOb5U+LkRqV_V7KEHcEPg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+    if [ -f ${OLDROOT}/etc/fstab ]; then
+        sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${OLDROOT}/etc/fstab
+    fi
+
+    # Tweak the "mount -o remount,rw /" command in busybox-inittab inittab
+    if [ -f ${OLDROOT}/etc/inittab ]; then
+        sed -i 's|/bin/mount -o remount,rw /|/bin/mount -o remount,ro /|' ${OLDROOT}/etc/inittab
+    fi
+
+    # Continue as if the overlayroot module didn't exist
+    . $MODULES_DIR/99-finish
+    eval "finish_run"
+}
+
+
+if [ -z "$bootparam_rootrw" ]; then
+    exit_gracefully "rootrw= kernel parameter doesn't exist and its required to mount the overlayfs"
+fi
+
+mkdir -p ${RWMOUNT}
+
+# Mount RW device
+if mount -n -t ${bootparam_rootfstype:-ext4} -o ${bootparam_rootflags:-defaults} ${bootparam_rootrw} ${RWMOUNT}
+then
+    # Set up overlay directories
+    mkdir -p ${UPPER_DIR}
+    mkdir -p ${WORK_DIR}
+    mkdir -p ${NEWROOT}
+    mkdir -p ${ROMOUNT}
+
+    # Remount OLDROOT as read-only
+    mount -o bind ${OLDROOT} ${ROMOUNT}
+    mount -o remount,ro ${ROMOUNT}
+
+    # Mount RW overlay
+    mount -t overlay overlay -o lowerdir=${ROMOUNT},upperdir=${UPPER_DIR},workdir=${WORK_DIR} ${NEWROOT} || exit_gracefully "initramfs-overlayroot: Mounting overlay failed"
+else
+    exit_gracefully "initramfs-overlayroot: Mounting RW device failed"
+fi
+
+# Set up filesystems on overlay
+mkdir -p ${NEWROOT}/proc
+mkdir -p ${NEWROOT}/dev
+mkdir -p ${NEWROOT}/sys
+mkdir -p ${NEWROOT}/rofs
+
+mount -n --move ${ROMOUNT} ${NEWROOT}/rofs
+mount -n --move /proc ${NEWROOT}/proc
+mount -n --move /sys ${NEWROOT}/sys
+mount -n --move /dev ${NEWROOT}/dev
+
+exec chroot ${NEWROOT}/ ${bootparam_init:-/sbin/init} || exit_gracefully "Couldn't chroot into overlay"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What's the boot flow in the end ? The r/w overlay is setup, and the rest of the
initrams -&gt; full boot happens as normal ?

Bruce</pre>
    </blockquote>
    <pre>In the initramfs-framework flow, this  would be the last module that is run, and "replaces" the finish module,
so the rest of the initramfs-modules that were installed should have been run already keeping the same boot
flow, although, instead of the finish module executing switch_root to the now mounted real root, this chroots
into the now mounted real RW root overlay.

This patch does not install (or create any rdepends to) the initramfs-module-overlayroot package on purpose,
the original flow using initramfs-framework is kept, it would only change to the above flow when a user manually
installs this module on their initramfs image.

Alejandro
</pre>
    <blockquote type="cite"
cite="mid:CADkTA4OjQsH5hJPt9RuEVaVHCPf6YXOb5U+LkRqV_V7KEHcEPg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 9e8c1dc3ab..4e76e20026 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -18,6 +18,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="file://init\file://e2fs\file://debug\file://lvm\+file://overlayroot\">"file://init \
            file://e2fs \
            file://debug \
            file://lvm \
+           file://overlayroot \
           "</a>

 S = "${WORKDIR}<a class="moz-txt-link-rfc2396E" href="mailto:@@-49,6+50,9@@do_install(){#lvminstall-m0755${WORKDIR}/lvm${D}/init.d/09-lvm+#overlayrootneedstorunafterrootfsmodulebutbeforefinish+install-m0755${WORKDIR}/overlayroot${D}/init.d/91-overlayroot+#Createdevicenodesexpectedbysomekernelsininitramfs#beforeevenexecuting/init.install-d${D}/dev@@-64,6+68,7@@PACKAGES=">"
@@ -49,6 +50,9 @@ do_install() {
     # lvm
     install -m 0755 ${WORKDIR}/lvm ${D}/init.d/09-lvm

+    # overlayroot needs to run after rootfs module but before finish
+    install -m 0755 ${WORKDIR}/overlayroot ${D}/init.d/91-overlayroot
+
     # Create device nodes expected by some kernels in initramfs
     # before even executing /init.
     install -d ${D}/dev
@@ -64,6 +68,7 @@ PACKAGES = "</a>${PN}-base \
             initramfs-module-rootfs \
             initramfs-module-debug \
             initramfs-module-lvm \
+            initramfs-module-overlayroot \
            "

 FILES:${PN}-base = "/init /init.d/99-finish /dev"
@@ -107,3 +112,7 @@ FILES:initramfs-module-debug = "/init.d/00-debug"
 SUMMARY:initramfs-module-lvm = "initramfs lvm rootfs support"
 RDEPENDS:initramfs-module-lvm = "${PN}-base"
 FILES:initramfs-module-lvm = "/init.d/09-lvm"
+
+SUMMARY:initramfs-module-overlayroot = "initramfs support for mounting a RW overlay on top of a RO root filesystem"
+RDEPENDS:initramfs-module-overlayroot = "${PN}-base initramfs-module-rootfs"
+FILES:initramfs-module-overlayroot = "/init.d/91-overlayroot"
--
2.25.1


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#160961): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/160961">https://lists.openembedded.org/g/openembedded-core/message/160961</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88691930/1050810">https://lists.openembedded.org/mt/88691930/1050810</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
</pre>
    </blockquote>
  </body>
</html>

--------------98751025438DA4BE5C866844--

