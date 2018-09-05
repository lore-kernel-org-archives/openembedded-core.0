Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
	[209.85.222.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0833774D0C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 08:37:27 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id 101-v6so5142839uav.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=a6qJ0Wattyt6ds4D3mP1J7wvjFo0VZdnzgcixOQuJCI=;
	b=Ouv6QkkwkJSuQOSE5P2sR7s3L3iotfa/2XbdA8d/nKCKoQDqAE8wibLy3xXQEHTNsz
	FEt+EA4x4wqJoOkqEHr1168LUybjNEm64joXMum8vZP6s8q3Xct3dcRJ/xDF4LsMcGsO
	Xg9CoWZmosHq/sx4r4jGFRsGlDzbZBJNq3AwDHp/2yerGqDvuz2SynBBgWJRZ60gQ51Y
	Mms4EfmsaN9LKO4a4lhZCigIhksYpkR3pJ+FU4SdrmsgMWKVnJm7Nfl4WVJWZGEfrQOv
	MKWVegpKbXKrRy8r/EyNGPKQtZuoDvP7RuZVnJYOGrLjDWkSZ5NCKSpWsQzgKQFGx1EB
	6OGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=a6qJ0Wattyt6ds4D3mP1J7wvjFo0VZdnzgcixOQuJCI=;
	b=re8HZKjQOCyliHO6ixGbVon4nHJqHtxo8/jama4+dfbC/wM6mWKhLxQA1tXKkE0bct
	PNHJcAoLRfvoinden6bxe7EMYS18FBnZCmkjnFUenwSmWvpfPEm+JdAivo9g5sF9SSFC
	fItIdwXVVcaVgRuOHo34R9k8cI4WZwW185RndEbMrlIwOB3/FkIGnqulPqfJMCFR18Ol
	Yvg3129PjVRTxjKUoYGf24C2zmoa0HR74fzlxu2zE4iLvBd1NBdwXmlM0J2/D/9HLhfh
	f6IMoDmDHgb5kUfSn/8+xhoG1kX2StDRoGbgkuvLjSSRdXdQUmSs3wOLpeuKueB2JRIy
	1vSw==
X-Gm-Message-State: APzg51AFOV624IE9V7K8AKsYfAtC4/tQIeM2N5Y1yID1MB2QBvoiRdgQ
	ftuI/nbMXPBkIwXH0je4aoIZHi5gNSf7NpnpD3QBHb4d4hQ=
X-Google-Smtp-Source: ANB0VdZhE6UU+bOQKO/ahtIysw0X+FNLSQwrE9gvT2RWfCUP1ykdhOHCCnJr6Xew4BCxGKR2TuvB7rD4QfRqdQ2gCng=
X-Received: by 2002:a67:ba09:: with SMTP id
	l9-v6mr12509681vsn.114.1536136648598; 
	Wed, 05 Sep 2018 01:37:28 -0700 (PDT)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 5 Sep 2018 09:37:17 +0100
Message-ID: <CAO5Uq5SjWvxmEXisPRmgM92JaGRHgAdd0qoCsTb=P=1PDzh+fg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, andrej.valek@siemens.com, 
	Chen Qi <Qi.Chen@windriver.com>
Subject: systemd/busybox fsck fail to run
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2018 08:37:28 -0000
Content-Type: text/plain; charset="UTF-8"

I've just come across a box with a corrupt filesystem which wasn't
being cleaned (using systemd and busybox):

Aug 29 16:03:22 localhost systemd-fsck[143]: read_bad_blocks_file: No
such file or directory while trying to open -M
Aug 29 16:03:22 localhost systemd-fsck[143]: Warning: fsck.ext4
/dev/mmcblk0p4 terminated by signal 8
Aug 29 16:03:22 localhost systemd-fsck[143]: fsck failed with exit status 8.
Aug 29 16:03:22 localhost systemd-fsck[143]: Ignoring error.
Aug 29 16:03:22 localhost systemd[1]:
systemd-fsck@dev-mmcblk0p4.service: cgroup is empty
Aug 29 16:03:22 localhost systemd[1]:
systemd-fsck@dev-mmcblk0p4.service: Child 143 belongs to
systemd-fsck@dev-mmcblk0p4.service.
Aug 29 16:03:22 localhost systemd[1]:
systemd-fsck@dev-mmcblk0p4.service: Main process exited, code=exited,
status=0/SUCCESS
Aug 29 16:03:22 localhost systemd[1]:
systemd-fsck@dev-mmcblk0p4.service: Changed start -> exited
Aug 29 16:03:22 localhost systemd[1]:
systemd-fsck@dev-mmcblk0p4.service: Job
systemd-fsck@dev-mmcblk0p4.service/start finished, result=done
Aug 29 16:03:22 localhost systemd[1]: Started File System Check on
/dev/mmcblk0p4.

It turns out systemd-fsck unconditionally passes `-l` to lock the filesystem:

https://github.com/systemd/systemd/blame/master/src/fsck/fsck.c#L408

which busybox fsck doesn't interpret and so passes on to fsck.ext4,
which then interprets it as a badblocks file...

What's the right answer here? Add a patch to busybox fsck so it just
ignores `-l`, or do we need something more sophisticated?

Obviously swapping in util-linux-fsck works around the problem.

-- 
Alex Kiernan

