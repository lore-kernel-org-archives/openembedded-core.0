Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id D6AD778C59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 23:01:10 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id h15-v6so3231504wrs.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Q9x2j5h00tIxOYpax3r0mxin0zXOEoHtXVPcOjOUKQo=;
	b=uV6qaE7m+m25Pr4KWlQb2LJ6QIGdLeuebg1TM+zOF+/KMsHczz7y2GWPtEh2m9BzGD
	54SUR4AMecwhvzl0xgp0c0akizFyPB1bD4Zlbq0zNPomr3DX+t618EJRaO/I0iGV8YeT
	KNY5kuMXOMouZ0BBTZkfBOX5F7Axdvrh+ocEDebvxfwxkBezWlKOpfg6qhEDjgCEQ8fu
	I26808I3unUQHMvNFji+6633xc+pVEN3Ek6AmJTtHOtORKjpxObknPKme1tK+25NSu3g
	s8fuE0t5MNGWFiQ/44ydyAXolL92ttOjG/dpGYeOvRA3IB7tQC1JnZN28JP03ZltBOQb
	qv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Q9x2j5h00tIxOYpax3r0mxin0zXOEoHtXVPcOjOUKQo=;
	b=P3isDeGJoyKZjrmFTFMUI6soJybPR5Qsg51N+O1K6PICtmqD+1iiozIk02TvUD9+JV
	FxCAimLUG4ghKbhSropm6h61ydgTRutx+QRZhCa8LbvR4fG6trM2rJgnMRoXaMDBIiNM
	SNGw4srF5q8KraYDwAfeV1y3dXFQKaYjo1yLKVVY12FrG7hzSbCvGWRIHGUowVCTPjwk
	H5sVrO/0mOFjqC4sp687Ge5WIqgzvJVvM7tiCNcCBVD/DvuJB/FxxrRG/XMej++uv50J
	4TSqr81fr/48XN68IyFipBtfjhChc3LrhrkesHKZxgBBwgBfrUZrFke8LHma1Ul1ZT+4
	vRMA==
X-Gm-Message-State: AOUpUlFe54qxJqkoDG5oXJ6Iuet2XFJ/tef9SEHhjyFEmmPNM3gtupNU
	U3ZdMjfI4jk9cHD8wHf0+v546PZvJ6k=
X-Google-Smtp-Source: AAOMgpcgIhvCXsYDXF/i+1pSFAHSGEqEkxSoNJBlExcoLyF9ciCNoI0KeOwjppbrqWEEdbWIykbCHQ==
X-Received: by 2002:adf:ad38:: with SMTP id
	p53-v6mr3022186wrc.10.1532646071038; 
	Thu, 26 Jul 2018 16:01:11 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h7-v6sm1948532wmb.48.2018.07.26.16.01.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 16:01:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 00:01:00 +0100
Message-Id: <20180726230100.6629-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180726230100.6629-1-ross.burton@intel.com>
References: <20180726230100.6629-1-ross.burton@intel.com>
Subject: [PATCH 5/5] unzip: fix symlink problem
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
X-List-Received-Date: Thu, 26 Jul 2018 23:01:11 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/unzip/unzip/symlink.patch | 26 +++++++++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb        |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/symlink.patch

diff --git a/meta/recipes-extended/unzip/unzip/symlink.patch b/meta/recipes-extended/unzip/unzip/symlink.patch
new file mode 100644
index 00000000000..a38f6f16123
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/symlink.patch
@@ -0,0 +1,26 @@
+Unzip doesn't handle large zip files well and crashes:
+
+"This only happens if you have more then 16k entries and when one of
+the 16k entry infos is reused it happend to be previously used for
+a symlink entry."
+
+This patch is taken from Fedora (https://bugzilla.redhat.com/show_bug.cgi?id=972427)
+
+Upstream-Status: Pending (upstream is dead)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+--- unzip60/process.c.sav	2013-06-09 12:08:57.070392264 +0200
++++ unzip60/process.c	2013-06-09 12:10:08.641696988 +0200
+@@ -1751,6 +1751,12 @@
+         = (G.crec.general_purpose_bit_flag & (1 << 11)) == (1 << 11);
+ #endif
+ 
++#ifdef SYMLINKS
++    /* Initialize the symlink flag, may be set by the platform-specific
++       mapattr function.  */
++    G.pInfo->symlink = 0;
++#endif 
++
+     return PK_COOL;
+ 
+ } /* end function process_cdir_file_hdr() */
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 105d048f55b..dbf4112a4c6 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://fix-security-format.patch \
 	file://18-cve-2014-9913-unzip-buffer-overflow.patch \
 	file://19-cve-2016-9844-zipinfo-buffer-overflow.patch \
+	file://symlink.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.11.0


