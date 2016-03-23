Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id D95EB60248
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 22:09:42 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id j35so24217203qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 15:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=igah5Fjzt2mkfPmxT64fb0lPlexY9cce6nJSi7qlqpQ=;
	b=Gfq+98n+wN0z6mZymLNVkiE9nVae1EQWaSJlUHTUyIOqBH/s/33hROnnhuhpf0dA8A
	znLbZ/Ua7GxEbIrDjqHTpLnY1xud2mSHAju1GIcUF7uDAY9M8nAvOk9Bd+8h3ilc/Ryu
	y13whe1y2T7CbLy5N3yL5LqZ4P1q7XBsfluQU6wx623k0YmmGazXmjE0aX1moePF6O47
	NFEl46eRX4snG8uj+hMJSXgJh0gJVyLYrGau29rMd3Saz6jNYNr4hZWzBHbKF3BW2yW7
	vKz6WHZCCPGHjF1aR+dbahnbr6Vb4thQtKdSLoFDq+H0ifK98Uz40GyGE3zE1VQW7sWy
	Ma/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=igah5Fjzt2mkfPmxT64fb0lPlexY9cce6nJSi7qlqpQ=;
	b=TmL3Len23JVIt2BYivA/TyEtrDmcG6GOxgE8HmXoIeHCGAPpb5FzYrcg8szCqa5ssT
	WW1zMf8J9RgCnYupD55QTPKChUK+9Gdzpoxf6cSO6ynN1SdQj/zc4A0g5oDzkVIbdvDJ
	a9Q1uR19MCsColDjhh8jnlCb/ziBUqmrrEupp+DLuO5puFsjz8GV090xTIUS3Y2AYyX+
	bfgAGlv+kxN21yiF4WSAHBPWVjsXKm6HdHiN09M+uN4DPW4bXJYm1V9vv2zyJysoEwzo
	rjCjpOU3NqLp6zbAaB2uNzqlbdUCyCdTFDlqRm9V1gxKUJI4aNJOLZsVlvdzubbh62WI
	Rzdg==
X-Gm-Message-State: AD7BkJKnmWLBalz+LsI5ik37oY1qWWpoXkvjzVYRqFnmLyTMnpau42Ie+EcnH6NGzjeA/A==
X-Received: by 10.140.43.37 with SMTP id d34mr6570968qga.51.1458770983283;
	Wed, 23 Mar 2016 15:09:43 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	a11sm1957214qge.43.2016.03.23.15.09.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 15:09:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 22:09:32 +0000
Message-Id: <1458770972-30300-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] kernel.bbclass: consider .csp firmware files
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
X-List-Received-Date: Wed, 23 Mar 2016 22:09:50 -0000

Fixes kernels which package sb16 firmware e.g.

directories were installed but not shipped in any package:
  /lib/firmware/sb16
  /lib/firmware/sb16/ima_adpcm_playback.csp
  /lib/firmware/sb16/ima_adpcm_init.csp
  /lib/firmware/sb16/mulaw_main.csp
  /lib/firmware/sb16/ima_adpcm_capture.csp
  /lib/firmware/sb16/alaw_main.csp

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c3eab50..6e3e81e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -405,7 +405,7 @@ pkg_postrm_kernel-image () {
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
-    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
 # Many scripts want to look in arch/$arch/boot for the bootable
-- 
1.9.1


