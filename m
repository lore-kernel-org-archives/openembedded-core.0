Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2A2996161F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 04:17:40 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so1249870pbb.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 21:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ytnVoUK5e3+AGQm0Z8TcVC/FIa7nNvwOALns5R+ZORM=;
	b=0JSCS/SNrjp9ZbUQpysUn0QS/+EBSdxtmSRx62NsquweUMOe1bhl/u91K6d7kuNgy4
	nxJ0qOGa67wA5caJhdrqjwIuaxF2CYevu3RhMSJwFMymb5AepZ71WX7jGHGEs9rDwq00
	tBMw3KVjpBDiC8+TqkC+i9t9X6L82BdBeYfcEwe/KhRUua0UfpONekuk8rUBlUiTDYR8
	DgCtnD+iITKZLpIXzrNGqMkRQrYe4D9qGZdQfgGW1rk0VdbA8AJwOvXSbxLVwvtHqkyF
	zs/5StnvuHp5VTEkjjEMJ6mPuFTOPSY3z6C2QCwGQXRsEVAcA4niUhS3O+7+ws0hsAid
	L6Zw==
X-Received: by 10.68.229.2 with SMTP id sm2mr6983274pbc.68.1378354662355;
	Wed, 04 Sep 2013 21:17:42 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	tr10sm32571783pbc.22.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 21:17:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2013 21:16:09 -0700
Message-Id: <11a2d5bfa905cc6144a2de753f9902842c647738.1378354382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
References: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
In-Reply-To: <cover.1378354381.git.raj.khem@gmail.com>
References: <cover.1378354381.git.raj.khem@gmail.com>
Subject: [PATCH 04/13] package_rpm.bbclass: Trigger the regexp on exact keyword match
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
X-List-Received-Date: Thu, 05 Sep 2013 04:17:40 -0000

This causes issues when postinstalls have ERROR keywords
its interpreted as error and image build is cancelled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index cc77c5e..c58f18a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -60,7 +60,7 @@ rpm_log_check() {
 	lf_txt="`cat $lf_path`"
 	for keyword_die in "unpacking of archive failed" "Cannot find package" "exit 1" ERR Fail
 	do
-		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
+		if (echo "$lf_txt" | grep -v log_check | grep "\<$keyword_die\>") >/dev/null 2>&1
 		then
 			echo "log_check: There were error messages in the logfile"
 			printf "log_check: Matched keyword: [$keyword_die]\n\n"
-- 
1.8.4


