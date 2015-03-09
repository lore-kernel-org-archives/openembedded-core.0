Return-Path: <Rob.Woolley@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 692A4739AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 23:53:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t29Nr4k0001277
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Mar 2015 16:53:04 -0700 (PDT)
Received: from yow-rwoolley-lx.wrs.com (128.224.20.140) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 9 Mar 2015 16:53:03 -0700
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2015 19:52:58 -0400
Message-ID: <1425945178-14806-4-git-send-email-rob.woolley@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1425945178-14806-1-git-send-email-rob.woolley@windriver.com>
References: <1425945178-14806-1-git-send-email-rob.woolley@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] logrotate: Identify CONFFILES
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
X-List-Received-Date: Mon, 09 Mar 2015 23:53:05 -0000
Content-Type: text/plain

Some package formats explicitly track which files are configuration files
so that they are not overwritten on updates. We must use an explicit list
instead of a wildcard as logrotate also provides files under ${sysconfdir}
that are not configuration files.

Signed-off by: Rob Woolley <rob.woolley@windriver.com>
diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.8.bb b/meta/recipes-extended/logrotate/logrotate_3.8.8.bb
index 00432de..e3cfa90 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.8.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.8.bb
@@ -27,6 +27,9 @@ PACKAGECONFIG ?= "\
 PACKAGECONFIG[acl] = ",,acl"
 PACKAGECONFIG[selinux] = ",,libselinux"
 
+CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status \
+		    ${sysconfdir}/logrotate.conf"
+
 # If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
 # optimization variables, so use it rather than EXTRA_CFLAGS.
 EXTRA_OEMAKE = "\

