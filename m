Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D068C0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 19:30:30 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.1364.1737747026747766708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 11:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DNv/hmry;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4678664e22fso21505201cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 11:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737747026; x=1738351826; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vZRhjPkZhAQzGROsG241qG9LxBXxAiY577vurgaXWjM=;
        b=DNv/hmry4ajLRRVR9X4/bFtyehrKfh4ISlptGN7oQXB9DH8CUI0DEVhJTk+orNDiDg
         Zb233UKCwTHT/3xFvAMKYVCnOsHChQyx+glkD6/+wf0u1zf86zz3tlQQFuR0uPfE8Jw/
         traOCAGf62Ff3fVJYIfn/Ihldujxg2VTL7XZlgPSkIUd5hGuSNIFUkw4Tqt+nNm+cMKy
         i+oKXT73hSqSFGt917y53hlaU+m7evg3GHS0Y2HDX6tuRgqXGwlgOalhO1EtgxZgLOkO
         Rs0Aa4rI8F6RI9XXUAPMqQlMS+jFvQ7x+oM8WhGYwTRXviljOSdYphSJUXLA68jfn3RM
         1AzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737747026; x=1738351826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZRhjPkZhAQzGROsG241qG9LxBXxAiY577vurgaXWjM=;
        b=V152bx46jKV1Qa71x7X4BMKvNaKjAC7kiMU+CMWLLfpFjzeBpEulkv0ZsJ7YXl20a8
         qFLIJ9CmCEaMo+Gqsf4nLO3s1hdOgCndK0yFbcNFqBiX3qtZc7bELBZaxzejDUn4lnhy
         GZ7qQQJWCJs96KnDKWcofMIThqQx53nAa8dhjHuwrsJ1c0AWIicVZ4Q/Mv46BE4x0oyn
         OLp8jijJ6yYMySWyDoyMqVKFpjRNp201+DkmRmUPmkUnKjWKrXjXbDRki6VgdX90233F
         xgeBSoHVR9XnwNqeLSL7Y64aCYVO6alH74ikJwP2AIO2Vqwd6qAcKnyJnGPsL5J2urnN
         sV4g==
X-Gm-Message-State: AOJu0YzgEu0Pq882Dy8ZlP55ZjM2uNIPXzOoDGCmdeSEeGUgNHjIOIl5
	j/QsSS6oe/bFudUngv63bUSnknI1fdm2gAY/brxyHqKybj1yocX9ERAOsIfbdzFgmn96k6tHo0D
	B4SamY2ffGIFvzckWLHbNqZMkLdNLbn9u
X-Gm-Gg: ASbGncskKedM4e7eEOkGSOZrhTpT/KZVTvQbUgsBfE6L4iDx93uSWz18+EjSUIYUrI7
	RlEriPGAfxcG0+H9JT6Eg/oyyGI8U6fiDV47aPwLhGaLmJJbJcmYik53WiWOqfHxrc8kbuuhuKU
	pY4ZoDq+7I+ACk3xq5ArGp
X-Google-Smtp-Source: AGHT+IFFYcgw/dsXOBhvYhEvCiNn6aCkL9Q6cKDJcjuR0RhQvnGgi3XFvOHHEGA1B4lNm2TdKkR1d3tbUotSQFGKLIQ=
X-Received: by 2002:ac8:5f08:0:b0:466:948e:bef6 with SMTP id
 d75a77b69052e-46e12bb31f5mr487823761cf.43.1737747025691; Fri, 24 Jan 2025
 11:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20250124141852.2089467-1-beniamin.sandu@windriver.com>
In-Reply-To: <20250124141852.2089467-1-beniamin.sandu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jan 2025 20:30:14 +0100
X-Gm-Features: AWEUYZnSWyuuQNisTYDzGHH5IJQ68A2EyNmxuyseNJwECtLz4H-scgZ7R8weSqw
Message-ID: <CANNYZj8v_gbjquwKafQHcczz7JX6v7HWmqKBi4WkAiucBKT-wQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: add rootfs-footprint
To: beniamin.sandu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 19:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210246

Isn't this what spdx already does?
E.g. tmp/deploy/spdx/3.0.1/qemux86_64/rootfs/core-image-full-cmdline-qemux86-64-rootfs.spdx.json

Alex

On Fri, 24 Jan 2025 at 17:29, Beniamin Sandu via
lists.openembedded.org
<beniamin.sandu=windriver.com@lists.openembedded.org> wrote:
>
> The rootfs-footprint class can be inherited by image recipes to generate
> a .json footprint file. This file contains a list of all installed packages,
> with the following format:
>
> {
>     "package_name": "busybox-udhcpc",
>     "version": "1.37.0",
>     "total_size": 2701,
>     "installed_files": {
>         "/etc/udhcpc.d/50default": 2652,
>         "/usr/share/udhcpc/default.script": 49
>     }
> }
>
> The data can be used with other tools/scripts to generate detailed
> rootfs reports or perform relevant comparisons.
>
> Signed-off-by: Beniamin Sandu <beniamin.sandu@windriver.com>
> ---
>  meta/classes/rootfs-footprint.bbclass | 54 +++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 meta/classes/rootfs-footprint.bbclass
>
> diff --git a/meta/classes/rootfs-footprint.bbclass b/meta/classes/rootfs-footprint.bbclass
> new file mode 100644
> index 0000000000..247db0b709
> --- /dev/null
> +++ b/meta/classes/rootfs-footprint.bbclass
> @@ -0,0 +1,54 @@
> +# Generates a json footprint file with the list of packages installed in the rootfs image,
> +# with the following format:
> +#
> +# {
> +#     "package_name": "busybox-syslog",
> +#     "version": "1.37.0",
> +#     "total_size": 2824,
> +#     "installed_files": {
> +#         "/etc/init.d/syslog": 2104,
> +#         "/etc/syslog-startup.conf": 651,
> +#         "/etc/syslog.conf": 69
> +#     }
> +# }
> +#
> +# Copyright (C) 2024 Wind River Systems, Inc.
> +# Author: Beniamin Sandu <beniamin.sandu@windriver.com>
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +ROOTFS_POSTPROCESS_COMMAND:append = " create_rootfs_footprint; "
> +ROOTFS_FOOTPRINT_FILE ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.footprint.json"
> +
> +python create_rootfs_footprint() {
> +    from oe.rootfs import image_list_installed_packages
> +    import oe.packagedata
> +    import json
> +
> +    footprint_file = d.getVar('ROOTFS_FOOTPRINT_FILE')
> +    pkg_info_dic = {}
> +    pkg_dic = dict(package_name="", version="", total_size=0, installed_files="")
> +    pkg_list = sorted(image_list_installed_packages(d))
> +
> +    pkg_data_list = []
> +
> +    for pkg in pkg_list:
> +        pkg_info = os.path.join(d.getVar('PKGDATA_DIR'), 'runtime-reverse', pkg)
> +        pkg_name = os.path.basename(os.readlink(pkg_info))
> +        pkg_info_dic[pkg_name] = oe.packagedata.read_pkgdatafile(pkg_info)
> +
> +        pkg_dic["package_name"] = pkg_name
> +        pkg_dic["version"] = pkg_info_dic[pkg_name]["PV"]
> +        pkg_dic["total_size"] = int(pkg_info_dic[pkg_name]["PKGSIZE:" + pkg_name])
> +        pkg_dic["installed_files"] = json.loads(pkg_info_dic[pkg_name]["FILES_INFO:" + pkg_name])
> +
> +        pkg_data_list.append(pkg_dic.copy())
> +
> +    with open(footprint_file, 'w') as f:
> +        json.dump(pkg_data_list, f, indent=4)
> +
> +    footprint_link = os.path.join(d.getVar('IMGDEPLOYDIR'), "%s.footprint.json" % d.getVar('IMAGE_LINK_NAME'))
> +    if os.path.lexists(footprint_link):
> +        os.remove(footprint_link)
> +    os.symlink(os.path.basename(footprint_file), footprint_link)
> +}
> --
> 2.39.5
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210236): https://lists.openembedded.org/g/openembedded-core/message/210236
> Mute This Topic: https://lists.openembedded.org/mt/110791960/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

