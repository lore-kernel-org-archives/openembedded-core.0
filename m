Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UBN1c-0002LC-Oq
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 11:17:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r21A0mO4018655
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Mar 2013 02:00:48 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Fri, 1 Mar 2013 02:00:48 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 1 Mar 2013 18:02:14 +0800
Message-ID: <1482f3856c694c4010a2b526a9d436e9eafb3e2c.1362123438.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1362123438.git.kai.kang@windriver.com>
References: <cover.1362123438.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] package_rpm.bbclass: name postinst files with package name
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 10:17:18 -0000
Content-Type: text/plain

When create rootfs, some post install scripts need be run on device.
They are saved under directory /etc/rpm-postinst and named with numbers
such as 100, 101 etc.

Update to name the postinst script file with its package name instead of
just number. That may be more easy to debug when there is a error.

[YOCTO #3218]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/classes/package_rpm.bbclass |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 99c4d1a..c0ba54d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -383,12 +383,11 @@ export NATIVE_ROOT=${STAGING_DIR_NATIVE}
 \$2 \$1/\$3 \$4
 if [ \$? -ne 0 ]; then
   mkdir -p \$1/etc/rpm-postinsts
-  num=100
-  while [ -e \$1/etc/rpm-postinsts/\${num} ]; do num=\$((num + 1)); done
-  echo "#!\$2" > \$1/etc/rpm-postinsts/\${num}
-  echo "# Arg: \$4" >> \$1/etc/rpm-postinsts/\${num}
-  cat \$1/\$3 >> \$1/etc/rpm-postinsts/\${num}
-  chmod +x \$1/etc/rpm-postinsts/\${num}
+  name=\`head -1 \$1/\$3 | cut -d' ' -f 2\`
+  echo "#!\$2" > \$1/etc/rpm-postinsts/\${name}
+  echo "# Arg: \$4" >> \$1/etc/rpm-postinsts/\${name}
+  cat \$1/\$3 >> \$1/etc/rpm-postinsts/\${name}
+  chmod +x \$1/etc/rpm-postinsts/\${name}
 fi
 EOF
 
-- 
1.7.5.4



