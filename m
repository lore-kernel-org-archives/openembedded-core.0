Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web12.42.1627386556025889681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 04:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=ayShmVGa;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627386555; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bQQHqMDV6pYN5460TcPsW1gw3ja1zLQR6M5qk9If/+lGX1P8SDEH6w2Dloq3eta+zHi2WUtBI0R/YyZGpc9x1vU/xO+84vzPfJu4ASjCJwOX/NUFEezvz+XLnQp/fDOU/jamFe76fyUZ9baftBtPLVEI6gv/9+oJOQLgFcaq9KM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627386555; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=f7fOezCVJRXioXnvNanr4wTkZVtiODED6qWKGPi+qWw=; 
	b=AZxipRBvG87hL4+jI8AvEHDjb6wX2MwTIpVH6k4v0zJ8eEUoql27x7RHz8U+Xo/qXuLu9RoMTmqC4IhITX6UfU/QjoJ97sRwns/V/6y4RcqF+sS3er6YW9V0sf2zcY+64WKT3jdp/iJbv4b5u3YmNOKs3OCmbI+doNx2KlDNRqk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627386555;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f7fOezCVJRXioXnvNanr4wTkZVtiODED6qWKGPi+qWw=;
	b=ayShmVGadKWUOU7fY47DSI8WaRl6rQih1OVSPT2yPl57cnkLYsEbNP9vyiEpNDXF
	+Em0km6WheDR4zxzFeImqVwasEAmCmTIQCKdBW70PlvAqJjTXRUth/7RoL8W2tgbHRM
	r53e12sDOA5T0NYI/HWykeuRLybIoKh/O+z6thWg=
Received: from localhost.localdomain.pl (91.230.58.69 [91.230.58.69]) by mx.zohomail.com
	with SMTPS id 1627386553520679.0726186354657; Tue, 27 Jul 2021 04:49:13 -0700 (PDT)
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH pseudo 4/4] Do not return address of local variable
Date: Tue, 27 Jul 2021 13:49:06 +0200
Message-Id: <20210727114906.191837-4-dwrobel@ertelnet.rybnik.pl>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the following warning:
  pseudo_client.c: In function ‘pseudo_client_op’:
  cc1: warning: function may return address of local variable [-Wreturn-local-addr]
  pseudo_client.c:1592:22: note: declared here
   1592 |         pseudo_msg_t msg = { .type = PSEUDO_MSG_OP };
        |                      ^~~

Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
---
 pseudo_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pseudo_client.c b/pseudo_client.c
index 2583bca..f1d09ff 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -1889,7 +1889,7 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
 	case OP_CHROOT:
 		if (pseudo_client_chroot(path) == 0) {
 			/* return a non-zero value to show non-failure */
-			result = &msg;
+			result = pseudo_msg_dup(&msg);
 		}
 		do_request = 0;
 		break;
-- 
2.31.1

