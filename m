Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF417D200
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 10:26:10 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id x18so1645510ljh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uqOM2G+RFG5gQt5f4y+QfSogVJXBzCnRLfacbddr0q4=;
	b=qL2kJCU8cjlQAFXkApXWMfwXqNTELAiXDwccUuj8xhkFj8XrSztZtN4pokTdQJVpKR
	N17cS5uuyDbEyDBbm0pLLpRPEqq1Wqmesr0rqglbLXW9gDttUIw4SN2SMapMOAENn8++
	XuAFPyZPLGANObuMtH7tCGNYHazKPgp2rk8tKn/0ARB9+jsG35pWX1YGnI2U9uDHgMRF
	9at/aibGaxwrbUismC6c6XvpMCmH0R4rnFn70hLioNddi7gUU85tIBXdquBC2tBoS1ky
	739lg1u8BqxXYMxoLtLOlGTsdgDENq53wmMF5sN/Ujkoma/Mz2Xr8xXWSNbFN2rdSOor
	XzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uqOM2G+RFG5gQt5f4y+QfSogVJXBzCnRLfacbddr0q4=;
	b=FnXT4BzAQFptAQu4gLEv3cMVgfqYU5o/hm8bPOmbxyPVz69X4zjBBnrm0VAHtFqPFE
	BDvnvlS7gzqgv2XFJjWO1oKs7Z0fJvKzn13CUQb4uQtu2WzS1UObCffc91PI8sxnca+z
	UEeOBkB3gfm04jFoaCQS9kSYZEfA2tT/sHiPX+5HF2Qhrr+bYVPCUXEZtHL0DdsJaJA7
	8njYKjkvR6IE4FHc3eD159FFTaruHkTWymUbHcgt5orRT21g0mXap+VpFc4/5lNmu0U4
	CXtrUn6l3eNked08wBGKCZ+j2fcIChHPKhjEozQZ72fzjmPiOUMSI+wr8rTWzHAsXAb5
	xDVw==
X-Gm-Message-State: APjAAAUfTsh0SBkuoYsvyGgF14sRqS7wV8jepEARzbVMdKiSz4II+iJi
	Gy/T+Lj7zZvehicbBYcknUlarBY9
X-Google-Smtp-Source: APXvYqzPNR0oX3xHUXhcIWS0EOO9le61lGqqJ99hGOfJtHSg7Jsud6R79je73YGCprpLkhPCU9JgQA==
X-Received: by 2002:a2e:9bc1:: with SMTP id w1mr17974006ljj.168.1566383170418; 
	Wed, 21 Aug 2019 03:26:10 -0700 (PDT)
Received: from manatarms-greyskull.lan.mikrodidakt.se ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	y66sm3237541lje.61.2019.08.21.03.26.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Aug 2019 03:26:09 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2019 12:25:53 +0200
Message-Id: <20190821102553.17770-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCHv2] initscripts: remove warnings on read-only-rootfs (again)
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
X-List-Received-Date: Wed, 21 Aug 2019 10:26:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Hundebøll <martin@geanix.com>

When the populate-volatile.sh initscript tests if a configured symlink
is already in place, it uses readlink with the '-f' (follow) option:

> [ "$(readlink -f $source)" = "$dest" ]

If the test fails, it proceeds to delete the exisiting folder/file, and
create the configured symlink.

However, the '-f' option to readlink makes it follow symlinks pointing
at symlinks. If the $dest argument is a symlink, the above test fails,
and warnings are printed due to changing a read-only rootfs.

This is the case for /tmp, and /etc/resolv.conf:
> /tmp -> /var/tmp -> /var/volatile/tmp
> /etc/resolv.conf -> /var/run/resolv.conf -> /run/resolv.conf

Fix the warnings by removing the '-f' option, so that the test matches
the configuration.

[ YOCTO #10814 ]

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---

v2:
 * Added my own signed-off-by tag
 * Added reference to YOCTO #10814
 * Original patch: https://patchwork.openembedded.org/patch/152602/

 .../initscripts/initscripts-1.0/populate-volatile.sh            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 6f965a6870..1c525b71bd 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -80,7 +80,7 @@ mk_dir() {
 link_file() {
 	EXEC="
 	if [ -L \"$2\" ]; then
-		[ \"\$(readlink -f \"$2\")\" != \"$1\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
+		[ \"\$(readlink \"$2\")\" != \"$1\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
 	elif [ -d \"$2\" ]; then
 		if awk '\$2 == \"$2\" {exit 1}' /proc/mounts; then
 			cp -a $2/* $1 2>/dev/null;
-- 
2.21.0


