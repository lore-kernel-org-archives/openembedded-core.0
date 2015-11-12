Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id BE37377226
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:32:32 +0000 (UTC)
Received: by wmww144 with SMTP id w144so202968178wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+Cbhu7CufWvDHDRYFOmaIM/YrpFzylAKZZ7S0X+0j+I=;
	b=scWQerrhVvUoK8BcAmeXedr2x77JD+DNdL/FfJTg9QMZGrqQYAOpcWBLW02R/XGx/3
	3I3uZShxeRH3lEqmPCFo5G/ecU66YCJSCj6qrvW1kKeoRGQ2ZavpgmtLkwxkrUuNTddx
	Y7pxoO0lDSo2LQSg+qqlbiB/D0xZfl2aN3IUcsWegaTDzvb1afcfkyl/1TnI0TMjuPkG
	bPm+Tpw+DYGRGEhoKz5yOzWWo67k/OlB11pJPUisEgJTpJ0aAS4MnfHKbochfnYSSzq5
	qmi1PJEbR1H5ZN2IiQ+X7VLbWsYUdD0jaWVExRmEcbX3l6FBo8SpuR/gSpwsOsLfOYly
	19kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+Cbhu7CufWvDHDRYFOmaIM/YrpFzylAKZZ7S0X+0j+I=;
	b=Km4Si5mseDdRwxwwR/HgOw6HUUKSV7laC+Y4aIa9UVE//gDlqrcMyS+oXen58THTIV
	4xvIql05ptDXCaNGnePmeRzhkZViBCrojDEjF++BUXN/gRgj5uK4+dyfaw+aipAAlvBP
	UntxVcMbxfXN4w7iBQoFaEwbshP9XS9dCl2FNNn6/rp7vN1PjoWTb69RKxHH9S2acLXB
	qg/VLPWKjIy4ObrKL2a8epcV2umMOjiLqYm63TRF13+Yy+x1mfX1pYGOHYYmdyeWRUhu
	IGQ571oBFIHGN6WcUo7vSK454kKEQMSeTpgDZJxztH6Hv+xaYC783J9QyWT+5rlVzLkO
	gZ0g==
X-Gm-Message-State: ALoCoQmUur2DZpoHcrgYeT8QII95bQYk3ez9md4kYlekmZjZlhIU26x7XFhL++Wez1UO+jxMLqn4
X-Received: by 10.194.20.130 with SMTP id n2mr18849964wje.115.1447338752343;
	Thu, 12 Nov 2015 06:32:32 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l1sm4201099wmb.1.2015.11.12.06.32.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 06:32:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 14:24:12 +0000
Message-Id: <1447338252-17802-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] lib/oe/distro_check: don't set empty proxy keys
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
X-List-Received-Date: Thu, 12 Nov 2015 14:32:33 -0000

If the proxies dictionary has a proxy set to None urllib will throw an exception
instead of not using a proxy (abridged stack):

File: '/home/ross/Yocto/poky/meta/lib/oe/distro_check.py', lineno: 43, function: get_links_from_url
 *** 0043:    with create_socket(url,d) as sock:
     0044:        webpage = sock.read()
File: '/home/ross/Yocto/poky/meta/lib/oe/distro_check.py', lineno: 5, function: create_socket
     0003:def create_socket(url, d):
     0004:    import urllib
 *** 0005:    socket = urllib.urlopen(url, proxies=get_proxies(d))
File: '/usr/lib/python2.7/urllib.py', lineno: 87, function: urlopen
     0086:    if data is None:
 *** 0087:        return opener.open(url)
File: '/usr/lib/python2.7/urllib.py', lineno: 203, function: open
     0201:        else:
     0202:            proxy = None
 *** 0203:        name = 'open_' + urltype
     0204:        self.type = urltype
     0205:        name = name.replace('-', '_')
Exception: TypeError: cannot concatenate 'str' and 'NoneType' objects

Filter out unset values so that the dictionary only has valid assignments in.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/distro_check.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index f92cd2e..8655a6f 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -9,10 +9,12 @@ def create_socket(url, d):
         socket.close()
 
 def get_proxies(d):
-    import os
-    proxykeys = ['http', 'https', 'ftp', 'ftps', 'no', 'all']
-    proxyvalues = map(lambda key: d.getVar(key+'_proxy', True), proxykeys)
-    return dict(zip(proxykeys, proxyvalues))
+    proxies = {}
+    for key in ['http', 'https', 'ftp', 'ftps', 'no', 'all']:
+        proxy = d.getVar(key + '_proxy', True)
+        if proxy:
+            proxies[key] = proxy
+    return proxies
 
 def get_links_from_url(url, d):
     "Return all the href links found on the web location"
-- 
2.1.4


