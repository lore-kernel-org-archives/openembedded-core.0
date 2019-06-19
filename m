Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D158C6B519
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:00:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d18so3547013wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 07:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JAYSH0ItRdYEmTdQI1fch0OdrtpGr8wVYvJEwJ5Wx2o=;
	b=C3OpbubCyDoaOYvLruB7VPdxTTBJzVfs2NI7J8xhsFfHECFRXOGnk6fgZDGj1UNp43
	EQoHtexsur26+wQzdTyef7IKqrwv1YT8zJCnp7pECERfzbWir6pOsovOaTE5s0nSvKQ8
	z3q+PpJEO58ly7mrRgZxIKnvhF4tviEyqNTbJ1mcsYeuCl4nIZJBWVvxCOrfSQglrCqL
	2IM3FCSAemDKLM0vmn6LgxlbwC4M+0y1Uk4uT9RBqPy+bJS4LtJALjBBWJezfdDtvoeH
	8A1UXzTeri75HlDFc5S2q+Tr5EAv8ZrbADOWVINecwvxypwDWCkPD0QjNLqTGRT5kVta
	Yq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JAYSH0ItRdYEmTdQI1fch0OdrtpGr8wVYvJEwJ5Wx2o=;
	b=SDykNL7gvvDH/jy7nvrwDmdVGus7278VRzwKzfC9AUNEabXenWlK1BdAGM6rs9JWE6
	uDYVShyYzyNddpQMeCxhnL8reNpdwm3gWBo2jT/Xc7K3eRgcGErmpUuP6dCRAdw31wYz
	aKAS0RgdeS3ebR/NSPwBTtYOtEi+B9xEzq1rE4UDTkKXTBb4i9UUoJQOWxyPZT2hDEi5
	cytb4cNW0eM/6mICnk6DgyTt6dB0UmA3jNJRxGDmmAj7DO8TUhyAhPHlv9333nqtgRYk
	QzQmXuw6v0daMcMdDEFEEei9Hrar8g4aJL66oynos6gx9YFS+z7tNYnWn6G6IsKCRJeQ
	Yldw==
X-Gm-Message-State: APjAAAXvhnum3FDS6gHEiy4o2OOwdS+HgHmxdwTxVgJiGRqnRoelwSoX
	XzGhrwLLJUKdLJBZeZlTyfwuUy/E
X-Google-Smtp-Source: APXvYqw9CSPKsqt7tBGdjc6yKzlObU6kJOWi0XnuIw6OpkYuwgJuX7fENcmYNPV8xMOSb5GcpKaAig==
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr33361266wru.161.1560952821180; 
	Wed, 19 Jun 2019 07:00:21 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	g131sm924905wmf.37.2019.06.19.07.00.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 07:00:20 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:59:40 +0200
Message-Id: <20190619135940.18544-4-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190619135940.18544-1-lemagoup@gmail.com>
References: <20190619135940.18544-1-lemagoup@gmail.com>
Subject: [PATCH 4/4] cve-check: Consider CVE that affects versions with less than operator
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
X-List-Received-Date: Wed, 19 Jun 2019 14:00:21 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

In the NVD json CVE feed, affected versions can be strictly matched to a
version, but they can also be matched with the operator '<='.

Add a new condition in the sqlite query to match affected versions that
are defined with the operator '<='. Then use LooseVersion to discard all
versions that are not relevant.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/classes/cve-check.bbclass | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e7540b8c1f..379f7121cc 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -166,6 +166,7 @@ def check_cves(d, patched_cves):
     Connect to the NVD database and find unpatched cves.
     """
     import ast, csv, tempfile, subprocess, io
+    from distutils.version import LooseVersion
 
     cves_unpatched = []
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
@@ -186,14 +187,25 @@ def check_cves(d, patched_cves):
     conn = sqlite3.connect(db_file)
     c = conn.cursor()
 
-    query = "SELECT * FROM PRODUCTS WHERE PRODUCT IS '%s' AND VERSION IS '%s';"
+    query = """SELECT * FROM PRODUCTS WHERE
+               (PRODUCT IS '{0}' AND VERSION = '{1}' AND OPERATOR IS '=') OR
+               (PRODUCT IS '{0}' AND OPERATOR IS '<=');"""
     for idx in range(len(bpn)):
-        for row in c.execute(query % (bpn[idx],pv)):
+        for row in c.execute(query.format(bpn[idx],pv)):
             cve = row[1]
+            version = row[4]
+
+            try:
+                discardVersion = LooseVersion(version) < LooseVersion(pv)
+            except:
+                discardVersion = True
+
             if pv in cve_whitelist.get(cve,[]):
                 bb.note("%s-%s has been whitelisted for %s" % (bpn[idx], pv, cve))
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
+            elif discardVersion:
+                bb.debug(2, "Do not consider version %s " % (version))
             else:
                 cves_unpatched.append(cve)
                 bb.debug(2, "%s-%s is not patched for %s" % (bpn[idx], pv, cve))
-- 
2.11.0


