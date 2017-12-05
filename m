Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F5C2783AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 17:53:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 64so2811557wme.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 09:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=zl9zSNLeT4jqydc7kLBSAAKpzAw3Pg4XLtgbxEHXMo4=;
	b=nJf0MGJ2Oqg1+jCS2TDhnKO1eYeLoRmdUCz2WxJQfePxmj55OGKrQ7YCYM0cPlKOHX
	ytsufL0Q3j7OeSeoPSfceWNGZfcMcxJ5mKucdh9ACP0ahqvWljJnqLqBarojJeLV9P1m
	3LnYlt5Wrn3OQC3srk4h3SxC6QPfv/8keHiDs1xUWQMDBIpux650gAST1yKQbG3wP57w
	oGe0yOCxBCOnqPpCB4aRxfjMm+LI0ZlzmRBxKq78vMBE8JNppqwV7Y6nqPNLS804WEfS
	lzG3IHc3lScl50vlvVmgCXbbydv7L6Zngk6khAYU87sHbcq6ahngLRVwe0wne/VW2Xd1
	yg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zl9zSNLeT4jqydc7kLBSAAKpzAw3Pg4XLtgbxEHXMo4=;
	b=AB93M4M6IHwLV9T0bdws/jr/LgynnJYDZbsG0SaeQT6+82gwviAsqJ63XpS9HxJMNS
	qUFAkxU0EuVD4NLGTCVJFbO0dFOISXNq+mbHgWYcPAQBDZ1TgH+C/kTyePCAD6XZp/pu
	Bb5MLGmsmSXZqFwTfZsBgEND8sgnjRsXoaNTyxC6qyllb6rvxaTNvjsKsoB12bj93Q6E
	6oS/hJq1BSgSHO9iCWRB6j0gD7X9tbB9gW2ad9V7CJwe/oFPRj0NrB6XHWnYG2rk6/4S
	fnb4N4nurXKU1fyvHuT/oc2JX40i0wMJBpWB/G8tLp2vdUkgBVv8YQFlNzDXOh+flnCX
	wfog==
X-Gm-Message-State: AKGB3mJev5gTmz85vsZGTfLjYQ1M1d+M7nGTqgyh8TVcWrQlaea/TEDP
	Y+soR9PVkGFeiyvgJmgf3pv2fC3n
X-Google-Smtp-Source: AGs4zMZWXXUDoN6OryzDWMSnXoh6y9ac36/TyL6zfc/9LmurY7/MEjxc9RUv6ufuEQx4QaUtP7SGAw==
X-Received: by 10.28.94.75 with SMTP id s72mr11160851wmb.112.1512496434351;
	Tue, 05 Dec 2017 09:53:54 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	138sm1128291wmf.21.2017.12.05.09.53.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 09:53:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 17:53:50 +0000
Message-Id: <20171205175351.4499-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] sanity: getstatusoutput returns an int, not a string
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
X-List-Received-Date: Tue, 05 Dec 2017 17:53:54 -0000

This code is an error path so nobody noticed that oe.utils.getstatusoutput() is
just a wrapper around subprocess.getstatusoutput() which returns an (int,
string) pair not (string, string).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 1feb7949daa..1410af29017 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -462,7 +462,7 @@ def check_make_version(sanity_data):
     from distutils.version import LooseVersion
     status, result = oe.utils.getstatusoutput("make --version")
     if status != 0:
-        return "Unable to execute make --version, exit code %s\n" % status
+        return "Unable to execute make --version, exit code %d\n" % status
     version = result.split()[2]
     if LooseVersion(version) == LooseVersion("3.82"):
         # Construct a test file
@@ -498,7 +498,7 @@ def check_tar_version(sanity_data):
     from distutils.version import LooseVersion
     status, result = oe.utils.getstatusoutput("tar --version")
     if status != 0:
-        return "Unable to execute tar --version, exit code %s\n" % status
+        return "Unable to execute tar --version, exit code %d\n" % status
     version = result.split()[3]
     if LooseVersion(version) < LooseVersion("1.24"):
         return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar.\n"
@@ -511,7 +511,7 @@ def check_git_version(sanity_data):
     from distutils.version import LooseVersion
     status, result = oe.utils.getstatusoutput("git --version 2> /dev/null")
     if status != 0:
-        return "Unable to execute git --version, exit code %s\n" % status
+        return "Unable to execute git --version, exit code %d\n" % status
     version = result.split()[2]
     if LooseVersion(version) < LooseVersion("1.8.3.1"):
         return "Your version of git is older than 1.8.3.1 and has bugs which will break builds. Please install a newer version of git.\n"
-- 
2.11.0


