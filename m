Return-Path: <n.merinov@inango-systems.com>
Received: from mail.inango-sw.com (mail.inango-systems.com [178.238.230.57])
	by mail.openembedded.org (Postfix) with ESMTP id 1EEF9731BC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 11:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 9EA24108020F;
	Fri,  3 Jan 2020 13:15:37 +0200 (IST)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id LK3qxNtuWzGh; Fri,  3 Jan 2020 13:15:35 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 517DC1080799;
	Fri,  3 Jan 2020 13:15:35 +0200 (IST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com 517DC1080799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1578050135;
	bh=nkBe2PLbIFR2W+lQKLtTetjtPz9amGNzTuJ1dsjb/eE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=EJHHQ+72oMvInSMEOEFYpqtY14GyRcgqEqTWrpHPG9mb9Gu6In2Mbe7a7GOKBwtaQ
	rtuNeBRWMewJvad85I0+A0V+4sajPbcQEUUfKVSrVaq6TvYml0q43z6LwmVUpf67x4
	M4oWYyPa0xYUyZDzU7vYd43UCTQQwa4cHpRk3d1EmWKzZWpfNU5JLMwzjYh38Fb2hf
	Kw2JkPcyfqcQeN7dSs1Y9kdk8mo3y04YJQrVQwGiPJj04OXo1DL/QFL+GuqdC2XKRM
	00BsDLsqNrK6NJIuA7WOscWURAGK6Qzlcdxv97h+50ql3AtoyMJkTBOn/do9hLFLrU
	IfnVlcPqwnOBg==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5DD8yEmkuukM; Fri,  3 Jan 2020 13:15:35 +0200 (IST)
Received: from mail.inango-sw.com (mail.inango-sw.com [172.17.220.3])
	by mail.inango-sw.com (Postfix) with ESMTP id 2E26D1080235;
	Fri,  3 Jan 2020 13:15:35 +0200 (IST)
Date: Fri, 3 Jan 2020 13:15:34 +0200 (IST)
From: Nikolai Merinov <n.merinov@inango-systems.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <1808064219.517731.1578050134784.JavaMail.zimbra@inango-systems.com>
In-Reply-To: <CANNYZj81SBio8vA1eeP5-17kAZ0OHnd0TCB2RC_pNO7uPyA66g@mail.gmail.com>
References: <20191231083315.19828-1-n.merinov@inango-systems.com>
	<CANNYZj81SBio8vA1eeP5-17kAZ0OHnd0TCB2RC_pNO7uPyA66g@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [172.17.220.3]
X-Mailer: Zimbra 8.8.15_GA_3888 (ZimbraWebClient - [unknown]
	(Linux)/8.8.15_GA_3890)
Thread-Topic: sanity: allow to compile from root in user namespaces
Thread-Index: Mg0Vqdk4j5XtjW5LoMgafxo0wihoRA==
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: allow to compile from root in user namespaces
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
X-List-Received-Date: Fri, 03 Jan 2020 11:15:37 -0000
Content-Type: multipart/alternative; 
	boundary="=_9ab72b9f-fe00-4277-8751-1f5cfc9d7b2a"

--=_9ab72b9f-fe00-4277-8751-1f5cfc9d7b2a
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Alexander. 

I understand all of the concerns. Yes, it's possible to create a regular user inside of containers (at least in case of the rootless LXC and Docker containers), but this is a question of usability. 
All existed Docker containers for a Yocto compilation (including tge CROPS described at the yoctoproject wiki) tried to use same UID/GID for files inside and outside of the container in order to allow to work with files both inside and outside of container. 

In the case of the main container subsystems (Docker, OCI) same level of a usability for rootless containers can be supported only if we allow compilation from UID == 0 because users own UID mapped to 0 in this containers. In order to support such configuration we, in any case, should modify somehow contamination check, check for a root user in the sanity.bbclass and disable root check from "mknod" module in gnulib (used by coreutils). 

Will it be appropriate if we allow such regime of the compilation with the following limitation: 
1. Allow compilation only from root user inside of the linux user namespace (not a real root) 
2. Allow such compilation only if there is "native_root_user" feature in DISTRO_FEATURES 
3. Each modified place will check this two conditions 

Will be such design appropriate compromise between safety and usability? 

Regards, 
Nikolai 




From: "Alexander Kanavin" <alex.kanavin@gmail.com> 
To: "n merinov" <n.merinov@inango-systems.com> 
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org> 
Sent: Tuesday, December 31, 2019 9:29:34 AM 
Subject: Re: [OE-core] [PATCH] sanity: allow to compile from root in user namespaces 




BQ_BEGIN

I believe it should be possible to create a regular user inside the container and then run bitbake as that user? 

The patch effectively disables the host contamination check, fixes one recipe that breaks, and likely introduces other issues; the assumption (and automated testing) throughout the build is that it's run under a regular user. 

Alex 

On Tue, 31 Dec 2019 at 11:40, Nikolai Merinov via Openembedded-core < [ mailto:openembedded-core@lists.openembedded.org | openembedded-core@lists.openembedded.org ] > wrote: 

BQ_BEGIN
New rootless container subsystems rely on the "user namespaces" 
Linux feature. In order to create a container from a regular user the 
user uid and subuids mapped to the uid space inside of container. 

There are different default configurations used for different 
container subsystems: 

1. Rootless Docker[1] maps the user ID to 0, the subuids to range 
starting from 1. 
2. Rootless RunC[2] from OCI by default maps the user ID to 0 and 
ignores the subuids. 
3. LXC[3] maps the subuids to range from 0. UID not participates 
in the mapping. 

The LXC variant does not allow to work on same files simultaneusly 
inside and outside of a container. Variant suggested by other 
container susbsystems assumes that files owned by user should be 
owned by root in a container environment. 

In order to simplify Yocto compilation in such rootless containers I 
want to allow to start the bitbake from root user in user namespace 
and allow software compilation from root user in the described 
configuration. Additionally I want to provide minimal dockerfile 
suitable for the core-image-sato image compilation. 

-- 
[1] [ https://docs.docker.com/engine/security/rootless/ | https://docs.docker.com/engine/security/rootless/ ] 
[2] [ https://github.com/opencontainers/runc#rootless-containers | https://github.com/opencontainers/runc#rootless-containers ] 
[3] [ https://linuxcontainers.org/lxc/getting-started/#creating-unprivileged-containers-as-a-user | https://linuxcontainers.org/lxc/getting-started/#creating-unprivileged-containers-as-a-user ] 
--- 
meta/classes/insane.bbclass | 4 ++-- 
meta/classes/sanity.bbclass | 10 +++++++- 
meta/recipes-core/coreutils/ [ http://coreutils_8.31.bb/ | coreutils_8.31.bb ] | 1 + 
scripts/docker/Dockerfile | 19 +++++++++++++++ 
scripts/docker/oe-rootless-docker | 24 +++++++++++++++++++ 
5 files changed, 55 insertions(+), 3 deletions(-) 
create mode 100644 scripts/docker/Dockerfile 
create mode 100755 scripts/docker/oe-rootless-docker 

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass 
index 0564f9c2a4..3599ce3e6a 100644 
--- a/meta/classes/insane.bbclass 
+++ b/meta/classes/insane.bbclass 
@@ -876,12 +876,12 @@ def package_qa_check_host_user(path, name, d, elf, messages): 
raise 
else: 
check_uid = int(d.getVar('HOST_USER_UID')) 
- if stat.st_uid == check_uid: 
+ if check_uid != 0 and stat.st_uid == check_uid: 
package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_uid)) 
return False 

check_gid = int(d.getVar('HOST_USER_GID')) 
- if stat.st_gid == check_gid: 
+ if check_gid != 0 and stat.st_gid == check_gid: 
package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_gid)) 
return False 
return True 
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass 
index 63ab6cf3df..a1eba62589 100644 
--- a/meta/classes/sanity.bbclass 
+++ b/meta/classes/sanity.bbclass 
@@ -742,7 +742,15 @@ def check_sanity_everybuild(status, d): 
# it makes sense to always run them. 

if 0 == os.getuid(): 
- raise_sanity_error("Do not use Bitbake as root.", d) 
+ userns = False 
+ with open("/proc/self/uid_map") as f: 
+ for line in f: 
+ fields = line.split() 
+ if fields[0] == "0" and fields[1] != "0": 
+ userns = True 
+ break 
+ if not userns: 
+ raise_sanity_error("Do not use Bitbake as root.", d) 

# Check the Python version, we now have a minimum of Python 3.4 
import sys 
diff --git a/meta/recipes-core/coreutils/ [ http://coreutils_8.31.bb/ | coreutils_8.31.bb ] b/meta/recipes-core/coreutils/ [ http://coreutils_8.31.bb/ | coreutils_8.31.bb ] 
index 57b2c1bdba..2f8009331a 100644 
--- a/meta/recipes-core/coreutils/ [ http://coreutils_8.31.bb/ | coreutils_8.31.bb ] 
+++ b/meta/recipes-core/coreutils/ [ http://coreutils_8.31.bb/ | coreutils_8.31.bb ] 
@@ -28,6 +28,7 @@ SRC_URI[sha256sum] = "ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3 
EXTRA_OECONF_class-native = "--without-gmp" 
EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}" 
EXTRA_OECONF_class-nativesdk = "--enable-install-program=arch,hostname" 
+EXTRA_OECONF_append = " FORCE_UNSAFE_CONFIGURE=1" 

# acl and xattr are not default features 
# 
diff --git a/scripts/docker/Dockerfile b/scripts/docker/Dockerfile 
new file mode 100644 
index 0000000000..4a143d6aa1 
--- /dev/null 
+++ b/scripts/docker/Dockerfile 
@@ -0,0 +1,19 @@ 
+FROM ubuntu:18.04 
+ 
+RUN DEBIAN_FRONTEND=noninteractive apt-get -y update --fix-missing 
+ 
+# Configure locale for Python3 
+RUN DEBIAN_FRONTEND=noninteractive apt-get -y install locales ; \ 
+ DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales && \ 
+ locale-gen en_US.UTF-8 && \ 
+ update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 
+ 
+ENV LANG=en_US.UTF-8 
+ENV LC_ALL=en_US.UTF-8 
+ 
+# Install Yocto native dependencies 
+RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \ 
+ wget git-core diffstat unzip texinfo gcc-multilib \ 
+ build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \ 
+ xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \ 
+ pylint3 xterm gawk 
diff --git a/scripts/docker/oe-rootless-docker b/scripts/docker/oe-rootless-docker 
new file mode 100755 
index 0000000000..1efcc82280 
--- /dev/null 
+++ b/scripts/docker/oe-rootless-docker 
@@ -0,0 +1,24 @@ 
+#!/bin/sh 
+ 
+usage () { 
+CMD=$(basename $0) 
+cat <<EOF 
+Usage: $CMD [docker-build|docker-run] 
+ docker-build Build Dockerfile locally 
+ docker-run Run rootless docker image suitable for image compilation 
+EOF 
+} 
+ 
+if ! [ -n "${DOCKER_HOST}" -a "$(stat -c '%U' "${DOCKER_HOST#*://}" 2>/dev/null)" = "$(whoami)" ] ; then 
+ echo "Install rootless docker according to the [ https://docs.docker.com/engine/security/rootless/ | https://docs.docker.com/engine/security/rootless/ ] " 
+ exit 1 
+fi 
+ 
+if [ "$1" = "docker-build" ]; then 
+ docker build -t poky-docker $(dirname $(readlink -f $0)) 
+elif [ "$1" = "docker-run" ]; then 
+ docker run -ti -v ${HOME}:${HOME} -v ${PWD}:${PWD} --workdir ${PWD} -e HOME poky-docker 
+else 
+ usage 
+ exit 0 
+fi 
-- 
2.17.1 

-- 
_______________________________________________ 
Openembedded-core mailing list 
[ mailto:Openembedded-core@lists.openembedded.org | Openembedded-core@lists.openembedded.org ] 
[ http://lists.openembedded.org/mailman/listinfo/openembedded-core | http://lists.openembedded.org/mailman/listinfo/openembedded-core ] 

BQ_END


BQ_END



--=_9ab72b9f-fe00-4277-8751-1f5cfc9d7b2a
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000"><div data-marker=3D"__QUOTED_TEXT__"><div style=
=3D"font-family:'arial' , 'helvetica' , sans-serif;font-size:12pt;color:#00=
0000"><div>Hi Alexander.</div><br><div>I understand all of the concerns. Ye=
s, it's possible to create a regular user inside of containers (at least in=
 case of the rootless LXC and Docker containers), but this is a question of=
 usability. </div><div>All existed Docker containers for a Yocto compilatio=
n (including tge CROPS described at the yoctoproject wiki) tried to use sam=
e UID/GID for files inside and outside of the container in order to allow t=
o work with files both inside and outside of container. <br></div><div><br =
data-mce-bogus=3D"1"></div><div>In the case of the main container subsystem=
s (Docker, OCI) same level of a usability for rootless containers can be su=
pported only if we allow compilation from UID =3D=3D 0 because users own UI=
D mapped to 0 in this containers. In order to support such configuration we=
, in any case, should modify somehow contamination check, check for a root =
user in the sanity.bbclass and disable root check from "mknod" module in gn=
ulib (used by coreutils).</div><div><br data-mce-bogus=3D"1"></div><div>Wil=
l it be appropriate if we allow such regime of the compilation with the fol=
lowing limitation:<br data-mce-bogus=3D"1"></div><div>1. Allow compilation =
only from root user inside of the linux user namespace (not a real root)<br=
 data-mce-bogus=3D"1"></div><div>2. Allow such compilation only if there is=
 "native_root_user" feature in DISTRO_FEATURES<br data-mce-bogus=3D"1"></di=
v><div>3. Each modified place will check this two conditions<br data-mce-bo=
gus=3D"1"></div><div><br data-mce-bogus=3D"1"></div><div>Will be such desig=
n appropriate compromise between safety and usability?<br data-mce-bogus=3D=
"1"></div><div><br data-mce-bogus=3D"1"></div><div>Regards,<br>Nikolai<br d=
ata-mce-bogus=3D"1"></div><br><hr id=3D"zwchr"><div><blockquote style=3D"bo=
rder-left:2px solid #1010ff;margin-left:5px;padding-left:5px;color:#000;fon=
t-weight:normal;font-style:normal;text-decoration:none;font-family:'helveti=
ca' , 'arial' , sans-serif;font-size:12pt"><b>From: </b>"Alexander Kanavin"=
 &lt;alex.kanavin@gmail.com&gt;<br><b>To: </b>"n merinov" &lt;n.merinov@ina=
ngo-systems.com&gt;<br><b>Cc: </b>"openembedded-core" &lt;openembedded-core=
@lists.openembedded.org&gt;<br><b>Sent: </b>Tuesday, December 31, 2019 9:29=
:34 AM<br><b>Subject: </b>Re: [OE-core] [PATCH] sanity: allow to compile fr=
om root in user namespaces<br></blockquote></div><div><blockquote style=3D"=
border-left:2px solid #1010ff;margin-left:5px;padding-left:5px;color:#000;f=
ont-weight:normal;font-style:normal;text-decoration:none;font-family:'helve=
tica' , 'arial' , sans-serif;font-size:12pt"><div dir=3D"ltr"><div>I believ=
e it should be possible to create a regular user inside the container and t=
hen run bitbake as that user?&nbsp;</div><br><div>The patch effectively dis=
ables the host contamination check, fixes one recipe that breaks, and likel=
y introduces other issues; the assumption (and automated testing) throughou=
t the build is that it's run under a regular user.</div><br><div>Alex</div>=
</div><br><div><div dir=3D"ltr">On Tue, 31 Dec 2019 at 11:40, Nikolai Merin=
ov via Openembedded-core &lt;<a href=3D"mailto:openembedded-core@lists.open=
embedded.org" rel=3D"nofollow noopener noreferrer nofollow noopener norefer=
rer" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;padding-left:1ex;border-left-color:rgb( 204 , 204 , 204 );border-left=
-width:1px;border-left-style:solid">New rootless container subsystems rely =
on the "user namespaces"<br>
Linux feature. In order to create a container from a regular user the<br>
user uid and subuids mapped to the uid space inside of container.<br>
<br>
There are different default configurations used for different<br>
container subsystems:<br>
<br>
&nbsp;1. Rootless Docker[1] maps the user ID to 0, the subuids to range<br>
&nbsp; &nbsp; starting from 1.<br>
&nbsp;2. Rootless RunC[2] from OCI by default maps the user ID to 0 and<br>
&nbsp; &nbsp; ignores the subuids.<br>
&nbsp;3. LXC[3] maps the subuids to range from 0. UID not participates<br>
&nbsp; &nbsp; in the mapping.<br>
<br>
The LXC variant does not allow to work on same files simultaneusly<br>
inside and outside of a container. Variant suggested by other<br>
container susbsystems assumes that files owned by user should be<br>
owned by root in a container environment.<br>
<br>
In order to simplify Yocto compilation in such rootless containers I<br>
want to allow to start the bitbake from root user in user namespace<br>
and allow software compilation from root user in the described<br>
configuration. Additionally I want to provide minimal dockerfile<br>
suitable for the core-image-sato image compilation.<br>
<br>
--<br>
[1] <a href=3D"https://docs.docker.com/engine/security/rootless/" rel=3D"no=
referrer nofollow noopener noreferrer nofollow noopener noreferrer" target=
=3D"_blank">https://docs.docker.com/engine/security/rootless/</a><br>
[2] <a href=3D"https://github.com/opencontainers/runc#rootless-containers" =
rel=3D"noreferrer nofollow noopener noreferrer nofollow noopener noreferrer=
" target=3D"_blank">https://github.com/opencontainers/runc#rootless-contain=
ers</a><br>
[3] <a href=3D"https://linuxcontainers.org/lxc/getting-started/#creating-un=
privileged-containers-as-a-user" rel=3D"noreferrer nofollow noopener norefe=
rrer nofollow noopener noreferrer" target=3D"_blank">https://linuxcontainer=
s.org/lxc/getting-started/#creating-unprivileged-containers-as-a-user</a><b=
r>
---<br>
&nbsp;meta/classes/insane.bbclass&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 4 ++--<br>
&nbsp;meta/classes/sanity.bbclass&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| 10 +++++++-<br>
&nbsp;meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" rel=
=3D"noreferrer nofollow noopener noreferrer nofollow noopener noreferrer" t=
arget=3D"_blank">coreutils_8.31.bb</a> |&nbsp; 1 +<br>
&nbsp;scripts/docker/Dockerfile&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;| 19 +++++++++++++++<br>
&nbsp;scripts/docker/oe-rootless-docker&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| 24 +++++++++++++++++++<br>
&nbsp;5 files changed, 55 insertions(+), 3 deletions(-)<br>
&nbsp;create mode 100644 scripts/docker/Dockerfile<br>
&nbsp;create mode 100755 scripts/docker/oe-rootless-docker<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index 0564f9c2a4..3599ce3e6a 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -876,12 +876,12 @@ def package_qa_check_host_user(path, name, d, elf, me=
ssages):<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;raise<br>
&nbsp; &nbsp; &nbsp;else:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;check_uid =3D int(d.getVar('HOST_USER_UID=
'))<br>
-&nbsp; &nbsp; &nbsp; &nbsp; if stat.st_uid =3D=3D check_uid:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; if check_uid !=3D 0 and stat.st_uid =3D=3D che=
ck_uid:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;package_qa_add_message(mess=
ages, "host-user-contaminated", "%s: %s is owned by uid %d, which is the sa=
me as the user running bitbake. This may be due to host contamination" % (p=
n, package_qa_clean_path(path, d, name), check_uid))<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return False<br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;check_gid =3D int(d.getVar('HOST_USER_GID=
'))<br>
-&nbsp; &nbsp; &nbsp; &nbsp; if stat.st_gid =3D=3D check_gid:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; if check_gid !=3D 0 and stat.st_gid =3D=3D che=
ck_gid:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;package_qa_add_message(mess=
ages, "host-user-contaminated", "%s: %s is owned by gid %d, which is the sa=
me as the user running bitbake. This may be due to host contamination" % (p=
n, package_qa_clean_path(path, d, name), check_gid))<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return False<br>
&nbsp; &nbsp; &nbsp;return True<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index 63ab6cf3df..a1eba62589 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -742,7 +742,15 @@ def check_sanity_everybuild(status, d):<br>
&nbsp; &nbsp; &nbsp;# it makes sense to always run them.<br>
<br>
&nbsp; &nbsp; &nbsp;if 0 =3D=3D os.getuid():<br>
-&nbsp; &nbsp; &nbsp; &nbsp; raise_sanity_error("Do not use Bitbake as root=
.", d)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; userns =3D False<br>
+&nbsp; &nbsp; &nbsp; &nbsp; with open("/proc/self/uid_map") as f:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for line in f:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fields =3D line.sp=
lit()<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if fields[0] =3D=
=3D "0" and fields[1] !=3D "0":<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; user=
ns =3D True<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; brea=
k<br>
+&nbsp; &nbsp; &nbsp; &nbsp; if not userns:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; raise_sanity_error("Do not use B=
itbake as root.", d)<br>
<br>
&nbsp; &nbsp; &nbsp;# Check the Python version, we now have a minimum of Py=
thon 3.4<br>
&nbsp; &nbsp; &nbsp;import sys<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.b=
b" rel=3D"noreferrer nofollow noopener noreferrer nofollow noopener norefer=
rer" target=3D"_blank">coreutils_8.31.bb</a> b/meta/recipes-core/coreutils/=
<a href=3D"http://coreutils_8.31.bb" rel=3D"noreferrer nofollow noopener no=
referrer nofollow noopener noreferrer" target=3D"_blank">coreutils_8.31.bb<=
/a><br>
index 57b2c1bdba..2f8009331a 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" rel=
=3D"noreferrer nofollow noopener noreferrer nofollow noopener noreferrer" t=
arget=3D"_blank">coreutils_8.31.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" rel=
=3D"noreferrer nofollow noopener noreferrer nofollow noopener noreferrer" t=
arget=3D"_blank">coreutils_8.31.bb</a><br>
@@ -28,6 +28,7 @@ SRC_URI[sha256sum] =3D "ff7a9c918edce6b4f4b2725e3f9b37b0c=
4d193531cac49a48b56c4d0d3<br>
&nbsp;EXTRA_OECONF_class-native =3D "--without-gmp"<br>
&nbsp;EXTRA_OECONF_class-target =3D "--enable-install-program=3Darch,hostna=
me --libexecdir=3D${libdir}"<br>
&nbsp;EXTRA_OECONF_class-nativesdk =3D "--enable-install-program=3Darch,hos=
tname"<br>
+EXTRA_OECONF_append =3D " FORCE_UNSAFE_CONFIGURE=3D1"<br>
<br>
&nbsp;# acl and xattr are not default features<br>
&nbsp;#<br>
diff --git a/scripts/docker/Dockerfile b/scripts/docker/Dockerfile<br>
new file mode 100644<br>
index 0000000000..4a143d6aa1<br>
--- /dev/null<br>
+++ b/scripts/docker/Dockerfile<br>
@@ -0,0 +1,19 @@<br>
+FROM ubuntu:18.04<br>
+<br>
+RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get -y update --fix-missing<br>
+<br>
+# Configure locale for Python3<br>
+RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get -y install locales ; \<br>
+&nbsp; &nbsp; DEBIAN_FRONTEND=3Dnoninteractive dpkg-reconfigure locales &a=
mp;&amp; \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; locale-gen en_US.UTF-8 &amp;&amp; \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; update-locale LC_ALL=3Den_US.UTF-8 LANG=3Den_U=
S.UTF-8<br>
+<br>
+ENV LANG=3Den_US.UTF-8<br>
+ENV LC_ALL=3Den_US.UTF-8<br>
+<br>
+# Install Yocto native dependencies<br>
+RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get -y install \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; wget git-core diffstat unzip texinfo gcc-multi=
lib \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; build-essential chrpath socat cpio python pyth=
on3 python3-pip python3-pexpect \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; xz-utils debianutils iputils-ping python3-git =
python3-jinja2 libegl1-mesa libsdl1.2-dev \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; pylint3 xterm gawk<br>
diff --git a/scripts/docker/oe-rootless-docker b/scripts/docker/oe-rootless=
-docker<br>
new file mode 100755<br>
index 0000000000..1efcc82280<br>
--- /dev/null<br>
+++ b/scripts/docker/oe-rootless-docker<br>
@@ -0,0 +1,24 @@<br>
+#!/bin/sh<br>
+<br>
+usage () {<!-- --><br>
+CMD=3D$(basename $0)<br>
+cat &lt;&lt;EOF<br>
+Usage: $CMD [docker-build|docker-run]<br>
+&nbsp; docker-build&nbsp; Build Dockerfile locally<br>
+&nbsp; docker-run&nbsp; &nbsp; Run rootless docker image suitable for imag=
e compilation<br>
+EOF<br>
+}<br>
+<br>
+if ! [ -n "${DOCKER_HOST}" -a "$(stat -c '%U' "${DOCKER_HOST#*://}" 2&gt;/=
dev/null)" =3D "$(whoami)" ] ; then<br>
+&nbsp; &nbsp; &nbsp; &nbsp;echo "Install rootless docker according to the =
<a href=3D"https://docs.docker.com/engine/security/rootless/" rel=3D"norefe=
rrer nofollow noopener noreferrer nofollow noopener noreferrer" target=3D"_=
blank">https://docs.docker.com/engine/security/rootless/</a>"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;exit 1<br>
+fi<br>
+<br>
+if [ "$1" =3D "docker-build" ]; then<br>
+&nbsp; &nbsp; &nbsp; &nbsp;docker build -t poky-docker $(dirname $(readlin=
k -f $0))<br>
+elif [ "$1" =3D "docker-run" ]; then<br>
+&nbsp; &nbsp; &nbsp; &nbsp;docker run -ti -v ${HOME}:${HOME} -v ${PWD}:${P=
WD} --workdir ${PWD} -e HOME poky-docker<br>
+else<br>
+&nbsp; &nbsp; &nbsp; &nbsp;usage<br>
+&nbsp; &nbsp; &nbsp; &nbsp;exit 0<br>
+fi<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" rel=3D"nofollow=
 noopener noreferrer nofollow noopener noreferrer" target=3D"_blank">Openem=
bedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer nofollow noopener noreferrer nofollow noopener noreferr=
er" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openem=
bedded-core</a><br>
</blockquote></div></blockquote></div></div><br></div></div></body></html>

--=_9ab72b9f-fe00-4277-8751-1f5cfc9d7b2a--
