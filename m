Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 80D87798C8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 11:49:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j8-v6so8836617wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 04:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=r9oeJ/pG0E4MFOdvY52G4642w+DLvib6Gt5xT17q6vc=;
	b=B1a/u8XErYH0QzjjVFxfbtRVpx8T3JzPPPoha+lKlwR7gfw4twGywYj4PKGWrByY+O
	7NOjpt/XtpXYJer4KhMqurPodc9PO+2JNrMJy2X/BQSKddoDQuxL1OF5BU4KGacyZNLN
	fxWMtlKvGUjiqQIYj1dXz/mMsuk0jAJoWsVUbThODpNneqfTh+FSzK9oLrIjMZ7l8L+l
	KP//IjAAJb0ysImnSmJSRYOUMJBSV4UjRAqek0MtxY+ehxtCrmERRAh44lsPbN9k2vhU
	KmuhGwchU83eO12rQPxI2BX+Au781viY5a/xBRNva6N7nSCAoZRsqshYRzfv6a9vonz4
	h2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=r9oeJ/pG0E4MFOdvY52G4642w+DLvib6Gt5xT17q6vc=;
	b=ksfdTl4UBJ8uzCEe/S+nOxvCJsA7fTec5+GPdrcBG6Vok7Odkyrl8TkrfsS2aeGKWK
	+cTvvEndzL84bo2LFlS/adCxfYMwBdFlO4DO6O9vRIzbd4/Edp60k1QogpNZjYZkCupP
	hknh4rw5x+6WShKfdMRV504Mi9V92UAx/Kc6RTaoxdfdmdzULjOjIneX7aXkaVdcCamU
	VXpbhXxwW7QT8oWitpGzqyshxHLQgUaDaQwG2gGZSaqJ5Aq8e4og85fICmLZpdH72jG8
	gt8mFxJdRt37bgej6gs+z3PuoolIH2hoF3RwlK1wMm6SOGYxFdww9Zxm57IueU2wn2yB
	Xh+Q==
X-Gm-Message-State: APzg51CxRDKoWPf+fs9pfEG2sCjcDSIG2Eu9L8dVLidv/lXwh+t0aZxD
	ZxETNeHw0MLcIim1Qz2umXQWMHF+oxA=
X-Google-Smtp-Source: ANB0VdZtA9/4WABWmmapT8iUoxJ+tqGyftGXJqF2UYy2hLHIwglBpgDyuaDCeDeCVoGH1pytQasdig==
X-Received: by 2002:a5d:608b:: with SMTP id
	w11-v6mr39385075wrt.193.1537530547799; 
	Fri, 21 Sep 2018 04:49:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n8-v6sm3479850wrw.31.2018.09.21.04.49.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Sep 2018 04:49:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 12:48:58 +0100
Message-Id: <20180921114900.26338-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180921114900.26338-1-ross.burton@intel.com>
References: <20180921114900.26338-1-ross.burton@intel.com>
Subject: [PATCH 2/4] python3: respect package order in manifest
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
X-List-Received-Date: Fri, 21 Sep 2018 11:49:07 -0000

Don't sort the manifest when using it to generate packaging rules, so ordering
can be used to have complex packaging rules.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.6.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 605ea6abfe7..6085e36b7db 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -252,7 +252,7 @@ RPROVIDES_${PN} += "${PN}-modules"
 INCLUDE_PYCS ?= "1"
 
 python(){
-    import json
+    import collections, json
 
     filename = os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manifest.json')
     # This python changes the datastore based on the contents of a file, so mark
@@ -260,7 +260,7 @@ python(){
     bb.parse.mark_dependency(d, filename)
 
     with open(filename) as manifest_file:
-        python_manifest=json.load(manifest_file)
+        python_manifest=json.load(manifest_file, object_pairs_hook=collections.OrderedDict)
 
     include_pycs = d.getVar('INCLUDE_PYCS')
 
@@ -294,8 +294,6 @@ python(){
             d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
         d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
 
-    # We need to ensure staticdev packages match for files first so we sort in reverse
-    newpackages.sort(reverse=True)
     # Prepending so to avoid python-misc getting everything
     packages = newpackages + packages
     d.setVar('PACKAGES', ' '.join(packages))
-- 
2.11.0


