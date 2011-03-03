Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvEKV-0006ev-21
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 20:36:55 +0100
Received: by fxm8 with SMTP id 8so1457489fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 11:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=4clCImLPEHDmA6fOyDZ+gS5iw0zf3FdcfloP2rzNW08=;
	b=suO4no6K7BL/cuoBfnjdTzlzGFDhQn+z+bSsgicx+Bup/3uvKJ5AqMGQm3Iy4R6p1b
	dCjHBpiYP3ayKJj22AoTMWudgDNnlDNLSZTnVL2Rz6F60izrxfHprxzmuopSeHKAKlJn
	g8pZdDhmjnUU06jP4Dvh8Osnc6db8m1wx1L6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=YOdrYHDqwwYelgbNcLey+HyMkCqO8GDslzyKFlTeiNL8iPfk/ReGyoybooW83o45so
	auEho60mjd4AxVigvQGzf06xbLMAsNpaJGdEU1WeqwIt+lktRoxhwjazKCHiyX4xXfzg
	m7M9CuUlEdR9UCT8gtly4zSHdvdNoqtNJ6h+4=
Received: by 10.223.87.75 with SMTP id v11mr1909781fal.131.1299180917157; Thu,
	03 Mar 2011 11:35:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Thu, 3 Mar 2011 11:34:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2011 11:34:57 -0800
Message-ID: <AANLkTinuLyfZ8sGCpgk66gMkt_TNiaALujooAhJiZTjB@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: bitbake -c cleanall fails first time but works second time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2011 19:36:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi

On oe-core I am seeing this behavior consistently. If I do cleanall on
a package like below then first time it ends up with this error
second time it succeeds. Anyone seeing the same.

$ bitbake -c cleanall rpm-native
Loading cache: 100%
|################################################################|
ETA:  00:00:00
Loaded 947 entries from dependency cache.
Parsing recipes: 100%
|##############################################################| Time:
00:00:00
Parsing of 774 .bb files complete (740 cached, 34 parsed). 981
targets, 34 skipped, 0 masked, 0 errors.
WARNING: No bb files matched BBFILE_PATTERN_pvt '/home/kraj/work/oe-core/layers'

OE Build Configuration:
BB_VERSION        = "1.13.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "e7164c0c67afd08698023caa7101f84a8f66a46d"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "qemuarm"
DISTRO            = "poky"
DISTRO_VERSION    = "0.9+snapshot-20110303"
TARGET_FPU        = "soft"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 1 of 2 (ID: 0,
virtual:native:/home/kraj/work/oe-core/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb,
do_clean)
NOTE: package rpm-native-5.4.0-r14: task do_clean: Started
ERROR: Error executing a python function in
/home/kraj/work/oe-core/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb:
OSError: [Errno 2] No such file or directory

ERROR: The stack trace of python calls that resulted in this
exception/failure was:
ERROR:   File "do_clean", line 16, in <module>
ERROR:
ERROR:   File "do_clean", line 13, in do_clean
ERROR:
ERROR:   File "/home/kraj/work/bitbake/lib/bb/build.py", line 168, in exec_func
ERROR:     exec_func_python(func, d, runfile, cwd=adir)
ERROR:
ERROR:   File "/home/kraj/work/bitbake/lib/bb/build.py", line 183, in
exec_func_python
ERROR:     olddir = os.getcwd()
ERROR:
ERROR: The code that was being executed was:
ERROR:      0012:       for f in (bb.data.getVar('CLEANFUNCS', d, 1)
or '').split():
ERROR:      0013:               bb.build.exec_func(f, d)
ERROR:      0014:
ERROR:      0015:
ERROR:  *** 0016:do_clean(d)
ERROR:      0017:
ERROR: (file: 'do_clean', lineno: 16, function: <module>)
ERROR:      0009:       bb.note("Removing " + dir)
ERROR:      0010:       oe.path.remove(dir)
ERROR:      0011:
ERROR:      0012:       for f in (bb.data.getVar('CLEANFUNCS', d, 1)
or '').split():
ERROR:  *** 0013:               bb.build.exec_func(f, d)
ERROR:      0014:
ERROR:      0015:
ERROR:      0016:do_clean(d)
ERROR:      0017:
ERROR: (file: 'do_clean', lineno: 13, function: do_clean)
ERROR: Function 'do_clean' failed
NOTE: package rpm-native-5.4.0-r14: task do_clean: Failed
ERROR: Task 0 (virtual:native:/home/kraj/work/oe-core/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb,
do_clean) failed with exit code '1'
ERROR: 'virtual:native:/home/kraj/work/oe-core/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb'
failed


