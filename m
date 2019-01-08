Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 31C007BFAA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 22:13:18 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id p6so4162026lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 14:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=mhBeHXKPzlWaK7Dv/mxHM6CKWQ3Ie7NwwwwsWa2efYk=;
	b=czV6qp2dMnwcmM44YhO6MFy0PqOI+ZxZTTAT81eI+b+uRCQ7Lvl5mlriHdUThuN7Oz
	uFr8k63XjUgyhB8nOoSTmJJr5pxZDZ/LfPD3lJHDglGvaJBCbzliqNuhwNfDVDzQjkhO
	tio+uX6hwBdXWmkl6bTb1J+PAzcKkj5Bem1YXe2/1qHOFxqOg4zw6Umog1imwDcpwSVk
	h3F3Wr7Us0gUkr/4MuRyu28u6WnoRrmNJ98sB7ybcCnXuVqM0oXKU4M9hXLXnP96LDOW
	4niBAgNz7HAu5sUPyYSesz0Ya4e69/QkeqagZBu49kk+y5nagT2MXK/LdbR+Gr+Jy35T
	7Ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mhBeHXKPzlWaK7Dv/mxHM6CKWQ3Ie7NwwwwsWa2efYk=;
	b=XGmdKsa3+ZxKEtlZWgOPXUkPY8SAIN42G4HAQJiKa5+A2twn/7CvMhlsQWGqBVO/g/
	uSX+Sb9K/RaaEX6zoQk+KZuyeK8oXde5CXXUlpRf6f0yQjqJk0Zii0Eop/1ah7C1JiUL
	48987AKIVLEohqOymTiIMA+2XEC6+kRpPgH/uw0rF1inVInab0ewLKceisFgB2IF2CiU
	HM/UtpzIFiD+Q9FpXAqp8NeUygV0RhhXMpLOQow1gQQzv4a1LaZbptRV+MdJihvUsiRI
	dhoiH5j6wpySdWT+Xz/l6vCW0y5q5KhfL6jEcIPwB52UtMfZa0I0kNWYUUB9MaiBFgSO
	lyRg==
X-Gm-Message-State: AJcUukcQJs8kwWHz1Z17NZ3ULqk4CKR0U9sZ4TCjBlZ1v1DKs0JrkAaI
	YAzxcPF0fCBuSJhv54ReMtkZpAW8Wn0=
X-Google-Smtp-Source: ALg8bN4M/zYM38hjd2dtyJs5ieMYGd/LLplNW8C6Ur36cRIxPA+F/2VnYvYmJ7syiRWDW6jLK9a/+A==
X-Received: by 2002:a19:5059:: with SMTP id z25mr2005495lfj.120.1546985598419; 
	Tue, 08 Jan 2019 14:13:18 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	q8-v6sm14745540lji.69.2019.01.08.14.13.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 14:13:17 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 23:13:01 +0100
Message-Id: <20190108221301.13352-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2] package.bbclass: Sort FILES_INFO by key
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
X-List-Received-Date: Tue, 08 Jan 2019 22:13:18 -0000

Observing depsig.do_package for a package inbetween rebuilds indicated
that FILES_INFO was changing content order randomly. Force it to be
deterministic by sorting with respect to the keys when serializing.

Suggested-by: Joshua Watt <jpewhacker@gmail.com>
Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0fe9576b4d..322c4ec77f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1438,7 +1438,7 @@ fi
             if fstat.st_ino not in seen:
                 seen.add(fstat.st_ino)
                 total_size += fstat.st_size
-        d.setVar('FILES_INFO', json.dumps(files))
+        d.setVar('FILES_INFO', json.dumps(files, sort_keys=True))
 
         subdata_file = pkgdatadir + "/runtime/%s" % pkg
         sf = open(subdata_file, 'w')
-- 
2.11.0


