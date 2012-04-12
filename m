Received: from szxga03-in.huawei.com ([58.251.152.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ramana.gollamudi@huawei.com>) id 1SIJuJ-0005z6-Uj
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 15:17:52 +0200
Received: from huawei.com (szxga03-in [172.24.2.9])
	by szxga03-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2D008XTAOZM5@szxga03-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 20:58:11 +0800 (CST)
Received: from szxrg01-dlp.huawei.com ([172.24.2.119])
	by szxga03-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2D004GYAOZ7D@szxga03-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 20:58:11 +0800 (CST)
Received: from szxeml209-edg.china.huawei.com ([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.1.9-GA)	with ESMTP id AIH79903; Thu,
	12 Apr 2012 20:58:11 +0800
Received: from SZXEML438-HUB.china.huawei.com (10.72.61.73)
	by szxeml209-edg.china.huawei.com (172.24.2.184) with Microsoft SMTP
	Server (TLS) id 14.1.323.3; Thu, 12 Apr 2012 20:57:41 +0800
Received: from SZXEML534-MBS.china.huawei.com ([169.254.6.253])
	by szxeml438-hub.china.huawei.com ([10.72.61.73]) with mapi id
	14.01.0323.003; Thu, 12 Apr 2012 20:57:06 +0800
Date: Thu, 12 Apr 2012 12:58:03 +0000
From: Venkata ramana gollamudi <ramana.gollamudi@huawei.com>
X-Originating-IP: [10.18.96.93]
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Message-id: <36ED13F3654AE54CA763E6821D93A57110438F01@szxeml534-mbs.china.huawei.com>
MIME-version: 1.0
Accept-Language: en-US, zh-CN
Thread-topic: [Patch 1/1]:Package eglibc: Re-execution of do_patch task is
	giving error.
Thread-index: Ac0Yq+Vvz9GkKS9HR+iKMCV8+QHrog==
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-CFilter-Loop: Reflected
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: [Patch 1/1]:Package eglibc: Re-execution of do_patch task is giving error.
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
X-List-Received-Date: Thu, 12 Apr 2012 13:17:52 -0000
Content-type: text/plain; charset=us-ascii
Content-language: en-US
Content-transfer-encoding: 7BIT

Failure:
Eglibc package : Re-execution of do_patch task is giving error.
| ERROR: Function failed: do_fix_ia_headers (see /home/jxu49/osel/sstate-test/build/tmp/work/i586-poky-linux/eglibc-2.13-r20+svnr15508/temp/log.do_patch.15498 for further information) 
| rm: cannot remove `/home/jxu49/osel/sstate-test/build/tmp/work/i586-poky-linux/eglibc-2.13-r20+svnr15508/eglibc-2_13/libc/sysdeps/i386/bits/huge_vall.h': No such file or directory

Steps to reproduce: 
1> bitbake -c cleansstate eglibc 
2> bitbake eglibc
3> bitbake -c patch eglibc -f 

Defect:
	
	As part of defect https://bugzilla.yoctoproject.org/show_bug.cgi?id=2194

Fix details:
eglibc package task do_patch_append calling do_fix_ia_headers is removing files using "rm" not "rm -f".
So first time execution of patch task is pass, while send execution of patch task without cleaning tries to remove the files already removed. So changed "rm" to "rm -f".

Please find the below patch :
--------------------------------------------------------------
diff -Nupr prev/meta/recipes-core/eglibc/eglibc_2.13.bb new/meta/recipes-core/eglibc/eglibc_2.13.bb
--- prev/meta/recipes-core/eglibc/eglibc_2.13.bb	2012-04-10 11:12:24.251806908 +0530
+++ new/meta/recipes-core/eglibc/eglibc_2.13.bb	2012-04-10 20:48:08.840802762 +0530
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
diff -Nupr prev/meta/recipes-core/eglibc/eglibc_2.15.bb new/meta/recipes-core/eglibc/eglibc_2.15.bb
--- prev/meta/recipes-core/eglibc/eglibc_2.15.bb	2012-04-10 11:12:24.214806882 +0530
+++ new/meta/recipes-core/eglibc/eglibc_2.15.bb	2012-04-10 20:50:24.657802746 +0530
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


