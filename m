Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7649C6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 14:22:35 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id w43so215857043wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 07:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3Xkvwc/MYcUCeX/bxIicE8vY12DlitIp8LpiU72Bc6Q=;
	b=rzFtWJhWDxnV/RWvU5bd8eHqMbHPWxmzPeh7n+FwDqjqgTQb50MvPTDDaBZsmInbYQ
	QoLRUeNFT5GWWWUkroYblovbk4hUtiBsaVZ6a4UGF3zYdHbirUya/+fksGdxuKitJCZ8
	9xMyCcVREtVppiVI0DfCkMPylLlBN9U+EFiJDPGhN7u7+f9StZtEiHtuvCwBVaJZ2yF7
	7BDO9NQOTR70hZA5nliu6MJYn39CqqZjR61e5zhUKvvNn4mgZWHQIruVm4+7d9i/RIR6
	mLqN6pRZyb2IFu6POTkRUFpipck6A/AUPFDb0V2CcRQAeH1Qbo6g6s8t2bDqOWLdjEjE
	4fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3Xkvwc/MYcUCeX/bxIicE8vY12DlitIp8LpiU72Bc6Q=;
	b=YhxVxbxTTnI+A+MCfUqS2o9b2HTbW8MtEmR3bLPSUYjPp36wjRKYzdLBLI4XV/6x/8
	M/QjKqaERRIfsuDg0K0lD04DG4oRG8ILMe8Qnm55nlTC4aTSR539uqqSg/iK1Yx6HDDV
	N/Q+k3CLn955tHh24lT6/YbVihvMJdRRp16MqrFWm4gkgPvJopJ0vwuASJ0Z9GwE2Z4x
	Ul3fAK0fBE8OWiF4Z4k2qxXXLt2ybTMj1Oe8IC9Lx7vRmTIl2c2tqO5TEww1iszzQo8N
	tcMWqTQ9jUtQ2Wo1XzlvTUWrbJpk8BjHcj0YnlEPaEQe3oOt6KUarYLuDPUxQ+4B0x8v
	sIHQ==
X-Gm-Message-State: AFeK/H3wRMv6emeqTV0yXPfJE5tHkUfaNQ7/ru6m4f15G/URdbeMc0fe3RlK2Gs5qjtGtAtf
X-Received: by 10.223.170.66 with SMTP id q2mr20010773wrd.179.1491315755891;
	Tue, 04 Apr 2017 07:22:35 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b199sm18639810wmb.13.2017.04.04.07.22.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Apr 2017 07:22:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 15:22:33 +0100
Message-Id: <1491315753-17805-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] sanity: explain where TMPDIR is if we're telling the user to delete it
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
X-List-Received-Date: Tue, 04 Apr 2017 14:22:37 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 94c78b5..ade8cb6 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -589,7 +589,7 @@ def sanity_handle_abichanges(status, d):
             with open(abifile, "w") as f:
                 f.write(current_abi)
         elif int(abi) <= 11 and current_abi == "12":
-            status.addresult("The layout of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn't make sense and this change will rebuild everything so please start with a clean TMPDIR.\n")
+            status.addresult("The layout of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn't make sense and this change will rebuild everything so please start with a clean TMPDIR (%s).\n" % d.getVar("TMPDIR"))
         elif (abi != current_abi):
             # Code to convert from one ABI to another could go here if possible.
             status.addresult("Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi))
-- 
2.8.1


