Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6A47A60C92
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 15:57:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k11so3345516wrd.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 07:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0SYbNgtKFbSMCVXa5AwhajXlgCVc+mRR2LEnWBtY7yE=;
	b=S0+DqLtipFloXNJTniboelOtMrEldFer20ltsC+/J9IjL3M72CofJr5TymjDbWrWoX
	AgBMXDt99D69vQCx3EFb6fiYZ+w6nD6OGNIqDZ1UO3ayNdIZQyn82ccCMd5Dz3feIztH
	+FF0ytEaqg9gt3Eoc91yMNM/5CO0scBc/M1Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0SYbNgtKFbSMCVXa5AwhajXlgCVc+mRR2LEnWBtY7yE=;
	b=Tnd6futns3Qk/t0eQglfqgjA3+nsGY9NWT/+KCLT7WFg4xUDnjDXg5gOZGRINcJNNk
	rYVyV3bB7V6/v7Yn0v0uNHkNpBPawUl7hbIJ+kupH9qAh2lrsNVGSuL9G63RO8tl8oIn
	VYRxmqwVQw7mZJBq+FGsZJaQTJZD1j1S1R9jxAnuVQBFCPz8DXr4HIq9MptSDRohYHik
	lA7wiHBvUhKXCdE0efeRyWrH5fxgwdSnRxKRvd7CIErmhYW75vDnSXvrjaH5VG1ExS8O
	VcqfRVIbpPpBFHcz4cx3g4rEuYWO2qDeXJdHw75t2cAlot7kKfn8rp7xT3FZ806a4P+U
	HXJg==
X-Gm-Message-State: APjAAAU1MVuVajOF29qN2oI3OVgEdMMqrTjkEhHJ4tBPmNWDt9M8PSJZ
	+2h8KyVr7w634PUr9EuECRAjlretr4s=
X-Google-Smtp-Source: APXvYqzsGcI7doj0m3UA8lQzRoQ46/5o6dCgMash3Fs6lgdQMP9T/NsYSbGRLN0HTMIYaPTjdRo4gA==
X-Received: by 2002:adf:face:: with SMTP id a14mr28543060wrs.284.1580918222581;
	Wed, 05 Feb 2020 07:57:02 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v5sm263412wrv.86.2020.02.05.07.57.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 07:57:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 15:56:59 +0000
Message-Id: <20200205155659.1193-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libidn2: Fix reproducibility issue
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
X-List-Received-Date: Wed, 05 Feb 2020 15:57:02 -0000
Content-Transfer-Encoding: 8bit

The previous tweak for reproducibility didn't handle the duplicate
whitepace left behind, fix this.

[YOCTO #13771]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/libidn/libidn2_2.3.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.0.bb b/meta/recipes-extended/libidn/libidn2_2.3.0.bb
index 8e7e6c0dbcb..7adf924aebf 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.0.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.0.bb
@@ -22,7 +22,8 @@ EXTRA_OECONF += "--disable-rpath \
                  "
 
 do_install_append() {
-	sed -i -e 's|-L${STAGING_LIBDIR}||' ${D}${libdir}/pkgconfig/libidn2.pc
+	# Need to remove any duplicate whitespace too for reproducibility
+	sed -i -e 's|-L${STAGING_LIBDIR}||' -e 's/  */ /g' ${D}${libdir}/pkgconfig/libidn2.pc
 }
 
 LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
-- 
2.20.1


