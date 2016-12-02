Return-Path: <mgloff@emacinc.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4997460761
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 03:20:01 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id 20so269156305uak.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 19:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emacinc-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=9Wh//QHKdHzeMzA8LQuAena7rTkguRG9r9LTi0CKD1g=;
	b=fsenFMhQejgzAPc0jalyvrInkvZOlAqOG9XAVvl5/EwJQu1at32Sl/wz8davxzyQWT
	qN79x1JluYhmXt85z9iY1DhWgNbMMzt7A4hsOOE7Y60SR5Oj9YDGS8PByv4AD8RWbzIj
	1Z3lonH+9rouukrj/WuIw3mEZdUDXHhxEfNjkv36/Gel3rWvIZjZCg1m+VvcUilJ4D8R
	qwmtGjWtxDP2QpXN5CPlk9N9qLAwvrOvQ1eRlRwh9g160AnfKiYe4idndTPOhWtumlSK
	y1g4/jVlEutuHLkXDveZ90tvvOTFbXQFvo6Qy3uFdBAkxw8BPDjigvpO5kxZU1/D6KBd
	DUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=9Wh//QHKdHzeMzA8LQuAena7rTkguRG9r9LTi0CKD1g=;
	b=CWdISAQRQs+bbMIeNHjvLX8d4723X4Y9hDE0/VKmfGwppZqw1cfad0HozL5Hu889uu
	yaWiPg6DItP0F1MMbDnRdweA8snWVy5llBKjHpAQvr+ynqVLuHepCOxXjiytAHh+m2AY
	3u0XWDuIErF2DzszeZAHJdVkj8PJYyTeo74OweGy03DomlA5cjrHfyT2w5kxDgPzfMe3
	ZWZ0+VoJ+I34bt1gI/DFyQhTOMnzGUl5PZD9Cv/HfAn/6ZjCBmnGrNCbLQAispxh7FZT
	DvpoFWofSz6QDpkv5P5IwbA8q8OlhMVfetrAp/iEIGuRDxqCTw38xJX3kH7hoR2MYLbX
	Jjww==
X-Gm-Message-State: AKaTC01X5CO9vh4or5zKZ6SSq3l5L5k9WBWV8hOJYbFvVZn8jsXAi68dkXahmw9+GJHlT7qc+0DqZxPDtD0oJ27S
X-Received: by 10.176.83.148 with SMTP id k20mr31595509uaa.64.1480648802865;
	Thu, 01 Dec 2016 19:20:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.4.10 with HTTP; Thu, 1 Dec 2016 19:19:22 -0800 (PST)
From: Michael Gloff <mgloff@emacinc.com>
Date: Thu, 1 Dec 2016 21:19:22 -0600
Message-ID: <CALXw4G5XD=N5QJg8OgvOGi-BDsAqUgmFqMddumdAq6MkC_LY5A@mail.gmail.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: Debugfs + nfs-utils-client + ipkg
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
X-List-Received-Date: Fri, 02 Dec 2016 03:20:02 -0000
Content-Type: multipart/alternative; boundary=f403045dd8fceead860542a46925

--f403045dd8fceead860542a46925
Content-Type: text/plain; charset=UTF-8

I've run into an issue recently when trying to build an image along with
the companion debugfs. This error only occurs if 'nfs-utils-client' is
added to IMAGE_INSTALL and ipkg packages are selected. I don't get the
error with RPM or with removing nfs-utils-client. Also, I can see the
missing files are present at some point during do_rootfs, but then must be
getting wiped out? I noticed this in Krogoth first, but can reproduce in
latest master. Any ideas?

developer@OEBuilder:~/oe/recipes/poky/build$ bitbake core-image-minimal
Loading cache: 100%
|##########################################################################################################################################################|
Time: 0:00:00
Loaded 1304 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.32.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "universal"
TARGET_SYS        = "i586-poky-linux"
MACHINE           = "qemux86"
DISTRO            = "poky"
DISTRO_VERSION    = "2.2"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta
meta-poky
meta-yocto-bsp    = "master:9e63f81c78e284c9b325fe04a1b59e61c7ad8a1a"

Initialising tasks: 100%
|#####################################################################################################################################################|
Time: 0:00:03
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: core-image-minimal-1.0-r0 do_rootfs: Cannot get the installed
packages list. Command
'/home/developer/oe/recipes/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg
-f
/home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/opkg.conf
-o
/home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs
--force_postinstall --prefer-arch-to-version   status' returned 0 and
stderr:
Collected errors:
 * file_md5sum_alloc: Failed to open file
/home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/etab:
No such file or directory.
 * file_md5sum_alloc: Failed to open file
/home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/rmtab:
No such file or directory.
 * file_md5sum_alloc: Failed to open file
/home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/xtab:
No such file or directory.
 * file_md5sum_alloc: Failed to open file
/home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/statd/state:
No such file or directory.

ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
/home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.5361
ERROR: Task
(/home/developer/oe/recipes/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2168 tasks of which 2167 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

/home/developer/oe/recipes/poky/meta/recipes-core/images/core-image-minimal.bb:
do_rootfs
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Thanks,

Michael Gloff
mgloff@emacinc.com

--f403045dd8fceead860542a46925
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div></div>I&#39;ve run into an issue recently when t=
rying to build an image along with the companion debugfs. This error only o=
ccurs if &#39;nfs-utils-client&#39; is added to IMAGE_INSTALL and ipkg pack=
ages are selected. I don&#39;t get the error with RPM or with removing nfs-=
utils-client. Also, I can see the missing files are present at some point d=
uring do_rootfs, but then must be getting wiped out? I noticed this in Krog=
oth first, but can reproduce in latest master. Any ideas?<br><br>developer@=
OEBuilder:~/oe/recipes/poky/build$ bitbake core-image-minimal<br>Loading ca=
che: 100% |################################################################=
###########################################################################=
###############| Time: 0:00:00<br>Loaded 1304 entries from dependency cache=
.<br>NOTE: Resolving any missing task queue dependencies<br><br>Build Confi=
guration:<br>BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot=
;1.32.0&quot;<br>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;x86_64-linux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0 =3D &quot;unive=
rsal&quot;<br>TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quo=
t;i586-poky-linux&quot;<br>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D &quot;qemux86&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky&quot;<br>DI=
STRO_VERSION=C2=A0=C2=A0=C2=A0 =3D &quot;2.2&quot;<br>TUNE_FEATURES=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D &quot;m32 i586&quot;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;&quot;<br>meta<br>meta-poky<br>meta-yoct=
o-bsp=C2=A0=C2=A0=C2=A0 =3D &quot;master:9e63f81c78e284c9b325fe04a1b59e61c7=
ad8a1a&quot;<br><br>Initialising tasks: 100% |#############################=
###########################################################################=
#############################################| Time: 0:00:03<br>NOTE: Execu=
ting SetScene Tasks<br>NOTE: Executing RunQueue Tasks<br>ERROR: core-image-=
minimal-1.0-r0 do_rootfs: Cannot get the installed packages list. Command &=
#39;/home/developer/oe/recipes/poky/build/tmp/sysroots/x86_64-linux/usr/bin=
/opkg -f /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/=
core-image-minimal/1.0-r0/opkg.conf -o /home/developer/oe/recipes/poky/buil=
d/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs=C2=A0 --forc=
e_postinstall --prefer-arch-to-version=C2=A0=C2=A0 status&#39; returned 0 a=
nd stderr:<br>Collected errors:<br>=C2=A0* file_md5sum_alloc: Failed to ope=
n file /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/co=
re-image-minimal/1.0-r0/rootfs/var/lib/nfs/etab: No such file or directory.=
<br>=C2=A0* file_md5sum_alloc: Failed to open file /home/developer/oe/recip=
es/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/=
var/lib/nfs/rmtab: No such file or directory.<br>=C2=A0* file_md5sum_alloc:=
 Failed to open file /home/developer/oe/recipes/poky/build/tmp/work/qemux86=
-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/xtab: No such file=
 or directory.<br>=C2=A0* file_md5sum_alloc: Failed to open file /home/deve=
loper/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/=
1.0-r0/rootfs/var/lib/nfs/statd/state: No such file or directory.<br><br>ER=
ROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs<br>ERR=
OR: Logfile of failure stored in: /home/developer/oe/recipes/poky/build/tmp=
/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.5361<=
br>ERROR: Task (/home/developer/oe/recipes/poky/meta/recipes-core/images/co=
re-image-minimal.bb:do_rootfs) failed with exit code &#39;1&#39;<br>NOTE: T=
asks Summary: Attempted 2168 tasks of which 2167 didn&#39;t need to be reru=
n and 1 failed.<br><br>Summary: 1 task failed:<br>=C2=A0 /home/developer/oe=
/recipes/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs<br>S=
ummary: There were 2 ERROR messages shown, returning a non-zero exit code.<=
br><br></div><div>Thanks,<br><br></div><div>Michael Gloff<br></div><div><a =
href=3D"mailto:mgloff@emacinc.com">mgloff@emacinc.com</a><br></div></div>

--f403045dd8fceead860542a46925--
