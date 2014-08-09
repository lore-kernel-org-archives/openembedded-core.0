Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id DC86265E2B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 08:26:56 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so2014542wib.17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 01:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SQ7gdpAGSm4oa5avtfM7dq4Hl6v6pQSCgC/lgAgWEZw=;
	b=jWbQtHb4EjuUVM9D63Rijoygx6yTqf0skrnnBzgHNkShxh7JDZVOt6AE4AHADqEUcL
	nVXQATJl4H8QtphIhmp0DZl3Qy51bl/103jqNrxOwoNvN99jRXZP/YbECT7xdd6ZlU7z
	AGxH5mHLbYGrgiaBsW2r0NSqUWFlPLXlqleT87VN+e62M2NSMUqZnXcR/WHX7+iMUixm
	gIgBRn9k5C8LnId7tn57CfGcqHTUvPf7PWzgIDRdRawJEiggCcJ7HRoZN+Ai4e34d7ov
	NxFUqiVEkjUWwlFPNfBrN/3ueAUt+/ayIW1Ks0t+l8r+In4QPjJ/jQIe1Qly0+BotY8s
	1I9w==
X-Gm-Message-State: ALoCoQkPAg4YtrzHcEiMPc0AjwMe8lP3FpNETRxjAkARmfJvwz8Ju4+L8kAFvbz8G3m1WXeq526T
X-Received: by 10.194.104.72 with SMTP id gc8mr1489849wjb.105.1407572817311;
	Sat, 09 Aug 2014 01:26:57 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	fv10sm16412158wic.23.2014.08.09.01.26.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 01:26:56 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 10:26:50 +0200
Message-Id: <1407572810-26063-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1407572810-26063-1-git-send-email-koen.kooi@linaro.org>
References: <1407572810-26063-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [RFC][PATCH 2/2] systemd: rprovide/rreplace/rconflict nss-myhostname
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
X-List-Received-Date: Sat, 09 Aug 2014 08:26:58 -0000

Systems builds and packages nss-myhostname so add the appropriate lines to the recipe.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---

I'm not 100% sure how this works with the debian shlib renaming for nss-myhostname_0.3.bb and how to handle this in the default providers include. Hence the RFC.


 meta/recipes-core/systemd/systemd_213.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_213.bb
index 4fb7ffc..8572dbd 100644
--- a/meta/recipes-core/systemd/systemd_213.bb
+++ b/meta/recipes-core/systemd/systemd_213.bb
@@ -6,7 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
-PROVIDES = "udev"
+MYHOSTNAME = "nss-myhostname"
+# See EXTRA_OECONF_uclibc below
+MYHOSTNAME_uclibc = ""
+
+PROVIDES = "udev ${MYHOSTNAME}"
 
 PE = "1"
 
@@ -195,6 +199,10 @@ RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
 
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
 
+RPROVIDES_{$PN} = "${MYHOSTNAME}"
+RREPLACES_${PN} = "${MYHOSTNAME}"
+RCONFLICTS_${PN} = "${MYHOSTNAME}"
+
 CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
                 ${sysconfdir}/systemd/logind.conf \
                 ${sysconfdir}/systemd/system.conf \
-- 
1.9.3


