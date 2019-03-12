Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 24CE87C3A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 20:07:30 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id m12so3439388edv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 13:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aSwNxGA1bv4QZI3TpHlKPfOHvFZesZjlum3B5Oq8jqc=;
	b=M2yMgsJQYoBL+AYREF5VOdI46W27fJpPxpexfVyiSGyiYYB7uwLRIoiGYq+USxHz4M
	NfBIht9ibt7J4GmpBBpf7zMQzHZKFcpuxiMxrhtuIa6KWiQp5V9nKO/WlaiMf9aMakS6
	FLzVoK1F3nb/Pt11kBJ2tRy3rCS4H8yko+rngWGVkUpVwrUbTmHj51w1QMcErYaUAVx0
	ZX17P1T+xcYKBrZvo+3XsLhm8v/bZ3wpcQarlRrq7Yez2t7wzE+cI9bllpDzrjHWCWlR
	Rgmkc8zEimlSza98HXR1+0fLkAJ9jJ4YuBaBtlntPM+0YakyFGvgseEvkWPoHMlmZyvG
	J27A==
X-Gm-Message-State: APjAAAXZvBpEXnpDW7+gxNOkzghuJ0J+5uJxk18uS6VPG1AtRNFEP5Fr
	7fqYw+xZes94zNHqGQ/2qtJny8E=
X-Google-Smtp-Source: APXvYqzThOP6zZO8l8SEczsEc9VBDZAru76xskrOcr6gnWpc4UfbJ44HZmf9IvcwiJW2sb9aE1PBOw==
X-Received: by 2002:a17:906:70d6:: with SMTP id
	g22mr27171699ejk.215.1552421250271; 
	Tue, 12 Mar 2019 13:07:30 -0700 (PDT)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-8115-DDFA-B95A-8656-E3E2.dyn6.twc.com.
	[2606:a000:1401:8115:ddfa:b95a:8656:e3e2])
	by smtp.gmail.com with ESMTPSA id
	e11sm3879621eja.54.2019.03.12.13.07.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Mar 2019 13:07:29 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2019 16:07:21 -0400
Message-Id: <1552421242-18570-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552421242-18570-1-git-send-email-trini@konsulko.com>
References: <1552421242-18570-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 2/3] inetutils: Handle rsh, etc more consistently
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
X-List-Received-Date: Tue, 12 Mar 2019 20:07:30 -0000

- We cannot build rsh, rshd, rlogind and rcp on musl.  This is handled
  gracefully in the configure scripts and spelled out with EXTRA_OECONF.
  Expand this to include rexec to cover all of the related functionality.
- Rework adding in the xinetd.d files for these services to only do so
  when we even have the services being built.  This leads to no rsh/rshd
  sub-packages on musl at all.
- If we use the normal alternatives mechanism to allow for this or
  netkit-rsh to provide rsh/rshd functionality we end up with QA issues
  on musl as we have unused ALTERNATIVES logic.  Switch to making use of
  RPROVIDES / RCONFLICTS logic instead and make it match the netkit-rsh
  packaging names.

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 .../inetutils/inetutils_1.9.4.bb                   | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 4a00e2b71d9b..c71b6787e819 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -49,7 +49,7 @@ EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         --enable-rpath=no \
 "
 
-EXTRA_OECONF_append_libc-musl = " --disable-rsh --disable-rcp --disable-rlogin "
+EXTRA_OECONF_append_libc-musl = " --disable-rsh --disable-rcp --disable-rlogin --disable-rexec --disable-rexecd"
 
 do_configure_prepend () {
     export HELP2MAN='true'
@@ -70,21 +70,23 @@ do_install_append () {
     mv ${D}${libexecdir}/syslogd ${D}${base_sbindir}/
     mv ${D}${libexecdir}/tftpd ${D}${sbindir}/in.tftpd
     mv ${D}${libexecdir}/telnetd ${D}${sbindir}/in.telnetd
-    mv ${D}${libexecdir}/rexecd ${D}${sbindir}/in.rexecd
+    if [ -e ${D}${libexecdir}/rexecd ]; then
+        mv ${D}${libexecdir}/rexecd ${D}${sbindir}/in.rexecd
+        cp ${WORKDIR}/rexec.xinetd.inetutils ${D}/${sysconfdir}/xinetd.d/rexec
+    fi
     if [ -e ${D}${libexecdir}/rlogind ]; then
         mv ${D}${libexecdir}/rlogind ${D}${sbindir}/in.rlogind
+        cp ${WORKDIR}/rlogin.xinetd.inetutils ${D}/${sysconfdir}/xinetd.d/rlogin
     fi
     if [ -e ${D}${libexecdir}/rshd ]; then
         mv ${D}${libexecdir}/rshd ${D}${sbindir}/in.rshd
+        cp ${WORKDIR}/rsh.xinetd.inetutils ${D}/${sysconfdir}/xinetd.d/rsh
     fi
     if [ -e ${D}${libexecdir}/talkd ]; then
         mv ${D}${libexecdir}/talkd ${D}${sbindir}/in.talkd
     fi
     mv ${D}${libexecdir}/uucpd ${D}${sbindir}/in.uucpd
     mv ${D}${libexecdir}/* ${D}${bindir}/
-    cp ${WORKDIR}/rexec.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rexec
-    cp ${WORKDIR}/rlogin.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rlogin
-    cp ${WORKDIR}/rsh.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rsh
     cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/telnet
     cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tftpd
 
@@ -130,15 +132,6 @@ ALTERNATIVE_${PN}-telnetd = "telnetd"
 ALTERNATIVE_LINK_NAME[telnetd] = "${sbindir}/telnetd"
 ALTERNATIVE_TARGET[telnetd] = "${sbindir}/in.telnetd"
 
-ALTERNATIVE_${PN}-rsh = "rcp rexec rlogin rsh"
-ALTERNATIVE_${PN}-rshd = "rshd rexecd rlogind"
-ALTERNATIVE_LINK_NAME[rshd] = "${sbindir}/rshd"
-ALTERNATIVE_TARGET[rshd] = "${sbindir}/in.rshd"
-ALTERNATIVE_LINK_NAME[rexecd] = "${sbindir}/rexecd"
-ALTERNATIVE_TARGET[rexecd] = "${sbindir}/in.rexecd"
-ALTERNATIVE_LINK_NAME[rlogind] = "${sbindir}/rlogind"
-ALTERNATIVE_TARGET[rlogind] = "${sbindir}/in.rlogind"
-
 ALTERNATIVE_${PN}-inetd= "inetd"
 ALTERNATIVE_${PN}-traceroute = "traceroute"
 
@@ -176,13 +169,20 @@ FILES_${PN}-ftp = "${bindir}/ftp.${BPN}"
 
 FILES_${PN}-tftp = "${bindir}/tftp.${BPN}"
 FILES_${PN}-telnet = "${bindir}/telnet.${BPN}"
-FILES_${PN}-rsh = "${bindir}/rsh.${BPN} ${bindir}/rlogin.${BPN} ${bindir}/rexec.${BPN} ${bindir}/rcp.${BPN}"
+
+# We make us of RCONFLICTS / RPROVIDES here rather than using the normal
+# alternatives method as this leads to packaging QA issues when using
+# musl as that library does not provide what these applications need to
+# build.
+FILES_${PN}-rsh = "${bindir}/rsh ${bindir}/rlogin ${bindir}/rexec ${bindir}/rcp"
+RCONFLICTS_${PN}-rsh += "netkit-rsh-client"
+RPROVIDES_${PN}-rsh = "rsh"
 
 FILES_${PN}-rshd = "${sbindir}/in.rshd ${sbindir}/in.rlogind ${sbindir}/in.rexecd \
                     ${sysconfdir}/xinetd.d/rsh ${sysconfdir}/xinetd.d/rlogin ${sysconfdir}/xinetd.d/rexec"
 FILES_${PN}-rshd-dbg = "${sbindir}/.debug/in.rshd ${sbindir}/.debug/in.rlogind ${sbindir}/.debug/in.rexecd"
 RDEPENDS_${PN}-rshd += "xinetd tcp-wrappers"
-RCONFLICTS_${PN}-rshd += "netkit-rshd"
+RCONFLICTS_${PN}-rshd += "netkit-rshd-server"
 RPROVIDES_${PN}-rshd = "rshd"
 
 FILES_${PN}-ftpd = "${bindir}/ftpd.${BPN}"
-- 
2.7.4


