Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0Yc1-0002FG-Lw
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:26:09 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE662v007211; Wed, 30 Jan 2013 14:06:13 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bjQXwwsO1nVp; Wed, 30 Jan 2013 14:06:13 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE65WD007197
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:06 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YE1-00083x-Ku; Wed, 30 Jan 2013 14:01:17 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:01:09 +0000
Message-Id: <118025cdb7f099a98e5d16eccc0da4f80ffaf1af.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 16/17] package_ipk/deb/rpm: Ensure deploy staging directory is empty before rerunning task
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
X-List-Received-Date: Wed, 30 Jan 2013 14:38:43 -0000

If we don't do this, stale files can build up, particularly with the PR
server.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_deb.bbclass |    1 +
 meta/classes/package_ipk.bbclass |    1 +
 meta/classes/package_rpm.bbclass |    1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index ac8c9f3..5740948 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -452,6 +452,7 @@ python do_package_write_deb () {
     bb.build.exec_func("do_package_deb", d)
 }
 do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
+do_package_write_deb[cleandirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[umask] = "022"
 addtask package_write_deb before do_package_write after do_packagedata do_package
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index ad4ea53..433d0bb 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -476,6 +476,7 @@ python do_package_write_ipk () {
     bb.build.exec_func("do_package_ipk", d)
 }
 do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
+do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[umask] = "022"
 addtask package_write_ipk before do_package_write after do_packagedata do_package
 
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index af51d80..8ea2bbe 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1125,6 +1125,7 @@ python do_package_write_rpm () {
 }
 
 do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
+do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[umask] = "022"
 addtask package_write_rpm before do_package_write after do_packagedata do_package
 
-- 
1.7.10.4



