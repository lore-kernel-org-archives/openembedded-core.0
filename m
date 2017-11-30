Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id CFA1D7866B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 20:20:48 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id w7so3462232pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 12:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WWWGjs23WTI/9ylnpN8Z4AySZxzvSIVilJsyVaWt/9M=;
	b=k9nScFjKEH6paw+j64oAUn2RaCswVNwpJ7ZY2b4g+pMQhwyryiYBP3G6gqNUfsDrJ3
	KNRFtEROq4sfiXbHzYU/Yu/o7yg4OZtc6dJzfaIWoLBRZDUtW55q5rYJkaZokAUjuekD
	hID0PKBkIoMGkzaaft/HdSwudJ5d+mU3ZUdObRzv5DAuxzxx1LdT+w0nInuwaQ2Fcq3S
	sL5VYqknDP2WJf6IkrtcVE45uDVr0TAqAKTGuetbkU9bPIaFEzxKvAIaaDosIyepdZat
	ns+yp9809QeUd+P84csgpRlove7Ea8MLntx8RW2DtvQZYhrfykyd/68DlRW3dPMwB42z
	70kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WWWGjs23WTI/9ylnpN8Z4AySZxzvSIVilJsyVaWt/9M=;
	b=nl7pjM2S3Tm7Co8F9K7sSAk+Y4a2uyhA6/ypHpU1vfE7O1lxGzylTEY3ysY5LId/Jo
	XognvORKgCKc5szsWjdwlGwfj04AmBX0EJRNzmRm5LBMWrsn8qY0DOmyjx4WGudDgNwX
	3nsl3q9rnBWRADfz8VaoYtpd151AF5RHDOizVCKpK8Ap18ByR8TW1fyT7BWkNb/6e/6s
	OLCtDcCRoaiboTMBk0nty4VGewdJq+WoG8JbJUhjlMUzOx+HytJvX7IGO3TTXPUmHQ1A
	Rv6YJ6vFr65LnF7eTJQoSZ1+wRI/IxDuB1b3+EfMiiuRkv5yqjlxJmOzwZO5nkjcIGMn
	mh2A==
X-Gm-Message-State: AJaThX52vfegMTbTzIlxPMpP4FYx7af8tjXA/qxYwecaM6NRK+WZUT/U
	gh+aZxfyFD2TACTHvKwoFzd16Q==
X-Google-Smtp-Source: AGs4zMbrQ83RfyWxXMpwoH2dACDDa90aP0ubOeuZ/uSXgtksaX3HB+O3bCCBgxsUnQEfnNFpE0zN+A==
X-Received: by 10.99.183.15 with SMTP id t15mr3610780pgf.128.1512073249371;
	Thu, 30 Nov 2017 12:20:49 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r16sm8168719pgt.72.2017.11.30.12.20.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Nov 2017 12:20:47 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2017 12:20:40 -0800
Message-Id: <1512073240-3830-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] musl: prevent errors if do_install is run more than once
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
X-List-Received-Date: Thu, 30 Nov 2017 20:20:49 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 932c9a2..db26b4f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -57,10 +57,11 @@ do_install() {
 	oe_runmake install DESTDIR='${D}'
 
 	install -d ${D}${bindir}
+	rm -f ${D}${bindir}/ldd
 	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
 	for l in crypt dl m pthread resolv rt util xnet
 	do
-		ln -s libc.so ${D}${libdir}/lib$l.so
+		ln -sf libc.so ${D}${libdir}/lib$l.so
 	done
 }
 
-- 
1.9.1


