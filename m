Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E504CAC583
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 03:17:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4070.1757301430080966446
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Sep 2025 20:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IJtLUjxt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=134629f1ef=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5881H6V72727726
	for <openembedded-core@lists.openembedded.org>; Sun, 7 Sep 2025 20:17:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=X2v25p4OaFDfppmA0hdk
	CLmFxOceERtI8wcbrEayxhI=; b=IJtLUjxttUWLU7uexCyugZdeocwsYN5MwKdc
	07zAQEBn77c+dFvRacWL7UgS/KGUjZk8SSySF42bnMMHt97uw7HeNj4omC9nMHrN
	fEt0jbvke3g7d5+R3MY8glO8q0FNcCbvaf8XOX9nqY3EhsDi9Cu6k/0XZG8XtCKn
	3uPfcSARs54wrATMuV7/GXXDLvZ2kQKOyfEj/Mqf1AuLafBiQ2P0l8SgvftiiHqh
	WpkjHjEgtCZRhoMK6JpzscAxwPl21FYCjFuODJPI9rAKWLKT34blaNCFjdMYTLHc
	1O/BjcPyh533H1CELvndLTDcZHEC+yxQ6jQXD+eTH4131CETMg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg139x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 20:17:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 7 Sep 2025 20:17:08 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 7 Sep 2025 20:17:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 1/2] rpm: correct tool path in macros for no usrmerge
Date: Sun, 7 Sep 2025 20:17:18 -0700
Message-ID: <20250908031719.3161732-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tdq0zIqIQkFPPlf72dm_t2WpHeuLGKwx
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68be4ab5 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=f1hami8VAAAA:8
 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=nyH7KnfDRL1iecw7tCoA:9 a=NS3OCI0N-QAA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FMFxGtP9trmfb28vA-lX:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzMCBTYWx0ZWRfX/S47pIM8q3/C
 Cjn34C8L4i7YRKP6bOOE3Fu/Nr//id/yebJ1ecZw1YoDJQ5Hrk1DtaGBnq+yCOr3D/YL4BxiCyA
 X1OMDPLpv+q+rI2Eh/h0Qmh7oP1GdD/R8oDHVqi7scOTXjlSfV3Kc6YbNf+rg55r47Ejfg9srqX
 w0iecSvuKDYvGAWF50NVJFx0xjfGw2mZOOXPVo7ZZGnEroudy1EesyJN4p5IdG24oORHSjhRiTB
 s6E5BBLhliSjO4OkDIGsOD7NXGwqxTJy26oxcNY+mhYY6/bvdJuD0E8YHJ/1pvg+Po6tSlWgJY9
 B3/wwsX9sqpm6ZTFDj5foAdG0/xdQv53+bEhHpOTb7ObzRWgbzl2VK3Mxm51aE=
X-Proofpoint-ORIG-GUID: tdq0zIqIQkFPPlf72dm_t2WpHeuLGKwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 03:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223059

While no usrmerge in sysvinit, some tools defined in rpm macro have wrong path

$ echo 'INIT_MANAGER="sysvinit"'  >> conf/local.conf
$ echo 'IMAGE_INSTALL:append = " rpm busybox"' >> conf/local.conf
$ bitbake core-image-minimal
$ runqemu tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.qemuboot.conf

root@qemux86-64:~# which sed tar rm mkdir cp cat chown chmod gzip grep mv
/bin/sed
/bin/tar
/bin/rm
/bin/mkdir
/bin/cp
/bin/cat
/bin/chown
/bin/chmod
/bin/gzip
/bin/grep
/bin/mv

root@qemux86-64:~# rpm --eval "%{__sed} %{__tar} %{__rm} %{__mkdir} %{__cp} %{__cat} %{__chown} %{__chmod} %{__gzip} %{__grep} %{__mv}"
/usr/bin/sed /usr/bin/tar /usr/bin/rm /usr/bin/mkdir /usr/bin/cp /usr/bin/cat /usr/bin/chown /usr/bin/chmod /usr/bin/gzip /usr/bin/grep /usr/bin/mv

Here to explain how __rm was set in rpm during build. The build system
of rpm is cmake. Take rpm rpm-4.19.x for example:

The '__RM rm' is defected by findutil [1], and function findutil
calls find_program to search for tool, if not found on host, then
hardcode with "/usr/bin" prefix [2]

Yocto explicitly set OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY" [3][4]
to search tools from CMAKE_FIND_ROOT_PATH [5] which locates in recipe sysroot,
if not found in recipe sysroot, hardcode with "/usr/bin" prefix

If "${base_bindir}" != "${bindir}, explicitly correct tools in rpm
macros, use ${base_bindir} to instead original ${bindir}. Only do the
operation for target, it is not necessary for native and nativesdk,
because most host distribution supports usrmerge

After applying this commit, on target:

root@qemux86-64:~# rpm --eval "%{__sed} %{__tar} %{__rm} %{__mkdir} %{__cp} %{__cat} %{__chown} %{__chmod} %{__gzip} %{__grep} %{__mv}"
/bin/sed /bin/tar /bin/rm /bin/mkdir /bin/cp /bin/cat /bin/chown /bin/chmod /bin/gzip /bin/grep /bin/mv

root@qemux86-64:~# ls /bin/sed /bin/tar /bin/rm /bin/mkdir /bin/cp /bin/cat /bin/chown /bin/chmod /bin/gzip /bin/grep /bin/mv
/bin/cat    /bin/chmod  /bin/chown  /bin/cp     /bin/grep   /bin/gzip   /bin/mkdir  /bin/mv     /bin/rm     /bin/sed    /bin/tar

In order to save size, this commit does not add these tools to
runtime depends, user should explicitly add them if necessary
(such as use rpm to build packages)

[1] https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/CMakeLists.txt#L121
[2] https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/CMakeLists.txt#L59
[3] https://git.openembedded.org/openembedded-core/commit/?id=f4ea12f6635125ee793f4dd801c538c0186f9dc3
[4] https://cmake.org/cmake/help/latest/variable/CMAKE_FIND_ROOT_PATH_MODE_PROGRAM.html
[5] https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/cmake.bbclass?id=f4ea12f6635125ee793f4dd801c538c0186f9dc3#n123

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(master rev: c89c7177be2df5d2be44478a6ac43b35ad46db9e)
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 281fde1c82..4ded77e8ce 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -97,6 +97,8 @@ WRAPPER_TOOLS = " \
    ${libdir}/rpm/rpmdeps \
 "
 
+base_bindir_progs = "sed tar rm mv mkdir cp cat chown chmod gzip grep"
+
 do_install:append:class-native() {
         for tool in ${WRAPPER_TOOLS}; do
                 test -x ${D}$tool && create_wrapper ${D}$tool \
@@ -119,9 +121,15 @@ do_install:append:class-nativesdk() {
 	EOF
 }
 
-# Rpm's make install creates var/tmp which clashes with base-files packaging
 do_install:append:class-target() {
+    # Rpm's make install creates var/tmp which clashes with base-files packaging
     rm -rf ${D}/var
+
+    if [ "${base_bindir}" != "${bindir}" ]; then
+        for prog in ${base_bindir_progs}; do
+            sed -i "s|^%__${prog}.*|%__${prog}  ${base_bindir}/${prog}|g" ${D}${libdir}/rpm/macros
+        done
+    fi
 }
 do_install:append:class-nativesdk() {
     rm -rf ${D}${SDKPATHNATIVE}/var
-- 
2.49.0


