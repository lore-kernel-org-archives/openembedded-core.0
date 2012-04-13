Received: from szxga01-in.huawei.com ([58.251.152.64])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ramana.gollamudi@huawei.com>) id 1SIfDa-0007xk-7a
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 14:03:10 +0200
Received: from huawei.com (szxga05-in [172.24.2.49])
	by szxga05-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2F003N51Z132@szxga05-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 19:45:01 +0800 (CST)
Received: from szxrg02-dlp.huawei.com ([172.24.2.119])
	by szxga05-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2F00JJY1XZEH@szxga05-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 19:45:01 +0800 (CST)
Received: from szxeml202-edg.china.huawei.com ([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.1.9-GA)	with ESMTP id AII57693; Fri,
	13 Apr 2012 19:45:01 +0800
Received: from SZXEML437-HUB.china.huawei.com (10.72.61.72)
	by szxeml202-edg.china.huawei.com (172.24.2.42) with Microsoft SMTP
	Server (TLS) id 14.1.323.3; Fri, 13 Apr 2012 19:44:48 +0800
Received: from SZXEML534-MBS.china.huawei.com ([169.254.6.253])
	by szxeml437-hub.china.huawei.com ([10.72.61.72]) with mapi id
	14.01.0323.003; Fri, 13 Apr 2012 19:44:51 +0800
Date: Fri, 13 Apr 2012 11:44:49 +0000
From: Venkata ramana gollamudi <ramana.gollamudi@huawei.com>
X-Originating-IP: [10.18.96.93]
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Message-id: <36ED13F3654AE54CA763E6821D93A5711043A0EE@szxeml534-mbs.china.huawei.com>
MIME-version: 1.0
Accept-Language: en-US, zh-CN
Thread-topic: [PATCH] eglibc: fix re-execution of task
Thread-index: Ac0ZatUFKv3ZX9hyTH6NeaUmZP6wcQ==
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-CFilter-Loop: Reflected
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: [PATCH] eglibc: fix re-execution of task
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2012 12:03:10 -0000
Content-type: text/plain; charset=us-ascii
Content-language: en-US
Content-transfer-encoding: 7BIT

Task do_patch_append calling do_fix_ia_headers is removing files using "rm" not "rm -f".
So first time execution of patch task is success, while re-execution of patch task
fails as it tries to remove the files already removed.

So changed "rm" to "rm -f".

[Yocto #2194]

Signed-off-by: Venkata Ramana Gollamudi <ramana.gollamudi@huawei.com>
---
 meta/recipes-core/eglibc/eglibc_2.13.bb |    8 ++++----
 meta/recipes-core/eglibc/eglibc_2.15.bb |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 927f72f..872767e 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -141,7 +141,7 @@ do_fix_ia_headers() {
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/environments.h ${S}/sysdeps/unix/sysv/linux/i386/bits/environments.h
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/fcntl.h ${S}/sysdeps/unix/sysv/linux/i386/bits/fcntl.h
 	cp ${S}/sysdeps/x86_64/fpu/bits/fenv.h ${S}/sysdeps/i386/fpu/bits/fenv.h
-	rm ${S}/sysdeps/i386/bits/huge_vall.h
+	rm -f ${S}/sysdeps/i386/bits/huge_vall.h
 	cp ${S}/sysdeps/x86_64/bits/link.h ${S}/sysdeps/i386/bits/link.h
 	cp ${S}/sysdeps/x86_64/bits/mathdef.h ${S}/sysdeps/i386/bits/mathdef.h
 	cp ${S}/sysdeps/x86_64/fpu/bits/mathinline.h ${S}/sysdeps/i386/fpu/bits/mathinline.h
@@ -150,14 +150,14 @@ do_fix_ia_headers() {
 	cp ${S}/nptl/sysdeps/unix/sysv/linux/x86_64/bits/pthreadtypes.h ${S}/nptl/sysdeps/unix/sysv/linux/i386/bits/pthreadtypes.h
 	cp ${S}/sysdeps/x86_64/bits/select.h ${S}/sysdeps/i386/bits/select.h
 	cp ${S}/nptl/sysdeps/unix/sysv/linux/x86_64/bits/semaphore.h ${S}/nptl/sysdeps/unix/sysv/linux/i386/bits/semaphore.h
-	rm ${S}/sysdeps/unix/sysv/linux/x86_64/bits/sem.h
+	rm -f ${S}/sysdeps/unix/sysv/linux/x86_64/bits/sem.h
 	cp ${S}/sysdeps/x86_64/bits/setjmp.h ${S}/sysdeps/i386/bits/setjmp.h
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/shm.h ${S}/sysdeps/unix/sysv/linux/i386/bits/shm.h
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/sigcontext.h ${S}/sysdeps/unix/sysv/linux/i386/bits/sigcontext.h
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/stat.h ${S}/sysdeps/unix/sysv/linux/i386/bits/stat.h
-	rm ${S}/sysdeps/i386/i486/bits/string.h ; cp ${S}/sysdeps/x86_64/bits/string.h ${S}/sysdeps/i386/bits/string.h
+	rm -f ${S}/sysdeps/i386/i486/bits/string.h ; cp ${S}/sysdeps/x86_64/bits/string.h ${S}/sysdeps/i386/bits/string.h 
 	# Skip syscall.h, see do_install
-	rm ${S}/sysdeps/unix/sysv/linux/i386/bits/wchar.h
+	rm -f ${S}/sysdeps/unix/sysv/linux/i386/bits/wchar.h 
 	cp ${S}/sysdeps/x86_64/bits/wordsize.h ${S}/sysdeps/i386/bits/wordsize.h
 	cp ${S}/sysdeps/x86_64/bits/xtitypes.h ${S}/sysdeps/i386/bits/xtitypes.h
 	# i386 version is correct, x86_64 is incorrect for fpu_control.h
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 1575e7f..dd04378 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -154,7 +154,7 @@ do_fix_ia_headers() {
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/environments.h ${S}/sysdeps/unix/sysv/linux/i386/bits/environments.h
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/fcntl.h ${S}/sysdeps/unix/sysv/linux/i386/bits/fcntl.h
 	cp ${S}/sysdeps/x86_64/fpu/bits/fenv.h ${S}/sysdeps/i386/fpu/bits/fenv.h
-	rm ${S}/sysdeps/i386/bits/huge_vall.h
+	rm -f ${S}/sysdeps/i386/bits/huge_vall.h 
 	cp ${S}/sysdeps/x86_64/bits/link.h ${S}/sysdeps/i386/bits/link.h
 	cp ${S}/sysdeps/x86_64/bits/mathdef.h ${S}/sysdeps/i386/bits/mathdef.h
 	cp ${S}/sysdeps/x86_64/fpu/bits/mathinline.h ${S}/sysdeps/i386/fpu/bits/mathinline.h
@@ -163,14 +163,14 @@ do_fix_ia_headers() {
 	cp ${S}/nptl/sysdeps/unix/sysv/linux/x86_64/bits/pthreadtypes.h ${S}/nptl/sysdeps/unix/sysv/linux/i386/bits/pthreadtypes.h
 	cp ${S}/sysdeps/x86_64/bits/select.h ${S}/sysdeps/i386/bits/select.h
 	cp ${S}/nptl/sysdeps/unix/sysv/linux/x86_64/bits/semaphore.h ${S}/nptl/sysdeps/unix/sysv/linux/i386/bits/semaphore.h
-	rm ${S}/sysdeps/unix/sysv/linux/x86_64/bits/sem.h
+	rm -f ${S}/sysdeps/unix/sysv/linux/x86_64/bits/sem.h 
 	cp ${S}/sysdeps/x86_64/bits/setjmp.h ${S}/sysdeps/i386/bits/setjmp.h
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/shm.h ${S}/sysdeps/unix/sysv/linux/i386/bits/shm.h
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/sigcontext.h ${S}/sysdeps/unix/sysv/linux/i386/bits/sigcontext.h
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/stat.h ${S}/sysdeps/unix/sysv/linux/i386/bits/stat.h
-	rm ${S}/sysdeps/i386/i486/bits/string.h ; cp ${S}/sysdeps/x86_64/bits/string.h ${S}/sysdeps/i386/bits/string.h
+	rm -f ${S}/sysdeps/i386/i486/bits/string.h ; cp ${S}/sysdeps/x86_64/bits/string.h ${S}/sysdeps/i386/bits/string.h
 	# Skip syscall.h, see do_install
-	rm ${S}/sysdeps/unix/sysv/linux/i386/bits/wchar.h
+	rm -f ${S}/sysdeps/unix/sysv/linux/i386/bits/wchar.h 
 	cp ${S}/sysdeps/x86_64/bits/wordsize.h ${S}/sysdeps/i386/bits/wordsize.h
 	cp ${S}/sysdeps/x86_64/bits/xtitypes.h ${S}/sysdeps/i386/bits/xtitypes.h
 	# i386 version is correct, x86_64 is incorrect for fpu_control.h
-- 
1.7.7



