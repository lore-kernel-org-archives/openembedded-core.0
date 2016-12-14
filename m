Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B7BA771DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 09:07:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBE97dff018210
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 01:07:39 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 14 Dec 2016 01:07:38 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Dec 2016 17:08:38 +0800
Message-ID: <432f9a5147f555f2126976856cbbcfdaf2ae1385.1481706394.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1481706394.git.Qi.Chen@windriver.com>
References: <cover.1481706394.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 2/4] base-files: respect VOLATILE_LOG_DIR
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
X-List-Received-Date: Wed, 14 Dec 2016 09:07:39 -0000
Content-Type: text/plain

Respect VOLATILE_LOG_DIR variable. In this way, if the user overrides
this variable to be any valid boolean false value, /var/log on the final
image would reside on persistent storage.

[YOCTO #6132]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 5333110..c065499 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -41,7 +41,7 @@ dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
            ${localstatedir}/backups ${localstatedir}/lib \
            /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
-           ${localstatedir}/volatile/log \
+           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
            /home ${prefix}/src ${localstatedir}/local \
            /media"
 
@@ -52,7 +52,7 @@ dirs755-lsb = "/srv  \
                ${prefix}/lib/locale"
 dirs2775-lsb = "/var/mail"
 
-volatiles = "log tmp"
+volatiles = "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
-- 
1.9.1


