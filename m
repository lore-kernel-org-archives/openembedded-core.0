Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9721C77E94
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 02:33:46 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id l6so3549468iti.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 19:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uoAlrkMsu9PN+x3ycYX/jjz5UdKF9iVUoiwi1nPiO/s=;
	b=J2WSfR9vsOxlNZ0oq3HRle//NUC8DN1cqk4+As0B8mAVykwO98kX/0Ag7jSgjzVi/T
	awnDJ1ikYuW2DDG7TSKkWbr2d3UfNdfLWF42k1SeND4ajAj4iZTkrh1jvqPebAhrJcku
	lcl3S/mrycPqYiacoFYx6XZ/3QcgaRJB6QECkqSN/IiIYn4Lnthec+lhaNyNPgMKaAYs
	1+3xE2G4RwjhNwN1D3VUcUBrdC0kIyMWeAiASUwgDnGhDeu+T4ZEIyz8Wfv4zae6JHld
	XGvowU0MnaBURHK43D/CbY7EHEcJguLZ5rx0Zniunw7xLciBHP+ZlTkjo3EUHkiA2bsJ
	+Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uoAlrkMsu9PN+x3ycYX/jjz5UdKF9iVUoiwi1nPiO/s=;
	b=SYu50DF6H7WT+TArKpXmNOpVI9Fnj95mL2LIIkAC1Ff4DqRw1HjPO84oDj0XSyJPb0
	4ruhMq/KRSTpcxhrMikWtR1rpsjW+cO/r2rI8ftxqMemJ1eWuaXfMTjduEFAvf9QkWBX
	BzqLfaRPKOtKqOrMl5paVWXoOgHxfa49h884Ovpe3drQLS4cEoeUv/YhdepEwAaiai0X
	V3ug6lQXGdtPn8W8UVBr4LMMbIcrRr8V6Vo/lOYNx1L48yqxMn2woaE9ZnnYvKwU0A/H
	zOL26234Eih57e7hO3IZtkX8CvL1HiLXDD0yKjoQuXuAJaC3RbyuCmaDxQKRInH4VNv2
	Q2oQ==
X-Gm-Message-State: AODbwcC1wQeEDmFt/wbeY2aZnKfIEHnUXj3+gCzAcGx51uJKjVrYnQX7
	Jb2bzNnxY9vEp6sKNLQ=
X-Received: by 10.36.57.137 with SMTP id l131mr15922034ita.61.1496716427977;
	Mon, 05 Jun 2017 19:33:47 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id
	w65sm5719020ita.21.2017.06.05.19.33.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jun 2017 19:33:46 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jun 2017 21:33:42 -0500
Message-Id: <20170606023342.7209-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.4
Subject: [pyro][PATCH] archiver: Escape recipe name in regex
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
X-List-Received-Date: Tue, 06 Jun 2017 02:33:47 -0000

From: Joshua Watt <jpewhacker@gmail.com>

The recipe name needs to be escaped when using it in a regular expression so
that and special characters are treated literally

(From OE-Core rev: 53c8cceb744adda1bf899d62071d11b20a5dea98)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/archiver.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 2c04557..9cc9fb5 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -349,8 +349,8 @@ python do_ar_recipe () {
     bbappend_files = d.getVar('BBINCLUDED').split()
     # If recipe name is aa, we need to match files like aa.bbappend and aa_1.1.bbappend
     # Files like aa1.bbappend or aa1_1.1.bbappend must be excluded.
-    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" %pn)
-    bbappend_re1 = re.compile( r".*/%s\.bbappend$" %pn)
+    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" % re.escape(pn))
+    bbappend_re1 = re.compile( r".*/%s\.bbappend$" % re.escape(pn))
     for file in bbappend_files:
         if bbappend_re.match(file) or bbappend_re1.match(file):
             shutil.copy(file, outdir)
-- 
2.9.4


