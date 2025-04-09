Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D64C369A1
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 16:47:54 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.13784.1744217272699784200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 09:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LqN26sCH;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c56321b22cso97070485a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744217272; x=1744822072; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfeP1RdyELK7kp7fAJIR0wlMZoxnEt+L9KR1VYOxiDc=;
        b=LqN26sCHxAKLltVSPlqJw75m3Xh4DPzIezzXx9waAZI408lFRXid5GMoJjJZAjqxP2
         hz56utd+0GWIKvXXhdTHGkklPplYNXTYOZnkyFtdmpTcgrMVH722X8kJnif+qNraSE7j
         QxgXcGhnhODsSANWUoMuWWS6jzGhsuVkHCouIQeS7/f8r+BAJDZuHZoBlxpv6CzY45fR
         sRaMO3ifYl1brq61pXPBdC9E7XQlexKoYoMCkR315Sl+aF6fkhr8ZzPcicn6joFASrjN
         2QKEEeiSN23UJmAWahBvu/E98XQTCNBuydxn867Vr6kwgOneh/dW5lAW0NcpiUDW3CLz
         oJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744217272; x=1744822072;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfeP1RdyELK7kp7fAJIR0wlMZoxnEt+L9KR1VYOxiDc=;
        b=rXWqsBmt1orzapsuBClTSeErOuyN7/eCaKJ7D3SAKQdofyJmZ8Ae1ajTlPavvd1Etv
         Q/9soSnE+J/KwLJkHI4Sv+WfJQjCheEWbXBh3BH4EUk86QsldyTEyDAhljlaFFSSR5tu
         aM5qMeWBBQXithP4ukbVo0x5W5CRfDfN8b7oY4cSHBwksO2otxs+P24e5lWrHGLYEIJb
         T+I+st6i26CL7xH/zFk2B8vVInrQnA3sKznyswK9EQEHOEHeY//aF0DvuuLSRB0vT+WC
         Tg3T55bCJk3jbPFIn58MDGX0tGFIBdKJYhFlJ1CTjxlZniOEnPnoONuoQHHt40ES0P0W
         n4kA==
X-Gm-Message-State: AOJu0YxhAyHeT2BWqjoBNOaTWejW5jG9ptT43qBaStYcqEowpebe3FJD
	YiEACHujgcwR/q/0uJ3/kuMyL+lDWpLoP9eKpRTyJWNCRynEdku8
X-Gm-Gg: ASbGncvt9gI+r/DPudSbHuDWjyTdKoqRGV28KUOG2HTh7v9uKaf6eVwv9sL8QDMINXg
	G6fdpmZDEu6mhgseKu+9lMlsww+xO7k6U474kZDE6DO80ShBGg/IdmasDxlJAYH3CnXZJBWKNU4
	RX646XLhiec50jrIZaaaRM3bwXTmIHDN3odxMPkhNuVb4FMRa1CgKMhNSAoROGYZQiX2I3Weout
	NVQvvJwU/fMcr/Z7E4xPJA2Sy0pnWcevBDkFqHKRuNBC7vrWU1u66uP+XCVfqK1Vmtjc/YgZwyq
	O/EGxd6cCFEwjhYgAclGZ9CwqiBapboMeO794b1b9ltB/Z2+2bcl7sqtWTLMZ9vD5A1q
X-Google-Smtp-Source: AGHT+IG8DSU0buWb8um7plO9IvSEx7UIoFQ9QINGkqHYh1jKc1my7VaZ0Cw4o0zJFY5NF0VUd0AUvA==
X-Received: by 2002:a05:620a:280e:b0:7c5:6b46:e1f6 with SMTP id af79cd13be357-7c7a65ab734mr41256585a.1.1744217271629;
        Wed, 09 Apr 2025 09:47:51 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea08084sm9284916d6.91.2025.04.09.09.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 09:47:50 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:47:49 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] wic: do not ignore ROOTFS_SIZE if the rootfs
 is modified
Message-ID: <20250409164748.GA24240@localhost>
References: <20250408205709.7013-1-twoerner@gmail.com>
 <D926HJUGOVD7.WS65R1LTLOYT@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D926HJUGOVD7.WS65R1LTLOYT@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 16:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214596

Hi Mathieu,

Thanks for looking at my patch!

On Wed 2025-04-09 @ 04:29:57 PM, Mathieu Dubois-Briand wrote:
> On Tue Apr 8, 2025 at 10:57 PM CEST, Trevor Woerner via lists.openembedded.org wrote:
> I do have some build issue on the autobuilder:
> 
> 2025-04-09 11:14:21,897 - oe-selftest - INFO - wic.Wic.test_exclude_path_with_extra_space (subunit.RemotedTestCase)
> 2025-04-09 11:14:21,898 - oe-selftest - INFO -  ... FAIL
> ...
> [Wed Apr  9 11:01:08 2025] (1309377/1309395): 192.168.7.4:53040 UA:elfutils/0.192,Linux/x86_64,/ XFF: GET /buildid/da3aea1c8160034e1b0961a7f2b5ce5c5a95553b/debuginfo 200 237848 0+9ms
> ERROR: When reparsing /tmp/selftest-fetchw3a6djws/test.bb:do_checkuri, the basehash value changed from 84b9e23a83a764e7a5d8a96ee523199e2b1c604f4280a45030e248de0ff52962 to 4123da244f465feffecb2b4fd2b132b64851981ec2fb70bf9445df8b0ea6a69e. The metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake test -cdo_checkuri -Snone
> ERROR: Then:
> ERROR: $ bitbake test -cdo_checkuri -Sprintdiff
> 
> ERROR: When reparsing /tmp/selftest-fetchw3a6djws/test.bb:do_fetch, the basehash value changed from 6d55d6743729b615749dc016857d7e5f9c884a8b92f0d57f68e743f4910333d3 to fa7d6ea0563b60362418d2a6c5e41a6684183d01ec578b65abd0c64a9cfba7cf. The metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake test -cdo_fetch -Snone
> ERROR: Then:
> ERROR: $ bitbake test -cdo_fetch -Sprintdiff
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1329

Strange. This *sounds* like what happens when I update my layers while a build
is running. I wouldn't expect the AB to do something like that in the middle
of a build?

> I tried to reproduce this locally, and reproduced a fail with
> "oe-selftest -r wic.Wic.test_exclude_path_with_extra_space", but with a
> different error:
> 
> | INFO: Creating image(s)...
> |
> | DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-contrib/scripts/lib/wic/plugins/imager/direct.py
> | DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-contrib/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
> | DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-contrib/scripts/lib/wic/plugins/source/empty.py
> | DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-contrib/scripts/lib/wic/plugins/source/bootimg-efi.py
> | DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-contrib/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> | DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-contrib/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> | DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-contrib/scripts/lib/wic/plugins/source/bootimg-partition.py
> | DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-contrib/scripts/lib/wic/plugins/source/rootfs.py
> | DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-contrib/scripts/lib/wic/plugins/source/rawcopy.py
> | DEBUG: _exec_cmd: install -d /home/mdubois-briand/swat/oe-sefltest/poky-contrib/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/boot.1
> | DEBUG: ['install', '-d', '/home/mdubois-briand/swat/oe-sefltest/poky-contrib/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/boot.1']
> | DEBUG: _exec_cmd: output for install -d /home/mdubois-briand/swat/oe-sefltest/poky-contrib/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/boot.1 (rc = 0):
> | ERROR: No boot files defined, IMAGE_BOOT_FILES unset for entry #1
> 
> So maybe I'm missing something here.
> 
> The exact branch I used for this build should be available in
> https://web.git.yoctoproject.org/poky-ci-archive/tag/?h=autobuilder.yoctoproject.org/valkyrie/a-full-1372,
> but the mirror seems out of sync. I hope it will be there a bit later
> today.
> 
> Can you have a look at this, please?

This is my first oe-selftest, so I'm not entirely surprised. It succeeded for
me, I thought I had it figured out, but I've probably done something wrong in
my testing.

Thanks, I'll take another look at this with your branch.

Best regards,
	Trevor

