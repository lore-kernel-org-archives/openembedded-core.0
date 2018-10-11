Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05FD46FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 15:07:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9BF59Dh031899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Oct 2018 08:06:28 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 08:05:47 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 11 Oct 2018 22:24:17 +0800
Message-ID: <eedd956a3e7af4d2c64033d1b06944036c5d6536.1539267480.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1539267480.git.kai.kang@windriver.com>
References: <cover.1539267480.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] nss: fix non-determinism when create blank certificate
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
X-List-Received-Date: Thu, 11 Oct 2018 15:07:09 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It uses tool certutil from nss to create a blank certificate. But the
checksum of output file key4.db changes every time:

$ certutil -N -d sql:. --empty-password
$ md5sum *
f9dac2cfcb07cc8ca6db442a9a570906  cert9.db
b892c5ff7c1977d4728240b0cf628377  key4.db
7b9136cb03f07ae62eb213a5239fda71  pkcs11.txt
$ rm *

$ certutil -N -d sql:. --empty-password
$ md5sum *
f9dac2cfcb07cc8ca6db442a9a570906  cert9.db
405d55178e866a115c1aa975fccfa764  key4.db
7b9136cb03f07ae62eb213a5239fda71  pkcs11.txt

Provide pre-created blank database files to fix non-determinism issue.
And these files are from nss qemux86-64 build.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-support/nss/nss/blank-cert9.db    | Bin 0 -> 28672 bytes
 meta/recipes-support/nss/nss/blank-key4.db     | Bin 0 -> 36864 bytes
 meta/recipes-support/nss/nss/system-pkcs11.txt |   5 +++++
 meta/recipes-support/nss/nss_3.38.bb           |  16 ++++++++--------
 4 files changed, 13 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/nss/nss/blank-cert9.db
 create mode 100644 meta/recipes-support/nss/nss/blank-key4.db
 create mode 100644 meta/recipes-support/nss/nss/system-pkcs11.txt

diff --git a/meta/recipes-support/nss/nss/blank-cert9.db b/meta/recipes-support/nss/nss/blank-cert9.db
new file mode 100644
index 0000000000000000000000000000000000000000..7d4bcf2582d510f7b51d4306706746178c41fbbc
GIT binary patch
literal 28672
zcmeH~OK;Oa6ou_RTxhB2E<!9aOCljO58HJ%sA+4Yh?2G;mFNOhcH&Bb(26FJSh8cs
zo*x9ii4|h*_1I~<VaFmmmVA3=?%XpopQn-L?dj2YR*1{%n@`zH7;ne(eQ!?)&+~ly
zZrHba)~#5p8ul;c|MmFZ3-M$7@oz8K{Np`(`1t46udT0Jd$xfG1V8`;KmY_l00ck)
z1pYgLy&z~bn*RCtYE*m~e$2+BtLgM)o=?WZje~yL8Kk1yJ51jR&WYomsPp1krlfAY
zTxW+fc9>*&F{wuccN{o(-@&vF*Mi2=rvIMnr}O+nF`U&7>vtSn_P&Rbs?}Ky8c(Wy
zjHlCiaZ{VD-7zVX_dOET`quV08qKEvy)(=5Nl};AV#WCkI{QcIZ4Tp+IO%uabo%Gw
zb$Tw&dfn5rlx8?M?!7wd9t=ch|F}PRE;4CfWnXPyLz+9NM^RTo&4ii>H)%)`Qiv$T
z6m}^j6xtLr3b_q!wvuIJM@b$^mh+H{l4PSK`6x+7N|KY3WThl|DM@BZ4k^0jmFr_?
zU21mL?5x>Yv$JMr&CZ&g4ObbiGF)Z2%5YW8*_g92XJgLBWtKf-_T1%>%ttXG%{$eS
zYBldv^J+tBAFZg{N%A#3+VE(@qivFhlmlr@$fQC^bB9bSWKto|8uF|mf0u}BBX*0}
zE#lf?5t-0LWa%XNI!POIl4fv{w&*17(@6s8BvC9SLveCZ#&}%sqAae;;>B{Ttd?VC
zwHzy}<ycwyT3Ic}%F5TuTfTH=Xkyz-2ggY|Jx<aQa&okg#X?@zk`F>THeW0!r{#>I
zOpbCUp3t|IjGe}YCgyXi+by*cG}5N;l|Le%C-z2vk<Dk<+`g#)gD+GqSM5*j1Nyn$
zrm#Z+4+ww&2!H?xfB*=900@8p2!H?xfWWd6*rbi&{=clB7yAMM5C8!X009sH0T2KI
z5C8!X00Aa|`#%l>2!H?xfB*=900@8p2!H?xfB*<AKLOnTm;W1Mhadm~AOHd&00JNY
z0w4eaAOHd&fcrnr00@8p2!H?xfB*=900@8p2!H?xEI$F<|Cj$8V}~FB0w4eaAOHd&
O00JNY0w4eaAn+IM<WtiC

literal 0
HcmV?d00001

diff --git a/meta/recipes-support/nss/nss/blank-key4.db b/meta/recipes-support/nss/nss/blank-key4.db
new file mode 100644
index 0000000000000000000000000000000000000000..d47f08d04fe82197bc6a39ef9bf216b61c3dc77a
GIT binary patch
literal 36864
zcmeI)Pj3@P7zXfN$JsbGQBr~AB4lZNXcZIG&g?%N!~w@RZQ3*mZcvLjSnGHJQ-_q;
zfnEyAB}g2&RFzt!s;9Q+svn?82vt4w)Lub+1tcV(r_THCZkH&E#0_CRt9bl+XXe@2
z-!3E@BtAW}*d2u8!p7!$Fc6M0WtgUMN(jR+GWs>HU&&_aBAa~B@8(POer3jZPkcWy
z`P|6mo5q3c<o&|$h3f?`|0Lhc-`j5z_Co*y5P$##AOHafyh#GRv9V&QWNyz4f_5)l
z4+p{NU=Sqlxq7ovTWyHd+T3D8Bzwhlw<A`X3!l`Q=fua2bK>mM!kM!TvAiVe%S-c%
z3-wjeY^*HS>WyPU|Gc`cqBpzpe$Fb^OQzAi(h0xnU+wA6R<JeL;Loijzon9De9p3p
z#j<&x2dsS&bURo2{gut`wO|mA#fw{5I^FnOa3?Jx9U!IyCGE<oQO@{`GkQTg?4?7j
zT^ZcDC&Q`CXRYFqve}B3z16-Pt_{+R(Ont+sC!R}lB!Z4v5JS2v+4HxTj6FJlid{)
z_3lZjs>-dC=2)>@Ht*E=lBEG@m5HOG%a-ncl?zv!TW+o%6M@t(ecb|EzZ|N02klX`
zt4bfM^s&kxX-L(j#-qlk<~TJ~YG$bksA=nFmZN0Ua-yURC8Og|ijowgB;_bcK}u4R
zk`$#RWhqHvO0H2GFE3gjC)-iY$u=k3oNRNl&B-<=+nnt1EQe<~Jj>x(4$tzr*XLfJ
zdwuTpqh8MRIrBJ=WFN&qHlL|2X|By@YV&GcsW)5E?zp5}heta++Tqc<lZQkDX^hKK
zuB2nTEakG4%SUzjs4ia@kLP-v=5d<GbJs%8aUG8$<C1dYl1?lx=?HO2rx=%Xo^eTl
zaY>3%$tZD|PGg>UZ#vCSrupe|beSwim&tN;nJh<_Nv<xF<>)fW)#XdMbkER%^<KJh
z;*##3xTISsE<0%%rsakIOTH1JvF&s@ZCXyp3uLFw;#In~lG$mj>-c=%+OriWV--Ir
z@Ap?=`e(JJ(t1RHN6FE5l?iI5sKEvS2tWV=5P$##AOHafKmY;|fWWW{<mtrl{6DOh
z7v}{52tWV=5P$##AOHafKmY;|U;#Y;<3@l01Rwwb2tWV=5P$##AOHaf48H)L|A+q?
z;|w7H0SG_<0uX=z1Rwwb2tWV=c>c#d009U<00Izz00bZa0SG_<0uUH}0X+W?|24)L
zLI45~fB*y_009U<00Izz00ij&|2HRpH1roX2tWV=5P$##AOHafKmY;|fB*zuk3h>D
zExFsdFN1#n`o?DG@A=!mz4-R0mFHhS{`aGMCw_gf{mystq@1=2M|VElc{X7l7&S-a
z;q0N#(b>ECcfWb-&&$6&y8G8Z_h0;R>*tJVW~XMJ>|DC|(5t=u;D?(BCuVNYzyF()
mPYwNr4FV8=00bZa0SG_<0uX=z1Rwx`ArdHzl*W_aDEtSkqPYeD

literal 0
HcmV?d00001

diff --git a/meta/recipes-support/nss/nss/system-pkcs11.txt b/meta/recipes-support/nss/nss/system-pkcs11.txt
new file mode 100644
index 0000000000..1a264e9cc4
--- /dev/null
+++ b/meta/recipes-support/nss/nss/system-pkcs11.txt
@@ -0,0 +1,5 @@
+library=
+name=NSS Internal PKCS #11 Module
+parameters=configdir='sql:/etc/pki/nssdb' certPrefix='' keyPrefix='' secmod='secmod.db' flags= updatedir='' updateCertPrefix='' updateKeyPrefix='' updateid='' updateTokenDescription='' 
+NSS=Flags=internal,critical trustOrder=75 cipherOrder=100 slotParams=(1={slotFlags=[ECC,RSA,DSA,DH,RC2,RC4,DES,RANDOM,SHA1,MD5,MD2,SSL,TLS,AES,Camellia,SEED,SHA256,SHA512] askpw=any timeout=30})
+
diff --git a/meta/recipes-support/nss/nss_3.38.bb b/meta/recipes-support/nss/nss_3.38.bb
index 904b621a07..1de76e9826 100644
--- a/meta/recipes-support/nss/nss_3.38.bb
+++ b/meta/recipes-support/nss/nss_3.38.bb
@@ -25,6 +25,9 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
+           file://blank-cert9.db \
+           file://blank-key4.db \
+           file://system-pkcs11.txt \
            "
 
 SRC_URI[md5sum] = "ac9065460a7634ba8eb0f942f404e773"
@@ -212,14 +215,11 @@ do_install_append() {
 }
 
 do_install_append_class-target() {
-    # Create a blank certificate
-    mkdir -p ${D}${sysconfdir}/pki/nssdb/
-    touch ./empty_password
-    certutil -N -d sql:${D}${sysconfdir}/pki/nssdb/ -f ./empty_password
-    chmod 644 ${D}${sysconfdir}/pki/nssdb/*.db
-    rm ./empty_password
-    # Remove build path prefix
-    sed -i "s:${D}::g"  ${D}${sysconfdir}/pki/nssdb/pkcs11.txt
+    # install pre-created blank certificate
+    install -d ${D}${sysconfdir}/pki/nssdb/
+    install -m 0644 ${WORKDIR}/blank-cert9.db ${D}${sysconfdir}/pki/nssdb/cert9.db
+    install -m 0644 ${WORKDIR}/blank-key4.db ${D}${sysconfdir}/pki/nssdb/key4.db
+    install -m 0644 ${WORKDIR}/system-pkcs11.txt ${D}${sysconfdir}/pki/nssdb/pkcs11.txt
 }
 
 PACKAGE_WRITE_DEPS += "nss-native"
-- 
2.18.0


