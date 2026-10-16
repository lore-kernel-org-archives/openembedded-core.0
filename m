Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F079CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:37:44 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13985.1792121859155516438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VYJ0LpFD;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8766; q=dns/txt;
  s=iport01; t=1792121859; x=1793331459;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V7kBbMYt+97o5Xhnfmm4eO0MGWfwMK42Kf7vVBGcEJA=;
  b=VYJ0LpFDymd2o8vPR0vfCilP85lyGSN4M6utEFF5hrUVMQuxnin+lGwd
   Gav/Nwiu2ahRhahujP+/pUDKpB5zb6fMUXAquDg8nYPSoiy1SZVkr9QFZ
   /3GNkXJCcUtjgwdolQ0FmnevCbIozwFQi8wy5glbiBa7XGdcuhYeIPDYr
   VuW0ZErvK8K6G88kDB6PGDKloMx7j1z4QILgDyYtNbWexKoHXehxjAUA/
   TmIkTmQywkWvUwRUMSLAmrjAmK33wgZ8kDzPeZIZ5dT0NAggsvM0LpXFU
   Xpgl/hQ1WbNsX/elLXOnvalC9WwSKLQokzG4BVc2dmdAOcxya7hcU72t5
   g==;
X-CSE-ConnectionGUID: +X2iEcJbSbyV03SX+4OOjA==
X-CSE-MsgGUID: 04zGwua5SxaaqvzWUv6VEw==
X-IPAS-Result: =?us-ascii?q?A0BFAgCzm9Fq/4v/Ja1aHgEBCxIMggULgld1YENJlkqeH?=
 =?us-ascii?q?4F+DwEBAQ9EDQQBAYUFjhcCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEqCwEYAS0sAwECWiMhGoJoAYJ0AxG8dYF5M4EBg?=
 =?us-ascii?q?ykBgVTbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoEUAYE7gi6BBYFcAoIGhh8Eg?=
 =?us-ascii?q?iJ6EoFaHogbjQ5IgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSC?=
 =?us-ascii?q?QETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSEx6CXgdTK?=
 =?us-ascii?q?BMBExiBEVcBFAEPH5M3CJAVgiGhDwoog3aMIpU6GjOqbwuYfY4KiQ+MQ32Ea?=
 =?us-ascii?q?YFoPIFZcBWDIglKGQ+OLgsLg2AzhB3KCicyAgEIMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:T97N3qlVoip+LuQtFdLLKnjo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCzuEO//ZYTP2LYtzaYS/9ktX6sOHzoVmG1RopHtnQ1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fc4ooOdaCkNEz
 vYJFmhWVSDA28WRwpvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIeOJIXbGJkJxy50o
 Eqeo3bWHQwTaeePwDOc7GCTu/GRow7kDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:yZn3kKsHeSOFSd6xAVswGbbG7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:+RyNPGAFmejX4bb6E2pXrk85EeIvSXfM8i+LGH/7VUFOSpTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A4UOmcg/E/VbWp4rjohteG2CQf5808YuxFUlQqoU?=
 =?us-ascii?q?PstCaJxNNJWmjoSviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536195441"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:37:26 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id BB667180000F5;
	Fri, 16 Oct 2026 03:37:26 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 6316DCC1611; Thu, 15 Oct 2026 20:37:26 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-105841
Date: Thu, 15 Oct 2026 20:37:24 -0700
Message-Id: <20261016033726.426908-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247906

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec96121215bd
[2] https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-os-command-injection-via-lrz-pipe-mode

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch | 267 ++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |   1 +
 2 files changed, 268 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
new file mode 100644
index 00000000000..268218fb8a6
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
@@ -0,0 +1,267 @@
+From 9eef71ce20fda2b345ef8431359aec96121215bd Mon Sep 17 00:00:00 2001
+From: Uwe Ohse at akiar <uwe@ohse.de>
+Date: Mon, 10 Aug 2026 17:55:28 +0200
+Subject: [PATCH] remove topipe 'feature'
+
+CVE: CVE-2026-105841
+Upstream-Status: Backport [https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec96121215bd]
+
+Backport Changes:
+- Retained sys2() and exec2() and their declarations because 0.12.20
+  still calls them in its separate, opt-in ZCOMMAND handling. Removing
+  them as upstream does causes undefined references when linking lrz.
+- Omitted NEWS because its 0.13.0 release-note hunk conflicts with the
+  0.12.20 release history and is not needed for the security fix.
+
+(cherry picked from commit 9eef71ce20fda2b345ef8431359aec96121215bd)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/lrz.c | 193 ++++++++++++++++++++++--------------------------------
+ 1 file changed, 79 insertions(+), 114 deletions(-)
+
+diff --git a/src/lrz.c b/src/lrz.c
+index ae3c62d..9c08a3d 100644
+--- a/src/lrz.c
++++ b/src/lrz.c
+@@ -76,7 +76,6 @@ int skip_if_not_found;
+ char *Pathname;
+ const char *program_name;		/* the name by which we were called */
+ 
+-int Topipe=0;
+ int MakeLCPathname=TRUE;	/* make received pathname lower case */
+ int Verbose=0;
+ int Quiet=0;		/* overrides logic that would otherwise set verbose */
+@@ -803,9 +802,6 @@ fubar:
+ 			shortname ? shortname : "no.name", protname());
+ #endif
+ 	canit(STDOUT_FILENO);
+-	if (Topipe && fout) {
+-		pclose(fout);  return ERROR;
+-	}
+ 	if (fout)
+ 		fclose(fout);
+ 
+@@ -1286,111 +1282,89 @@ procheader(char *name, struct zm_fileinfo *zi)
+ 	if (!zmodem_requested && MakeLCPathname && !IsAnyLower(name_static)
+ 	  && !(zi->mode&UNIXFILE))
+ 		uncaps(name_static);
+-	if (Topipe > 0) {
+-		if (Pathname)
+-			free(Pathname);
+-		Pathname=malloc((PATH_MAX)*2);
+-		if (!Pathname)
+-			error(1,0,_("out of memory"));
+-		sprintf(Pathname, "%s %s", program_name+2, name_static);
+-		if (Verbose) {
+-			vstringf("%s: %s %s\n",
+-				_("Topipe"),
+-				Pathname, Thisbinary?"BIN":"ASCII");
+-		}
+-		if ((fout=popen(Pathname, "w")) == NULL)
+-			return ERROR;
+-	} else {
+-		if (protocol==ZM_XMODEM)
+-			/* we don't have the filename yet */
+-			return OK; /* dummy */
+-		if (Pathname)
+-			free(Pathname);
+-		Pathname=malloc((PATH_MAX)*2);
+-		if (!Pathname)
+-			error(1,0,_("out of memory"));
+-		strcpy(Pathname, name_static);
+-		if (Verbose) {
+-			/* overwrite the "waiting to receive" line */
+-			vstring("\r                                                                     \r");
+-			vstringf(_("Receiving: %s\n"), name_static);
+-		}
+-		checkpath(name_static);
+-		if (Nflag)
+-		{
+-			/* cast because we might not have a prototyp for strdup :-/ */
+-			free(name_static);
+-			name_static=(char *) strdup("/dev/null");
+-			if (!name_static)
+-			{
+-				fprintf(stderr,"%s: %s\n", program_name, _("out of memory"));
+-				exit(1);
+-			}
+-		}
+-#ifdef OMEN
+-		/* looks like a security hole -- uwe */
+-		if (name_static[0] == '!' || name_static[0] == '|') {
+-			if ( !(fout = popen(name_static+1, "w"))) {
+-				return ERROR;
+-			}
+-			Topipe = -1;  return(OK);
+-		}
+-#endif
+-		if (Thisbinary && zconv==ZCRESUM) {
+-			struct stat st;
+-			fout = fopen(name_static, "r+");
+-			if (fout && 0==fstat(fileno(fout),&st))
+-			{
+-				int can_resume=TRUE;
+-				if (zmanag==ZF1_ZMCRC) {
+-					int r=do_crc_check(fout,zi->bytes_total,st.st_size);
+-					if (r==ERROR) {
+-						fclose(fout);
+-						return ZFERR;
+-					}
+-					if (r==ZCRC_DIFFERS) {
+-						can_resume=FALSE;
+-					}
+-				}
+-				if ((unsigned long)st.st_size > zi->bytes_total) {
+-					can_resume=FALSE;
+-				}
+-				/* retransfer whole blocks */
+-				zi->bytes_skipped = st.st_size & ~(1023);
+-				if (can_resume) {
+-					if (fseek(fout, (long) zi->bytes_skipped, SEEK_SET)) {
+-						fclose(fout);
+-						return ZFERR;
+-					}
+-				}
+-				else
+-					zi->bytes_skipped=0; /* resume impossible, file has changed */
+-				goto buffer_it;
+-			}
+-			zi->bytes_skipped=0;
+-			if (fout)
+-				fclose(fout);
+-		}
+-		fout = fopen(name_static, openmode);
++
++        if (protocol==ZM_XMODEM)
++                /* we don't have the filename yet */
++                return OK; /* dummy */
++        if (Pathname)
++                free(Pathname);
++        Pathname=malloc((PATH_MAX)*2);
++        if (!Pathname)
++                error(1,0,_("out of memory"));
++        strcpy(Pathname, name_static);
++        if (Verbose) {
++                /* overwrite the "waiting to receive" line */
++                vstring("\r                                                                     \r");
++                vstringf(_("Receiving: %s\n"), name_static);
++        }
++        checkpath(name_static);
++        if (Nflag)
++        {
++                /* cast because we might not have a prototyp for strdup :-/ */
++                free(name_static);
++                name_static=(char *) strdup("/dev/null");
++                if (!name_static)
++                {
++                        fprintf(stderr,"%s: %s\n", program_name, _("out of memory"));
++                        exit(1);
++                }
++        }
++
++        if (Thisbinary && zconv==ZCRESUM) {
++                struct stat st;
++                fout = fopen(name_static, "r+");
++                if (fout && 0==fstat(fileno(fout),&st))
++                {
++                        int can_resume=TRUE;
++                        if (zmanag==ZF1_ZMCRC) {
++                                int r=do_crc_check(fout,zi->bytes_total,st.st_size);
++                                if (r==ERROR) {
++                                        fclose(fout);
++                                        return ZFERR;
++                                }
++                                if (r==ZCRC_DIFFERS) {
++                                        can_resume=FALSE;
++                                }
++                        }
++                        if ((unsigned long)st.st_size > zi->bytes_total) {
++                                can_resume=FALSE;
++                        }
++                        /* retransfer whole blocks */
++                        zi->bytes_skipped = st.st_size & ~(1023);
++                        if (can_resume) {
++                                if (fseek(fout, (long) zi->bytes_skipped, SEEK_SET)) {
++                                        fclose(fout);
++                                        return ZFERR;
++                                }
++                        }
++                        else
++                                zi->bytes_skipped=0; /* resume impossible, file has changed */
++                        goto buffer_it;
++                }
++                zi->bytes_skipped=0;
++                if (fout)
++                        fclose(fout);
++        }
++        fout = fopen(name_static, openmode);
+ #ifdef ENABLE_MKDIR
+-		if ( !fout && Restricted < 2) {
+-			if (make_dirs(name_static))
+-				fout = fopen(name_static, openmode);
+-		}
++        if ( !fout && Restricted < 2) {
++                if (make_dirs(name_static))
++                        fout = fopen(name_static, openmode);
++        }
+ #endif
+-		if ( !fout)
+-		{
++        if ( !fout)
++        {
+ #ifdef ENABLE_SYSLOG
+-			int e=errno;
++                int e=errno;
+ #endif
+-			zpfatal(_("cannot open %s"), name_static);
+-			DO_SYSLOG((LOG_ERR,"%s: cannot open: %s",
+-				protname(),strerror(e)));
+-			return ERROR;
+-		}
+-	}
++                zpfatal(_("cannot open %s"), name_static);
++                DO_SYSLOG((LOG_ERR,"%s: cannot open: %s",
++                        protname(),strerror(e)));
++                return ERROR;
++        }
++
+ buffer_it:
+-	if (Topipe == 0) {
++	{
+ 		static char *s=NULL;
+ 		static size_t last_length=0;
+ #if defined(F_GETFD) && defined(F_SETFD) && defined(O_SYNC)
+@@ -1550,8 +1524,7 @@ report(int sct)
+ }
+ 
+ /*
+- * If called as [-][dir/../]vrzCOMMAND set Verbose to 1
+- * If called as [-][dir/../]rzCOMMAND set the pipe flag
++ * If called as [-][dir/../]vrz set Verbose to 1
+  * If called as rb use YMODEM protocol
+  */
+ static void
+@@ -1576,8 +1549,6 @@ chkinvok(const char *s)
+ 		protocol=ZM_XMODEM;
+ 	if (s[0]=='r' && (s[1]=='b' || s[1]=='y'))
+ 		protocol=ZM_YMODEM;
+-	if (s[2] && protocol!=ZM_XMODEM)
+-		Topipe = 1;
+ }
+ 
+ /*
+@@ -2207,12 +2178,6 @@ static int
+ closeit(struct zm_fileinfo *zi)
+ {
+ 	int ret;
+-	if (Topipe) {
+-		if (pclose(fout)) {
+-			return ERROR;
+-		}
+-		return OK;
+-	}
+ 	if (in_tcpsync) {
+ 		rewind(fout);
+ 		if (!fgets(tcp_buf,sizeof(tcp_buf),fout)) {
+-- 
+2.35.6
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 042cf7fbaca..403266743e0 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://0001-Fix-cross-compilation-using-autoconf-detected-AR.patch \
            file://0001-Fix-build-with-GCC-15.patch \
            file://0001-lrzsz-convert-K-R-function-definitions-to-ANSI-C-pro.patch \
+           file://CVE-2026-105841.patch \
            "
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
 
-- 
2.35.6


