Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158FECD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 12:11:43 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89945.1781352695085861124
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 05:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm2 header.b=DKXd7EG9;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=KpeClTJm;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.153, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1A27E1400082;
	Sat, 13 Jun 2026 08:11:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 13 Jun 2026 08:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1781352694; x=
	1781439094; bh=9zlbaCFO5j07hcerDwbaC7Z7aSQlF/jcdp+LDOkgYl0=; b=D
	KXd7EG9oUFH6NCoUiw1vMq0INGgFAb3RXwdKPnFg6J1ctpF1MSs5gHu0I7pExnYE
	bkTq5J174g9qebzvOnm9XzmAvaag9I6nXX9sVE0EsE91QRQQO1FdztJkoqnuRMeT
	X4DgrXwTVeFHZloeOa94gQDW+gZxLzcgSVtawNMpPBLXYmJpsPuxz5VCkQKIPKhk
	oufbXhB4fVyQsR3g6P0n3guHk34wEgrbCY0O7R0Spaf8xCS2edi0F5KDiLflmmUl
	7vf+lujvOsQOLk4mKqDvBQQQtOUfeCJk3pMyb3xk9vIaKxCSCRDnxpgBH1nQp7eE
	OuafXuHkgco2M6ropCVNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781352694; x=1781439094; bh=9zlbaCFO5j07hcerDwbaC7Z7aSQl
	F/jcdp+LDOkgYl0=; b=KpeClTJm2agGCKdZbrdJXtvbpWK4rQHR2ojD9ORr2tCh
	fVuyaTqkmeJijjJXSDoHTtZ8Ek11o6sMUS5XDnhb5/rNd0zzCDHMspHHODoPkFkO
	c6yUmne+JY6xZDYjqDBTGlgLtoUiU1QhF4CMvIBE/HaOBV9FDbYsZhu2hOt+PaUF
	lYDEZ8jxbBgsJic83i8fxpvVfHx9AsjhqOnYY7gdWOcSbqx+AgGkfjKlgA1tv+n6
	Md+biKS2GvNDYBcruxXA15SVSK6uE2M7Pjba6EtvwJGVpLBIFQ0OzZqfCs6GrZW2
	7DCNmnuP7wdzegXO6TP6c/UPn3G4cattu+NgOhLypQ==
X-ME-Sender: <xms:9UgtaptGoofdp9IGZolQaBgs95tbcide4NOiwu-OpFO2zIx96fhdMA>
    <xme:9Ugtaofx_uRIBt6QTttbc7y2Ggnd4vhmT7eiQt4_5NRmeelgka1JXWFHF33Uzwh5_
    rgXeUpVPbErXZJXMAotqL_HG0IJV5V249JXz0Vy4EJxLChC1p4qDg>
X-ME-Received: <xmr:9UgtaqYWSXxUsb4S8FjQyZCQkm7lIooNs_nb-_CsLFUtfpHvNxP2JdlWsTg4b5oIiJdg_w>
X-ME-Proxy-Cause: dmFkZTFD6J9Lw0yofr0qTA0oszvBoaBEJ1+dVlt+VxtlaOIDs8Hgp3LS+aJj/Z+tq2P1/R
    7akNh5WcJ8scaombqsFM+MmcAYjyDDbN8Gprxn4vWznMdLiOb2RDDzdwi9VTX1IhVm9MmR
    5nC8WnEXGzFAzD9UvD726CAfHi6tQzZvRTBxYR0pxrPSC5T9LJBRJwDbHZeaC8EaEh5r6U
    8Tc0LM08cxV+c9G5dMvEq+vgco5GGVoFd6i8n8qwUzalCXbnuttpwcWAmSNGvipXIoDT65
    wwmSeYPB4oibpesByBrYCTCh0djkEkiAF2QELcSsc3blX3Ls+ZwnkRahQ1YpdclgbYJza0
    ZN/tSsnwNBHoHJZ0lMq3FESpejfPn0bFFwT0/3Pnl5PzGtUYKWT4PTneAC/zXuJMGFWQoS
    cdamp18PgOj/2wslTMC6cjdLJ+ApbBzjqLpvILNr1IV4SDPNUbhhJ1pewODhqDCJhqM0vN
    ytT4eFjIHr29hMIj4vCqN7wPhzwMCD4U0M6p6pM+q6LYk7tOuQnZXLGyMyoydfwbbX3ou1
    kQOnM8uoJ4Upong2Z3Zo/URAlusLNOpcL/Y9OiZ0uIpcilyc+d/5HTZzYHvTdXGmcLs+i4
    FqY9qsdCOgILayh4LvjqAaTa7MGrFYExGIUY/nl3bUpba7Cv+3vA7uqwLFvQ
X-ME-Proxy: <xmx:9UgtarURWpLbk_omhnsE3DmmP2Y7uS5MtFkJa1dsWcjTSzAGqB4Qxw>
    <xmx:9Ugtasil5G5WRL-uQi9SrJ-W-SmYR-5D7Mt9Gl4JY42F8JULuKPw3g>
    <xmx:9UgtapUxRIaEHLV53_i69vXiaFdZ-1NbsfyIp7Fr25IajS92ClpU4g>
    <xmx:9UgtajOthTYg6rI-jej-GsDhh_abNQFByn36Q4Jwn4_YJz2kTZmtcA>
    <xmx:9kgtahRyaSnpOOlnlIDDKq02bQWcAkZ2hCFbSxdX6LIT46MSxvCrKGCy>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jun 2026 08:11:33 -0400 (EDT)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Sat, 13 Jun 2026 15:11:26 +0300
Subject: [PATCH] devtool: provide explicit error for missing "script"
 command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-script-command-not-found-v1-1-5c5f6742a6fa@schnwalter.eu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsFNKegr0cFsqz2koRWB9Pek2
 8xhJkPiKJygrzJEviVJ8EWorsBt1q+MMheHRjWtakljclGOE13Yd+tn9OHEJVyFyDBZPXFnSEH
 Jj8iLPP96GN/3A0xa9j9qAAAA
X-Change-ID: 20260613-script-command-not-found-14e1a3be7410
To: openembedded-core@lists.openembedded.org
Cc: Walter Werner Schneider <contact@schnwalter.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781352692; l=1445;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=TJk91j2B45YX26tqc5mEMvl8sUDymTqXJwF6+sNnp6Q=;
 b=LvkT8wWX0rCt69j3fU2/VnOpz/y6iaZrAWZ7Ddl0nsUBb/hhRKTuQazELH7ErcUl/q4TPDQlP
 tP8KblKoJ+/A3+iJ0ittnFPEO9zJ1kDbgyYRXPLhcye7d7U8TsG8nXx
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 12:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238678

Without this "script" command, the "devtool build" provides a very
ambigous error: `/bin/sh: line 1: script: command not found`. With this
patch we provide a more detailed error.

On Fedora 43 the "script" command is not present by default, one needs
to install the "util-linux-script" package. On other systems it's in a
different package.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
 scripts/lib/devtool/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index f47f57c465..58b02eb460 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -42,6 +42,9 @@ def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
         init_prefix = ''
     if watch:
         if sys.stdout.isatty():
+            import shutil
+            if not shutil.which('script'):
+                raise DevtoolError('The util-linux "script" command was not found')
             # Fool bitbake into thinking it's outputting to a terminal (because it is, indirectly)
             cmd = 'script -e -q -c "%s" /dev/null' % cmd
         return exec_watch('%s%s' % (init_prefix, cmd), **options)

---
base-commit: dcaea329458c741f47560d51732e3d9c88f3d5b4
change-id: 20260613-script-command-not-found-14e1a3be7410

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


