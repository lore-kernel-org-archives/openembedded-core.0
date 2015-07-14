Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0A365D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:56:45 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so16773672wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 07:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ldKH65eFI5dR3wyJz84Q/ISxTGztF6wIkvuHEiYktyg=;
	b=NuGo4Ce7f9GFC6JZ3zM+uAyY0ckFJ8h9IGBVIpc2YuQlaDoDcUOM0gEmOPr/zfg9oq
	v00ofs1ozMPIFwXOql+vAa4yyoAMC8FB1ca6wUJobe4S7+j6+uRt9wYuLKk7Z1b+fAl0
	H2NFPM2wW1QAsa1+S1TclGsI/M2ROnjzU0MEDxBiTi9+YY5MLn09mSt5SphCA7AehgzJ
	VpE/x2OeAlHIkyCveHGQPKlJsuEzqyfvZ8xxaRyUn+K79umgqP9RE7CgJQSPseaeieVv
	0ZBlDEgn2onV4zYoD7dEMhFrY2V3+pUtLlDOBR7kkx/X19wERMmjw8Zzp1iOzd2kCCOQ
	+YEw==
X-Gm-Message-State: ALoCoQkNPfzMQmdI2Uwahx5mqaY2a6oBPa14ZLbsPCg47vhPMbYdOz/MnbQGHdkixG98dY81YbxF
X-Received: by 10.181.12.20 with SMTP id em20mr35258639wid.28.1436885805234;
	Tue, 14 Jul 2015 07:56:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lj14sm3644571wic.18.2015.07.14.07.56.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jul 2015 07:56:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:51:02 +0100
Message-Id: <1436885463-4577-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
References: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 6/7] chkconfig: use explicit directories in obey_variables()
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
X-List-Received-Date: Tue, 14 Jul 2015 14:56:48 -0000

obey_variables() was using relative paths which mean it depends on exactly what
directory it starts in.  To clarify the code, always use absolute paths.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index d285c50..8df87f8 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -36,10 +36,10 @@ EXTRA_OEMAKE = "\
 do_unpack[postfuncs] += "obey_variables"
 do_unpack[vardeps] += "obey_variables"
 obey_variables () {
-	sed -i -e 's,/etc,${sysconfdir},; s,/lib/systemd,${base_libdir}/systemd,' leveldb.h
+	sed -i -e 's,/etc,${sysconfdir},; s,/lib/systemd,${base_libdir}/systemd,' ${S}/leveldb.h
 	sed -i -e 's,/etc/alternatives,${sysconfdir}/alternatives,' \
 	       -e 's,/var/lib/alternatives,${localstatedir}/lib/alternatives,' \
-	       -e 's,/usr/share/locale,${datadir}/locale,' alternatives.c
+	       -e 's,/usr/share/locale,${datadir}/locale,' ${S}/alternatives.c
 }
 
 do_install() {
-- 
2.1.4


