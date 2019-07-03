Return-Path: <twoerner@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id B8CA57E6D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 15:04:08 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id u13so1184294iop.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 08:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=E5bS+13/HWlPPiie7iG5jnvanuMhQVqQYe0JtCDnZXs=;
	b=JK+zxuaVOQqX7FElWoAcgsYErgIRt+sCF6zWQu/XgHHtYXE65whxVd9QweIwuKVNJa
	J4CJ1YKGq61I7OFn4EsOuA1I9kt22hUSASUER36h2r03xPJEewuK8WWTBeuDJGwO5UxQ
	riYvxsWXjRx5svboMlpf/YuNt0Rr7DOFsxNiWtmLkcvi5SQadVaXxno063loqnvuXle8
	Jy6GUaXQ+uBf2m6BuU69MCIjKijXUGCuFCbPdDO1UFFuYhywEVtU441FMe61GRCrMttY
	pCo7CtqgE3uNKo43a/6MAdSHlZQ4V3v72GDNXaGtRsry3Z/iIrnCYcRdAqi5hUzilaZe
	A/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=E5bS+13/HWlPPiie7iG5jnvanuMhQVqQYe0JtCDnZXs=;
	b=iTSEgRzGRuR187oHvr93uUWc/IfrhBcOG19ELipR5mLE5we/9CSpWWXPppeperDWox
	4Tyns9Gs9UlESH20n+SwRJUSo5N/RiYxdNj4kowp/PVNCNpVFVXCMWpN+WTW6cCSXo0N
	u0K8rTCTtV0Gv6eRgid3pkjBG+WB7gQbxNMl3VKut8TZU1PuzfrOYxchNCeJrGg917pA
	0dlsvXMx1nVljCvOr2yM2StjEFC5sIlCXThYTOljR8nN5p5dvjE2+mOs1WJaqk1hPUcm
	hyhuIjjAhZyNQLFa2VD0ogbPqstaG/oNaxiuIVWWvkV4FzHOew6Oz992Z5FN0sA54C7L
	s1fw==
X-Gm-Message-State: APjAAAW6l5nSaGCRpQylvFo/UjAj7R2DA7tjgyudkzYR/EpUXLVF7Qoo
	vQTK5ObjmQHT9GAO0ys5D5j3JfKWK9o=
X-Google-Smtp-Source: APXvYqz8U+k8ZrkcrvD0xqlW6drrRdbrTer5lXIatqqG2sLHJHDmY6ASuVipr731Z6rZEHEFnZViCQ==
X-Received: by 2002:a6b:8f93:: with SMTP id
	r141mr40835974iod.145.1562166249410; 
	Wed, 03 Jul 2019 08:04:09 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	w26sm3575059iom.59.2019.07.03.08.04.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jul 2019 08:04:08 -0700 (PDT)
Date: Wed, 3 Jul 2019 11:04:06 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190703150405.GA23280@linux-uys3>
MIME-Version: 1.0
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: build failures due to pigz host tool
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
X-List-Received-Date: Wed, 03 Jul 2019 15:04:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

This came up as a topic in yesterday's Engineering Sync meeting. For roughly a
year I've been seeing random build failures on my Jenkins setup due to pigz
failing; apparently the project is now seeing them on their builds, so I'll
share what I know of them.

At the time I started seeing these failures (Aug 2018) I had just upgraded my
system to openSUSE 15.0. Since nobody else was seeing them, I assumed they
were related to my setup. When I went out searching for an answer, I found
there wasn't very much out there to help me. But I did notice that there were
reports of other people seeing the issue who weren't using openSUSE and who
weren't doing anything related to OE builds using Jenkins.

The build failure looks something like this:

	| DEBUG: Executing shell function sstate_create_package
	| pigz: abort: internal threads error
	| tar: /z/jenkins-workspace/nightly/cubietruck/build/sstate-cache/8a/sstate:linux-mainline:cubietruck-oe-linux-gnueabi:4.19.46:r0:cubietruck:3:8a159ba1ffefb5fc2feeeff5b40abf8ad67658e5ff3ed3bf67d25d9c8f2805e0_package.tgz.9bA8tCje: Wrote only 6144 of 10240 bytes
	| tar: Child returned status 16
	| tar: Error is not recoverable: exiting now
	| WARNING: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/cubietruck-oe-linux-gnueabi/linux-mainline/4.19.46-r0/temp/run.sstate_create_package.19996:1 exit 1 from 'exit 1'
	| DEBUG: Python function sstate_task_postfunc finished
	| ERROR: Function failed: sstate_create_package (log file is located at /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/cubietruck-oe-linux-gnueabi/linux-mainline/4.19.46-r0/temp/log.do_package.19996)
	NOTE: recipe linux-mainline-4.19.46-r0: task do_package: Failed
	ERROR: Task (/opt/oe/configs/z/jenkins-workspace/nightly/cubietruck/layers/meta-sunxi/recipes-kernel/linux/linux-mainline_4.19.46.bb:do_package) failed with exit code '1'

Here's another example:

	| DEBUG: Executing shell function sstate_create_package
	| pigz: abort: internal threads error
	| tar: /z/jenkins-workspace/nightly/odroid-xu4/build/sstate-cache/d4/sstate:sqlite3:cortexa15t2hf-neon-vfpv4-oe-linux-gnueabi:3.28.0:r0:cortexa15t2hf-neon-vfpv4:3:d4eb5692a1756a832d72fb2003a3d431108fbc736044747d33698ad7b6881dd9_package.tgz.herLUpYQ: Wrote only 2048 of 10240 bytes
	| tar: Child returned status 16
	| tar: Error is not recoverable: exiting now
	| WARNING: /z/jenkins-workspace/nightly/odroid-xu4/build/tmp-glibc/work/cortexa15t2hf-neon-vfpv4-oe-linux-gnueabi/sqlite3/3_3.28.0-r0/temp/run.sstate_create_package.24136:1 exit 1 from 'exit 1'
	| DEBUG: Python function sstate_task_postfunc finished
	| ERROR: Function failed: sstate_create_package (log file is located at /z/jenkins-workspace/nightly/odroid-xu4/build/tmp-glibc/work/cortexa15t2hf-neon-vfpv4-oe-linux-gnueabi/sqlite3/3_3.28.0-r0/temp/log.do_package.24136)
	NOTE: recipe sqlite3-3_3.28.0-r0: task do_package: Failed
	ERROR: Task (/opt/oe/configs/z/jenkins-workspace/nightly/odroid-xu4/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.28.0.bb:do_package) failed with exit code '1'

When I first started seeing this problem, I would see it quite frequently.
Every morning, out of roughly 15 nightly builds, around 4-5 of them would have
failed in this way. Back then I would also get a lot of errors that would
report something along the lines of the following:

	fork: Resource temporarily unavailable
	Cannot spawn thread (?)

I don't have an example of that error on hand, but I used to get a lot of
those around the same time too.

My observations are:
- I've never seen any of these errors with builds that I run by hand, oddly
  enough, these errors only ever happen to builds that are run by Jenkins. I
  have no idea if this is just a coincidence, or if there is something going
  on related to kicking off a build from a large program (Jenkins)

- Back then these failures were quite frequent. Today, of the 20-ish or so
  Jenkins builds that are kicked off every night, in a 2-week span I have only
  2 such failures. So it seems that I've been able to reduce the occurrence
  rate, but not eliminate it completely

- I haven't seen the "resource" failure in a while. I don't know if these are
  two separate issues that just happened to start at the same time, or if
  they're related in some way.

From what little information I was able to find online, here are the things I
tweaked (which may or may not have contributed to the reduction in the rate of
occurrence):

- At that time, I had been setting a "barrier=6000" on the disk I was using
  for the builds. I removed that tweak.

- I edited /etc/systemd/logind.conf and set
	UserTaskMax=infinity

- I edited /etc/systemd/system.conf and set:
	DefaultTaskAccounting=no
	DefaultTaskMax=infinity

- I edited /etc/sysconfig/jenkins and added/set:
	JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true -Xmx1g"

Since this build failure is so intermittent, it's quite hard to dig into it.
As I said above, of the last roughly 280 builds my system has done in the last
2 weeks, only 2 such failures occurred.

It's possible that overriding CONVERSION_CMD_gz in my builds to not use pigz
would probably fix the issue at the cost of losing the parallelism of the
sstate_create_package task.

My host machine's version of pigz is: 2.3.3

Best regards,
	Trevor

