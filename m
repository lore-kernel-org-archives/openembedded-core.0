Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 724846007C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 11:37:40 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id x55so7990369wes.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 03:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iaCD5gp7c00dkrpHS11ndCoNraVvBsywpwRZ4arZskU=;
	b=KtvlW86ik29x4BCdI+HLPGHLyUxLU/COmUSfPjTG2PTrfY7Y3irill5bFgwH0OXF/r
	p+BkP/+bcMn6F7gZx4k3m8V17cQiCAa41bwMCt2qnUX9I6Ptlnt/Kd6NO0K9io/r2E8f
	tWnVbXXbZiA2s4sXePoaAzTARCtIgzFrEnMiWkxulyKfjgKuvsWYIU/N0TwPbKoMytWF
	mKBgBZOlBR4LazAve6IEez/wERuqosCUWbvlE3/dJlh5Fc1TdJczTIC5b6K+Y+Y6Uppz
	MmG2Vprdzqus+vCuNWEgW16FYOX9S/Ci3MKY+zAqYPMm147hFHqQialHnY4YlLmum/g3
	hVTA==
X-Gm-Message-State: ALoCoQl6x9hnZXYCssuROb8OWSwsLCeVDvB2N7p043w1cf/HL7OlGPi9cFUO+QQLe5mZ9GGD0ywc
X-Received: by 10.194.92.7 with SMTP id ci7mr1396290wjb.58.1390304260916;
	Tue, 21 Jan 2014 03:37:40 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k10sm7236797wjf.11.2014.01.21.03.37.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 03:37:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 11:37:36 +0000
Message-Id: <1390304257-32484-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] cmake.bbclass: fix note when warning about deprecated variables
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
X-List-Received-Date: Tue, 21 Jan 2014 11:37:41 -0000

The note issues when OECMAKE_BUILDPATH and OECMAKE_SOURCEPATH were being used
stated that an in-tree build would be done, but the default is in fact an
out-of-tree build.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 7ff9984..c9c15f3 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -66,7 +66,7 @@ addtask generate_toolchain_file after do_patch before do_configure
 
 cmake_do_configure() {
 	if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
-		bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH. This recipe now will do in-tree builds, to do out-of-tree builds set S and B."
+		bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
 	fi
 
 	if [ "${S}" != "${B}" ]; then
-- 
1.7.10.4


