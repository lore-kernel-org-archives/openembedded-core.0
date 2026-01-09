Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D65D232F8
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 08:52:46 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6358.1767948761847219285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 00:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mtE97uI+;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477632b0621so24811565e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 00:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767948760; x=1768553560; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rkwKFwLK3vFqtgdnD2eDPwnNJ1Tw2GP/VgVYLX7XQ9Q=;
        b=mtE97uI+g0gahvn2TwQ0Ur/Gr03dVzzFKXhnCK1a195mkztwSDmg14v+Xna68dWDfE
         oDrqlBUSnyWfl9Veo82celuk+yumXJJRNdRUCYXpw+k1PkGxGgO0iAfXrJrmJggDBWR1
         hXaxF0KL6BxhFnHd/2q0oVHx4l4DUN7uilV4m2EPRhF95oRjyWPvxnPe/n2e5ERVXUup
         reMlA1erhdPG7n9paJjgZkd53EyM4j3IQk5kZRR9dTNXp7LZ7u1pUclYnHuv/MVmnH+6
         XSV6IGNOYePgqnCc2VqhZvkxKZLZVSsNLwJQR+cFPk1EtKXKcsSpUZcsbGDkZ2OxFdU1
         c6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767948760; x=1768553560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkwKFwLK3vFqtgdnD2eDPwnNJ1Tw2GP/VgVYLX7XQ9Q=;
        b=MQHB9xcpOGgjOsI2rjolAV0eVsK80CNE68j857fyFhmipnc8MtcGqK8B1eQbX+mtuW
         VZ0EtIryFI+B8V3JtUnNKyHd7nK3s9exVCSPIwfcwb8UbE2gS2iwp0XYLYAWScJghYom
         vmFTp0r5JUZSr2/I+XqAGQoEQ4b5fdJ80vfufY91eCz7LJpwBqXUh5DiqnCeC0STxQFb
         NbevKC3LMjuuGvzFhgyzhgYgG2o24k7Axrj8Ib/26Dqlbo5oJXtzxWsukdcvLwZaht9X
         yvZ5Nl9WD5Kuc+8rqKw8atl1qhx+tTJdx3gr0b6h3WVQ7Fdgf3crvXNenZUsEE+8py7B
         hpSA==
X-Forwarded-Encrypted: i=1; AJvYcCVhS+FCvfNoP65HewCq3oW6tHFjd/76k+1jtszjxQbWuGn4i+bk8S3q/RCuQyHq+JSjpbf/jy0z1UFFtCEoY0nOtg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBkApzuMDkIZkD24cjjxDr0ESnQNhEoSZpbK+SRrUyJPTFTU5O
	9eatvTTF7VzKqts8TFpdneqpb7bONj1yPVetHFzxoS12mVb1i13/sZ9x
X-Gm-Gg: AY/fxX4TJOqeoWa/z9yhTir4wsbpKGZAIXpabOZOqvR23PF0QgrAX3NTH7HR3vPKjtq
	Wcf6V+/M0bZyPb/8m+1VMkwh5jpp6urs+djc3dLgGMCaNhfpSfVcAZmhtCFfg7E6iYHpFHOrBtb
	zq2+oRHUcsngxXAFV8PTpyh0Fgue8qBRP+rXUH1r74mz+XBA2jGkVfA5c44LMFdIOgVh6GKERyA
	rufmS32xr3c4/iQ3SuYJy8xvS0kCU1FV2EouDxsrmmtIdFlFr5kBe47RCe8FFreO/v2nV1xBrIa
	dHE3gGj76u8+Ryu6/DjbEpxLyzt+Zf8ts9mUFEm/+Wd5JN4QyZ0ezpG+ZW30YAhpDsw7kKccxax
	CKjUidfpIuu08+41yATZXqRTq6R9J8tuBn4NkOQB5eKNE6Q1TdYm6MsYwosA2mXV0jmzMaeFiMG
	Awj1tutdYESWttaPGcRug7DXeuhSE=
X-Google-Smtp-Source: AGHT+IGBWuwyogK7VQbQPDDEdVEl2zkPn6GQMzUdBbdfRuQ5JktAoOfZ29+Z0NktyQX3N1nYVd7k4Q==
X-Received: by 2002:a05:600c:820f:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-47d84b349e9mr101793825e9.17.1767948760027;
        Fri, 09 Jan 2026 00:52:40 -0800 (PST)
Received: from [10.54.22.201] ([154.47.27.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6f0e15sm192448555e9.10.2026.01.09.00.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 00:52:38 -0800 (PST)
Message-ID: <b330bbd0-32b2-49e4-af2e-0d1baaa512a6@gmail.com>
Date: Fri, 9 Jan 2026 09:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 4/4] oe-selftest: overlayfs: Add a demo case
 for /etc
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20251224141659.2218381-1-uvv.mail@gmail.com>
 <20251224141659.2218381-4-uvv.mail@gmail.com>
 <95ec050db607457c2ae6e979dd5ae1c7d9df328c.camel@pbarker.dev>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <95ec050db607457c2ae6e979dd5ae1c7d9df328c.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 08:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229097

On 08.01.2026 14:46, Paul Barker wrote:
> On Wed, 2025-12-24 at 14:16 +0000, Vyacheslav Yurkov via
> lists.openembedded.org wrote:
>> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>
>> /etc is a special directory. It's possible to create a mount unit for
>> it, but many system services that start early at boot time will not
>> rescan its content when you mount overlay on top. The added test case
>> demonstrates this by adding a sample systemd service and enabling it in
>> overlay.
>>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/overlayfs.py | 98 +++++++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> index 3e55e97927..426b4ccee3 100644
>> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
>> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> @@ -263,6 +263,104 @@ EOT
>>   
>>           self._test_correct_image('systemd-machine-units', systemd_machine_unit_append)
>>   
>> +    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
>> +    def test_etc_mount(self):
>> +        """
>> +        Summary:   /etc is not supposed to be used with overlayfs.bbclass
>> +        Expected:  Observe inconsistencies after using etc overlay with a mount unit
>> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
>> +        """
>> +        systemd_machine_unit_append = """
>> +SYSTEMD_SERVICE:${PN} += " \
>> +    data.mount \
>> +    etc.mount \
>> +"
>> +
>> +do_install:append() {
>> +    install -d ${D}${systemd_system_unitdir}
>> +    install -d ${D}${ROOT_HOME}
>> +    cat <<EOT > ${D}${systemd_system_unitdir}/etc.mount
>> +[Unit]
>> +Description=OverlayFS mount for /etc directory
>> +DefaultDependencies=no
>> +RequiresMountsFor=/data
>> +
>> +[Mount]
>> +What=overlay
>> +Where=/etc
>> +Type=overlay
>> +Options=lowerdir=/etc,upperdir=/data/overlay/etc,workdir=/data/overlay-workdir/etc
>> +[Install]
>> +WantedBy=local-fs.target
>> +EOT
>> +
>> +    cat <<EOT >${D}${systemd_system_unitdir}/data.mount
>> +[Unit]
>> +Description=Persistent storage partition
>> +
>> +[Mount]
>> +What=/dev/sda3
>> +Where=/data
>> +Type=ext4
>> +Options=defaults
>> +
>> +[Install]
>> +WantedBy=local-fs.target
>> +EOT
>> +    cat <<EOT > ${D}${ROOT_HOME}/test-daemon.service
>> +[Unit]
>> +Description=My one-shot task
>> +After=local-fs.target
>> +
>> +[Service]
>> +Type=oneshot
>> +ExecStart=/usr/bin/echo test
>> +RemainAfterExit=yes
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> +EOT
>> +}
>> +
>> +FILES:${PN} += "${ROOT_HOME}"
>> +"""
>> +
>> +        config = """
>> +IMAGE_INSTALL:append = " systemd-machine-units"
>> +DISTRO_FEATURES:append = " overlayfs"
>> +
>> +# Use systemd as init manager
>> +INIT_MANAGER = "systemd"
>> +
>> +# enable overlayfs in the kernel
>> +KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
>> +
>> +IMAGE_FSTYPES += "wic"
>> +WKS_FILE = "overlayfs_etc.wks.in"
>> +OVERLAYFS_ROOTFS_TYPE = "ext4"
>> +"""
>> +
>> +        self.write_config(config)
>> +
>> +        machine_inc = """
>> +OVERLAYFS_MOUNT_POINT[etc] = "/etc"
>> +OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
>> +"""
>> +        self.set_machine_config(machine_inc)
>> +        self.write_recipeinc('systemd-machine-units', systemd_machine_unit_append)
>> +        bitbake('core-image-minimal')
>> +        with runqemu('core-image-minimal', image_fstype='wic', discard_writes=False) as qemu:
>> +            test_daemon_path = get_bb_var('ROOT_HOME') + '/test-daemon.service'
>> +            status, output = qemu.run_serial('cp -f ' + test_daemon_path + ' /etc/systemd/system/')
>> +            status, output = qemu.run_serial("systemctl enable test-daemon")
>> +            status, output = qemu.run_serial("sync")
>> +        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
>> +            # Check the test service status. It's enabled and supposed to start, but it didn't
>> +            status, output = qemu.run_serial("systemctl is-enabled test-daemon")
>> +            self.assertTrue("enabled" in output, msg=output)
>> +            status, output = qemu.run_serial("systemctl is-active test-daemon")
>> +            self.assertTrue("inactive" in output, msg=output)
>> +
> What is actually being tested here? It looks like we're just confirming
> that incorrect behaviour occurs. Why do we want to ensure that the
> behaviour stays incorrect?
>
> If someone is installing an 'etc.mount' unit into the rootfs that
> behaves like this then there's probably nothing we can do within Yocto
> Project to help them. I suppose you could use overlayfs for /etc if you
> set it up from an initramfs before pivoting to the main rootfs.
>
> Best regards,
>

Correct, and this is what overlayfs-etc class is for. I've seen attempts 
to use the mount unit instead and this is just a proof of concept that 
it doesn't work.

Slava


