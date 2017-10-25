Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D31B71B1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 04:55:10 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id j3so16380262pga.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 21:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=znHp/oyUQz5x6GGAG+QqxeDW+2iZRMfDiW6eSQyrrK0=;
	b=GO426jBmKQBqGkrNwDWMJg5pM5ZU0oz/xsDHAAeZ88B/tVUf6XfI81QFBI3BtR8BL5
	lno+m7AJ98wNX9mv/EPkLIgLGX814YnsH9DdkHDujMBqWnM1H1Y5ONa1Qva1lgAfzBnu
	zSDD7umLDvF/114n8sBVScVizU0zix5GRumSIZPKILtLYp6ZXzgyyaxxxVSdV++xnI9x
	GolzkbJOOq7rNsQZY5aOC4oNrfGdLXT8szDka8507a0jJEWURj+4TjMXgffj/mO9K/o2
	inFUhTGw3K7biEW4qC9g3LtSfLxN+DmXTQhq86vRZCw0fwp1N/Gk2ksm9hVHpjdV4HMP
	Oq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=znHp/oyUQz5x6GGAG+QqxeDW+2iZRMfDiW6eSQyrrK0=;
	b=WKlRTdaFtyIAB4pWuC+BVUfH6tQFybKcNUjX5u8uXE8fRNC2mQDGLH1lTujTehhVlt
	ERt3gcUNJhNZzRXXL2SRHbAQPrco9cMPLYIy9OBtwDviqGd8tu82FRjGzdvoyDxQKDFz
	/ut+JLtFQzdihaGsOSVyrLZyccL/uxC7kKChm3ZyIxYlA5gLkmbFvxF9fZYW6QXI3nmI
	I56eSaFENaBbbtJgbv2Emcl0loPo/XCFaKchrMJWfInifrHcxYNy02x+ZXidsuaq5OLT
	E8W4G+MPcF/Gy5TI9Vkl8w0Z6OqTf1Ek4f9LPYX1AYCSx/VrptR5vIGvVJx8QJ4C826K
	bzQg==
X-Gm-Message-State: AMCzsaX0pqGKdPLqsW4MO9Nb6Cu+yGz9KwZZywDwvuBqzBgNbcrDlySh
	71QUzDPQi7H77EzTjpKfZWWceQ==
X-Google-Smtp-Source: ABhQp+QiOkwXVucsF6i48bDo2U3ZkEdUHOwx0fcp9Ipyb5fF2R1hVcVertJyzcMgLo+ABTS4sdBSaA==
X-Received: by 10.99.123.84 with SMTP id k20mr904202pgn.444.1508907311503;
	Tue, 24 Oct 2017 21:55:11 -0700 (PDT)
Received: from e6520.gateway.sonic.net
	(173-228-90-28.dsl.dynamic.fusionbroadband.com. [173.228.90.28])
	by smtp.gmail.com with ESMTPSA id
	q13sm3214084pfi.166.2017.10.24.21.55.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Oct 2017 21:55:10 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Oct 2017 21:55:04 -0700
Message-Id: <1508907304-24381-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] package_ipk.bbclass: handle only whitespace in PACKAGE_EXCLUDE
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
X-List-Received-Date: Wed, 25 Oct 2017 04:55:10 -0000

If PACKAGE_EXCLUDE is constructed using _append then it's possible
that the final value will contain only a space. Currently that
results in build failures due to an invalid opkg command line.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 8439cda..6c1fdaa 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -12,7 +12,7 @@ OPKGBUILDCMD ??= "opkg-build"
 
 OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
-OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE') or "").split())][(d.getVar("PACKAGE_EXCLUDE") or "") != ""]}"
+OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE') or "").split())][(d.getVar("PACKAGE_EXCLUDE") or "").strip() != ""]}"
 
 OPKGLIBDIR = "${localstatedir}/lib"
 
-- 
1.9.1


