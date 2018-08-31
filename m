Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B72EF790AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 12:11:43 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o37-v6so11003644wrf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 05:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=q4KyQ+4Hqt35O98aYufWBaaWAXX+H77Q1VzMeZ5Pm6c=;
	b=Yw51DnbLhnlH/cODjak6aLCRDRDc1jWLiUiZU/C6j3T2PzyJP54i3G+GpuC3wp5eng
	wZR19M6d50ALKaMpScoaBCm3GXPEy+VAkU2VxdMr7vbBZdgpdpQa28HK2OTEZKCH36ga
	GyDi5SsQFcj0WxFVp09KARTHn1i4ZtV94oNjz5AsQr36axa9M11kokhf1gbLrpB4SoMG
	yl1qwtmkOM3AZQwKHEgukyXJB8cWs+j4UWviQl86YLB5RfZQRN2h5Xk886gsy+1EQyHr
	MqP9sFLod2gAl6beWfUOvAEVAAT9hLdfc+D6DVsDmiAaxsYdEfLduXYUsxLhoQujjRp4
	o9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=q4KyQ+4Hqt35O98aYufWBaaWAXX+H77Q1VzMeZ5Pm6c=;
	b=Za/FhB2cnmia3KJtAN4Eq/nNK4/s1Xr97QEjHA1Ck2QmEqjeBlOmMV/L70iXOoo8UT
	kV9ANXtUKIQHp6D1n8GvTfk3Du8+h6+X48ENeq9DDjtDrxRM5rJp+VG62UQhdavAWeGj
	fkfGk7mulH5ZV10LzQEqY5r03vXOqQPQwBrmYLaVWTqC5pCT/ORkDUbpy9gBLAyyhFAb
	ZpRkZ4y5YED3O/vTsQqtYHKoUEme8BLf97QlyUZ0SXqprj2rGQuO5DjlCfNKLOLg1Z1Q
	RKoBASJQOB2/HjM8Dqeb+7Y810gKpDUpDbdVtCC6j4pXiK8UfHwT5jHo0lp6weHOAgSY
	cC1Q==
X-Gm-Message-State: APzg51CgYq0Tr4swL8Hagd6XHp/zgYOTjchsAHOHlM+yX0XH2PfVNFGM
	y4zwjWUUhj84gC/CDk6fJ8lxgh087Tk=
X-Google-Smtp-Source: ANB0VdbOayS8ht+aXh1uv2aBhV0fpoBzAi3hmmGKLdRFYV3kFR5Q4pntXBjPMx1eUtUqMeHz77PotQ==
X-Received: by 2002:adf:f1cc:: with SMTP id
	z12-v6mr399849wro.214.1535717504087; 
	Fri, 31 Aug 2018 05:11:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	184-v6sm8173150wmv.6.2018.08.31.05.11.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 05:11:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Aug 2018 13:11:41 +0100
Message-Id: <20180831121141.30470-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oe-pkgdata-util: add option for lookup-recipe to not fatally fail
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
X-List-Received-Date: Fri, 31 Aug 2018 12:11:44 -0000

It is often useful to run lookup-recipe on a list of packages and get
notifications that there were failures, instead of a fatal error on the first
failure.

This makes it possible to pass long lists of packages to oe-pkgdata-util and
process the output.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/oe-pkgdata-util | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index e6c9df94e83..53739b0bfc5 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -279,10 +279,14 @@ def lookup_recipe(args):
                 parse_pkgdatafile(pkgdatafile)
             continue
         pkgdatafile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
-        if not os.path.exists(pkgdatafile):
-            logger.error("The following packages could not be found: %s" % pkg)
-            sys.exit(1)
-        parse_pkgdatafile(pkgdatafile)
+        if os.path.exists(pkgdatafile):
+            parse_pkgdatafile(pkgdatafile)
+        else:
+            if args.carryon:
+                print("The following packages could not be found: %s" % pkg)
+            else:
+                logger.error("The following packages could not be found: %s" % pkg)
+                sys.exit(1)
 
 def package_info(args):
     def parse_pkgdatafile(pkgdatafile):
@@ -558,6 +562,7 @@ def main():
                                           help='Find recipe producing one or more packages',
                                           description='Looks up the specified runtime package(s) to see which recipe they were produced by')
     parser_lookup_recipe.add_argument('pkg', nargs='+', help='Runtime package name to look up')
+    parser_lookup_recipe.add_argument('-c', '--continue', dest="carryon", help='Continue looking up recipes even if we can not find one', action='store_true')
     parser_lookup_recipe.set_defaults(func=lookup_recipe)
 
     parser_package_info = subparsers.add_parser('package-info',
-- 
2.11.0


