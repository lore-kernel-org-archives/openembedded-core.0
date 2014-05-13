Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 865C36600B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 02:54:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4D2s65s017041
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 19:54:06 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 12 May 2014 19:54:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 May 2014 10:54:26 +0800
Message-ID: <61850645ac9dce0499383ace5ddd5af4c29bccf2.1399949579.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399949579.git.Qi.Chen@windriver.com>
References: <cover.1399949579.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gdb: add PACKAGECONFIG for babeltrace
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
X-List-Received-Date: Tue, 13 May 2014 02:54:05 -0000
Content-Type: text/plain

Add PACKAGECONFIG for 'babeltrace' so that we don't have the implicit
dependency which might lead to problems when building images.

As an example of showing what problem we might have without this patch,
see the following steps which would lead to a failure.
1. IMAGE_INSTALL_append = " gdb"
2. bitbake babeltrace
3. bitbake gdb
4. bitbake babeltrace -ccleansstate
5. bitbake core-image-minimal

The rootfs process would fail with the following error message.
error: Can't install gdb-7.7-r0@i586: no package provides babeltrace >= 1.2.1+git0+66c2a20b43

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/gdb/gdb_7.7.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gdb/gdb_7.7.bb b/meta/recipes-devtools/gdb/gdb_7.7.bb
index c7ca26b..1abc9d8 100644
--- a/meta/recipes-devtools/gdb/gdb_7.7.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.7.bb
@@ -5,6 +5,7 @@ inherit python-dir
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python"
+PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 
 do_configure_prepend() {
 	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
-- 
1.7.9.5


