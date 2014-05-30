Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 33E6065E05
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 21:39:47 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id a108so7007748qge.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 14:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=7Nqexa5VGy3w2wSBZCjDzqmLqZXp3cRd6cd7wwa/x6s=;
	b=bQvfz8oneclKDS7xTbg4r90opiGuYc7bsJvQnmnAZKg68UK/R2qSQZoecARvhba5MV
	hPAmNNMBDkP4vnmjpr0WCIrldO1IkpFe9My9YAMHYTAjaOQq+NXY+6I47mRtXKEqcmYJ
	jX4tVSVl8kEQIfYjedz/rO68SHii11CbEeqNwEFblvL4h6xvRBIZ9HyOjFMdMu4f3Bcx
	2Amx1kjHrVxH8dVu7x8U86ZuDdJJAobnV0NpVa2kjXfnHvofeSojnS4yx32Swjqdn6tm
	zi8HCYaEtLOebQSuwJ1VO1E29BLmKscYF6mXOnGaF/rMPA7NRSJwsDfRwIxvYsGYGXgu
	qMnw==
MIME-Version: 1.0
X-Received: by 10.140.20.144 with SMTP id 16mr23987391qgj.114.1401485988173;
	Fri, 30 May 2014 14:39:48 -0700 (PDT)
Received: by 10.96.84.232 with HTTP; Fri, 30 May 2014 14:39:48 -0700 (PDT)
Date: Fri, 30 May 2014 15:39:48 -0600
Message-ID: <CACS+7ZSNrb+Q7NkPpd3rz17ky6=DAuQY2mo0iF-2Mc9cUUxgeQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] gzip: Avoid host contamination during build
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
X-List-Received-Date: Fri, 30 May 2014 21:39:49 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

On systems with /bin and /usr/bin merged the gzip recipe may find grep
in /usr/bin, while OE puts it in /bin. Force the recipe to find grep in
the correct place.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-extended/gzip/gzip.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gzip/gzip.inc
b/meta/recipes-extended/gzip/gzip.inc
index 920b256..5f0a5ca 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -12,6 +12,8 @@ SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"

 inherit autotools texinfo

+EXTRA_OEMAKE_class-target = "GREP=${base_bindir}/grep"
+
 do_install_append () {
  # Rename and move files into /bin (FHS), which is typical place for gzip
  install -d ${D}${base_bindir}
-- 
1.9.3

