Return-Path: <adraszik@digisoft.tv>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id E24BE76262
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 12:48:56 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so26574339wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 05:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=I6t5zqW6A47fPY8Eujv+K6QgGZ78jbxcntvon84AoRk=;
	b=SoX7dG8Uwf8fcmzXH3lbxZVtFZRXROU9olLNlut0dutoCI0GAWPNxv0adTSOF51CS4
	ajMGy3bQCozqdLqB4xpiMEj23RwLX++aZngEBXx4ywriFFGUAd2EttAOOw6vAwrpIDeI
	CcVaJUwXUos1gQyfeJs8bvX6EvOVGWEf4VOSRSswCGGk+IRkdyZALmjaWprpMT8tvQH7
	Emr2LyVT+rWTCdfSEEGcoi9TznRfuMLCXxtJ0DwnWryqOpUhQ+jL0odNMsPp+HcHHnpO
	j7YeE2SldMRgBcJOUop8+Sp7M6lCASTnAqS/BX42JzPDMtsprawEpgI91a1MJbZ5z1o3
	KxDQ==
X-Gm-Message-State: ALoCoQkRrapB4t+heYACbv6MrSpEfYfwCn31lkt4jLE3iyswJTbK1Grvyi6tYvSxmkV1kWK3S/dR
X-Received: by 10.194.172.130 with SMTP id bc2mr29182584wjc.85.1437742136532; 
	Fri, 24 Jul 2015 05:48:56 -0700 (PDT)
Received: from bri0771.fritz.box (31-187-15-27.dynamic.upc.ie. [31.187.15.27])
	by smtp.gmail.com with ESMTPSA id
	x5sm3374677wif.21.2015.07.24.05.48.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 05:48:56 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 13:48:47 +0100
Message-Id: <1437742128-23260-5-git-send-email-adraszik@digisoft.tv>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437742128-23260-1-git-send-email-adraszik@digisoft.tv>
References: <1437742128-23260-1-git-send-email-adraszik@digisoft.tv>
MIME-Version: 1.0
Subject: [PATCH 4/5] run-postinsts: use ${localstatedir} instead of hardcoding /var/lib
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
 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 2 +-
 meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index ac9cee6..58ea85e 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -20,7 +20,7 @@ for pm in $backend_list; do
 
 	case $pm in
 		"deb")
-			if [ -s "/var/lib/dpkg/status" ]; then
+			if [ -s "#LOCALSTATEDIR#/lib/dpkg/status" ]; then
 				pm_installed=true
 				break
 			fi
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index d126132..11c94e5 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -39,6 +39,7 @@ do_install() {
 	sed -i -e 's:#SYSCONFDIR#:${sysconfdir}:g' \
                -e 's:#SBINDIR#:${sbindir}:g' \
                -e 's:#BASE_BINDIR#:${base_bindir}:g' \
+               -e 's:#LOCALSTATEDIR#:${localstatedir}:g' \
                ${D}${sbindir}/run-postinsts \
                ${D}${systemd_unitdir}/system/run-postinsts.service
 }
-- 
2.1.4


