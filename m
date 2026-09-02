Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4132CC61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:37 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5658.1788326792020009548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0e3gRQnv;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso5895155e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326790; x=1788931590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=duS4+gbXMLo2NElH0ECFDjn1qgJ/grEllHlvH2IUnH8=;
        b=0e3gRQnvSrTZNCnxoaRYFMCSrzH94ek8MQ1pnIoBdBlYINbPsGcTmjxL/0dL6JcH84
         Z4krIWTgSRii+GAMoNDuiNVk3g0A/vggHjj1I+zk9HdyCaE/8hqaeAaUAqXynah8V0CD
         D35AMPTf8SDP0N5AdO6CT1OlkjAzbbBnscScA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326790; x=1788931590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=duS4+gbXMLo2NElH0ECFDjn1qgJ/grEllHlvH2IUnH8=;
        b=aHS9KoW7SLk1g/oHokMIOlCjAMRGJNrrH+mt6ZU0+1ejefI+OoGX/ESqDA45R88fCr
         hBFLPCPeYvGXZ2uZjQgH2FTDlfmRWfSTzDPXtGbqwQgtsMXF8isYZYaos3y1vBEs+bsF
         W3boJ0BcWcbS8lYC8VPCaVUMcoC0n1OoK+IPVit43VBFYdeOVbO9hlza4dPESnVIwH/h
         FUqfQ/F8189nsTMRPWdjwWPLLJvsoquFUf2qYjFbMalObhxggNijsVyF2/Z2x6lemxi7
         A4hPSY/mG/KsAWf7O2z75wGD4k4/VTZDVeWtYHl8J22EcdER9+Cd5ydkmd/4CcI/FIme
         dkaw==
X-Gm-Message-State: AFuF++kksWI/n9qaNHX5Qp5BtTJJDbao4BrgpC1AejizyknBTRWimAeR
	eM84u48D1M4BaSynLeRVXNegpfwGcEk+s1csVtjD818gjxeQYW51eeaTR0ytqk6E7fC58piMXlp
	FV/PcjWM=
X-Gm-Gg: AR+sD13aRSougLjMlaaFQhEMQyRuD1D7hAB1Grryrz9uI57xIxECaotwkHfdEr8rmwX
	js/K8GqPasopTFUUwvmbQ+6fRlZKoOrsagTb3DYMgZvzNJq12MV+LY23ga50fwVI1Rr+VFHlQiR
	DavRdP93xTljMlzE53EbIdY8OlSz+mL2jWb7rfjzn6faAlTAdefeVJvjSciox1IDGrgqdnkMeUC
	iPtSae93oakrQ5UUP1cOfeh365i0oFF4+GqwKLzDKdSbSk9iGH/IijUMwbCviv6hXzC3xbISUhP
	25k97q4V8+rU0MMCH1yhzXSo/WYRVw5zg4SxDO69tgIKPacMa42yN4zOzgY0kSZnx/Oy92u4Cf9
	2EQrTKR20qTdBdLdJ7nRVIqQTD3M6eefJOkZ5VatcSnqn+lWk/Na2eYpryXHH2N2/aSDbvuSd9j
	bCwnphfgwIT9WJI+pqkWQ8NarAan2DPI1EduEbtzTX2DnEsejb5bXpC2t+VjVpR1zckHYX64yWL
	UrLhxL7RSVNbJ8kLw==
X-Received: by 2002:a05:600c:548b:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49ce5821208mr31201945e9.7.1788326790206;
        Tue, 01 Sep 2026 22:26:30 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/27] glibc: fix CVE-2026-5435
Date: Wed,  2 Sep 2026 07:25:19 +0200
Message-ID: <336e429b4d0048964cf883c187438ca7c5aca2ea.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244853

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)

Specifically, CERT, TKEY, TSIG, OPT.  This removes the buggy
implementations of TSIG, fixing bug 34033, and partially
fixing bug 34069.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-5435
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=34033
[3] https://sourceware.org/git/?p=glibc.git;a=commit;h=ca44a6609c29a683b03575fa035c6d17aa591e72

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: This patch will change output of a debug and deprecated function.
     Upstream chose to remove the vulnerable implementation instead of
     fixing it.
     See: https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0011
]
---
 .../glibc/glibc/0024-CVE-2026-5435.patch      | 137 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch
new file mode 100644
index 00000000000..722ec2129ca
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch
@@ -0,0 +1,137 @@
+From 5d41b8e5aaec3580e4a05d93c5ff2fc69bb3d5a7 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
+
+Specifically, CERT, TKEY, TSIG, OPT.  This removes the buggy
+implementations of TSIG, fixing bug 34033, and partially
+fixing bug 34069.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-5435
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=ca44a6609c29a683b03575fa035c6d17aa591e72]
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ resolv/ns_print.c | 96 -----------------------------------------------
+ 1 file changed, 96 deletions(-)
+
+diff --git a/resolv/ns_print.c b/resolv/ns_print.c
+index cef2212fd2..882a86e58e 100644
+--- a/resolv/ns_print.c
++++ b/resolv/ns_print.c
+@@ -434,96 +434,6 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 		break;
+ 	    }
+ 
+-	case ns_t_cert: {
+-		u_int c_type, key_tag, alg;
+-		int n;
+-		unsigned int siz;
+-		char base64_cert[8192], tmp[40];
+-		const char *leader;
+-
+-		c_type  = ns_get16(rdata); rdata += NS_INT16SZ;
+-		key_tag = ns_get16(rdata); rdata += NS_INT16SZ;
+-		alg = (u_int) *rdata++;
+-
+-		len = SPRINTF((tmp, "%d %d %d ", c_type, key_tag, alg));
+-		T(addstr(tmp, len, &buf, &buflen));
+-		siz = (edata-rdata)*4/3 + 4; /* "+4" accounts for trailing \0 */
+-		if (siz > sizeof(base64_cert) * 3/4) {
+-			const char *str = "record too long to print";
+-			T(addstr(str, strlen(str), &buf, &buflen));
+-		}
+-		else {
+-			len = b64_ntop(rdata, edata-rdata, base64_cert, siz);
+-
+-			if (len < 0)
+-				goto formerr;
+-			else if (len > 15) {
+-				T(addstr(" (", 2, &buf, &buflen));
+-				leader = "\n\t\t";
+-				spaced = 0;
+-			}
+-			else
+-				leader = " ";
+-
+-			for (n = 0; n < len; n += 48) {
+-				T(addstr(leader, strlen(leader),
+-					 &buf, &buflen));
+-				T(addstr(base64_cert + n, MIN(len - n, 48),
+-					 &buf, &buflen));
+-			}
+-			if (len > 15)
+-				T(addstr(" )", 2, &buf, &buflen));
+-		}
+-		break;
+-	    }
+-
+-	case ns_t_tkey: {
+-		/* KJD - need to complete this */
+-		u_long t;
+-		int mode, err, keysize;
+-
+-		/* Algorithm name. */
+-		T(addname(msg, msglen, &rdata, origin, &buf, &buflen));
+-		T(addstr(" ", 1, &buf, &buflen));
+-
+-		/* Inception. */
+-		t = ns_get32(rdata);  rdata += NS_INT32SZ;
+-		len = SPRINTF((tmp, "%lu ", t));
+-		T(addstr(tmp, len, &buf, &buflen));
+-
+-		/* Expiration. */
+-		t = ns_get32(rdata);  rdata += NS_INT32SZ;
+-		len = SPRINTF((tmp, "%lu ", t));
+-		T(addstr(tmp, len, &buf, &buflen));
+-
+-		/* Mode , Error, Key Size. */
+-		/* Priority, Weight, Port. */
+-		mode = ns_get16(rdata);  rdata += NS_INT16SZ;
+-		err  = ns_get16(rdata);  rdata += NS_INT16SZ;
+-		keysize  = ns_get16(rdata);  rdata += NS_INT16SZ;
+-		len = SPRINTF((tmp, "%u %u %u ", mode, err, keysize));
+-		T(addstr(tmp, len, &buf, &buflen));
+-
+-		/* XXX need to dump key, print otherdata length & other data */
+-		break;
+-	    }
+-
+-	case ns_t_tsig: {
+-		/* BEW - need to complete this */
+-		int n;
+-
+-		T(len = addname(msg, msglen, &rdata, origin, &buf, &buflen));
+-		T(addstr(" ", 1, &buf, &buflen));
+-		rdata += 8; /*%< time */
+-		n = ns_get16(rdata); rdata += INT16SZ;
+-		rdata += n; /*%< sig */
+-		n = ns_get16(rdata); rdata += INT16SZ; /*%< original id */
+-		sprintf(buf, "%d", ns_get16(rdata));
+-		rdata += INT16SZ;
+-		addlen(strlen(buf), &buf, &buflen);
+-		break;
+-	    }
+-
+ 	case ns_t_a6: {
+ 		struct in6_addr a;
+ 		int pbyte, pbit;
+@@ -557,12 +467,6 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 		break;
+ 	    }
+ 
+-	case ns_t_opt: {
+-		len = SPRINTF((tmp, "%u bytes", class));
+-		T(addstr(tmp, len, &buf, &buflen));
+-		break;
+-	    }
+-
+ 	default:
+ 		snprintf (errbuf, sizeof (errbuf), "unknown RR type %d", type);
+ 		comment = errbuf;
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index f6be1b5fc93..88ad5e44e80 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -56,6 +56,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-qemu-stale-process.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
+           file://0024-CVE-2026-5435.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"

