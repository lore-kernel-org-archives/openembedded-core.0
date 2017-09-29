Return-Path: <cavallini.koan@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id BEF98602D9
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 08:08:32 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id g29so995769wrg.11
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 01:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=7QHR5HBL9zwDbpFQnDvHHP7RtHTfkzV9p3K1PiIckc8=;
	b=Iq4w5CNWD9SQgfuONJF5nX87vwW/Vc/Q/2i6AczFstyn62CvpwA5EWUPSXNlrh36um
	QB0V93Csvi/Q90c27gKJ3lFImRLFVoiOwV6wGNa2deONMR8AH4tDlFEZc1X4Bm6IffdH
	WHXGpr7mt3W87AHebVKOxjuKYR2AfR1pvR4SEcYaq4tos+GTSfBZLVJfI1atSoFAFQwB
	PHl/uFRIor5ARIm/kE0U9iOtZHaddTRp6A/k/schq/vXYMkqSS7VTd5JdCMPy1NBaWmp
	/Ki5Ic6yd7HEsqsPkmd3ZPXk7hrAxJ+rjeE5buThiuEkNyQoWDKcnjxseUR9vJc3vpR6
	Sedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=7QHR5HBL9zwDbpFQnDvHHP7RtHTfkzV9p3K1PiIckc8=;
	b=RxyI8exdNAMwHswykKNLZhbhNmOUapafBvZ+B+OUBw7VHrwWhQ6xWafuJiULD2BCO4
	ccak0perqK9H2kHSEV24Pq5TagHFWR+xj09ypoT9XdjayJFbTBGlbI5a4S8WR9Eclguz
	OHMBQ5VWyE0gVZU0wltFR1Z0KRrkxY6gBn18cLUgly0YbzP9AH/GWi2tufpKyxHEJM2n
	D5jzWNA06YjXVQUp2JreZiqexCSeTB1RzqInWg2eK47wZaFR0IXweTX3OJkwLpbc/JEX
	2otNovWZD3cK+xcfx7jJAFabTBDbMBq7r+K/tz6HPlXJdHPzG2lMqeJqOfa1j8Sw24jL
	CW9g==
X-Gm-Message-State: AHPjjUio+gKArwlxb1vZhYILhNSz0eDXpPTxLasNooAm/eaXqIArKgZL
	HatcYZR8FYE6aNTgZJV4RKqeMnU4j2RBg7RGUTTCLA==
X-Google-Smtp-Source: AOwi7QCivKHOHgPfn5vLZOYXrQuLL2MF83MemLGXZixeP8usov3+iKbSahNewHFUzb3SCHXfFK6xveVzdWvcwIHe87A=
X-Received: by 10.25.162.193 with SMTP id l184mr1018707lfe.120.1506672513152; 
	Fri, 29 Sep 2017 01:08:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.212.195 with HTTP; Fri, 29 Sep 2017 01:08:32 -0700 (PDT)
From: Marco <cavallini.koan@gmail.com>
Date: Fri, 29 Sep 2017 10:08:32 +0200
Message-ID: <CAFQ+DiirJpmmnhLcrX6OW-vHLv-rBhc6XCrJ4j47JeMQ5rE=sg@mail.gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: SSTATE_DIR not working with multi user environment
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
X-List-Received-Date: Fri, 29 Sep 2017 08:08:33 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,
I am trying to share a sstate-cache between two (or more) users in a
shared directory.
Although I set the directory owner, group and permissions I face to a
weird condition that I don't understand and seems to point out a
bitbake/class problem.


Problem description

I have a shared area with the following permissions (g+ws) set up
before the builds

ls -al /opt/yocto
    drwxrwsrwx   4 tux yocto 20480 set 28 14:47 downloads
    drwxrwsrwx 259 tux yocto  4096 set 28 15:33 sstate-cache

This is the common local.conf
    DL_DIR ?= "/opt/yocto/downloads"
    SSTATE_DIR ?= "/opt/yocto/sstate-cache"

1. workspace1 with user1 (tux) generates the first build using bitbake
core-image-minimal

    /opt/yocto/sstate-cache (content excerpt)
    drwxr-xr-x   2 tux yocto 4096 set 28 14:44 94
    drwxr-sr-x   2 tux yocto 4096 set 28 14:45 95
    drwxr-xr-x   2 tux yocto 4096 set 28 14:46 96

2. build on workspace2 using user2 (devel) faces to the following problem
Permission denied: '/opt/yocto/sstate-cache/95/sigtask'
because the permissions of directory '95' is 'drwxr-sr-x'

3. The only temporary solution I've found is to manually set the
directory permissions in sstate.cache affter each bitbake.

Any hint would be appreciated.


$ bitbake core-image-minimal

Build Configuration:
BB_VERSION        = "1.34.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "universal-4.8"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "qemuarm"
DISTRO            = "poky"
DISTRO_VERSION    = "2.3.2"
TUNE_FEATURES     = "arm armv5 thumb dsp"
TARGET_FPU        = "soft"
meta
meta-poky
meta-yocto-bsp    = "pyro:30613467d864130202d90e8460f7bbfa4db98397"

Initialising tasks: 100%
|############################################################################################################|
Time: 0:00:04
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: core-image-minimal-1.0-r0 do_image_ext4: Execution of event
handler 'sstate_eventhandler' failed
Traceback (most recent call last):
  File "/home/devel/yocto-pyro-qemuarm2/poky/bitbake/lib/bb/siggen.py",
line 356, in dump_this_task(outfile='/opt/yocto/sstate-cache/95/sstate:core-image-minimal:qemuarm-poky-linux-gnueabi:1.0:r0:qemuarm:3:95da4ea64e782dcc0c8dfb4b9b7c0099_image_ext4.tgz.siginfo',
d=<bb.data_smart.DataSmart object at 0x7f0e07567cc0>):
         referencestamp = bb.build.stamp_internal(task, d, None, True)
    >    bb.parse.siggen.dump_sigtask(fn, task, outfile, "customfile:"
+ referencestamp)

  File "/home/devel/yocto-pyro-qemuarm2/poky/meta/lib/oe/sstatesig.py",
line 184, in SignatureGeneratorOEBasicHash.dump_sigtask(fn='/home/devel/yocto-pyro-qemuarm2/poky/meta/recipes-core/images/core-image-minimal.bb',
task='do_image_ext4',
stampbase='/opt/yocto/sstate-cache/95/sstate:core-image-minimal:qemuarm-poky-linux-gnueabi:1.0:r0:qemuarm:3:95da4ea64e782dcc0c8dfb4b9b7c0099_image_ext4.tgz.siginfo',
runtime='customfile:/home/devel/yocto-pyro-qemuarm2/poky/build/tmp/stamps/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0'):
                 return
    >        super(bb.siggen.SignatureGeneratorBasicHash,
self).dump_sigtask(fn, task, stampbase, runtime)

  File "/home/devel/yocto-pyro-qemuarm2/poky/bitbake/lib/bb/siggen.py",
line 300, in SignatureGeneratorOEBasicHash.dump_sigtask(fn='/home/devel/yocto-pyro-qemuarm2/poky/meta/recipes-core/images/core-image-minimal.bb',
task='do_image_ext4',
stampbase='/opt/yocto/sstate-cache/95/sstate:core-image-minimal:qemuarm-poky-linux-gnueabi:1.0:r0:qemuarm:3:95da4ea64e782dcc0c8dfb4b9b7c0099_image_ext4.tgz.siginfo',
runtime='customfile:/home/devel/yocto-pyro-qemuarm2/poky/build/tmp/stamps/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0'):

    >        fd, tmpfile =
tempfile.mkstemp(dir=os.path.dirname(sigfile), prefix="sigtask.")
             try:
  File "/usr/lib/python3.4/tempfile.py", line 409, in
mkstemp(suffix='', prefix='sigtask.',
dir='/opt/yocto/sstate-cache/95', text=False):

    >    return _mkstemp_inner(dir, prefix, suffix, flags)

  File "/usr/lib/python3.4/tempfile.py", line 339, in
_mkstemp_inner(dir='/opt/yocto/sstate-cache/95', pre='sigtask.',
suf='', flags=131266):
             try:
    >            fd = _os.open(file, flags, 0o600)
                 return (fd, _os.path.abspath(file))
PermissionError: [Errno 13] Permission denied:
'/opt/yocto/sstate-cache/95/sigtask._nk80whe'

ERROR: core-image-minimal-1.0-r0 do_image_ext4: Build of do_image_ext4 failed
ERROR: core-image-minimal-1.0-r0 do_image_ext4: Traceback (most recent
call last):
  File "/home/devel/yocto-pyro-qemuarm2/poky/bitbake/lib/bb/build.py",
line 644, in exec_task
    return _exec_task(fn, task, d, quieterr)
  File "/home/devel/yocto-pyro-qemuarm2/poky/bitbake/lib/bb/build.py",
line 618, in _exec_task
    event.fire(TaskSucceeded(task, logfn, localdata), localdata)
  File "/home/devel/yocto-pyro-qemuarm2/poky/bitbake/lib/bb/event.py",
line 211, in fire
    fire_class_handlers(event, d)
  File "/home/devel/yocto-pyro-qemuarm2/poky/bitbake/lib/bb/event.py",
line 134, in fire_class_handlers
    execute_handler(name, handler, event, d)
  File "/home/devel/yocto-pyro-qemuarm2/poky/bitbake/lib/bb/event.py",
line 106, in execute_handler
    ret = handler(event)
  File "/home/devel/yocto-pyro-qemuarm2/poky/meta/classes/sstate.bbclass",
line 1003, in sstate_eventhandler
    bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tgz" ".siginfo", d)
  File "/home/devel/yocto-pyro-qemuarm2/poky/bitbake/lib/bb/siggen.py",
line 356, in dump_this_task
    bb.parse.siggen.dump_sigtask(fn, task, outfile, "customfile:" +
referencestamp)
  File "/home/devel/yocto-pyro-qemuarm2/poky/meta/lib/oe/sstatesig.py",
line 184, in dump_sigtask
    super(bb.siggen.SignatureGeneratorBasicHash,
self).dump_sigtask(fn, task, stampbase, runtime)
  File "/home/devel/yocto-pyro-qemuarm2/poky/bitbake/lib/bb/siggen.py",
line 300, in dump_sigtask
    fd, tmpfile = tempfile.mkstemp(dir=os.path.dirname(sigfile),
prefix="sigtask.")
  File "/usr/lib/python3.4/tempfile.py", line 409, in mkstemp
    return _mkstemp_inner(dir, prefix, suffix, flags)
  File "/usr/lib/python3.4/tempfile.py", line 339, in _mkstemp_inner
    fd = _os.open(file, flags, 0o600)
PermissionError: [Errno 13] Permission denied:
'/opt/yocto/sstate-cache/95/sigtask._nk80whe'

ERROR: Task (/home/devel/yocto-pyro-qemuarm2/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_ext4)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2254 tasks of which 2063 didn't need to
be rerun and 1 failed.

Summary: 1 task failed:
  /home/devel/yocto-pyro-qemuarm2/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_ext4
Summary: There was 1 WARNING message shown.
Summary: There were 3 ERROR messages shown, returning a non-zero exit code.

--
Marco

