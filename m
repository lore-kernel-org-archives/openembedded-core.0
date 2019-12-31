Return-Path: <n.merinov@inango-systems.com>
X-Greylist: delayed 313 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 Dec 2019 08:39:58 UTC
Received: from mail.inango-sw.com (mail.inango-systems.com [178.238.230.57])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD537F8C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 08:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 7690E1080794
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 10:34:46 +0200 (IST)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id lQEYnne1sG0T; Tue, 31 Dec 2019 10:34:45 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 90E361080791;
	Tue, 31 Dec 2019 10:34:45 +0200 (IST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com 90E361080791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1577781285;
	bh=agHzJjljgqVc5CmkGnIY3PUbL4sV4dFKVgNCrBgZT1w=;
	h=From:To:Date:Message-Id;
	b=G6lFpPlYLqCnQKx1ldfAemRDBfbpo7JaIJ4KJyIRkyaok2uFAy+Ud3Bqqz6h1raU1
	eJNEHLr8pBRr/WIlhwbMkrQhSMvZuRVUN+qrr1IpWxiP6MX4UnjOlTOcE8qm+PJAdl
	j3jc8Po2IpupVzNKR3LWlTesaYpdX7itlMhMAQSlD2RFHfp0VLJ2yOQ8I0evYu66Py
	eiCPxMt06NWJHFTs56wODxnsfwhlgDT74kjf9JhoPQEJgCaEMr9eOUwzqCWaMsFhc3
	a65q4ibgYVrCfOtc6ENrBQmVzsUTi0AeOBzJGtBaYxYAxaCle0mzB6eTkwhiqGfUvn
	3lklGi7aENN/A==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id n0AcZDzvdtxh; Tue, 31 Dec 2019 10:34:45 +0200 (IST)
Received: from nmerinov.inango.loc (unknown [194.60.247.123])
	by mail.inango-sw.com (Postfix) with ESMTPSA id 25694108023B;
	Tue, 31 Dec 2019 10:34:45 +0200 (IST)
From: Nikolai Merinov <n.merinov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Dec 2019 13:33:15 +0500
Message-Id: <20191231083315.19828-1-n.merinov@inango-systems.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] sanity: allow to compile from root in user namespaces
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
X-List-Received-Date: Tue, 31 Dec 2019 08:39:58 -0000

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
[1] https://docs.docker.com/engine/security/rootless/
[2] https://github.com/opencontainers/runc#rootless-containers
[3] https://linuxcontainers.org/lxc/getting-started/#creating-unprivileged-containers-as-a-user
---
 meta/classes/insane.bbclass                   |  4 ++--
 meta/classes/sanity.bbclass                   | 10 +++++++-
 meta/recipes-core/coreutils/coreutils_8.31.bb |  1 +
 scripts/docker/Dockerfile                     | 19 +++++++++++++++
 scripts/docker/oe-rootless-docker             | 24 +++++++++++++++++++
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
-        if stat.st_uid == check_uid:
+        if check_uid != 0 and stat.st_uid == check_uid:
             package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_uid))
             return False
 
         check_gid = int(d.getVar('HOST_USER_GID'))
-        if stat.st_gid == check_gid:
+        if check_gid != 0 and stat.st_gid == check_gid:
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
-        raise_sanity_error("Do not use Bitbake as root.", d)
+        userns = False
+        with open("/proc/self/uid_map") as f:
+            for line in f:
+                fields = line.split()
+                if fields[0] == "0" and fields[1] != "0":
+                    userns = True
+                    break
+        if not userns:
+            raise_sanity_error("Do not use Bitbake as root.", d)
 
     # Check the Python version, we now have a minimum of Python 3.4
     import sys
diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index 57b2c1bdba..2f8009331a 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
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
+    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales && \
+        locale-gen en_US.UTF-8 && \
+        update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
+
+ENV LANG=en_US.UTF-8
+ENV LC_ALL=en_US.UTF-8
+
+# Install Yocto native dependencies
+RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
+        wget git-core diffstat unzip texinfo gcc-multilib \
+        build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
+        xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
+        pylint3 xterm gawk
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
+  docker-build  Build Dockerfile locally
+  docker-run    Run rootless docker image suitable for image compilation
+EOF
+}
+
+if ! [ -n "${DOCKER_HOST}" -a "$(stat -c '%U' "${DOCKER_HOST#*://}" 2>/dev/null)" = "$(whoami)" ] ; then
+	echo "Install rootless docker according to the https://docs.docker.com/engine/security/rootless/"
+	exit 1
+fi
+
+if [ "$1" = "docker-build" ]; then
+	docker build -t poky-docker $(dirname $(readlink -f $0))
+elif [ "$1" = "docker-run" ]; then
+	docker run -ti -v ${HOME}:${HOME} -v ${PWD}:${PWD} --workdir ${PWD} -e HOME poky-docker
+else
+	usage
+	exit 0
+fi
-- 
2.17.1


