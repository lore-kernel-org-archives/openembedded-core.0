Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web09.1278.1627393055882254797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 06:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cybernetics.com header.s=mail header.b=kAwDRVw6;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==842db41608d==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1627393054-0fb3b001bf175d0001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id 83RBizDDyy7uxKBy; Tue, 27 Jul 2021 09:37:34 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=EaEqj0z2eqBZ9XNxhAT3kHRGChdvIxT9NalO9gP7zJU=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:Cc:To; b=kAwDRVw6CTwvOh/hlqU4m85iPgBHO0I5E6maApZtBecB
	oTqpzN4lUnMvciu2ua84jO/yRxeZohP2el7oED/ujCiF1eKbGmpWB4in4YduhJRFwNR4GHP2TI63p
	Hd0h2QgZCz1CGp3xOzZmAvtLyJV6zGH+CZe1yhifS2q2MwVf+U=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 10999394; Tue, 27 Jul 2021 09:37:34 -0400
To: openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
Cc: randy.macleod@windriver.com
From: "Tony Battersby" <tonyb@cybernetics.com>
Subject: [meta-networking][master][PATCH 4/4] net-snmp: fix QA Issue after LDFLAGS change
Message-ID: <5d41e8fd-1b94-6eaf-a90b-7f520bdf3baf@cybernetics.com>
X-ASG-Orig-Subj: [meta-networking][master][PATCH 4/4] net-snmp: fix QA Issue after
 LDFLAGS change
Date: Tue, 27 Jul 2021 09:37:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1627393054
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 1303
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Adding -f*-prefix-map to LDFLAGS caused the following issue:

QA Issue: netsnmp-agent.pc failed sanity test (tmpdir)

Fix by filtering out -f*-prefix-map from *.pc files.

[YOCTO #14481]

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
---

Note: patches 1-3 of this series are only being sent to the
openembedded-core list.

 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index ed7f8428b..aa497c894 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -132,6 +132,11 @@ do_install_append() {
         -e 's@[^ ]*PKG_CONFIG_LIBDIR=[^ "]*@@g' \
         -i ${D}${bindir}/net-snmp-config
 
+    sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
+        -i ${D}${libdir}/pkgconfig/netsnmp*.pc
+
     # ${STAGING_DIR_HOST} is empty for native builds, and the sed command below
     # will result in errors if run for native.
     if [ "${STAGING_DIR_HOST}" ]; then
-- 
2.25.1

