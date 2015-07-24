Return-Path: <adraszik@digisoft.tv>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id BD2D97625C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 12:48:55 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so26521871wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 05:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=fQyiM/578jf84iXLr5oZwCxZKCor54YOd1W9WNjqZuc=;
	b=X1rbBey/iGBsvy9GN63iGuI36zIeuak6lrGOe4PN5VCXIOsJoL9LZRJi5dXSRcN8zi
	uXtU0q/iL7g4eEfKbVFJBBwpLrFBlNgCKEUpr5FT6TDjNSYG+Qbmp7ff1N7m1SCJ5iH3
	uKL971Y61aJbCbzjpb0Kgf12g/2yo4wJO5KagfdcPB0Y+amMKyEzcUWvZUuzMEwSSnoX
	6JEKzXoYbzSPYubdSnDNdy1aw/1MiNwpJxB0z9DmMaNKo8+NZEqoNZW82ZM9NP+mZh1C
	QjakT1SdYutu0wU23kBdIsX/ncNULg7MNKSjN0ZvUyP2LdJm1Mfj86V3pyGvesgxdbJU
	PMAA==
X-Gm-Message-State: ALoCoQne5FlAf9EzhTGYDCiV4L4JDQLJ6IFuxNlLBNnuGW71dDHm3mOTADPQOmG1Hno5Sl4/AJ8M
X-Received: by 10.194.246.105 with SMTP id xv9mr26426906wjc.135.1437742135790; 
	Fri, 24 Jul 2015 05:48:55 -0700 (PDT)
Received: from bri0771.fritz.box (31-187-15-27.dynamic.upc.ie. [31.187.15.27])
	by smtp.gmail.com with ESMTPSA id
	x5sm3374677wif.21.2015.07.24.05.48.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 05:48:55 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 13:48:46 +0100
Message-Id: <1437742128-23260-4-git-send-email-adraszik@digisoft.tv>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437742128-23260-1-git-send-email-adraszik@digisoft.tv>
References: <1437742128-23260-1-git-send-email-adraszik@digisoft.tv>
MIME-Version: 1.0
Subject: [PATCH 3/5] initscripts: urandom: respect ${localstatedir} instead of hardcoding /var
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
X-List-Received-Date: Fri, 24 Jul 2015 12:48:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <git@andred.net>

---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index b1d917d..f90de6e 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -79,7 +79,7 @@ do_install () {
 	install -d ${D}${sysconfdir}/default
 	install -d ${D}${sysconfdir}/default/volatiles
 	# Holds state information pertaining to urandom
-	install -d ${D}/var/lib/urandom
+	install -d ${D}${localstatedir}/lib/urandom
 
 	install -m 0644    ${WORKDIR}/functions		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/bootmisc.sh	${D}${sysconfdir}/init.d
@@ -94,6 +94,7 @@ do_install () {
 	install -m 0755    ${WORKDIR}/single		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/umountnfs.sh	${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/urandom		${D}${sysconfdir}/init.d
+	sed -i ${D}${sysconfdir}/init.d/urandom -e 's,/var/,${localstatedir}/,g;s,/etc/,${sysconfdir}/,g'
 	install -m 0755    ${WORKDIR}/devpts.sh	${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/devpts		${D}${sysconfdir}/default
 	install -m 0755    ${WORKDIR}/sysfs.sh		${D}${sysconfdir}/init.d
-- 
2.1.4


