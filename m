Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F13817900A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:13:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7L7DPTr025186
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2018 00:13:26 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 21 Aug 2018 00:13:24 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Aug 2018 14:36:05 +0800
Message-ID: <b68ee7dc304de0c95a26b8a5da3b94ad266ba5a3.1534832871.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534832871.git.kai.kang@windriver.com>
References: <cover.1534832871.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] cmake.bbclass: fix wrong toolchain flags of nativesdk package
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
X-List-Received-Date: Tue, 21 Aug 2018 07:13:26 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When enable multilib in an existing build project, if already build a
nativesdk package which inherits cmake, rebuild it will cause configure
error when test compiler:

| .../libexec/x86_64-pokysdk-linux/gcc/x86_64-pokysdk-linux/8.2.0/ld:
| cannot find crt1.o: No such file or directory

The STAGING_DIR_TARGET is different when multilib is enabled and
disabled. And it is a component of compiler option '--sysroot'. The
values are stored in file ${WORKDIR}/toolchain.cmake which is generated
by task generate_toolchain_file. But the task doesn't be re-run with
multilib status change.

Add ${STAGING_DIR_TARGET} to var flag 'vardeps' of generate_toolchain_file
to make sure file toolchain.cmake is re-gerated when toggle multilib.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/cmake.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index fd40a9863e..bb63414b77 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -112,6 +112,7 @@ EOF
 }
 
 addtask generate_toolchain_file after do_patch before do_configure
+do_generate_toolchain_file[vardeps] += "${STAGING_DIR_TARGET}"
 
 CONFIGURE_FILES = "CMakeLists.txt"
 
-- 
2.18.0


