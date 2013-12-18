Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1DEF960D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:20:14 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id y10so7630624wgg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 08:20:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hRhhbw+FOTXWK1z9zycVDSkzpRDqoObIjYoFcw4jMIg=;
	b=m+UsE027jDT0txmJYfq7H9GZGkPxM9/O7wAhRkh1slbr4xXveVh4blygr2oPS2tQw1
	35Gi0YE0OfRl4AnbgJcmZlURT0O2bewPnjKh5Wyn1ZlPouyvbgIJFmmf9v79zYE2PfmP
	Gz4JpL1imRK+gv8GZVEBleWt16gj/eJC6jQR2/i+pyOD0YlO0IlPLjufe34KXKwLYU+q
	R2lUelSBdE0ZATR4Mx8paFOSXHhiTcwyHlLF70vRSKO1Wu71Dz9L02cF+BexBUaWQ6/y
	kmXrAaYZuERQbOnG08iH4xNPcXMGNQDkH8pu7kVC/o5wsRJF0l42pZalMz++PUOEJlN7
	07QA==
X-Gm-Message-State: ALoCoQmf3KswOwClVWNhDg4+3pT2Ms4VqqjB3ONYJRYMupuDa2BycjQIT1MF+NSfybGoED6MUKXM
X-Received: by 10.194.89.97 with SMTP id bn1mr24968008wjb.18.1387383614913;
	Wed, 18 Dec 2013 08:20:14 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm2179947wij.7.2013.12.18.08.20.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Dec 2013 08:20:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2013 16:20:03 +0000
Message-Id: <1387383607-4005-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1387383607-4005-1-git-send-email-ross.burton@intel.com>
References: <1387383607-4005-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/6] buildhistory: be quiet when garbage collecting the git repo
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
X-List-Received-Date: Wed, 18 Dec 2013 16:20:15 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/buildhistory.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3590da0..e9a9c3b 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -534,7 +534,7 @@ END
 			for entry in `echo "$repostatus" | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
 				git commit $entry metadata-revs -m "$entry: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" -m "cmd: $CMDLINE" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 			done
-			git gc --auto
+			git gc --auto --quiet
 			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
 				git push -q ${BUILDHISTORY_PUSH_REPO}
 			fi
-- 
1.7.10.4


