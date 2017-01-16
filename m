Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id BFF1071AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:16:57 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id t6so1384709pgt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=5e7xDiqwicC8cBMZ5S22Z4mLVXiSF06XzEFRzucAXIU=;
	b=A/PncAerhuoA62EzIWevLDPP4Ew/tFb5cdH/43Q/LJ+G6nEoOIiIwn/BOYmD0jU6NK
	MQaYGcwAiSWAzTOnluZo1lxwF6uLtOANypLGnovuxuV945cWtxxUcTvXnauYwr8zsIOg
	Q07Cumjy5d2i7ilHEmq8IBzOSVJzUuOXFE59eny0GuVyGNqvozC8ECDsM9vP+LwDeLra
	FvL5reRfbZ65wa6x1r7aSTQitOlMlP8ZPvzFNW1GXA38Q1CgiyyOQQZ3w+pz0UsGVTZO
	6cLbLjHKHcIKPvi1QD26Uzxa4hcGrnUdI7yUh+G37j/jFavIfKHre7xjje7asbMC44hh
	Kf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=5e7xDiqwicC8cBMZ5S22Z4mLVXiSF06XzEFRzucAXIU=;
	b=kSrqgZYNeabyvzFUrKURBPyCEETi3qiMya24lK9kL4T9AFDkhSyQXd8ZoMlXCs+xCy
	OlXeP5dIE93XwNcCIfpwpbe2VfwTjE2+k5Vz158GOXt2b+03xgbiqIn2VTkgUR9Ut2/m
	d2rwvXlgooUQnvZsSEOS6iYKYya0PhOjk2NYT7HHN5MyBxzas2i8Il9SK0IxtsiQdoK8
	Ac6/EyMACR5r+oprc2DF72Qwf3Mb6TXsUZI1jMyLSnULuYSdGv1SlU23GJG0oJGqOH95
	uSUdOFYYmdFkFVOSu0ZWrfrfbfrq8JHCZZw9nEy+nevxk09u3YKShJbprcJV0DdYMjfX
	IrqA==
X-Gm-Message-State: AIkVDXLX7F2rpnRlfXE02Vxu634+WBkZTlG4HfXlFR6j94xjmOJLxLJfnaeO9jkZT+mpJw==
X-Received: by 10.98.214.73 with SMTP id r70mr37238754pfg.89.1484576218303;
	Mon, 16 Jan 2017 06:16:58 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	q145sm48244765pfq.22.2017.01.16.06.16.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:16:57 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-16-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 16/30] glib-2.0/glib.inc: Handle packaging .dll and .exe files for mingw32
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
X-List-Received-Date: Mon, 16 Jan 2017 14:16:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Handle the packaging of .dll files into the ${PN} package, this is
required due to the mingw/windows convention where .dll's are shipped in
the bindir.

Wildcard the suffix of '*gio-querymodules' so that the .exe versions are
also included in the ${PN} package.

Also handle the packaging of only .exe files into the ${PN}-utils
package. As mentioned above, bindir includes more than just binary
executables.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 24b31a7f9f..4ed2808d0f 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -52,9 +52,11 @@ do_configure_prepend() {
 }
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} \
+               ${bindir}/lib*.dll \
                ${libdir}/gio \
-               ${libexecdir}/*gio-querymodules \
-               ${datadir}/glib-2.0/schemas"
+               ${libexecdir}/*gio-querymodules* \
+               ${datadir}/glib-2.0/schemas \
+               "
 FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/lib*${SOLIBSDEV} \
                     ${libdir}/gio/modules/*.la \
@@ -69,6 +71,7 @@ FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
 FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py \
                        ${bindir}/gdbus-codegen"
 FILES_${PN}-utils = "${bindir}/*"
+FILES_${PN}-utils_mingw32 = "${bindir}/*.exe"
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
2.11.0


