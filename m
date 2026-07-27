Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FABC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:42:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25163.1785134529384822670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QVPxCNqd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so26270565e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785134528; x=1785739328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A4OgwqHvgx9sXRDNkpBTJ4/543Q0RqOp1/8yaGWbRCw=;
        b=QVPxCNqdGb8wnfU2wXG8oLNVv7UH1svNYPQCW8meC2jBczI0JdVb+W030BvUFYtQPi
         1qkq51UneEB6IPipDYfxxa3IlxcWOTYqbRKuxAJL8k57eL/Jbpuom6BoRfq4wsgD1qYf
         zuKSOR/+H9mevrUZdisNQPBj+ZUSMzr7bfUhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134528; x=1785739328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A4OgwqHvgx9sXRDNkpBTJ4/543Q0RqOp1/8yaGWbRCw=;
        b=sTer+24gbDDOaz1UL4qV71kYWHcwAHRLHqYM+uuhgo3Pizn2theuKQHYYcI9eqByyu
         yVwhhINPu4V05j4WffdBTgha5Zh3u07UjZ4U4msQqvHdoPsXa+UGashiNQ1Gkw8PaKot
         iBcZAu4Ff/T/y5E+sLGNdFpyguJWSfGecZWqF2r/wO8+eDJdXuTmvxN3w0/dzoAFgwBN
         acukb66yYSHrzUPvJbhoEOUCmx1Fb8w3UoN9bwAEiLNPXKxs2n2/5fJ3e5kAfIqdUz+B
         Leb5IocOzCeqrDKLJrZ9/h+L8Li+2BOXS0Yekq+vTxOqw5L/MxctDCspHhIHp1fbCgBx
         plGQ==
X-Gm-Message-State: AOJu0Yw1AqB7sOq0EUzT87pD9ivDnIPstewKpZRKMe6+2+cvKTY41wTg
	luIHXU68k8ofCSYoIke8Lo7phlOTgBy3UsAMe9bgpxZZhf3/ApC+qepX39qM7L21MeXUHQmd+OF
	PkrZy0pg=
X-Gm-Gg: AR+sD10RH+fJyluiGLmp/3ecEaPd1KQEQ/aPxMfKtJTYxIFyjswRjz62xgsZl9sEWWp
	PSs3cdOvoDl5aTL9P2YnjlzPr8uHC3JmuQjSI9gjM+W1cEWc90o1fioO2TaDOA4SUYvZ0BVtlnV
	JhGBxzbC3MbqdnMLlJ3QbmfwTAPPxmv2hUjr+4CLCV+ypqABmwcBkA+ykfcaJ5kNKXJmRwxBxG3
	OTNBmIOhrLPvxHdD1LKKriVCEC/M4oscHQyXoSmjYl0xbY7VUiHIhdnSJY4QpudT6OKRchEH8fS
	85iZ+L6iZEm44O3KfsNu6vtnCM697tIQO0tSdtFrRztSt/V6WTIMsM5h9vVUCclbUtSjMOBCkNY
	jNtKsNZLPH8qQjymxjnSncy1y5xBPJsSg0HhnY9CqwvMWOBWBDHHRZEUPcKbnbA3m1Ne0vyB4z2
	e+dI3sz+4Cg3Fx1JQmNE3G73pPy2q+Wg==
X-Received: by 2002:a05:600c:1c27:b0:493:aab3:c09c with SMTP id 5b1f17b1804b1-496b5721055mr100605555e9.28.1785134527460;
        Sun, 26 Jul 2026 23:42:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4866813sm229103255e9.8.2026.07.26.23.42.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:42:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] gnupg: upgrade 2.5.20 -> 2.5.21
Date: Mon, 27 Jul 2026 07:41:55 +0100
Message-ID: <20260727064158.3784068-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
References: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242044

2026-07-02  Werner Koch  <wk@gnupg.org>

	Release 2.5.21.
	+ commit 363096d9c9a973ac8dcad8ee4efd479f50add290

2026-06-30  Werner Koch  <wk@gnupg.org>

	speedo: Create a pkgversioninfo.txt file.
	+ commit 8716b4dac4a79b600d18847b8bc0193bd06e1fc1
	* build-aux/mk-sbom.sh: New.  Taken from gpg4win and extended.
	* Makefile.am (EXTRA_DIST): Add it.
	* build-aux/speedo.mk (gnupg_ver_this): Use sed to extract version.
	(gnupg_commit_id): new.
	(00-unpack): Call mk-sbom.sh.
	(clean-pkg-versions: Clear version files.
	($(bdir)/pkgversioninfo.txt): New.
	(all-speedo,installer): Depend on above.
	(dist-source): Exclude autom4te.cache just in case
	* build-aux/speedo/w32/inst.nsi: Install pkgversioninfo.txt.

2026-06-30  NIIBE Yutaka  <gniibe@fsij.org>

	scd: Fix condition to retrieve ATR.
	+ commit ca25a7a61bebbe4e27dd5568c5b049675b7aa4ae
	* scd/app.c (atr_to_cardtype): Call apdu_get_atr when ATR is NULL.

2026-06-29  Werner Koch  <wk@gnupg.org>

	speedo: Fix passing configure args to w32 builds.
	+ commit 7af73849a5dbbc5c70e43c3a3f5d70c639c80ab4
	* build-aux/speedo.mk (pkgcfg): Use correct number of dollar signs.

	common: Prepare to get rid of map_w32_to_errno.
	+ commit bf808091534f587e8cdacf351b0e7ba060165fd8
	* common/sysutils.c (gnupg_w32_set_errno): Use gpgrt function if
	  available.

	agent: Make batch import of Kyber keys work.
	+ commit 4fca79b67bba04bc5ef2a4402e948c01821ceac5
	* agent/command.c (cmd_import_key): Allow --unattended also for
	  composite keys.

2026-06-26  NIIBE Yutaka  <gniibe@fsij.org>

	dirmngr: Add a validation check in get_dns_cert_standard.
	+ commit c3ec7678799a161b9265969e7ad3fd59605b18ab
	* dirmngr/dns-stuff.c (get_dns_cert_standard): Validate the length.

2026-06-19  NIIBE Yutaka  <gniibe@fsij.org>

	build: Update ldap.m4 for POSIX with no LDAP_DEPRECATED.
	+ commit d3822099fdd4d84323afae4bacaadfeab9cb3e27
	* m4/ldap.m4: Check ldap_err2string, instead.

2026-06-18  Werner Koch  <wk@gnupg.org>

	gpgsm: Require a minimum tag length for GCM decryption.
	+ commit 4c7e68cf3d335328821bdbb70db309a60d0e4fd4
	* sm/decrypt.c (gpgsm_decrypt): Require a minimum authtaglen.

2026-06-18  NIIBE Yutaka  <gniibe@fsij.org>

	w32:common: Fix usleep in w32_wait_when_sharing_violation.
	+ commit ab9ce5f5e775a3a6a37923299685ac371f740103
	* common/sysutils.c (w32_wait_when_sharing_violation): WTIME is
	in milliseconds.

2026-06-17  Philip Le  <philip.le@gnupg.com>

	gpg: Fix copy_signature.
	+ commit 56e11ffe971d5cc58185b4e8d02b82dc432c634b
	* g10/free-packet.c (copy_signature): Set the signers_uid of the new
	copy to NULL if it is not present in the source signature.

	gpg: Use the INT_RCP_FPR subpacket in revocation signatures.
	+ commit 9e0e5547d2a008332873a9b632f82f9414ad887f
	* common/openpgpdefs.h (sigsubpkttype_t): Add Intended Recipient
	Fingerprint signature subpacket.
	* g10/build-packet.c (build_sig_subpkt): Build the Intended Recipient
	Fingerprint signature subpacket for v4 and v5 keys.
	* g10/free-packet.c (fre

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...erride-init-is-not-needed-with-gcc-9.patch |  2 +-
 ...-a-custom-value-for-the-location-of-.patch |  6 +--
 ...use-pkgconfig-instead-of-npth-config.patch |  2 +-
 .../gnupg/gnupg/CVE-2026-57062.patch          | 43 -------------------
 .../gnupg/gnupg/relocate.patch                | 18 ++++----
 .../{gnupg_2.5.20.bb => gnupg_2.5.21.bb}      |  3 +-
 6 files changed, 15 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
 rename meta/recipes-support/gnupg/{gnupg_2.5.20.bb => gnupg_2.5.21.bb} (95%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index b48db409704..7a3fa59c543 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 9b7ef8aa1a5d71fc95f36a92874d3faa4579fc4e Mon Sep 17 00:00:00 2001
+From 46db1301b1b71f47aa131b9a3de9d1cf356cf408 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index bfee9c99043..1c7cd7ba7be 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 84a16d46a72a2501cbe3a4a83ea7f8393ada4038 Mon Sep 17 00:00:00 2001
+From fd060f524e50c7c3f8694f71630ac151627235f1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 023604b..c84442c 100644
+index 5ac4d0b..09615c5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1908,7 +1908,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1909,7 +1909,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 90d53674d4e..f4c9b2161aa 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From 0c3a09a95875e5744a910a0d3c93fa2e9dbe8c69 Mon Sep 17 00:00:00 2001
+From b8a99b2d9caa05f54be25635e3b1687753fe7196 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
deleted file mode 100644
index f298b6e9a89..00000000000
--- a/meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d586f50ee849c8cbeaea47b50c64446c1becbf9b Mon Sep 17 00:00:00 2001
-From: Werner Koch <wk@gnupg.org>
-Date: Thu, 18 Jun 2026 10:51:34 +0200
-Subject: [PATCH] gpgsm: Require a minimum tag length for GCM decryption.
-
-* sm/decrypt.c (gpgsm_decrypt): Require a minimum authtaglen.
---
-
-Reported-by: Thai Duong <thai@calif.io>
-This is similar to OpenSSL's
-CVE-id: CVE-2026-34182
-
-CVE: CVE-2026-57062
-Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/4c7e68cf3d335328821bdbb70db309a60d0e4fd4]
-
-Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
----
- sm/decrypt.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/sm/decrypt.c b/sm/decrypt.c
-index 20fb96060..92a33c6e6 100644
---- a/sm/decrypt.c
-+++ b/sm/decrypt.c
-@@ -1447,7 +1447,14 @@ gpgsm_decrypt (ctrl_t ctrl, estream_t in_fp, estream_t out_fp)
-                 }
-               if (DBG_CRYPTO)
-                 log_printhex (authtag, authtaglen, "Authtag ...:");
--              rc = gcry_cipher_checktag (dfparm.hd, authtag, authtaglen);
-+              if (authtaglen < 12)
-+                {
-+                  log_info ("authentication tag is too short (%zu octets)\n",
-+                            authtaglen);
-+                  rc = gpg_error (GPG_ERR_CHECKSUM);
-+                }
-+              else
-+                rc = gcry_cipher_checktag (dfparm.hd, authtag, authtaglen);
-               xfree (authtag);
-               if (rc)
-                 log_error ("data is not authentic: %s\n", gpg_strerror (rc));
--- 
-2.34.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index fedb7f6407d..02f03386ecc 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 8d7658741da050f604bcf26f8a6c24a0b15df94b Mon Sep 17 00:00:00 2001
+From c70694bd3e71cc1fec6ccb3ea0f694c3863ebd48 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index d26ddd9..24224c0 100644
+index 835f0ea..0a67a33 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1451,7 +1451,7 @@ gnupg_socketdir (void)
+@@ -1526,7 +1526,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -25,7 +25,7 @@ index d26ddd9..24224c0 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1480,7 +1480,7 @@ gnupg_sysconfdir (void)
+@@ -1555,7 +1555,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -34,7 +34,7 @@ index d26ddd9..24224c0 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1516,7 +1516,7 @@ gnupg_bindir (void)
+@@ -1591,7 +1591,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -43,7 +43,7 @@ index d26ddd9..24224c0 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1543,7 +1543,7 @@ gnupg_libexecdir (void)
+@@ -1618,7 +1618,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -52,7 +52,7 @@ index d26ddd9..24224c0 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1573,7 +1573,7 @@ gnupg_libdir (void)
+@@ -1648,7 +1648,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -61,7 +61,7 @@ index d26ddd9..24224c0 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1604,7 +1604,7 @@ gnupg_datadir (void)
+@@ -1679,7 +1679,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -70,7 +70,7 @@ index d26ddd9..24224c0 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1636,7 +1636,7 @@ gnupg_localedir (void)
+@@ -1711,7 +1711,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.20.bb b/meta/recipes-support/gnupg/gnupg_2.5.21.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.5.20.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.21.bb
index 4a72d8c8f06..dc77691bbdf 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.21.bb
@@ -20,13 +20,12 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/ftp/gcrypt/gnupg/"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
-           file://CVE-2026-57062.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "6461266e99c308419a379abe6c356d54c214136c4589bd65951091138989ffc6"
+SRC_URI[sha256sum] = "e3af2c8caa46a66a9329fa7c6880af260451914d819595beabc2c26597b31352"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \

