Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 696CD6DFD0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 23:01:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB5N1qIO018854
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 15:01:52 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 15:01:51 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 17:01:16 -0600
Message-ID: <3f3ce15582971e37fc3afc5425361d6951390da2.1386284385.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386284385.git.mark.hatle@windriver.com>
References: <cover.1386284385.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/6][dora] libtiff: fix CVE-2013-1960
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
X-List-Received-Date: Thu, 05 Dec 2013 23:01:52 -0000
Content-Type: text/plain

From: Ming Liu <ming.liu@windriver.com>

Heap-based buffer overflow in the tp_process_jpeg_strip function in tiff2pdf
in libtiff 4.0.3 and earlier allows remote attackers to cause a denial of
service (crash) and possibly execute arbitrary code via a crafted TIFF image
file.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-1960

Signed-off-by: Ming Liu <ming.liu@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 .../libtiff/files/libtiff-CVE-2013-1960.patch      | 151 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |   3 +-
 2 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-1960.patch

diff --git a/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-1960.patch b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-1960.patch
new file mode 100644
index 0000000..e4348f1
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-1960.patch
@@ -0,0 +1,151 @@
+This patch comes from: http://pkgs.fedoraproject.org/cgit/libtiff.git/plain/libtiff-CVE-2013-1960.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+
+diff -Naur a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+--- a/tools/tiff2pdf.c	2012-07-25 22:56:43.000000000 -0400
++++ b/tools/tiff2pdf.c	2013-05-02 12:04:49.057090227 -0400
+@@ -3341,33 +3341,56 @@
+ 	uint32 height){
+ 
+ 	tsize_t i=0;
+-	uint16 ri =0;
+-	uint16 v_samp=1;
+-	uint16 h_samp=1;
+-	int j=0;
+-	
+-	i++;
+-	
+-	while(i<(*striplength)){
++
++	while (i < *striplength) {
++		tsize_t datalen;
++		uint16 ri;
++		uint16 v_samp;
++		uint16 h_samp;
++		int j;
++		int ncomp;
++
++		/* marker header: one or more FFs */
++		if (strip[i] != 0xff)
++			return(0);
++		i++;
++		while (i < *striplength && strip[i] == 0xff)
++			i++;
++		if (i >= *striplength)
++			return(0);
++		/* SOI is the only pre-SOS marker without a length word */
++		if (strip[i] == 0xd8)
++			datalen = 0;
++		else {
++			if ((*striplength - i) <= 2)
++				return(0);
++			datalen = (strip[i+1] << 8) | strip[i+2];
++			if (datalen < 2 || datalen >= (*striplength - i))
++				return(0);
++		}
+ 		switch( strip[i] ){
+-			case 0xd8:
+-				/* SOI - start of image */
++			case 0xd8:	/* SOI - start of image */
+ 				_TIFFmemcpy(&(buffer[*bufferoffset]), &(strip[i-1]), 2);
+ 				*bufferoffset+=2;
+-				i+=2;
+ 				break;
+-			case 0xc0:
+-			case 0xc1:
+-			case 0xc3:
+-			case 0xc9:
+-			case 0xca:
++			case 0xc0:	/* SOF0 */
++			case 0xc1:	/* SOF1 */
++			case 0xc3:	/* SOF3 */
++			case 0xc9:	/* SOF9 */
++			case 0xca:	/* SOF10 */
+ 				if(no==0){
+-					_TIFFmemcpy(&(buffer[*bufferoffset]), &(strip[i-1]), strip[i+2]+2);
+-					for(j=0;j<buffer[*bufferoffset+9];j++){
+-						if( (buffer[*bufferoffset+11+(2*j)]>>4) > h_samp) 
+-							h_samp = (buffer[*bufferoffset+11+(2*j)]>>4);
+-						if( (buffer[*bufferoffset+11+(2*j)] & 0x0f) > v_samp) 
+-							v_samp = (buffer[*bufferoffset+11+(2*j)] & 0x0f);
++					_TIFFmemcpy(&(buffer[*bufferoffset]), &(strip[i-1]), datalen+2);
++					ncomp = buffer[*bufferoffset+9];
++					if (ncomp < 1 || ncomp > 4)
++						return(0);
++					v_samp=1;
++					h_samp=1;
++					for(j=0;j<ncomp;j++){
++						uint16 samp = buffer[*bufferoffset+11+(3*j)];
++						if( (samp>>4) > h_samp) 
++							h_samp = (samp>>4);
++						if( (samp & 0x0f) > v_samp) 
++							v_samp = (samp & 0x0f);
+ 					}
+ 					v_samp*=8;
+ 					h_samp*=8;
+@@ -3381,45 +3404,43 @@
+                                           (unsigned char) ((height>>8) & 0xff);
+ 					buffer[*bufferoffset+6]=
+                                             (unsigned char) (height & 0xff);
+-					*bufferoffset+=strip[i+2]+2;
+-					i+=strip[i+2]+2;
+-
++					*bufferoffset+=datalen+2;
++					/* insert a DRI marker */
+ 					buffer[(*bufferoffset)++]=0xff;
+ 					buffer[(*bufferoffset)++]=0xdd;
+ 					buffer[(*bufferoffset)++]=0x00;
+ 					buffer[(*bufferoffset)++]=0x04;
+ 					buffer[(*bufferoffset)++]=(ri >> 8) & 0xff;
+ 					buffer[(*bufferoffset)++]= ri & 0xff;
+-				} else {
+-					i+=strip[i+2]+2;
+ 				}
+ 				break;
+-			case 0xc4:
+-			case 0xdb:
+-				_TIFFmemcpy(&(buffer[*bufferoffset]), &(strip[i-1]), strip[i+2]+2);
+-				*bufferoffset+=strip[i+2]+2;
+-				i+=strip[i+2]+2;
++			case 0xc4: /* DHT */
++			case 0xdb: /* DQT */
++				_TIFFmemcpy(&(buffer[*bufferoffset]), &(strip[i-1]), datalen+2);
++				*bufferoffset+=datalen+2;
+ 				break;
+-			case 0xda:
++			case 0xda: /* SOS */
+ 				if(no==0){
+-					_TIFFmemcpy(&(buffer[*bufferoffset]), &(strip[i-1]), strip[i+2]+2);
+-					*bufferoffset+=strip[i+2]+2;
+-					i+=strip[i+2]+2;
++					_TIFFmemcpy(&(buffer[*bufferoffset]), &(strip[i-1]), datalen+2);
++					*bufferoffset+=datalen+2;
+ 				} else {
+ 					buffer[(*bufferoffset)++]=0xff;
+ 					buffer[(*bufferoffset)++]=
+                                             (unsigned char)(0xd0 | ((no-1)%8));
+-					i+=strip[i+2]+2;
+ 				}
+-				_TIFFmemcpy(&(buffer[*bufferoffset]), &(strip[i-1]), (*striplength)-i-1);
+-				*bufferoffset+=(*striplength)-i-1;
++				i += datalen + 1;
++				/* copy remainder of strip */
++				_TIFFmemcpy(&(buffer[*bufferoffset]), &(strip[i]), *striplength - i);
++				*bufferoffset+= *striplength - i;
+ 				return(1);
+ 			default:
+-				i+=strip[i+2]+2;
++				/* ignore any other marker */
++				break;
+ 		}
++		i += datalen + 1;
+ 	}
+-	
+ 
++	/* failed to find SOS marker */
+ 	return(0);
+ }
+ #endif
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
index 256e75e..8e450df 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
@@ -6,7 +6,8 @@ DEPENDS = "zlib jpeg xz"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
-           file://libtool2.patch"
+           file://libtool2.patch \
+           file://libtiff-CVE-2013-1960.patch"
 
 SRC_URI[md5sum] = "051c1068e6a0627f461948c365290410"
 SRC_URI[sha256sum] = "ea1aebe282319537fb2d4d7805f478dd4e0e05c33d0928baba76a7c963684872"
-- 
1.8.1.2.545.g2f19ada


