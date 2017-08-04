Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 73CD3600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 16:27:02 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id m85so24038074wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Aug 2017 09:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KqyN75i8e7DdKTaKUhM+IIhUqoqC09ZgkxN8Z3ALGjI=;
	b=k6XWVNoddlRIwXMiz3tUC6Y62fhETyRG3HGquxvOhFHgKjG/KmhXLLY+1tf182uAF7
	Wz23d1nV17HdIVtTFJZkRxXPKyXCS25mGZE/1DTMDZhIQwnTZYrU7GFP3XoFryHeB094
	O1ARXjTgOizXRi1ucnTnS/OM9sGa6ILQBolBKIjim8ov0GLT3dLTUF4aP76TPygCkJjL
	C8khs49vxs4Jjq68dVSJer5A/rg4uCBLR0E7imHVuVzFjlgXoKzf1etn74Ao7fP+QsAg
	0I8s7X0C+A1n+yYhFGl6jv3gqO632MxySbLtuTtJZjOe41nRawJKqh7EOGaskctNUrvl
	ggxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KqyN75i8e7DdKTaKUhM+IIhUqoqC09ZgkxN8Z3ALGjI=;
	b=Vgg+ABpBDkhDwI2P38PVdD3+mRZklkL6J+crK77PrHXvgNPwBH+UTl2kEttgo7m1OW
	Q95cyPrCbEvGM3gz6fnvvUMu/qlJDIiXQ0velUsID8Lvb1cXnlbHvVXl/u8l/155rD7v
	YU2toF9geMqxasZxCh+h/Bb9jc6L5P7w2k8NW0Wxkwj8weRZWv4iGRnFOLQqCDmyfP75
	ayNyC1ZjNyWDoa203yUA8h854egQXLCRTjjpeBeALPImpAVmF6chd/tj9mFhLWgo18Oz
	2JqJ+bXeS839ZGT27uIaufJT1/tDwKHS4HwhzoBiDrUlC9C9hlLlFJQ4W0gyj2UfAU34
	xlEA==
X-Gm-Message-State: AHYfb5g3cgLyD1936hq6yhg/QGi0tngzs/Ukye3a1kFI7BwoDsZkCeaF
	AJHgxVKUnOcBagGBOYc=
X-Received: by 10.28.13.138 with SMTP id 132mr2071898wmn.23.1501864022860;
	Fri, 04 Aug 2017 09:27:02 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f80sm1275946wmh.16.2017.08.04.09.27.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 09:27:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 17:26:58 +0100
Message-Id: <20170804162700.11765-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][morty 1/3] archiver: Escape recipe name in regex
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
X-List-Received-Date: Fri, 04 Aug 2017 16:27:02 -0000

From: Joshua Watt <jpewhacker@gmail.com>

The recipe name needs to be escaped when using it in a regular expression so
that and special characters are treated literally

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/archiver.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 3543ca9c588..188f8c04232 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -349,8 +349,8 @@ python do_ar_recipe () {
     bbappend_files = d.getVar('BBINCLUDED', True).split()
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
2.11.0


