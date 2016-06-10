Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 412416FF7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 08:04:57 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id h190so54398456ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=SF23hjjMIOfYRt6dTCIn7JRUKC07MWucgo40d8AxSwI=;
	b=pLGMIJaIUa3fLQMDvKes87vHdY99ewuntO16jv5XFNhmj9+HWKEpnMn26vNgjNzhVN
	RYmuZpQuaBtrPQUGaR82PxZPVeHUPj1b05uuP7Jo6j6yqbZ6MInP/4bI7dyUHATyXf7j
	9O98tTFYTcvl7Lw51+ePPwZJ5bqk/3jMaXNVxyDk1hPF+r8qxC4ox9zMV0doXQ95fzC9
	fbnlN4cbyDm6fiKNqqMNx88gqthk8DcSczJAwuS7tVq6JxoHN1y6ZRQBwexM7aYePuek
	vEWRbV5BCBlWod56tqMa+NBokuer5hwjQwg1z452FA73YjKHYjPuiYodK6KEdhJbRMES
	P6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SF23hjjMIOfYRt6dTCIn7JRUKC07MWucgo40d8AxSwI=;
	b=JKRUSwSJQOhYoVNkYevcC8+4iPCO1expHJZZBTzf7XgNs5o/uZQKtSdwTLeOKl8r8M
	2HBF6eDkh2tpojECD/5KUNFAn9ucyu21iVCI2Ok03gFxdskbQQpWAw5xXN/UAg9wxksw
	ZdsgdBoH9TwAhFXhKCao08IE4z7WQMSNg4ECI32phRsq2+cLcI9qZo24YjAgPJr/6V8V
	L5tgS5GjMD7CsN1iEsDc8BGqRjKs//mkzx4voi4193N3/y/3ehwJHjlipOtkD2ICSq9C
	P7O1M2+yEpCeitfNm8OKT/Cvwk+mLEMiG0bDEMvmbVX34CqaO2ABgvXaFWl/paTowF2Y
	gOUg==
X-Gm-Message-State: ALyK8tJ6BJb9JJRFcrqmPtWlsYPTGFsGARrE1Z+mrAC38O7oRcALyv3ffwUKTqVVQ8LVBJEa
X-Received: by 10.36.90.73 with SMTP id v70mr29037501ita.10.1465545898530;
	Fri, 10 Jun 2016 01:04:58 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D4E8.dip0.t-ipconnect.de.
	[93.232.212.232]) by smtp.gmail.com with ESMTPSA id
	o201sm5054959ioe.15.2016.06.10.01.04.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Jun 2016 01:04:57 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 10:04:51 +0200
Message-Id: <1465545891-7779-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] npm.bbclass: avoid str/byte conversion problems for PKGV and SUMMARY
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
X-List-Received-Date: Fri, 10 Jun 2016 08:04:59 -0000

In Python3, str.encode() returns byte strings, which later are not
converted back to strings automatically, leading to "TypeError: Can't
convert 'bytes' object to str implicitly" in code which reads PKGV and
SUMMARY and expects to find strings there.

The npm.bbclass must use values for d.setVar() that meet that
expectation, and thus the redundant (and in Python3, harmful)
.encode() gets removed.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/npm.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index d0d3d8f..95be751 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -46,10 +46,10 @@ python populate_packages_prepend () {
         if pdata:
             version = pdata.get('version', None)
             if version:
-                d.setVar('PKGV_%s' % expanded_pkgname, version.encode("utf8"))
+                d.setVar('PKGV_%s' % expanded_pkgname, version)
             description = pdata.get('description', None)
             if description:
-                d.setVar('SUMMARY_%s' % expanded_pkgname, description.replace(u"\u2018", "'").replace(u"\u2019", "'").encode("utf8"))
+                d.setVar('SUMMARY_%s' % expanded_pkgname, description.replace(u"\u2018", "'").replace(u"\u2019", "'"))
     d.appendVar('RDEPENDS_%s' % d.getVar('PN', True), ' %s' % ' '.join(pkgnames).replace('_', '-'))
 }
 
-- 
2.1.4


