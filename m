Received: from mail-pd0-f182.google.com ([209.85.192.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UeEzz-00043K-MY
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 03:34:56 +0200
Received: by mail-pd0-f182.google.com with SMTP id z10so1331915pdj.41
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 18:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=vXLK+fWe9WvhTOJnlhw6aU8U4jVsH2m831F4nVZc3Xk=;
	b=Udc028cuyVRsYNcGeINmLiP389tIEL3P6ZDVBAIQr/eNKJ/PKKh+ErA+0sjIjjaiKv
	zhdebNBeUADPPovGNx7p655sAHayF2+XYkKdtdX9fQzjCeMaGDPIOhFsj37MdqBpUuW4
	QXTWix3VAO2hNp2+uChtZbaBea8e9g3FP7WjWls5etPLxAdorSm+pDdN2GZSzwTEaaOr
	jHWxLetonWS3QBSZ+pdxyraV+zmPlX3jwme6PqZJqElVS8XXPYj7umZtib3JnpoH30Ns
	GbNklec970YVGJtQW8mPKLYkb3JeADGyJ0zb8xXOYn7Lj0FC3cLxqYGFktbmRlpCyFuj
	e89Q==
X-Received: by 10.68.250.229 with SMTP id zf5mr57531674pbc.148.1369012589436; 
	Sun, 19 May 2013 18:16:29 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	xu10sm23256606pab.3.2013.05.19.18.16.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 19 May 2013 18:16:28 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 11:29:30 +1000
Message-Id: <1369013370-21391-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] populate-volatile.sh: normalize repeated leading slashes in TNAME
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
X-List-Received-Date: Mon, 20 May 2013 01:34:58 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index ab09231..bbc1f35 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -150,7 +150,7 @@ apply_cfgfile() {
 	cat ${CFGFILE} | grep -v "^#" | \
 		while read LINE; do
 		eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
-		TNAME=${ROOT_DIR}/${TNAME}
+		TNAME=`echo ${ROOT_DIR}/${TNAME} | sed -e 's@^//*@/@'`
 		[ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
 
 		[ "${TTYPE}" = "l" ] && {
-- 
1.8.2.3



