Received: from mailrelay-egress7.pub.mailoutpod3-cph3.one.com (mailrelay-egress7.pub.mailoutpod3-cph3.one.com [46.30.211.246])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6726.1793974438879136550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=G51YpzFJ;
 dkim=pass header.i=@berginkonsult.se header.s=ed1 header.b=tU7r3wHM;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.246, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793974437; x=1794579237;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=cAPZ3TGXSltwERcdvmK2/c/l1XdAXl6fUfP35q1rDb0=;
	b=G51YpzFJl9nvpqyxz92VQPNl70LaN7QoZyqLFA6V+fzKL8LUvdqdSprKPwb+r0IQlqTcjNsjMGA8M
	 CsP4WvCsghpc8ZPXr6ZrLsplnWAKbzcx1LzbnM/7lyKXvgY5r9csOWWVAtp0XoeMFpcuvU7Ak4sYbB
	 eTr/gF2vfgcbuSDYZ7xSccWJJM7PEh2ueqWNhpmAF+mRnySFWbvPr6D9OStucV6d0FL6hKcY7jyyV7
	 vSU2gx/zVjYTe2a8NbNgzfssn54sVVbTjSb1Wy64iOsAutraiMOLcF+s2mlbp/v0TavUnX8JjbFG2b
	 2hEtxSsgnowz8f3VPsM116KZ4eGNF8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793974437; x=1794579237;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=cAPZ3TGXSltwERcdvmK2/c/l1XdAXl6fUfP35q1rDb0=;
	b=tU7r3wHM9zo2/ZTB1Rr+dmr41Ea6BHXiPo+aDiReV4te2gfl0/0IBVly3ulxFLwGc2rYNi7/0wL4z
	 aHbJnWyDQ==
X-HalOne-ID: 4d8391bb-d9ec-11f1-8920-1b46ed53ce32
Received: from pbkserver2.metrum.local (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 4d8391bb-d9ec-11f1-8920-1b46ed53ce32;
	Fri, 06 Nov 2026 14:13:57 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH 1/2] useradd.bbclass: create shadow files before useradd on ipk/deb rootfs
Date: Fri,  6 Nov 2026 15:13:47 +0100
Message-ID: <20261106141348.2757557-2-peter@berginkonsult.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106141348.2757557-1-peter@berginkonsult.se>
References: <20261106141348.2757557-1-peter@berginkonsult.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249652
Content-Type: text/plain; charset="utf-8"

There was a difference in the user/group setting for different package
backends. The reason behind is the timing when shadow files are created
that is different for rpm and ipk/deb. opkg and dpkg run all preinsts
before any postinst, so useradd/groupadd run before shadow's pkg_postinst
has created /etc/shadow and /etc/gshadow with pwconv/grpconv. The later
pwconv then gives --system users password aging from login.defs, and grpconv
copies the "x" that groupadd puts in /etc/group into /etc/gshadow. With rpm,
shadow's postinst runs first, so the same accounts get no aging and "!",
as useradd/groupadd intend.

Solution is to run pwconv/grpconv in the preinst when the files are missing
so all backends give the same result. Wait until login.defs is unpacked, as
apt only orders unpacking by Pre-Depends, so base-passwd users still get
their aging defaults. This also makes useradd/usermod -e/-f work on
ipk/deb, as they require shadow files. Recipe sysroots (UA_SYSROOT) are
left as they are.

[YOCTO #14139]

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/classes/useradd.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index ca6462edd0..185cb65d6e 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -37,6 +37,17 @@ if test "x$D" != "x"; then
 		cp $D${sysconfdir}/login.defs.dpkg-new $D${sysconfdir}/login.defs
 	fi
 
+	# opkg/dpkg run preinsts before shadow's postinst has run pwconv/grpconv
+	if test "x$UA_SYSROOT" = "x" -a -e $D${sysconfdir}/login.defs; then
+		# image rootfs only; on deb, packages unpacked before shadow keep the old behaviour
+		if [ ! -e $D${sysconfdir}/shadow ]; then
+			pwconv --root $D || exit 1
+		fi
+		if [ ! -e $D${sysconfdir}/gshadow ]; then
+			grpconv --root $D || exit 1
+		fi
+	fi
+
 	# user/group lookups should match useradd/groupadd --prefix
 	export PSEUDO_PASSWD="$SYSROOT"
 fi
