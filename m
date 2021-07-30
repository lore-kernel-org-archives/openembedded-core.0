Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.19891.1627622096109552465
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 22:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aHgeoby6;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id a192-20020a1c7fc90000b0290253b32e8796so6488372wmd.0
        for <Openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 22:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=HhgrJ2VOFv8q5KADX6oBYX/O211D2R4AdJb1AJF70/8=;
        b=aHgeoby6o16FvrqwPYXhRzmBLOsOPyro06rycic52AmPHvceYQdILspVQ/YwsDguSd
         pqEfecd2qKgsbvIykCmFeflmxHl8VMecFx6yX2zKLEXm1lfKQTfbAQQJiP6ZZOd0B4XN
         b+gnZiwGrvn088pixIdPejn5SN0oLlyY1XBwM3Ehtl9uNyrFev6tQBFFmwDDEyDBjXkd
         CbC2HOhUTZHSiXRhXQxSViPr8tgDD/POpwFNWsoZfAOc3gWWTosDdJAyEOE2aeTbnPDF
         33hkFm8lvkHrLyZpRTlAZe/ye5IEmJM0XBxwKXho5SXsxL4htZ5zHJGUy9O7hvn8n8jb
         QkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HhgrJ2VOFv8q5KADX6oBYX/O211D2R4AdJb1AJF70/8=;
        b=BHJ5/q7ffXtjk5vtUN3ZxtGPwwsaOvsBeqERlEAj6cHFwzGC8lL/J1zXMiMN12lHdC
         tppRWd0iqs0Zr/tYab5unGR7zN1uS/fcVzwVSistVmutPnrEaJuXZLgW+cIH9U55AT+6
         L5pYbw7ZD9FU+bPLUtVKMPbxzQSToKTBsEXHFuaEHhfnzFkC+bpfS0Yn7CuENkNN8lml
         GuClldeg0TvQNqWmVcxsXuO3BVAmxsijkmsxj3eSYZoyGyAEOLWFU3idb+4wJXXm+/ra
         oD3IxsX3Dqe+BHGe29LVJRBOuv+d2c1+I8bSfkpu/VvxqQDV1kb14DEwjOUNG5Cqfg5l
         UP2w==
X-Gm-Message-State: AOAM530VltYLzdZLbkee30SvFux9kMowKQOYSY+irnMynghR2BS6x5h+
	koHSkccLwS54H/CYKJPGl3Ycihvt05LbBhGXe3s=
X-Google-Smtp-Source: ABdhPJyrBKhcefpMwmB/1Mi8PsefhhD2Lodu9ojDUE16dMzzVtXDYT/4FIcVeKBQYtIlqCfMvu1S3A==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr992605wmb.82.1627622094384;
        Thu, 29 Jul 2021 22:14:54 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local (pdv237.internetdsl.tpnet.pl. [46.171.99.237])
        by smtp.gmail.com with ESMTPSA id v12sm389971wrq.59.2021.07.29.22.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 22:14:53 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v3 2/8] overlayfs.bbclass: generate overlayfs mount units
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
References: <20210715193933.66120-1-uvv.mail@gmail.com>
 <20210715193933.66120-2-uvv.mail@gmail.com>
 <3374ac50d1997cf849fc5a8d83109dc05cc1926f.camel@linuxfoundation.org>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <04ee9e7a-6139-db38-0a08-80962f3e3e24@gmail.com>
Date: Fri, 30 Jul 2021 07:14:50 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <3374ac50d1997cf849fc5a8d83109dc05cc1926f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 22.07.2021 23:13, Richard Purdie wrote:
> On Thu, 2021-07-15 at 21:39 +0200, Vyacheslav Yurkov wrote:
>> It's often desired in Embedded System design to have a read-only rootfs.
>> But a lot of different applications might want to have a read-write access
>> to some parts of a filesystem. It can be especially useful when your update
>> mechanism overwrites the whole rootfs, but you want your application data
>> to be preserved between updates. This class provides a way to achieve that
>> by means of overlayfs and at the same time keeping the base rootfs read-only.
>>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>   meta/classes/overlayfs.bbclass | 133 +++++++++++++++++++++++++++++++++
>>   1 file changed, 133 insertions(+)
>>   create mode 100644 meta/classes/overlayfs.bbclass
>>
>> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
>> new file mode 100644
>> index 0000000000..40e6107f0d
>> --- /dev/null
>> +++ b/meta/classes/overlayfs.bbclass
>> @@ -0,0 +1,133 @@
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
>> +# is supported by overlayfs. This has to be done in your machine configuration.
>> +# QA check fails to catch file existence if you redefine this variable in your recipe!
>> +#
>> +#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
>> +#
>> +# The class assumes you have a data.mount systemd unit defined in your
>> +# systemd-machine-units recipe and installed to the image.
>> +#
>> +# Then you can specify writable directories on a recipe base
>> +#
>> +#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
>> +#
>> +# To support several mount points you can use a different variable flag. Assume we
>> +# want to have a writable location on the file system, but not interested where the data
>> +# survive a reboot. Then we could have a mnt-overlay.mount unit for a tmpfs file system:
>> +#
>> +#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
>> +#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
>> +#
>> +# Note: the class does not support /etc directory itself, because systemd depends on it
>> +
>> +REQUIRED_DISTRO_FEATURES += "systemd overlayfs"
>> +
>> +inherit systemd features_check overlayfs-qa
>> +
>> +def strForBash(s):
>> +    return s.replace('\\', '\\\\')
>> +
>> +def unitFileList(d):
>> +    fileList = []
>> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
>> +
>> +    if not overlayMountPoints:
>> +        bb.fatal("A recipe uses overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE configuration")
>> +
>> +    # check that we have required mount points set first
>> +    requiredMountPoints = d.getVarFlags('OVERLAYFS_WRITABLE_PATHS')
>> +    for mountPoint in requiredMountPoints:
>> +        if mountPoint not in overlayMountPoints:
>> +            bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_POINT[%s] in your MACHINE configuration" % mountPoint)
>> +
>> +    for mountPoint in overlayMountPoints:
>> +        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
>> +            fileList.append(mountUnitName(path))
>> +            fileList.append(helperUnitName(path))
>> +
>> +    return fileList
>> +
>> +def helperUnitName(unit):
>> +    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
> Again, I'm a little torn on some of the functions. Would some of these
> be better as part of a function library in meta/lib/oe/ ?
>
> The downside is that variable dependencies are no longer automatic so
> the dependency on OVERLAYFS_WRITABLE_PATHS may be missed, I don't think
> it would see OVERLAYFS_MOUNT_POINT as I'm not sure the magic parsing
> code understand getVarFlags (compared to getVarFlag which it does).
>
> Cheers,
>
> Richard

Sorry for the late response. Do you mean to move only helper functions 
to meta/lib/oe, right?
By variable dependencies you mean that bitbake would not pick up meta 
data changes automatically?

I will try to move common parts to meta/lib/oe then and send a v4

Thanks,
Vyacheslav
