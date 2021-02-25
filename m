Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.5577.1614217729020498566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 17:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 11P1mbCO006948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 17:48:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Feb 2021 17:48:31 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Wed, 24 Feb 2021 17:48:31 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/7] rust: remove container build scripts used by meta-rust
Date: Wed, 24 Feb 2021 20:48:21 -0500
Message-ID: <20210225014823.397741-6-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210225014823.397741-1-Randy.MacLeod@windriver.com>
References: <16668FEB024AAA5B.31532@lists.openembedded.org>
 <20210225014823.397741-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove:
   scripts/build.sh
   scripts/cleanup-env.sh
   scripts/containerize.sh
   scripts/fetch.sh
   scripts/publish-build-cache.sh
   scripts/setup-env.sh
since they are only used to do container based builds for meta-rust.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 scripts/build.sh               |  19 ------
 scripts/cleanup-env.sh         |  14 -----
 scripts/containerize.sh        |  54 -----------------
 scripts/fetch.sh               | 103 ---------------------------------
 scripts/publish-build-cache.sh |  13 -----
 scripts/setup-env.sh           |  12 ----
 6 files changed, 215 deletions(-)
 delete mode 100755 scripts/build.sh
 delete mode 100755 scripts/cleanup-env.sh
 delete mode 100755 scripts/containerize.sh
 delete mode 100755 scripts/fetch.sh
 delete mode 100755 scripts/publish-build-cache.sh
 delete mode 100755 scripts/setup-env.sh

diff --git a/scripts/build.sh b/scripts/build.sh
deleted file mode 100755
index cfff7c1ba8..0000000000
--- a/scripts/build.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/bash
-
-# Grab the MACHINE from the environment; otherwise, set it to a sane default
-export MACHINE="${MACHINE-qemux86-64}"
-
-# What to build
-BUILD_TARGETS="\
-    rustfmt \
-    "
-
-die() {
-    echo "$*" >&2
-    exit 1
-}
-
-rm -f build/conf/bblayers.conf || die "failed to nuke bblayers.conf"
-rm -f build/conf/local.conf || die "failed to nuke local.conf"
-
-./scripts/containerize.sh bitbake ${BUILD_TARGETS} || die "failed to build"
diff --git a/scripts/cleanup-env.sh b/scripts/cleanup-env.sh
deleted file mode 100755
index d2d57295b2..0000000000
--- a/scripts/cleanup-env.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/bash -x
-
-sudo fuser -m `pwd`/build
-
-# Only attempt to unmount if the directory is already mounted
-if mountpoint -q `pwd`/build; then
-    sudo umount `pwd`/build
-fi
-
-sudo fuser -m `pwd`/build
-
-ps -ef
-
-exit 0
diff --git a/scripts/containerize.sh b/scripts/containerize.sh
deleted file mode 100755
index 9e28453a0a..0000000000
--- a/scripts/containerize.sh
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/bash
-
-# what container are we using to build this
-CONTAINER="cardoe/yocto:pyro"
-
-einfo() {
-	echo "$*" >&2
-}
-
-die() {
-    echo "$*" >&2
-    exit 1
-}
-
-# Save the commands for future use
-cmd=$@
-
-# If no command was specified, just drop us into a shell if we're interactive
-[ $# -eq 0 ] && tty -s && cmd="/bin/bash"
-
-# user and group we are running as to ensure files created inside
-# the container retain the same permissions
-my_uid=$(id -u)
-my_gid=$(id -g)
-
-# Are we in an interactive terminal?
-tty -s && termint=t
-
-# Fetch the latest version of the container
-einfo "*** Ensuring local container is up to date"
-docker pull ${CONTAINER} > /dev/null || die "Failed to update docker container"
-
-# Ensure we've got what we need for SSH_AUTH_SOCK
-if [[ -n ${SSH_AUTH_SOCK} ]]; then
-	SSH_AUTH_DIR=$(dirname $(readlink -f ${SSH_AUTH_SOCK}))
-	SSH_AUTH_NAME=$(basename ${SSH_AUTH_SOCK})
-fi
-
-# Kick off Docker
-einfo "*** Launching container ..."
-exec docker run \
-    --privileged \
-    -e BUILD_UID=${my_uid} \
-    -e BUILD_GID=${my_gid} \
-    -e TEMPLATECONF=meta-rust/conf \
-    -e MACHINE=${MACHINE:-qemux86-64} \
-    ${SSH_AUTH_SOCK:+-e SSH_AUTH_SOCK="/tmp/ssh-agent/${SSH_AUTH_NAME}"} \
-    -v ${HOME}/.ssh:/var/build/.ssh \
-    -v "${PWD}":/var/build:rw \
-    ${SSH_AUTH_SOCK:+-v "${SSH_AUTH_DIR}":/tmp/ssh-agent} \
-    ${EXTRA_CONTAINER_ARGS} \
-    -${termint}i --rm -- \
-    ${CONTAINER} \
-    ${cmd}
diff --git a/scripts/fetch.sh b/scripts/fetch.sh
deleted file mode 100755
index f8639a94af..0000000000
--- a/scripts/fetch.sh
+++ /dev/null
@@ -1,103 +0,0 @@
-#!/bin/bash -x
-
-# default repo
-if [[ $# -lt 1 ]]; then
-    echo "No Yocto branch specified, defaulting to master"
-    echo "To change this pass a Yocto branch name as an argument to this script"
-fi
-branch=${1-master}
-
-# the repos we want to check out, must setup variables below
-# NOTE: poky must remain first
-REPOS="poky metaoe"
-
-POKY_URI="git://git.yoctoproject.org/poky.git"
-POKY_PATH="poky"
-POKY_REV="${POKY_REV-refs/remotes/origin/${branch}}"
-
-METAOE_URI="git://git.openembedded.org/meta-openembedded.git"
-METAOE_PATH="poky/meta-openembedded"
-METAOE_REV="${METAOE_REV-refs/remotes/origin/${branch}}"
-
-METARUST_URI="."
-METARUST_PATH="poky/meta-rust"
-
-die() {
-	echo "$*" >&2
-	exit 1
-}
-
-update_repo() {
-	uri=$1
-	path=$2
-	rev=$3
-
-	# check if we already have it checked out, if so we just want to update
-	if [[ -d ${path} ]]; then
-		pushd ${path} > /dev/null
-		echo "Updating '${path}'"
-		git remote set-url origin "${uri}"
-		git fetch origin || die "unable to fetch ${uri}"
-	else
-		echo "Cloning '${path}'"
-		if [ -d "${GIT_LOCAL_REF_DIR}" ]; then
-			git clone --reference ${GIT_LOCAL_REF_DIR}/`basename ${path}` \
-				${uri} ${path} || die "unable to clone ${uri}"
-		else
-			git clone ${uri} ${path} || die "unable to clone ${uri}"
-		fi
-		pushd ${path} > /dev/null
-	fi
-
-	# The reset steps are taken from Jenkins
-
-	# Reset
-	# * drop -d from clean to not nuke build/tmp
-	# * add -e to not clear out bitbake bits
-	git reset --hard || die "failed reset"
-	git clean -fx -e bitbake -e meta/lib/oe || die "failed clean"
-
-	# Call the branch what we're basing it on, otherwise use default
-	# if the revision was not a branch.
-	branch=$(basename ${rev})
-	[[ "${branch}" == "${rev}" ]] && branch="default"
-
-	# Create 'default' branch
-	git update-ref refs/heads/${branch} ${rev} || \
-		die "unable to get ${rev} of ${uri}"
-	git config branch.${branch}.remote origin || die "failed config remote"
-	git config branch.${branch}.merge ${rev} || die "failed config merge"
-	git symbolic-ref HEAD refs/heads/${branch} || die "failed symbolic-ref"
-	git reset --hard || die "failed reset"
-	popd > /dev/null
-	echo "Updated '${path}' to '${rev}'"
-}
-
-# For each repo, do the work
-for repo in ${REPOS}; do
-	# upper case the name
-	repo=$(echo ${repo} | tr '[:lower:]' '[:upper:]')
-
-	# expand variables
-	expand_uri="${repo}_URI"
-	expand_path="${repo}_PATH"
-	expand_rev="${repo}_REV"
-	repo_uri=${!expand_uri}
-	repo_path=${!expand_path}
-	repo_rev=${!expand_rev}
-
-	# check that we've got data
-	[[ -z ${repo_uri} ]] && die "No revision defined in ${expand_uri}"
-	[[ -z ${repo_path} ]] && die "No revision defined in ${expand_path}"
-	[[ -z ${repo_rev} ]] && die "No revision defined in ${expand_rev}"
-
-	# now fetch/clone/update repo
-	update_repo "${repo_uri}" "${repo_path}" "${repo_rev}"
-
-done
-
-rm -rf "${METARUST_PATH}" || die "unable to clear old ${METARUST_PATH}"
-ln -sf "../${METARUST_URI}" "${METARUST_PATH}" || \
-	die "unable to symlink ${METARUST_PATH}"
-
-exit 0
diff --git a/scripts/publish-build-cache.sh b/scripts/publish-build-cache.sh
deleted file mode 100755
index e3a0a1829a..0000000000
--- a/scripts/publish-build-cache.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/bash -x
-
-if [[ $# -lt 1 ]]; then
-    echo "No Yocto branch specified, defaulting to master"
-    echo "To change this pass a Yocto branch name as an argument to this script"
-fi
-branch=${1-master}
-
-rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress build/downloads yocto-cache@build-cache.asterius.io:/srv/yocto-cache/
-
-rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress build/sstate-cache yocto-cache@build-cache.asterius.io:/srv/yocto-cache/${branch}/
-
-exit 0
diff --git a/scripts/setup-env.sh b/scripts/setup-env.sh
deleted file mode 100755
index dbed06111b..0000000000
--- a/scripts/setup-env.sh
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/bash -e
-
-mkdir -p build
-
-total_mem=`grep MemTotal /proc/meminfo | awk '{print $2}'`
-
-# Only have the slaves with large amounts of RAM mount the tmpfs
-if [ "$total_mem" -ge "67108864" ]; then
-    sudo mount -t tmpfs -o size=64G,mode=755,uid=${UID} tmpfs build
-fi
-
-exit 0
-- 
2.27.0

