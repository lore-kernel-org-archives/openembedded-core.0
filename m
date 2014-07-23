Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 28DA465D5F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:35:51 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so1923591wes.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 15:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/lfj3rlW30g895e+iaPFPstB7y0lQ3t4ZCJt2P1Ozkk=;
	b=k3KFVlJyjWWbUbg2CQQHFMVLPi/1mh7nB/aJnGHuktirTfeuaYrXtbunqjXrMstU8C
	OPNDP7q2yKBp7fHzVL9DoqYBMVfb7qjukB6iULMiaJaVYrkGlrvhnb8wX0Qa9IEpY8/n
	lufyhhjMdGgmc0yq70FMbJGiN+U55Kug0pmpUmAwNsCsX9gAK7BCJ2T5PoBfOVepvEez
	ZPeEG3w2rwCqUNetuRhXNlVH2nA6hr4skivTutW7k6WSodJQg98fMasu82kzX2IR5SpR
	AX5HcJqvk/mx/5qhl1IPsThYH+/cyiQzk4GLSHuM3gK6OeH0pc9VXwkKRfV30475Qftv
	hPPg==
X-Gm-Message-State: ALoCoQn3ntOgIWeVQJckT7rl6N9XZhEb62pe8V/xKUYDyoS8VDKyB/igR6Ey8cQlyMLG0nA1O3tv
X-Received: by 10.180.7.230 with SMTP id m6mr7125117wia.3.1406154952570;
	Wed, 23 Jul 2014 15:35:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fs17sm10025970wjc.6.2014.07.23.15.35.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 15:35:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 23:35:42 +0100
Message-Id: <1406154942-15571-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] debian.bbclass: inherit package
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
X-List-Received-Date: Wed, 23 Jul 2014 22:36:01 -0000

This class defines a package_name_hook implementation but as EXPORT_FUNCTIONS is
order-dependent it needs to inherit package.bbclass first to ensure that the
"base" definition in there is defined first, otherwise with a suitable inherit
order of debian and then a packaging class can result in the stub
package_name_hook being incorrectly used.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/debian.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index d7ea151..1ddb56f 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -8,6 +8,9 @@
 #
 # Better expressed as ensure all RDEPENDS package before we package
 # This means we can't have circular RDEPENDS/RRECOMMENDS
+
+inherit package
+
 DEBIANRDEP = "do_packagedata"
 do_package_write_ipk[rdeptask] = "${DEBIANRDEP}"
 do_package_write_deb[rdeptask] = "${DEBIANRDEP}"
-- 
1.7.10.4


