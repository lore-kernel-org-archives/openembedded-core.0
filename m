Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id B4E6160745
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 03:48:42 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id w104so60632956qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 19:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8rS2oinFZ53DcUNVOscinpnSYTJ/BZQe1wOJ3NqgNJk=;
	b=doHkVht7at77O552iRWlVFnQ6u5Vzshjes9AxEYJK+n45X23fK+XanmM8VKcRfZROz
	ItVpQMJIw0ILIGU05KdgUSE+whxSXx2yGlpZFpT328/rkqE7VvTucTwCo1o81DMV9V4L
	bFOvNFSXSTzeJ7gitAwt9tFAN7hLRx87RrNn8zeWVYVuguvoN0KNMBd7Vh2M0W5gOLIq
	edEyHMYKdjnrxMcinSWFbO0mw9j1Nm4SdbHkgCRZIZAaWxGyOsFv5QmXd01iIIkpJVtr
	gPOig7CneUCZO1hq9nEFWeLpPvXFeGZkoF2L6VYcb9LF1Cprw3wY7Z/Hn1wqsD0M8lKu
	nyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8rS2oinFZ53DcUNVOscinpnSYTJ/BZQe1wOJ3NqgNJk=;
	b=BgtvyWvacqa2bnOWZ/eBYe9blHbBgHyw1ByaFSHjcX0P3YudCZpu+fYk8ZnxAh6hYN
	v2TmgSHG19ySok1xsclSzkuhv5ci1eNRuAZCpu1b2/eBYenQGJmhqV1KSCiNkYcFLwSd
	h8d0CiT6wIS0SCpvUdsSN5wucHZ+D/uyvDHAiglVIFDVWtchLMEWG/sqq/hEesGWo3I7
	dtdVar2E3bjdyVgL1AQpWYzdjXLU8+DgoKMvQ7ejSnA0YlgqEesZKWB3dW96+VCEsKTO
	iryMwRolJdHVFLkGu7WS98vLQ3xmjYbE+4n3GDFPBR6yV9Quz24SXKow8aP2i7LXKOx/
	r0VA==
X-Gm-Message-State: AD7BkJKRUGBmLj7tdfgetqEHNwWsD/adV5YVEA2dJryYlJG8A6F6KINATtWHz21PjFwJvw==
X-Received: by 10.140.32.100 with SMTP id g91mr1393579qgg.47.1457581722693;
	Wed, 09 Mar 2016 19:48:42 -0800 (PST)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id i67sm877991qhi.45.2016.03.09.19.48.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 19:48:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 03:48:32 +0000
Message-Id: <1457581712-10673-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] valgrind: Make dep on glibc-utils conditional on TCLIBC = glibc
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
X-List-Received-Date: Thu, 10 Mar 2016 03:48:42 -0000

This helps with building valgrind for non-glibc systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 7e23240..e8a2357 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -64,7 +64,8 @@ RDEPENDS_${PN} += "perl"
 # redirect functions like strlen.
 RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 
-RDEPENDS_${PN}-ptest += " sed perl glibc-utils perl-module-file-glob"
+RDEPENDS_${PN}-ptest += " sed perl perl-module-file-glob"
+RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
 # One of the tests contains a bogus interpreter path on purpose, and QA
 # check complains about it
-- 
1.8.3.1


