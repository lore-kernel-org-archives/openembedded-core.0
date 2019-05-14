Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5068E7DEA7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:12 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z3so7940219pgp.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oX7yI3Htksusv1XzaLD0zgUAZ9GbK8jc80frYgO9vTc=;
	b=Q6bsv3tc3bvQSUVlUx9dr2jHmnK1GRoKfClZsm23DAsRwhMOus9wrByEF45ykYGS3O
	KzX3qhk1kK3IImNizHMjEUqxlI3QBtqIOHc+0zsvyF/oSlSYwBx1P+iUMrR2HzIbb6DJ
	sMAHpKFaGI78XMliPonVtFRZmwQ47NweAPtmtiy6BwieMRN/e6exqJMRZ/brz1f2v/qB
	lcAUBwGcJvioq1RhmpJEtjg6eYn7aFOSIK2VDT9GCP1hXwrPu2aCieTN6jIFxLm0dK0j
	C8hzCVbMWXrMkWq4AfKyVYz1+10THmxedy+kO6nSy4gHBAx3ctx3X/wGOTRd6O/sSRTk
	9TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oX7yI3Htksusv1XzaLD0zgUAZ9GbK8jc80frYgO9vTc=;
	b=t4KprQcx0KTZ25vTGnUJ+UHRSoBC8hqAlL4yxgAg15B2T4kfyWp2X10+jdnSnmrG12
	PjUJQPvvE4pgwxP/1+sOSqlSU04G+IgI5gbCkF+x10+4COG68cBaExO+XJntgIa8j5Cq
	I481x3X3q4Ff01XBqpFmlrX1bb+KusyepPEERc5umTnMYZq9qAWyYeaMlPv7otEikCw/
	6Myweho3GOqf6jqgSF4nOecndgAn7hb9jhM2H3lrg9DgYR7PMbSVRoEKEDmsimIrfF4C
	x/KtWAd8uAErYKJ57Qs+IbTrv+41bswVRPLIfe5ufRF56BESMVlMHdsbrytNwmaPRe9y
	SRyg==
X-Gm-Message-State: APjAAAWd7ko445sfUtqX6dC80a+tMVPGi5zDca9zUj9wrXFWgSj7yvSi
	nKQJ2DAeZ9xa/+ROKFw5wphy93md
X-Google-Smtp-Source: APXvYqw9YGeONk/cbDDEDQ8HBADf1VClB+eIYieKxKkSrGqHUt74LaQtw6pe0yA3GpJajhZJuZU9wA==
X-Received: by 2002:a63:ce43:: with SMTP id r3mr17821738pgi.368.1557809653379; 
	Mon, 13 May 2019 21:54:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:46 -0700
Message-Id: <0da5f86e05ff63e9362cc9b216c7e6007c0de26f.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 04/23] go: Exclude vcs files when installing deps
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
X-List-Received-Date: Tue, 14 May 2019 04:54:12 -0000

From: Alex Kiernan <alex.kiernan@gmail.com>

Because our clones use the host git, on (say) Ubuntu 18.04, the local
git directories acquire perl scripts such as fsmonitor-watchman.sample.
During packaging, this leads to failures:

  ERROR: go-hsperfdata-1.0.3+gitAUTOINC+b58598ac84-r0 do_package_qa: QA Issue: /usr/lib/go/pkg/dep/sources/https---github.com-nsf-termbox--go/.git/hooks/fsmonitor-watchman.sample contained in package go-hsperfdata-staticdev requires /usr/bin/perl, but no providers found in RDEPENDS_go-hsperfdata-staticdev? [file-rdeps]
  ERROR: go-hsperfdata-1.0.3+gitAUTOINC+b58598ac84-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
  ERROR: go-hsperfdata-1.0.3+gitAUTOINC+b58598ac84-r0 do_package_qa:
  ERROR: go-hsperfdata-1.0.3+gitAUTOINC+b58598ac84-r0 do_package_qa: Function failed: do_package_qa

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 7f5e8b9..b6d9372 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -130,7 +130,7 @@ go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
 	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
-	tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
+	tar -C ${B} -cf - --exclude-vcs pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
 
 	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
 		install -d ${D}${bindir}
-- 
2.7.4


