Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA3DC369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 21:06:09 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.5703.1744664767166969692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 14:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IdnGpvcb;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c546334bdeso383363085a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 14:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744664766; x=1745269566; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKVC6PS7V0XLd6w2Vx2Es/pCcVIMW5xPfgu104hPdZw=;
        b=IdnGpvcbxrAa0PL9G4lP9ryIG+JUX31zeleuKlpGfml8CsBEUWWyWHQ9ZrGy2KhQZ/
         mD+ErLwnosjtutzAIARsZULd58XRDB+vojqJo5Qeds0vEdFt7XjR0jQOL9TtfDAqJnYS
         LmJqjrcJCVjn6/WhoQwuLpaFald1V5Ks02IGjBdrQTezD+QxFS4NRPZF6OxvEMNWwGFX
         Fv3LJ8uEiBrOkHTIWeqdrlB0QaEoQJD/FxhOJ/jqbYWV9oNwv4eiouNjfasEVNtvzqTz
         mBskho2R8MF+ds+cAR3fY+n1h6t0U8QgZLHh5KI/JXGyt70mO6qmpjTEYNXg8XjpqIqP
         q5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744664766; x=1745269566;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKVC6PS7V0XLd6w2Vx2Es/pCcVIMW5xPfgu104hPdZw=;
        b=Jd98fyVJ2uE9QbudtxM7Q6/hSN6/RSZnMjSWbulH3OlC8o/64xady4lkxHdBy0Yuie
         Oh2rptbbqDebD4C9f+HHw0DI4BRvDYGNCIn9rS5cEx/vr1pgsSCdHyXuHSSK+harz6CX
         sF3+aLQGZRJ2QkHvxDeBNGkiA/FeO/Zunb7FWXg2Z+vmn+E2b2N76cJlazUM/iClW47S
         8urVYquHL1SR/pI1WB+FzileEzffKjBEED6YO448YFdYDz+a2HisrbXS/dJKIQr/M6uX
         jllpoQc1dgkvHxOUBQhrorQzoLB9hmgPexFKF0blencDljcTtGrSduqmRPcuzrwvYW9p
         6iTw==
X-Gm-Message-State: AOJu0YyM1VPFOdXSjxx7RxOSbOeY9V77BRjcN02/4zWS4FJVSQI+qAO+
	iDzLn8OasSfr4aj6EKc6ezhwgEkb9FmHD8BM+H2exh742HqV341T
X-Gm-Gg: ASbGncvjQw1UecEC9OEbCbq4HgH+DWak2uC4lcJ1g1e3yKwso00orIpENyrSBh08nrN
	yRUTk19nn5QdxdiivRp/Z53hGjLXVo5yJnXTGHSqu+05q82Nw/zwQBYIcW/RZgumnX4XMvwVew5
	OonlARxzJ0HHip7nC9h/B7w1Lzq7dHGl+81MjVnmsz17wdIFfTDacbGwHzaZhsGkuswkFs1byNd
	Q21wq929mos2aUXVxe5AUuwEvPw4eJVtKaz1B3zznyG0TB4WhrKI8vmuR2QRLeNAL/8Cq/GCbDH
	CzdGvEhREng79Rmbp4uyM4iijaO0ykjI9bhBS+RlnLw9AC6+jSCL32YjHnO1S/CmiSNj
X-Google-Smtp-Source: AGHT+IGOGAe6qyTaYLemr+jtSAf8zREpL+r34aKeCLobCk4kdlBgWMFutWls48gqrYVe6wHksw1TGw==
X-Received: by 2002:a05:620a:4399:b0:7c5:6396:f161 with SMTP id af79cd13be357-7c7af20ba80mr2435820685a.49.1744664766156;
        Mon, 14 Apr 2025 14:06:06 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7b7cd5f4fsm469275585a.54.2025.04.14.14.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 14:06:05 -0700 (PDT)
Date: Mon, 14 Apr 2025 17:06:03 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] wic: do not ignore ROOTFS_SIZE if the
 rootfs is modified
Message-ID: <20250414210603.GA39105@localhost>
References: <20250410113626.9057-1-twoerner@gmail.com>
 <D96C0KR6XEKH.25C14VR7MLUOK@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D96C0KR6XEKH.25C14VR7MLUOK@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 21:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214814

On Mon 2025-04-14 @ 01:40:34 PM, Mathieu Dubois-Briand wrote:
> On Thu Apr 10, 2025 at 1:36 PM CEST, Trevor Woerner via lists.openembedded.org wrote:
> > If the *.wks file contains a "--source rootfs" then
> > lib/wic/plugins/source/rootfs.py will be invoked to generate (what is assumed
> > to be) the rootfs partition. If the rootfs partition needs to be tweaked or
> > modified, the "rootfs.py" plugin will make a copy of the filesystem and then
> > perform the changes on that copy. In other words, if the "--source rootfs"
> > line of the *.wks file also contains any of:
> >
> > 	--exclude-path
> > 	--include-path
> > 	--change-directory
> > 	--use-label (i.e. modify etc/fstab)
> >
> > then the rootfs will be copied first, then the copy is modified.
> >
> > If, for example, the unmodified IMAGE_ROOTFS is:
> >
> > 	.../tmp/work/qemuarm64_secureboot-oe-linux/core-image-base/1.0/rootfs
> >
> > then the copy would be made at:
> >
> > 	.../tmp/work/qemuarm64_secureboot-oe-linux/core-image-base/1.0/tmp-wic/rootfs${LINENO}
> >
> > where ${LINENO} is the line number where this "--source rootfs" line appears
> > in the *wks file.
> >
> > When it comes time to make an actual partition of a specific filesystem type,
> > lib/wic/partition.py::prepare_rootfs() is called. It is in this function that
> > wic figures out if any extra size needs to be added. The bitbake variable used
> > to specify the ultimate rootfs size is ROOTFS_SIZE, and since this variable is
> > only valid for the rootfs (and not any other partitions), the code also
> > verifies that the partition being created is ${IMAGE_ROOTFS}:
> >
> > 	rsize_bb = get_bitbake_var('ROOTFS_SIZE')
> > 	rdir = get_bitbake_var('IMAGE_ROOTFS')
> > 	if rsize_bb and rdir == rootfs_dir:
> > 		<use rsize_bb>
> > 	else:
> > 		<calculate the partition size using "du -ks $p">
> >
> > As noted above, if lib/wic/plugins/source/rootfs.py has made a copy, then the
> > "rdir == rootfs_dir" clause will fail and the code will assume this partition
> > is not a rootfs since the strings do not compare equal.
> >
> > Therefore, in order to determine if this is a rootfs, retain the existing
> > "rdir == rootfs_dir" comparison, but also add another one to check whether or
> > not this is a wic-generated copy of the rootfs.
> >
> > STEPS TO REPRODUCE:
> > 	- start with the following *wks file:
> > 		bootloader --ptable gpt
> > 		part /boot --size=100M --active --fstype=ext4 --label boot
> > 		part /     --source rootfs      --fstype=ext4 --label root
> > 	- and the following extra variable in conf/local.conf:
> > 		IMAGE_ROOTFS_EXTRA_SPACE = "500000"
> > 	- build an image
> > 	- run it in qemu
> > 		$ runqemu slirp nographic serial
> > 	- verify the root partition has extra space:
> > 		root@qemuarm64-secureboot:~# df -h
> > 		Filesystem                Size      Used Available Use% Mounted on
> > 		/dev/root               721.5M     67.4M    600.6M  10% /
> > 		devtmpfs                477.7M         0    477.7M   0% /dev
> > 		tmpfs                    40.0K         0     40.0K   0% /mnt
> > 		tmpfs                   489.3M     92.0K    489.2M   0% /run
> > 		tmpfs                   489.3M     68.0K    489.2M   0% /var/volatile
> > 		/dev/vda1               120.4M     19.9M     91.4M  18% /boot
> > 	- modify the "/" line of the *wks file to be:
> > 		part /     --source rootfs      --fstype=ext4 --label root --exclude-path boot/
> > 	- build image
> >
> > 	when it fails:
> > 		root@qemuarm64-secureboot:~# df -h
> > 		Filesystem                Size      Used Available Use% Mounted on
> > 		/dev/root                73.4M     41.9M     25.8M  62% /
> > 		devtmpfs                477.7M         0    477.7M   0% /dev
> > 		tmpfs                    40.0K         0     40.0K   0% /mnt
> > 		tmpfs                   489.3M     92.0K    489.2M   0% /run
> > 		tmpfs                   489.3M     68.0K    489.2M   0% /var/volatile
> > 		/dev/vda1               120.4M     19.9M     91.4M  18% /boot
> >
> > 	after this fix:
> > 		root@qemuarm64-secureboot:~# df -h
> > 		Filesystem                Size      Used Available Use% Mounted on
> > 		/dev/root               721.5M     47.4M    620.6M   7% /
> > 		devtmpfs                477.7M         0    477.7M   0% /dev
> > 		tmpfs                    40.0K         0     40.0K   0% /mnt
> > 		tmpfs                   489.3M     92.0K    489.2M   0% /run
> > 		tmpfs                   489.3M     68.0K    489.2M   0% /var/volatile
> > 		/dev/vda1               120.4M     19.9M     91.4M  18% /boot
> >
> > Doing the math we see that the /boot partition is ~20MB and in the first image
> > the / partition contains this ~20MB in addition to the rest of the rootfs.
> > This ~20MB is completely wasted since it is used in the / partition, but then
> > the /boot partition is mounted on top of it, making the /boot directory of /
> > inaccessible. After the fix the / partition has an additional ~20MB since the
> > /boot portion is excluded.
> >
> > Fixes [YOCTO #15555]
> >
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> 
> Hi Trevor,
> 
> Thanks for the v2, but I believe we still have an issue. Maybe a missing dependency?
> 
> 2025-04-13 19:18:05,421 - oe-selftest - INFO - FAIL: wic.Wic.test_exclude_path_with_extra_space (subunit.RemotedTestCase)
> 2025-04-13 19:18:05,421 - oe-selftest - INFO - ----------------------------------------------------------------------
> 2025-04-13 19:18:05,421 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/wic.py", line 567, in test_exclude_path_with_extra_space
>     size_of_root_partition = int(runCmd("wic ls %s" % wicout).output.split('\n')[2].split()[3])
>                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command 'wic ls /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2511849/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20250413181535.wic' returned non-zero exit status 1:
> ERROR: Can't find executable parted

Ouch, this might end up taking a couple of iterations. I don't want to blindly
install every wic native dependency, but I'm would be just guessing which
native utilities the buildbots have available to run the "wic ls" command.

Thanks for the feedback!

