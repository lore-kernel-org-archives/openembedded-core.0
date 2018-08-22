Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3993579430
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:37:20 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id q204-v6so3127848oig.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b5b2SaNYiGfnIwykx0E/hhBeM1B8Fmkr9zPcGne88k8=;
	b=tKcX5p9MnEyHJNgITfJfAKla293/WI/inlEVsyVhqg5//eI9IESQHmlovVjEkqsOUm
	i/GFSKS0XYqxVfuDMdAC704I75oJFdAyo7JT1tXU8s+30K2L5qpk6sW6qB0/wiaBJYMo
	w/vARG56Vd3SSFAdBPQofp/O4zi2sOxPFwI7OE9UEMrhrS9TI+cJIFUaBC+IF0CtYFHa
	rrrpSVTRIsy7bklP7tYKq7uMtONIrtNfEcgQ+AY1jbpx0UiA//l23FvHIAMex+R+cSqN
	bQ+xqjG4BF1gQhCXu9Lzk0LIRSlCFH48UpVZkjD0wbWUsdaW7zI66rRjUVmekg1Y2q0w
	3Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b5b2SaNYiGfnIwykx0E/hhBeM1B8Fmkr9zPcGne88k8=;
	b=uEJK6m4sWRlH+knSEXWU+Igt2Qs98KxJjacUrxDcoUx7tfiIwv7NXH55zjmYvggOIx
	IAl5BeUxRWvztPRoPqg4LDCGbWq6u/+O+zboVmpsFiI8NU48kSRpPA8KomvfO2Me6vEm
	4pprIoadH35iqq1NO1+GG2tOfHueaCDbddMu0stP87UL48BhIKQlyjOWJuyOvQrG3aXO
	+ay7FAc68+InWhrMmRDi994hmd1A5Fz3Mc6eevU3Txlc+lL3Ii73DXsV71qR3zfsPKGG
	iR4WS9TYZEISVTIfeyV8WizvRa7FbcfofD5gaVKYvAU8Y5h1pyJetgJ1TXo3PXYKOVpc
	F6WQ==
X-Gm-Message-State: APzg51C8feJmAChGdrNfNfup7eQF5cOIqOUbYobtKzk5eylw8w4u8ISz
	25Y+MR4SE8LAXbve0RjyaBWJg+dMvos=
X-Google-Smtp-Source: ANB0VdYocSgFIj9Bql49D930V+jbMF4Q6eH/om62VTyJoGTyz0Jj6eKnrWuovcaCz7DdSf1MmKWXfw==
X-Received: by 2002:aca:494b:: with SMTP id
	w72-v6mr4044556oia.293.1534945041082; 
	Wed, 22 Aug 2018 06:37:21 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.37.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:37:20 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:39 +0530
Message-Id: <1534944940-21566-33-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 33/34] perl: CVE-2018-12015
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
X-List-Received-Date: Wed, 22 Aug 2018 13:37:20 -0000

Remove existing files before overwriting them

Archive should extract only the latest same-named entry.
Extracted regular file should not be writtent into existing block
device (or any other one).

https://rt.cpan.org/Ticket/Display.html?id=125523

Affects perl <= 5.26.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../perl/perl/CVE-2018-12015.patch                 | 48 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-12015.patch

diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch b/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
new file mode 100644
index 0000000..a2b0109
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
@@ -0,0 +1,48 @@
+From ae65651eab053fc6dc4590dbb863a268215c1fc5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Fri, 8 Jun 2018 11:45:40 +0100
+Subject: [PATCH] [PATCH] Remove existing files before overwriting them
+
+Archive should extract only the latest same-named entry.
+Extracted regular file should not be writtent into existing block
+device (or any other one).
+
+https://rt.cpan.org/Ticket/Display.html?id=125523
+
+CVE: CVE-2018-12015
+Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit/ae65651eab053fc6dc4590dbb863a268215c1fc5]
+
+Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ lib/Archive/Tar.pm | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/Archive/Tar.pm
+index 6244369..a83975f 100644
+--- a/cpan/Archive-Tar/lib/Archive/Tar.pm
++++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
+@@ -845,6 +845,20 @@ sub _extract_file {
+         return;
+     }
+ 
++    ### If a file system already contains a block device with the same name as
++    ### the being extracted regular file, we would write the file's content
++    ### to the block device. So remove the existing file (block device) now.
++    ### If an archive contains multiple same-named entries, the last one
++    ### should replace the previous ones. So remove the old file now.
++    ### If the old entry is a symlink to a file outside of the CWD, the new
++    ### entry would create a file there. This is CVE-2018-12015
++    ### <https://rt.cpan.org/Ticket/Display.html?id=125523>.
++    if (-l $full || -e _) {
++	if (!unlink $full) {
++	    $self->_error( qq[Could not remove old file '$full': $!] );
++	    return;
++	}
++    }
+     if( length $entry->type && $entry->is_file ) {
+         my $fh = IO::File->new;
+         $fh->open( $full, '>' ) or (
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index aec30c8..8dfe34a 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -72,6 +72,7 @@ SRC_URI += " \
         file://CVE-2018-6798-2.patch \
         file://CVE-2018-6797.patch \
         file://CVE-2018-6913.patch \
+        file://CVE-2018-12015.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


