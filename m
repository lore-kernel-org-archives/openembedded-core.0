Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id C9D4C71AC2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:15:58 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id t6so1383193pgt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=5aPy32gZxB1im1SXyaxwy4cxENd0FUwC8V2nnch09so=;
	b=Ll5guhH6U+n3wbxV4IzlzFyUkkuqoN/j4itXeeQAVM2ptXpZ792mHRbT6cQUpot50N
	0bJ7gKnEe01zngnOKZwbSP4mi8DRLMP/S3LGsdwEtHCUWTSJwWsupWYBbvOhkbfCS8Tq
	T9QvjsehTr8GNBs8MxEoMlhViDmDUJbqW6MF7SC6vqQSG0Bx6z/YsEjazYT+B5lLnf8J
	gL26fSvHPUfTWHfQcC9qJyi2YUIvRTggvy177P7BDhubMDkBPktuhDHR383kHNL30Rr4
	dxdduDrvu74+2fBVG8B+t2sr1TRIzwdB1n6bIilRyc1BZrONc5uXUww4Um+XBZJHGJU+
	4/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=5aPy32gZxB1im1SXyaxwy4cxENd0FUwC8V2nnch09so=;
	b=PwzPeeVSEh141ysPcAkTOcv49xcYY+5fiu+oW50WapxVaqY0lWuLDKTXtrzbuszNZ8
	NdeqC25t+5k2A351di4esM4Ldx23yRjGpx7+ygEm8hggsYK0Sjg8zQqObv4a6GSAXf3J
	+rAxpJNV6xmenZOqad4FZz6ky2KG7cur17AVl1DJvho1VVqkIkDQMbjnsK+sylReOm8y
	6R5FIO/WbQlVEswp3dC2bsTIsrCpgXublFwJTzv1Pd4fzwTUDCuR91HFq/FpF/NpfdMn
	iQRtX31s1UjpYMpG6C0dMW7WDU5X3ngbXHjKpMlRjq1oUKHeqtHszZjNKQ015qlHwNBH
	/fJQ==
X-Gm-Message-State: AIkVDXKq0atq8NxS4BvpC7nBkXyVjlomHZqBemD0arvcoNy3h5o67RhsbKwnOWAHEzHKaA==
X-Received: by 10.98.62.153 with SMTP id y25mr37641078pfj.162.1484576158935;
	Mon, 16 Jan 2017 06:15:58 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	k76sm32482459pfg.42.2017.01.16.06.15.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:15:58 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-5-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 5/30] bitbake.conf: Override FILES_${PN}-bin for mingw32
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
X-List-Received-Date: Mon, 16 Jan 2017 14:15:59 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On MinGW32 targets (aka Windows) it is convention to have DLLs in bindir
along side the executables. This is due to how Windows does not have a
bindir/libdir separation and thus cannot handle dynamic loading in the
same way as other targets (e.g. glibc). To avoid grouping anything other
that .exe files into the ${PN}-bin packages, override it so that on
mingw32 targets only '${bindir}/*.exe' files are shipped by default.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5dbcf5c441..6eb60a8553 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -292,6 +292,8 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
             ${libdir}/bonobo/servers"
 
 FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"
+# For mingw32 limit the -bin pkg to only have .exe's
+FILES_${PN}-bin_mingw32 = "${bindir}/*.exe ${sbindir}/*.exe"
 
 FILES_${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
             ${datadir}/gnome/help"
-- 
2.11.0


