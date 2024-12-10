Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15088E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 15:10:40 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.web10.12560.1733843425695489177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 07:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm3 header.b=tj+SoEb0;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=oV+TGeRz;
 spf=pass (domain: cold-front.org, ip: 103.168.172.151, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id D66051384194;
	Tue, 10 Dec 2024 10:10:24 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 10 Dec 2024 10:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1733843424; x=1733929824; bh=vqCHCE+3MA
	ur4qYU9TVlgACmW9euJ9pUW4qenGFlwYo=; b=tj+SoEb0Jo2grxOxFfNpWZ07dQ
	3rQWVZaJY89hfUKT6cs2t15jzO0kgHblRlrRewVYq6qwmIwoXx8bDBMf262dXhPQ
	zVW2ePUQ8LsYwP7X8rPD5XdbY0xS/p2SlTUNLhYs6ydXfO1ti56HcayBMrdF2cwT
	gNRkw/WNoj+hShf0DDK7fa9AVMHmtHyfxMortTwkljskNXNbUt+SuWKJq8kqjP+9
	qBS49PjV+UDYiXG3QbGGURgfl2YXaLMaY0B+ASyCEgXNuYqekJ948uZv05sCkBtx
	+HkT4iPJOWDWA2W6xoVmkKQGnEi+PtPR8KkrH1b5eVW4vpL2eRiz3C0zmCig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1733843424; x=1733929824; bh=vqCHCE+3MAur4qYU9TVlgACmW9euJ9pUW4q
	enGFlwYo=; b=oV+TGeRzLC+tJlK+BEn0MnGrf4dOLoFccFWLVfsR9y9B3sst9T3
	52CGrj7NlTWiIv+BiC2S2AMhIYd0gWhCQrKEO5tB/L8ldWA5tj/aVTQAeymc5bez
	pDyRlX7lIAmlSNS7c+UNIg8xeN2FonGZkL+t7naUNwkXwdiuMK6MiG/yHOnI+W3b
	unl0dTl4N0CjvEKe8Ee4ZFB1vSwA7ZgkxPB8Wj3xlVm5S19ogn8Q9j/L7zixfK6+
	TrDr0+ERySr+Fhs/R9pBW+J6s/aFBNq07FpM0UOCTOW2Jux+v0nsIA6AHz+q7orO
	GlSDDRDCiL/qs39Yho6aiddsElg5MAIT4AQ==
X-ME-Sender: <xms:4FlYZ8mMymQuApqGYGnWkQLQsIMu36lY83lpkZ25rgq49r_kENTkbw>
    <xme:4FlYZ72j_EPoCtB8nulR05VabUBrCC5WukIoQtbq_Wk67K9BZjKRriJ-qb7gpyYau
    BMhoDZcilB1IPS3GA>
X-ME-Received: <xmr:4FlYZ6rdSb3VpxHaIppK8M1v9yioPX3oAZ0YmrT4sq0L3szEG0whFJ7m6Pp28VWJYSC5BGWHFqn-M8KBk7PkzrXmX-CaVUeoAmbbwWYPCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeekgdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefuff
    fkofgggfestdekredtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceo
    jhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrh
    hnpedugffhvdekueehudduudfhueeiieekgeeflefhgfefjeegleehjefhfedtleehgeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrh
    honhguvghrsegtohhlugdqfhhrohhnthdrohhrghdpnhgspghrtghpthhtohepvddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvg
    eslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepjhhssghr
    ohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:4FlYZ4mJNf_pc2cdWs_CyDJGo5P2sr_-t-5cjLDjFHAm_I2qQShA5w>
    <xmx:4FlYZ61p7JcYCMYiL28NLdspt6gC1tr8pdAvKZ3utq0KM5hHRuHJjA>
    <xmx:4FlYZ_sI_Qg2MrQdXhWph2SkCcwLRdGYpCOGe1rcqmIPkGSUY8P7sg>
    <xmx:4FlYZ2Xmz43c0C3j3ym_HD04hub2JD3NC7aMQeUzpfyCVPK4U1bFGA>
    <xmx:4FlYZ4Af6OCZPPEEaN8RHZcPXbWHq5d234R6WGvpgwrewLAlqsBWg4Dx>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Dec 2024 10:10:24 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH] bitbake.conf: add lz4c to HOSTTOOLS_NONFATAL
Date: Tue, 10 Dec 2024 10:10:16 -0500
Message-ID: <20241210151015.2450083-2-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 15:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208537

Commit fe167e082cbde1c6d186ecdda531abef610ac2ac switched to requiring
lz4 instead of lz4c which allows us to support distros dropping lz4c.
However, it's only in the 6.13 kernel that CONFIG_KERNEL_LZ4 makes the
switch from lz4c to lz4.  So we should continue to link lz4c if it's
available to support older kernels.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1d2c2e0022..c7927d19a0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -553,6 +553,9 @@ HOSTTOOLS_NONFATAL += "gsutil"
 # Link to git-lfs if present
 HOSTTOOLS_NONFATAL += "git-lfs"
 
+# Link to lz4c if present, used by linux <6.13 with CONFIG_KERNEL_LZ4
+HOSTTOOLS_NONFATAL += "lz4c"
+
 CCACHE ??= ""
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
-- 
2.47.0


