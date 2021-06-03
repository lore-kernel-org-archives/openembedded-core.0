Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.8763.1622730924151401605
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 07:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G1i5NQfy;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id g8so9629018ejx.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mg5sq8ujAghp5goxIQeVuxRIpTjSWXZrq4IwDvEjHvc=;
        b=G1i5NQfyYyTh+Fdhn6iGzpGFqm/FrmCFc5CMKyga5jVwKVQVc4GyVmWKXmlwZmqRhp
         b141KdGgbpOm5H5KLXjQANhQ7JQQiBp0+0O0eg2n08933JNM6K/+XX8IXumRn1y2LiaV
         Qpb5viMvCeGIbi2XqUjtGOVTvnyrDQjfV2Sl0Co4IoVVUEasO8fi/dHU16cvsBN43vz2
         Ac+so5GdLdkrAOkYJQ8aex+D+NkEq36SKVovDD8ea7GlSwuCWCwX2E6i7iMiUvPgaHg3
         iJ2oX7P8JliQaYgBiYU0rFMGPpDU8pYBmSmZ6yt8xeyKEZtLDAX/w/ezpAMELKZCzyaL
         /EvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mg5sq8ujAghp5goxIQeVuxRIpTjSWXZrq4IwDvEjHvc=;
        b=N6hnVW0kWJ2TheGZENgfyTmwfF9c3lsh8fYQeth+sbGDSTFUwStQRgPetXWL7XmPCw
         V/ff1dpBUifB+5t8B64rDqIPYft/mQkJgYfulW1MnObOoHeBVCw9bLmQBbEn+swA8/GW
         JCyW7YoU492nOwwn7MmVbHkuBHvULKE7KrwpLm5lCq9OjYRwlQCKRPW9sQVw0Oi9aDGs
         dagaMB5BJRICKxbxFRAqSYwovuArM/qatHCT3xDnpbwKRtGEt/5nYW9QZJ6aEt9txYR/
         CcAV805xKxxwU00XJUelY6+Rc/PzLzt7E1TTl9HJaxsMiYjaN0/VKaAhFECruXYMHr9l
         sjGg==
X-Gm-Message-State: AOAM531Z2o2B+LjAwqfwAT2MsZIPjayFOFDNhJisEsdYc/mAC0snrxzs
	pWCWH4zpF1Mj7o4Hcez3gCW5H7IUMntiZBDXAbE=
X-Google-Smtp-Source: ABdhPJzRUkQ4eQcdwgzEPVa/FE4yMgetGPtClFnhC8QMnt0Li7ddwP+NAZeauIMjERMuj8gSALvdcbKrKo6fDOi1RIc=
X-Received: by 2002:a17:906:c211:: with SMTP id d17mr39556301ejz.247.1622730922584;
 Thu, 03 Jun 2021 07:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210603142106.115932-1-uvv.mail@gmail.com>
In-Reply-To: <20210603142106.115932-1-uvv.mail@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 3 Jun 2021 10:35:11 -0400
Message-ID: <CADkTA4PF=kie6Q=sqUkZjyX=NB-yq5Ccqy-XryhZ6DNVgcrRFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] overlayfs.bbclass: generate overlayfs mount units
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 10:21 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> It's often desired in Embedded System design to have a read-only rootfs.
> But a lot of different applications might want to have a read-write access
> to some parts of a filesystem. It can be especially useful when your update
> mechanism overwrites the whole rootfs, but you want your application data
> to be preserved between updates. This class provides a way to achieve that
> by means of overlayfs and at the same time keeping the base rootfs read-only.

Hi Vyacheslav,

This looks like it could be quite useful, but a few comments came to
mind on a really quick scan.

Since this is systemd based, it should probably have
REQUIRED_DISTRO_FEATURES = "systemd", to ensure that the rest of the
system and packages are consistently enabled.

As part of getting this into core, it needs some sort of test cases /
test suite (and one that covers the different modes you describe in
the class) .. so something like a test image (a user) and the tests
themselves.

It really also needs a maintainer entry, since otherwise the
maintenance work falls to the same already overloaded folks.

Since this is intended to be used on a per-recipe basis (at least that
is my understanding from reading it), what happens if two recipes
create conflicting overlay mounts ? or if the mentioned data.mount is
not present in the image ?

Bruce

>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/classes/overlayfs.bbclass | 132 +++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 meta/classes/overlayfs.bbclass
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
> --
> 2.28.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
