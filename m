Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4717.1594242489619170622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=dJART+FL;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjL46y1zF2
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242486;
	bh=fM/rEVz9kXobP+e/2fYBGEAeydoopQQiP+rL3JEVzPQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dJART+FLYkJ6tqb1tZSAYoVdYkpU0mIdXEqvZ5l0pJ+/ERQMXS969/7qWX5j6DJLf
	 xx6CWhDCnWXELVN+lWWnalATEAW1cpwr/umvrJAqDd7p7amLkHMRP1eCcOeeoGYrV1
	 gYYzC7X3SDrlYasAwaVsRFNjeksGD8GVgbaJSNVw+OiSuMZuHrpKLvidAS6s1KhFPh
	 bMS0wzY3IsOu3apxMHNPkKqoqbcJmAz4IIMwE9BUEZ/STCekEmXgPw/ImIamm3MTmt
	 jTDUmLqR0vhntXBcbWUL5ZRXCrynsZwdOhyB/2aJTLf00wCp3KXF42gCpnL04R9kXa
	 wvh5yN+UvOr1pQYxT0FV/w3uTTIis7Fg/lwyjb14WAWraworq0ticaK+sqcAmOR8Jg
	 GqcNd3/ss8rJy7/RHe3gUHILvyKzPepMYcaAksWOwUlObRVkilDLoXs+JWKxKUViM0
	 6IAa/lS05TeSJzOe8I7vs+2dB/hDH0PYAGb5DcYn5F/ywbl4Xn/XsZhyuzyx438qH6
	 /m4cU49wTQ0RTlUzkbXJA/w1ll2c9+LUqIO3f8Bm4KrYG/eT/TX826Ptqob7VLbXfi
	 pX8kkEOv9ldDW4/YaBoXngLvZJy/Bz/s8M46i8D+2Rm3PhsJB1wgigmHy+q5ZA51Cn
	 gQlwmP2DDR+BDS3PtrJ9htZg=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 08/19] cve-check: include epoch in product version output
Date: Thu,  9 Jul 2020 00:07:50 +0300
Message-Id: <20200708210801.5553-8-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Ralph Siemsen <ralph.siemsen@linaro.org>

In the generated cve.log files, include the epoch in the product
version. This better matches how versions are displayed elsewhere,
in particular the bb.warn("Found unpatched CVE...") that appears
on the terminal when CVEs are found.

(From OE-Core rev: 99f6de1c74b581054c74c6b4598a5d47facc9964)

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
(cherry picked from commit e1c3c0b6e5b01304e2127f5058986697e82adf93)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 556ac6e67f..514897e8b8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -301,7 +301,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
 
     for cve in sorted(cve_data):
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
-        write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV")
+        write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
         if cve in whitelisted:
             write_string += "CVE STATUS: Whitelisted\n"
-- 
2.17.1

