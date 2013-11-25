Return-Path: <Yanjun.Zhu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC736D867
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 02:49:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAP2nIQR024102
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2013 18:49:19 -0800 (PST)
Received: from wind-OptiPlex-780.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Sun, 24 Nov 2013 18:49:18 -0800
From: yzhu1 <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Nov 2013 10:49:27 +0800
Message-ID: <1385347767-5950-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] e1000: prevent oops when adapter is being closed and reset simultaneously
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
X-List-Received-Date: Mon, 25 Nov 2013 02:49:20 -0000
Content-Type: text/plain

This change is based on a similar change made to e1000e support in
commit bb9e44d0d0f4 ("e1000e: prevent oops when adapter is being closed
and reset simultaneously").  The same issue has also been observed
on the older e1000 cards.

Here, we have increased the RESET_COUNT value to 50 because there are too
many accesses to e1000 nic on stress tests to e1000 nic, it is not enough
to set RESET_COUT 25. Experimentation has shown that it is enough to set
RESET_COUNT 50.
---
 drivers/net/ethernet/intel/e1000/e1000.h      |    5 +++++
 drivers/net/ethernet/intel/e1000/e1000_main.c |    7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/intel/e1000/e1000.h b/drivers/net/ethernet/intel/e1000/e1000.h
index 26d9cd5..5c2a1b1 100644
--- a/drivers/net/ethernet/intel/e1000/e1000.h
+++ b/drivers/net/ethernet/intel/e1000/e1000.h
@@ -83,6 +83,11 @@ struct e1000_adapter;
 
 #define E1000_MAX_INTR			10
 
+/*
+ * Count for polling __E1000_RESET condition every 10-20msec.
+ */
+#define E1000_CHECK_RESET_COUNT         50
+
 /* TX/RX descriptor defines */
 #define E1000_DEFAULT_TXD		256
 #define E1000_MAX_TXD			256
diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index 59ad007..69c55ed 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -1445,7 +1445,10 @@ static int e1000_close(struct net_device *netdev)
 {
 	struct e1000_adapter *adapter = netdev_priv(netdev);
 	struct e1000_hw *hw = &adapter->hw;
+	int count = E1000_CHECK_RESET_COUNT;
 
+	while (test_bit(__E1000_RESETTING, &adapter->flags) && count--)
+		usleep_range(10000, 20000);
 	WARN_ON(test_bit(__E1000_RESETTING, &adapter->flags));
 	e1000_down(adapter);
 	e1000_power_down_phy(adapter);
@@ -4969,6 +4972,10 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
 	netif_device_detach(netdev);
 
 	if (netif_running(netdev)) {
+		int count = E1000_CHECK_RESET_COUNT;
+		while (test_bit(__E1000_RESETTING, &adapter->flags) && count--)
+			usleep_range(10000, 20000);
+
 		WARN_ON(test_bit(__E1000_RESETTING, &adapter->flags));
 		e1000_down(adapter);
 	}
-- 
1.7.9.5


