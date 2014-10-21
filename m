Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 282B160097
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 06:29:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9L6TD4U004828
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 23:29:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 20 Oct 2014 23:29:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Oct 2014 14:30:36 +0800
Message-ID: <9170798de4e6bb33f5eef9ea5f51ae9378d2f1a8.1413872640.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413872640.git.Qi.Chen@windriver.com>
References: <cover.1413872640.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass: avoid boot error on read-only systemd image
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
X-List-Received-Date: Tue, 21 Oct 2014 06:29:19 -0000
Content-Type: text/plain

New version of systemd implements a new feature of updating /etc
or /var when needed at boot. For details, please see link below.

Opointer.de/blog/projects/stateless.html

For now, at boot time, the systemd-sysusers.service would update user
database files (/etc/passwd, /etc/group, etc.) according to the configuration
files under /usr/lib/sysusers.d. This step is necessary for other systemd
services to work correctly. Examples of such services are systemd-resolved
and systemd-tmpfiles-setup.

The problem is that on a read-only file system, that is, if /etc is read-only,
the user database files could not be updated, causing failures of services.

This patch fixes this problem by adding users/groups at rootfs time.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 940bdb6..56109a0 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -225,6 +225,27 @@ read_only_rootfs_hook () {
 			fi
 		fi
 	fi
+
+	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
+	    # Update user database files so that services don't fail for a read-only systemd system
+	    for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
+		[ -e $conffile ] || continue
+		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
+		    if [ "$type" = "u" ]; then
+			useradd_params=""
+			[ "$id" != "-" ] && useradd_params="$useradd_params --uid $id"
+			[ "$comment" != "-" ] && useradd_params="$useradd_params --comment $comment"
+			useradd_params="$useradd_params --system $name"
+			eval useradd --root ${IMAGE_ROOTFS} $useradd_params || true
+		    elif [ "$type" = "g" ]; then
+			groupadd_params=""
+			[ "$id" != "-" ] && groupadd_params="$groupadd_params --gid $id"
+			groupadd_params="$groupadd_params --system $name"
+			eval groupadd --root ${IMAGE_ROOTFS} $groupadd_params || true
+		    fi
+		done
+	    done
+	fi
 }
 
 PACKAGE_EXCLUDE ??= ""
-- 
1.9.1


