Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 62DBD74769
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 10:04:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s18so13416848wrn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2019 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Kc2uDtuPPpMB56FOb5dw2YjyDfzTjeC8UZn+FufbHFo=;
	b=b13icvbeNVOcV5TK+vj+ndb4tKvR5T6LH0ARz8WYPQ10PdPL28mHeDbJjpJ6Xm/E7K
	p+pz8gqcEEkWPvdibfbj3F3VMu44SXZyvMDn2kAmdhrHLrSO5HRLubMcA4624XM//zmn
	BQjpCYTA+kBb7WH1qNcFT2hm5MPzGf145Z0FvfTlxJ9m7jJAuznHUqL/a8yBraicEQl5
	5K4P84KtKYN+4zw2131oVy5d/NyPJQGmhPOy7WZtS03v7faDk87NgEtQbZMkZWTsu6f5
	G2OVrUurlQ6iOQHTh7+9h/H8ZLwsFaQKu30h3YTSu2sMT9nroi8lO75A8lrBsgJ3TyXG
	sX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Kc2uDtuPPpMB56FOb5dw2YjyDfzTjeC8UZn+FufbHFo=;
	b=YkuKuQS50ipk9I+IX3mfofO5eCX/RFKbkKY7tMEMVw2IRATBELqe21qQLFU2qlQbnE
	X19VWJnC3n9tquSnfiB4HybyNdQL8JL/PQyN/hfmOQRNIyZcqvB3eBbNFNac76sCY+Db
	HpUsfLfxqlmbztxDWh5ePUMOhgomJ/bC2JCfyL7XSdrqJHw9vrpVULUTQnT1kmkWR0fC
	D17Y/Cl7gKRHHQemCvhLG3yCtw0rKtLGnU6HXG//EDSczEJ1douhCTP86Byzu88F9MPx
	JT/rPkaucIAsh3orYXwDkXGVEWMWSUJN5Vhq6lLVNBP+hX8gjFHVb3wvmpFdST7v9uK+
	XNpg==
X-Gm-Message-State: APjAAAUiTtgh+eyyCgfwa3U7tnSHvPRYLhIXDN3GN9apu5nNUZ+jyZyK
	ZbyWWkuvV40/AjIgj0vkNAOFKf8XEjc=
X-Google-Smtp-Source: APXvYqzrZQ1zA2dbwRNE4pSHdAk1GhaPWElunWsidX8rPFCIgCJhpfd7jGpNsB2wbg49w4fDELOMrw==
X-Received: by 2002:a5d:4b0e:: with SMTP id v14mr36003392wrq.24.1567418672878; 
	Mon, 02 Sep 2019 03:04:32 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18])
	by smtp.gmail.com with ESMTPSA id f66sm627195wmg.2.2019.09.02.03.04.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 03:04:32 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2019 11:04:09 +0100
Message-Id: <20190902100409.129032-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] iputils: Set prefix correctly for usrmerge
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
X-List-Received-Date: Mon, 02 Sep 2019 10:04:33 -0000

Fix build with usrmerge enabled:

  WARNING: iputils-s20190709-r0 do_package: iputils: alternative target (/usr/bin/ping or /usr/bin/ping.iputils) does not exist, skipping...
  WARNING: iputils-s20190709-r0 do_package: iputils: NOT adding alternative provide /usr/bin/ping: /usr/bin/ping.iputils does not exist
  ERROR: iputils-s20190709-r0 do_package: QA Issue: iputils: Files/directories were installed but not shipped in any package:
    /bin/tftpd
    /bin/tracepath
    /bin/arping
    /bin/clockdiff
    /bin/ping
    /bin/traceroute6
    /sbin/rarpd
    /sbin/ninfod
    /sbin/rdisc
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  iputils: 9 installed and not shipped files. [installed-vs-shipped]
  WARNING: iputils-s20190709-r0 do_package: iputils: alt_link == alt_target: /usr/bin/ping == /usr/bin/ping

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-extended/iputils/iputils_s20190709.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index 34a6c682607a..ce9f27f348ad 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -28,7 +28,7 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson update-alternatives
 
-EXTRA_OEMESON += "--prefix=/"
+EXTRA_OEMESON += "--prefix=${prefix}"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.17.1


