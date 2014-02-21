Return-Path: <Chao.Han@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C3CD26B8D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 07:24:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1L7OIxq011507
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 23:24:18 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 20 Feb 2014 23:24:18 -0800
Message-ID: <5306FE6A.2020704@windriver.com>
Date: Fri, 21 Feb 2014 15:21:14 +0800
From: HanChao <chao.han@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
Subject: lsb: change script init-functions installed path
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
X-List-Received-Date: Fri, 21 Feb 2014 07:24:19 -0000
X-Groupsio-MsgNum: 50414
Content-Type: multipart/mixed; boundary="------------050201090600030302080106"

--------------050201090600030302080106
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



--------------050201090600030302080106
Content-Type: text/x-patch;
	name="0001-lsb-change-script-init-functions-installed-path.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-lsb-change-script-init-functions-installed-path.patch"

From fbdcf88fe2d46e83f1e25a5681e16ea5c967a11a Mon Sep 17 00:00:00 2001
From: Han Chao <chan@windriver.com>
Date: Fri, 21 Feb 2014 10:44:35 +0800
Subject: [PATCH] lsb: change script init-functions installed path

The bb code assume the target is 64bit, so some files can not be
installed well. init-functions is a text script. Other script called
it from /lib/lsb, but it is installed on /lib64/lsb.
So this change fix the image path and packages.

Signed-off-by: Han Chao <chan@windriver.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index ecb4dcc..62a8077 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -30,6 +30,7 @@ do_install(){
 
 	mkdir -p ${D}${base_bindir}
 	mkdir -p ${D}/${baselib}
+	mkdir -p ${D}/lib
 	mkdir -p ${D}${sysconfdir}/lsb-release.d
 	printf "LSB_VERSION=\"core-4.1-noarch:" > ${D}${sysconfdir}/lsb-release
 
@@ -70,12 +71,12 @@ do_install(){
 
 do_install_append(){
        install -d ${D}${sysconfdir}/core-lsb
-       install -d ${D}/${baselib}/lsb
+       install -d ${D}/lib/lsb
        for i in lsb_killproc lsb_log_message lsb_pidofproc lsb_start_daemon
        do
            install -m 0755 ${WORKDIR}/${i} ${D}${sysconfdir}/core-lsb
        done
-       install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
+       install -m 0755 ${WORKDIR}/init-functions ${D}/lib/lsb
 
        # creat links for LSB test
        install -d ${D}/usr/lib/lsb
@@ -114,8 +115,8 @@ do_install_append(){
                ln -sf ld.so.1 ld-lsb-ppc32.so.3
        fi
 }
-FILES_${PN} += "/lib64 \
+FILES_${PN} += "/lib \
+		${baselib} \
 		/usr/lib/lsb \
-                ${base_libdir}/lsb/* \
 		${libdir}/sendmail \
                "
-- 
1.7.9.5


--------------050201090600030302080106--
