Return-Path: <danismostlikely@gmail.com>
X-Greylist: delayed 356 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 23:44:03 UTC
Received: from mail-qg0-f48.google.com (unknown [209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id AEE546B15C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 23:44:03 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id i50so15712393qgf.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 16:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=VPrdZNXtm4w6Vqt0Gt8+jBvvi4eIPuNAje60l6RjktQ=;
	b=rZ5+8dg1TkaKXdQVT5vR0iKLGNz8tvEGNCdV6Vg/D5RF8iETVqklvCsYu3/8Ab/DbK
	eUcISLOWuGJPCnOcpZadODV5ezsXeXdJs8cjcvllrmZNSvSD3TBW0mCg/GCDftgBXiM2
	yqDHZWYtt3s796YKfGYOTF8tP5gz4fN1Kef+xOsAXPR6vy/AztY2rQDprQq2EsP6GwCC
	wRWGTpFdDLrsph1Qh/IRiJDqvLy2G/oyXo3GQlSmQNC79sHxDBSRbnmMsImGp+7q5GO1
	qEexY397zwG/RPiO9D+pJpfVWRPLqmilSgiPpK9OcjU02oinera6h9P4ErsBaOo07UK2
	oC6A==
MIME-Version: 1.0
X-Received: by 10.224.56.5 with SMTP id w5mr47062597qag.60.1401233888147; Tue,
	27 May 2014 16:38:08 -0700 (PDT)
Received: by 10.96.84.232 with HTTP; Tue, 27 May 2014 16:38:08 -0700 (PDT)
Date: Tue, 27 May 2014 17:38:08 -0600
Message-ID: <CACS+7ZSGKFG06F_jFOJZu7FJqLh2F+FgkW30PSMRQ8Xdio51Qw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] gzip: Avoid host contamination during build
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
X-List-Received-Date: Tue, 27 May 2014 23:44:05 -0000
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
index 920b256..57873cb 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -12,6 +12,8 @@ SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"

 inherit autotools texinfo

+EXTRA_OEMAKE = "GREP=${base_bindir}/grep"
+
 do_install_append () {
  # Rename and move files into /bin (FHS), which is typical place for gzip
  install -d ${D}${base_bindir}
-- 
1.9.3

