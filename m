Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 24AB6731BD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:17 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id uo6so404039444pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Kc8IH0Wp5olOmKw4WGnjSmcB9CqHokZF9kwCuL6TOyY=;
	b=wCgyUuy8BKm22MApXtQhhgC0T876+K3csUOvtqgWm7QnRqqrrri8BuP7xIT51WMwQc
	hvbawMKu3MP+k+uOlFYOk/GNyxeRrbvzn7NzszTG9nKqNMRVoD9etniomAD0N4oL6yh5
	ugDKygIu39kUxPgV0qCyjotRIi7TZPL/yWeIlJZq5IfhxWiauVFtktHJZc+ZrRfU4c9r
	pzuIBEkkUGgd0Rc1bD6Bv8KW/Z0KILG24/2SI1vRTCG3gf8deSuRo68xY1DAzgsvzeds
	GqOwZBHdtQtvbiRiVEMU+6KSS7OCYLYYEWzkuvZ1adcpL6VDU7B/YAJbgYpNhhLd/9vn
	KRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Kc8IH0Wp5olOmKw4WGnjSmcB9CqHokZF9kwCuL6TOyY=;
	b=LkWf6QulLu9DJXbRma9A2nGZ+Ufydy8efGijDBroViQL3WcQ9zl8+aQpgOlbKkM66V
	5jESNydpt9PKLmEtfHh/zLtfDpIMqOGt8XtQD6yujAZDze6MbAF5lAhbzIdMbtrGkdil
	zRyB3tPiL42pck9GNzPexllQf0PCM8lvQXAdogLfzoImfARPsMA+CzligTUOTYt2mKL6
	G46L9YEPp1LEPcyrVMq+S9nRFb/7xFuUPelvzMTDb6qrUUKg//BVRMPy+G7N9pvHDJ48
	c2VL2AmDiha0OuUZXYYURUX7Us2NOR2mZ+/zkSLFD2lmBeQwOiFTkhnTu3FwS9zGQlne
	Qk3Q==
X-Gm-Message-State: ALoCoQlmRfTDS+ailBQCuCeMtplu5oYfug+m/w5IevazAdvRW6GvIwnljbpgDgpmTyg8UgVvBWbs/7bB7htQavZ5LANWdADB3g==
X-Received: by 10.66.158.169 with SMTP id wv9mr28217549pab.138.1453030638162; 
	Sun, 17 Jan 2016 03:37:18 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:52 -0800
Message-Id: <d75d4766f208e0c33dae34f536589b78bcbf39eb.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 19/73] mtools: Fix build with uclibc
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:17 -0000

unlike glibc, uclibc does not have internal APIs implemented for
libiconv, so it needs to depend upon libiconv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/mtools/mtools_4.0.18.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index bc9b79c..479fd32 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -5,6 +5,7 @@ SECTION = "optional"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+DEPENDS += "virtual/libiconv"
 
 RDEPENDS_${PN}_libc-glibc = "glibc-gconv-ibm850"
 RRECOMMENDS_${PN}_libc-glibc = "\
@@ -35,6 +36,8 @@ inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
 
+LDFLAGS_append_libc-uclibc = " -liconv "
+
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGECONFIG ??= ""
-- 
2.7.0


