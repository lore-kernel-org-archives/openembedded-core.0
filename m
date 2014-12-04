Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id E818C72200
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 14:21:43 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so28005535wiv.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 06:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CGg7RKFj9imqPlVn+FtWtU2e7BHygsZofdzFKIsG/aY=;
	b=hywjl3SM8FX3avKJ6H3OODmslXZZ//MmUnzmeTB1C+aLiC43FkER+rnBRnTMfOKiv3
	1/bhxQjhDDeO44+JZsDMAHE9yUVblPRp+nM/n/5ZtDp3bZ/lnTRoM+dwPDlitb3G6+IV
	B0F7eYRQDq/WcvyuCV6by9zNROwnkrrA6cXp0/lNIj2rgEplSRt1kbsZWtGrGBeRCKEu
	OWcARGNsGmpFaF9JGIzXd+XMES7hElRD3NnQUVT7jc1wkmVmV+cU5o9RgUkQL2mmXSRO
	CbmlwGEXGcYz/3waNu2C/EQZq+n7KPEA8DwTvIdrca0MNf2BLBr4T8po+lHco8gDXfKi
	q5Ig==
X-Gm-Message-State: ALoCoQlsdwHYbJAPuibLEUNtFJTB6qdrP4LZJ4AdpAAgBa0OseB6uwMAc3D7wKrlLPz2LS80KfGn
X-Received: by 10.180.186.40 with SMTP id fh8mr22203221wic.40.1417702903918;
	Thu, 04 Dec 2014 06:21:43 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	pl1sm25499820wic.16.2014.12.04.06.21.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 06:21:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 14:21:08 +0000
Message-Id: <1417702870-27012-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1417702870-27012-1-git-send-email-ross.burton@intel.com>
References: <1417702870-27012-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] autotools.bbclass: respect CLEANBROKEN
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
X-List-Received-Date: Thu, 04 Dec 2014 14:21:50 -0000

autotools.bbclass should respect CLEANBROKEN as it invokes 'make clean' on
configure.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/autotools.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index bed8a83..ca04e79 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -110,7 +110,7 @@ autotools_preconfigure() {
 				# At least remove the .la files since automake won't automatically
 				# regenerate them even if CFLAGS/LDFLAGS are different
 				cd ${S}
-				if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
+				if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile -o -e makefile -o -e GNUmakefile \) ]; then
 					${MAKE} clean
 				fi
 				find ${S} -name \*.la -delete
-- 
1.7.10.4


