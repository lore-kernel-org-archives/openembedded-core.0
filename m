Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.9756.1622878647376445093
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 00:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ov21fLQA;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id cb9so13783110edb.1
        for <Openembedded-core@lists.openembedded.org>; Sat, 05 Jun 2021 00:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=fp0LjhLkMWV0ZQvNLmeNBXYU5c+Sd9NGSDSd+WOmwDs=;
        b=ov21fLQAmD9E7uUA+hFhdvf9p/HHPE/ofbhf7wLOfFcJjcucztITy+VIVA68DwOUNI
         UieqjOGs1VpP33bV3pK1U4qoWkFxjOnCMje6t8Q01lbp8KL0QwcqO2FAW1y6SYFfSHYS
         Ym1RFBSjLVM798YvKIiXux5Dt6xrBrzUgfYPzt26T8XWUOKUJM62zKpbLbAar+TrN6nF
         qlgwowjIL5Z15ij0urACOl3qzpfYzP64SGxa+oQrmP3fdLK/Zw1ZjMjidgawMebeB0d6
         PfQn7hRbKOvqCYuQ/aXqPXxwPMiuQ4OBBv9RDtWqZIjN6x55qni4iI5UjWkthOMORasY
         LthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fp0LjhLkMWV0ZQvNLmeNBXYU5c+Sd9NGSDSd+WOmwDs=;
        b=tR1I6N6igMLnboAM3CLKR+89iNMJjWFQR6+pNo1KIjw1khb+AGsgtZleDYN3obsAnS
         wC+y55fUBpm/0XuNwX6HGdc8tdT6/oMv12bgqNh92+BcrDrqaPm7z6a5e5jMRHLEwtHs
         c7PNxVNcCjBbO01tjjzI07SlTA6iaeK36AQenI1CVT9HGjhAj81G8VSuDhWeBk9BDqwF
         kzktbomLCuS1xDOcb7lBR0cNOvuKHTV/JOOc6hzldFXQttCxKYHfKEKxxwcpIICr16aH
         URLq4dIoLUKGZJx03ToCQpQXZC4EOPPkGVYvzWU30MyY4XFfZuUH0UV40Xi8yrYkIkRB
         kyjA==
X-Gm-Message-State: AOAM533R4bV4Ue8f2eZRWX12mMGhxd63UuChDPS4CJZ0cXUFyQAFIoUc
	nPYnYhycHsoEwDsk94iMvRs=
X-Google-Smtp-Source: ABdhPJzafwh+J2tQC09te5DJDXIYEsgMagDEodBpMNfusGvd3pxg8chkBN5gJL7OyT0A7M9BgoQm7w==
X-Received: by 2002:a05:6402:51ce:: with SMTP id r14mr9262401edd.138.1622878645607;
        Sat, 05 Jun 2021 00:37:25 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id p10sm3740947ejc.14.2021.06.05.00.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 00:37:24 -0700 (PDT)
Message-ID: <64e51c69669c3e08da50789f22560f3f7857492b.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] overlayfs.bbclass: generate overlayfs mount units
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Openembedded-core@lists.openembedded.org
Date: Sat, 05 Jun 2021 09:37:23 +0200
In-Reply-To: <20210603142106.115932-1-uvv.mail@gmail.com>
References: <20210603142106.115932-1-uvv.mail@gmail.com>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Vyacheslav

It would be very nice to have such a feature in Yocto.

If I remember correctly I tried to do that once with an overlay on
/etc. However, that did not work with systemd. Did you ever try to add
/etc as a mount point?

On Thu, 2021-06-03 at 16:21 +0200, Vyacheslav Yurkov wrote:
> It's often desired in Embedded System design to have a read-only rootfs.
> But a lot of different applications might want to have a read-write access
> to some parts of a filesystem. It can be especially useful when your update
> mechanism overwrites the whole rootfs, but you want your application data
> to be preserved between updates. This class provides a way to achieve that
> by means of overlayfs and at the same time keeping the base rootfs read-only.
> 
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/classes/overlayfs.bbclass | 132 +++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 meta/classes/overlayfs.bbclass
> 
> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
> new file mode 100644
> index 0000000000..7fac3e696e
> --- /dev/null
> +++ b/meta/classes/overlayfs.bbclass
> @@ -0,0 +1,132 @@
> +# Class for generation of overlayfs mount units
> +#
> +# It's often desired in Embedded System design to have a read-only rootfs.
> +# But a lot of different applications might want to have a read-write access to
> +# some parts of a filesystem. It can be especially useful when your update mechanism
> +# overwrites the whole rootfs, but you want your application data to be preserved
> +# between updates. This class provides a way to achieve that by means
> +# of overlayfs and at the same time keeping the base rootfs read-only.
> +#
> +# Usage example.
> +#
> +# Set a mount point for a partition overlayfs is going to use as upper layer
> +# in your machine configuration. Underlying file system can be anything that
> +# is supported by overlayfs
> +#
> +#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
> +#
> +# The class assumes you have a data.mount systemd unit defined elsewhere in your
> +# BSP and installed to the image.
> +#
> +# Then you can specify writable directories on a recipe base
> +#
> +#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
> +#
> +# To support several mount points you can use a different variable flag. Assume we
> +# what to have a writable location on the file system, but not interested where the data
> +# survive a reboot. The we could have a mnt-overlay.mount unit for a tmpfs file system:
> +#
> +#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
> +
> +OVERLAYFS_WRITABLE_PATHS[data] ?= ""
> +
> +inherit systemd
> +
> +def strForBash(s):
> +    return s.replace('\\', '\\\\')
> +
> +def unitFileList(d):
> +    fileList = []
> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
> +    for mountPoint in overlayMountPoints:
> +        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
> +            fileList.append(mountUnitName(path))
> +            fileList.append(helperUnitName(path))
> +
> +    return fileList
> +
> +# this function is based on https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c
> +def escapeSystemdUnitName(path):
> +    escapeMap = {
> +        '/': '-',
> +        '-': "\\x2d",
> +        '\\': "\\x5d"
> +    }
> +    return "".join([escapeMap.get(c, c) for c in path.strip('/')])
> +
> +def mountUnitName(unit):
> +    return escapeSystemdUnitName(unit) + '.mount'
> +
> +def helperUnitName(unit):
> +    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
> +
> +python do_create_overlayfs_units() {
> +    CreateDirsUnitTemplate = """[Unit]
> +Description=Overlayfs directories setup
> +Requires={DATA_MOUNT_UNIT}
> +After={DATA_MOUNT_UNIT}
> +DefaultDependencies=no
> +
> +[Service]
> +Type=oneshot
> +ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
> +RemainAfterExit=true
> +StandardOutput=journal
> +
> +[Install]
> +WantedBy=multi-user.target
The mounting of overlays should probably happen very early at boot,
before services start using the desired folders.

Regards,
Adrian

> +"""
> +    MountUnitTemplate = """[Unit]
> +Description=Overlayfs mount unit
> +Requires={CREATE_DIRS_SERVICE}
> +After={CREATE_DIRS_SERVICE}
> +
> +[Mount]
> +What=overlay
> +Where={LOWERDIR}
> +Type=overlay
> +Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
> +
> +[Install]
> +WantedBy=multi-user.target
> +"""
> +
> +    def prepareUnits(data, lower):
> +        args = {
> +            'DATA_MOUNT_POINT': data,
> +            'DATA_MOUNT_UNIT': mountUnitName(data),
> +            'CREATE_DIRS_SERVICE': helperUnitName(lower),
> +            'LOWERDIR': lower,
> +        }
> +
> +        with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)), 'w') as f:
> +            f.write(MountUnitTemplate.format(**args))
> +
> +        with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower)), 'w') as f:
> +            f.write(CreateDirsUnitTemplate.format(**args))
> +
> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
> +    for mountPoint in overlayMountPoints:
> +        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
> +            prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
> +}
> +
> +# we need to generate file names early during parsing stage
> +python () {
> +    unitList = unitFileList(d)
> +    for unit in unitList:
> +        d.appendVar('SYSTEMD_SERVICE_' + d.getVar('PN'), ' ' + unit);
> +        d.appendVar('FILES_' + d.getVar('PN'), strForBash(unit))
> +
> +    d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
> +}
> +
> +do_install_append() {
> +    install -d ${D}${systemd_system_unitdir}
> +    for unit in ${OVERLAYFS_UNIT_LIST}; do
> +        install -m 0444 ${WORKDIR}/${unit} ${D}${systemd_system_unitdir}
> +    done
> +}
> +
> +addtask create_overlayfs_units before do_install
> 
> 


