Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W02-0004q6-Bw
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:18 +0200
Received: by iwn10 with SMTP id 10so3431291iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=x3NmweqCfiBJXdM++pSaB9k7WAMW3tlNlvGy4kaUpm4=;
	b=cT2oAibsRKALWwyRDZrjyu19B59ANLoue1LOrhQURteN2GsAqK604RR44mr41HdtiN
	4pDtM82VUCdPsGrJpZkeO52Lm+JRwuWMKmIw7QgblAcEeclziDNgwqOBQXRlK2syIlNG
	YWpkKa7f0xksgppBFuVMP1FEjWjI+GwxhRtyQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HnTWcFgUEU5nwixKn1Q1ortlPHIu0u/WLbdNZSICVALZp1I02Xt1bTZw3eEjWP15Dy
	6Rq1KtMIJJryktlqmWaBFFyTaz65d4f0uCGnf6Zh+DLBthwk667ddz4WH5ka2nXtyojM
	3A/M5outuATHNy2+iQ1c/yAdu7XYBVmPI8t4M=
Received: by 10.231.210.148 with SMTP id gk20mr3499289ibb.110.1301632095747;
	Thu, 31 Mar 2011 21:28:15 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u9sm1182593ibe.19.2011.03.31.21.28.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:06 -0700
Message-Id: <f1158ee9070ba8cbf1b6388e1af2906046548684.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 01/46] sanity.bbclass: Use SSTATE_MANIFESTS instead of hard coding sstate-control
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 04:30:18 -0000

This helps when SSTATE_MANIFESTS is overridden by external layers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 639e1ea..500a1b2 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -321,7 +321,7 @@ def check_sanity(e):
             messages = messages + "Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n"
         elif abi == "5" and current_abi == "6":
             bb.note("Converting staging layout from version 5 to layout version 6")
-            os.system(bb.data.expand("mv ${TMPDIR}/pstagelogs ${TMPDIR}/sstate-control", e.data))
+            os.system(bb.data.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}", e.data))
             f = file(abifile, "w")
             f.write(current_abi)
         elif (abi != current_abi):
-- 
1.7.4.1



