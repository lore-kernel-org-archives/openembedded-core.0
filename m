Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8DF7117C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 19:58:01 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id e89so8871009qgf.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 12:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=bAz2MwZJcV1ZC5+e7vSPo+A42Dsvo1ASbuSjrYQpYyY=;
	b=Quwlh3klpDhUZ80i3n0AHj/NplXltnApaGMmV3yoYOdrH7xsoWhDnSA7B7qLbdOwkt
	nAVJ/hIwrdCLIuFbJeHU+F4nkvGDWWmNImITyDxKUs3S4cETvE1sKnOCIIxkSnF4dy2b
	NeGdOKgYRU8hk1j/pm7zV4ktGWikTi7OUBdswS0CjUgv6F13YuoxeMAEu3BGbr42ymTi
	RixEvv/EhBI5f1ibHIV+IQRDFYnJQtbow4qqJw8AfgXIrtWaRtl33aYjTdbjRs+c9yua
	nMSgPcujvB4/teBOp+4F6sYOItbRQfAi5iNhrZ1HvrYejit06pfX3FCPMpKNimfaeWNX
	K1TQ==
MIME-Version: 1.0
X-Received: by 10.224.8.1 with SMTP id f1mr70325392qaf.89.1409774278229; Wed,
	03 Sep 2014 12:57:58 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Wed, 3 Sep 2014 12:57:58 -0700 (PDT)
Date: Wed, 3 Sep 2014 13:57:58 -0600
Message-ID: <CACS+7ZQq_tHp0vA0FA8e1W+iLhuzEA3tov0B5QGFaUvGp_cgNg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd: Use ${ROOT_HOME} instead of /root
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
X-List-Received-Date: Wed, 03 Sep 2014 19:58:07 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

systemd avoids using nss lookups for the root user, so
naturally it assumes that root's home directory is /root.
In OE that's not the case, and it can lead to long delays when
shutting down due to user shutdown unit failures.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/systemd/systemd_216.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_216.bb
b/meta/recipes-core/systemd/systemd_216.bb
index a7fd71e..e6b79d2 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -97,6 +97,10 @@ do_configure_prepend() {
  cp -r ${S}/units ${S}/units.pre_sed
  fi
  sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
+ sed -i -e 's:"/root":"${ROOT_HOME}":g' \
+        ${S}/src/core/unit-printf.c \
+        ${S}/src/nspawn/nspawn.c \
+        ${S}/src/shared/util.c
  sed -i '/ln --relative --help/d' ${S}/configure.ac
  sed -i -e 's:\$(LN_S) --relative -f:lnr:g' ${S}/Makefile.am
  sed -i -e 's:\$(LN_S) --relative:lnr:g' ${S}/Makefile.am
-- 
1.9.3

