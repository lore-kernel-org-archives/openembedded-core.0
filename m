Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A9B0C6FCDD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 02:33:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5N2X7lE014861
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jun 2014 19:33:07 -0700 (PDT)
Received: from pek-kkang-d1.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 22 Jun 2014 19:33:07 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jun 2014 10:32:50 +0800
Message-ID: <c33af6b8216db6c04c5a4114d818182a5438ed0e.1403490121.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403490121.git.kai.kang@windriver.com>
References: <cover.1403490121.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 3/5] iptables: add default rules
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
X-List-Received-Date: Mon, 23 Jun 2014 02:33:07 -0000
Content-Type: text/plain

Add default rule files for iptable/ip6tables from RHEL 5.8.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../iptables/iptables/ip6tables.rules              | 31 ++++++++++++++++++++++
 .../iptables/iptables/iptables.rules               | 30 +++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-extended/iptables/iptables/ip6tables.rules
 create mode 100644 meta/recipes-extended/iptables/iptables/iptables.rules

diff --git a/meta/recipes-extended/iptables/iptables/ip6tables.rules b/meta/recipes-extended/iptables/iptables/ip6tables.rules
new file mode 100644
index 0000000..bdd52ed
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/ip6tables.rules
@@ -0,0 +1,31 @@
+# Firewall configuration written by system-config-securitylevel
+# Manual customization of this file is not recommended.
+*filter
+:INPUT ACCEPT [0:0]
+:FORWARD ACCEPT [0:0]
+:OUTPUT ACCEPT [0:0]
+:RH-Firewall-1-INPUT - [0:0]
+-A INPUT -j RH-Firewall-1-INPUT
+-A FORWARD -j RH-Firewall-1-INPUT
+-A RH-Firewall-1-INPUT -i lo -j ACCEPT
+-A RH-Firewall-1-INPUT -p icmpv6 -j ACCEPT
+-A RH-Firewall-1-INPUT -p 50 -j ACCEPT
+-A RH-Firewall-1-INPUT -p 51 -j ACCEPT
+-A RH-Firewall-1-INPUT -p udp --dport 5353 -d ff02::fb -j ACCEPT
+-A RH-Firewall-1-INPUT -p udp -m udp --dport 631 -j ACCEPT
+-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 631 -j ACCEPT
+-A RH-Firewall-1-INPUT -p udp -m udp --dport 32768:61000 -j ACCEPT
+-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 32768:61000 ! --syn -j ACCEPT
+-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 22 -j ACCEPT
+-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 23 -j ACCEPT
+-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 25 -j ACCEPT
+-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 80 -j ACCEPT
+-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 21 -j ACCEPT
+-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 443 -j ACCEPT
+-A RH-Firewall-1-INPUT -m udp -p udp --dport 137 -j ACCEPT
+-A RH-Firewall-1-INPUT -m udp -p udp --dport 138 -j ACCEPT
+-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 139 -j ACCEPT
+-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 445 -j ACCEPT
+-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 2049 -j ACCEPT
+-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp6-adm-prohibited
+COMMIT
diff --git a/meta/recipes-extended/iptables/iptables/iptables.rules b/meta/recipes-extended/iptables/iptables/iptables.rules
new file mode 100644
index 0000000..3d92ee0
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/iptables.rules
@@ -0,0 +1,30 @@
+# Firewall configuration written by system-config-securitylevel
+# Manual customization of this file is not recommended.
+*filter
+:INPUT ACCEPT [0:0]
+:FORWARD ACCEPT [0:0]
+:OUTPUT ACCEPT [0:0]
+:RH-Firewall-1-INPUT - [0:0]
+-A INPUT -j RH-Firewall-1-INPUT
+-A FORWARD -j RH-Firewall-1-INPUT
+-A RH-Firewall-1-INPUT -i lo -j ACCEPT
+-A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
+-A RH-Firewall-1-INPUT -p 50 -j ACCEPT
+-A RH-Firewall-1-INPUT -p 51 -j ACCEPT
+-A RH-Firewall-1-INPUT -p udp --dport 5353 -d 224.0.0.251 -j ACCEPT
+-A RH-Firewall-1-INPUT -p udp -m udp --dport 631 -j ACCEPT
+-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 631 -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 23 -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 137 -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 138 -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 139 -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 445 -j ACCEPT
+-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 2049 -j ACCEPT
+-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
+COMMIT
-- 
1.9.1


