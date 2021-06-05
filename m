Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.10308.1622885321383472971
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 02:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uusLWcyf;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 3-20020a05600c0243b029019f2f9b2b8aso6893762wmj.2
        for <Openembedded-core@lists.openembedded.org>; Sat, 05 Jun 2021 02:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=u1kb99TfQMIu/K+9mbS//0MKLp9kpfGQ8Xw/L7I2wS4=;
        b=uusLWcyfnQBXrjBpFJETODzcuD59V7RQBeqmgkqthI7aLsiRG9pUR8i7yGaNGs/Yei
         VDX47eUKdVYdOBHGyDTmaqNeaXdH1FVYEP47mRAG6ITmY0kik7140vr+ko6DHx3Q5Y/6
         qrJBvTvRAw+ozBAUCuG5loeeu8CRPy8b/AtAxY6Dc9MDsC4fXABHUmSl5N5MMuGzRwRK
         jbtroaygb62rTQ1NiEZ2GDYBoBHY+EuMXYmA3Uvu7OABA+/wt+jXU9X9kzQlHTSkgefy
         1Ky67Lgw8qZwAYrNzD6B8H/Jfl52C2wV1JX8LOOvzA2cwUARROUtdAVsHqMhdBPt9138
         LSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=u1kb99TfQMIu/K+9mbS//0MKLp9kpfGQ8Xw/L7I2wS4=;
        b=IhI1ALLZF5iJZ8sxUcPfUiWrMXNmskkIOYenZsi+G2ednnFXs2dowcaR7HNglZ07yV
         G/mcPEE4wbBQKSsNzE6mJfZUHK1wGTzg66EZftUcC/JluRkweFMUAGz2XIFDxQMrp8U+
         hOJ0yHv1XoHKTI0FMoiudUmQkYt5ebPwU6XiUWm1KhmlRMwqHmhLOmyWTOPg7bHw646w
         os3JS54j1Yfl/btDyfUYBwcLtDXHzfLQTxwtmESz9zXB5fTxkAZhbTiihTULrQZSDWPF
         n351uuWqGbAh4rxweZh7zR+Jxh9+XVn2hObjKU7LLcN+anLkuBEDYL+a79bH7p58UUU3
         xQog==
X-Gm-Message-State: AOAM532bXVqvhc21JTnZFCdbb+W4sP+NEwGHgr8BvcqDELwgilQGUrwR
	mQpK5pARBq0hxo5fyGzJYoSJZ3+qWx6Tjsj0DmM=
X-Google-Smtp-Source: ABdhPJzKpo2JphtKzDIeD74LD4ndzpbWmMvYci8H9yh/7yTUzCPND1RinjNPFvYDjzncJZ+k50Vy8Q==
X-Received: by 2002:a1c:4b0d:: with SMTP id y13mr7381275wma.179.1622885319358;
        Sat, 05 Jun 2021 02:28:39 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([37.120.204.195])
        by smtp.gmail.com with ESMTPSA id o9sm4008436wro.97.2021.06.05.02.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 02:28:38 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] overlayfs.bbclass: generate overlayfs mount units
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
 Openembedded-core@lists.openembedded.org
References: <20210603142106.115932-1-uvv.mail@gmail.com>
 <64e51c69669c3e08da50789f22560f3f7857492b.camel@gmail.com>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <525d3814-b7cc-c1bb-892c-d44e08d171dc@gmail.com>
Date: Sat, 5 Jun 2021 11:28:37 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <64e51c69669c3e08da50789f22560f3f7857492b.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Adrian,
I don't think using /etc with overlay is a wise idea. You'd like to keep 
system configuration updatable, which wouldn't be simple if the whole 
/etc is an overlay (TBH, I'm not even sure it's possible that way. You'd 
probably need to write custom scripts and add initramfs here). But you 
can export to overlay individual user-specific configuration, for 
example /etc/wpa_supplicant.

Vyacheslav

On 05.06.2021 09:37, Adrian Freihofer wrote:
> Hi Vyacheslav
>
> It would be very nice to have such a feature in Yocto.
>
> If I remember correctly I tried to do that once with an overlay on
> /etc. However, that did not work with systemd. Did you ever try to add
> /etc as a mount point?
>
> On Thu, 2021-06-03 at 16:21 +0200, Vyacheslav Yurkov wrote:
>> It's often desired in Embedded System design to have a read-only rootfs.
>> But a lot of different applications might want to have a read-write access
>> to some parts of a filesystem. It can be especially useful when your update
>> mechanism overwrites the whole rootfs, but you want your application data
>> to be preserved between updates. This class provides a way to achieve that
>> by means of overlayfs and at the same time keeping the base rootfs read-only.
>>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>   meta/classes/overlayfs.bbclass | 132 +++++++++++++++++++++++++++++++++
>>   1 file changed, 132 insertions(+)
>>   create mode 100644 meta/classes/overlayfs.bbclass
>>
>> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
>> new file mode 100644
>> index 0000000000..7fac3e696e
>> --- /dev/null
>> +++ b/meta/classes/overlayfs.bbclass
>> @@ -0,0 +1,132 @@
>> +# Class for generation of overlayfs mount units
>> +#
>> +# It's often desired in Embedded System design to have a read-only rootfs.
>> +# But a lot of different applications might want to have a read-write access to
>> +# some parts of a filesystem. It can be especially useful when your update mechanism
>> +# overwrites the whole rootfs, but you want your application data to be preserved
>> +# between updates. This class provides a way to achieve that by means
>> +# of overlayfs and at the same time keeping the base rootfs read-only.
>> +#
>> +# Usage example.
>> +#
>> +# Set a mount point for a partition overlayfs is going to use as upper layer
>> +# in your machine configuration. Underlying file system can be anything that
>> +# is supported by overlayfs
>> +#
>> +#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
>> +#
>> +# The class assumes you have a data.mount systemd unit defined elsewhere in your
>> +# BSP and installed to the image.
>> +#
>> +# Then you can specify writable directories on a recipe base
>> +#
>> +#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
>> +#
>> +# To support several mount points you can use a different variable flag. Assume we
>> +# what to have a writable location on the file system, but not interested where the data
>> +# survive a reboot. The we could have a mnt-overlay.mount unit for a tmpfs file system:
>> +#
>> +#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
>> +#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
>> +
>> +OVERLAYFS_WRITABLE_PATHS[data] ?= ""
>> +
>> +inherit systemd
>> +
>> +def strForBash(s):
>> +    return s.replace('\\', '\\\\')
>> +
>> +def unitFileList(d):
>> +    fileList = []
>> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
>> +    for mountPoint in overlayMountPoints:
>> +        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
>> +            fileList.append(mountUnitName(path))
>> +            fileList.append(helperUnitName(path))
>> +
>> +    return fileList
>> +
>> +# this function is based on https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c
>> +def escapeSystemdUnitName(path):
>> +    escapeMap = {
>> +        '/': '-',
>> +        '-': "\\x2d",
>> +        '\\': "\\x5d"
>> +    }
>> +    return "".join([escapeMap.get(c, c) for c in path.strip('/')])
>> +
>> +def mountUnitName(unit):
>> +    return escapeSystemdUnitName(unit) + '.mount'
>> +
>> +def helperUnitName(unit):
>> +    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
>> +
>> +python do_create_overlayfs_units() {
>> +    CreateDirsUnitTemplate = """[Unit]
>> +Description=Overlayfs directories setup
>> +Requires={DATA_MOUNT_UNIT}
>> +After={DATA_MOUNT_UNIT}
>> +DefaultDependencies=no
>> +
>> +[Service]
>> +Type=oneshot
>> +ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
>> +RemainAfterExit=true
>> +StandardOutput=journal
>> +
>> +[Install]
>> +WantedBy=multi-user.target
> The mounting of overlays should probably happen very early at boot,
> before services start using the desired folders.
>
> Regards,
> Adrian
>
>> +"""
>> +    MountUnitTemplate = """[Unit]
>> +Description=Overlayfs mount unit
>> +Requires={CREATE_DIRS_SERVICE}
>> +After={CREATE_DIRS_SERVICE}
>> +
>> +[Mount]
>> +What=overlay
>> +Where={LOWERDIR}
>> +Type=overlay
>> +Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> +"""
>> +
>> +    def prepareUnits(data, lower):
>> +        args = {
>> +            'DATA_MOUNT_POINT': data,
>> +            'DATA_MOUNT_UNIT': mountUnitName(data),
>> +            'CREATE_DIRS_SERVICE': helperUnitName(lower),
>> +            'LOWERDIR': lower,
>> +        }
>> +
>> +        with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)), 'w') as f:
>> +            f.write(MountUnitTemplate.format(**args))
>> +
>> +        with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower)), 'w') as f:
>> +            f.write(CreateDirsUnitTemplate.format(**args))
>> +
>> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
>> +    for mountPoint in overlayMountPoints:
>> +        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
>> +            prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
>> +}
>> +
>> +# we need to generate file names early during parsing stage
>> +python () {
>> +    unitList = unitFileList(d)
>> +    for unit in unitList:
>> +        d.appendVar('SYSTEMD_SERVICE_' + d.getVar('PN'), ' ' + unit);
>> +        d.appendVar('FILES_' + d.getVar('PN'), strForBash(unit))
>> +
>> +    d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
>> +}
>> +
>> +do_install_append() {
>> +    install -d ${D}${systemd_system_unitdir}
>> +    for unit in ${OVERLAYFS_UNIT_LIST}; do
>> +        install -m 0444 ${WORKDIR}/${unit} ${D}${systemd_system_unitdir}
>> +    done
>> +}
>> +
>> +addtask create_overlayfs_units before do_install
>> 
>>
>
