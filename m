Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D8F8072DEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:38 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so8538214pdj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6kSXceILu+WjX1KWL3frZw76BoPIeoARSJN2f4zRR4M=;
	b=d+Ut5iDtXEfG7x2FlL9lXWloUhBsnl8N5AAfTkwrqXTrBW3/HZzyPCbUk3EDq9JIwx
	SiPdJD5krQx9X0yFc1sUCpaqB9Ac0R8Ic6DGWI/1Pfs04wf4K8565zM7a/5Fk8QXGLjP
	wnV2VGYb/i4NIYAVbhlfLVnNH7pk6qtVGsiFG8LKWyawRp/NjE4l/ZIX9HmOqnB7tgeW
	dYzzwIBspx/kg++takloKa2xQHz7iflNpHNuK/aqVGxJDaTNTRD71okQowJ0cJitIIec
	IY5egM60tLwIz6kUV7ZzptSFH9isXLaLN57r6XxX5XVZxbWHKGAYBhvsTgfIaN27Uh5o
	yduA==
X-Received: by 10.70.90.144 with SMTP id bw16mr6462607pdb.149.1423152340044;
	Thu, 05 Feb 2015 08:05:40 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:51 -0800
Message-Id: <9a819e3e4c85f81f2b7cb7381a73e9da822ac419.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 43/61] net-tools: Fix rerunning of do_patch task
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:41 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Rerunning the do_patch task currently fails. The code is nearly correct
but needs to remove the quilt ".pc" directory and move the secondary
one into place in order to rerun, not move it into the .pc directory
as the code currently does.

[YOCTO #7128]

(From OE-Core rev: 2a775ebbb175dd70fc7228607c306d4ccb9e4ba4)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-25.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb b/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
index 02826a0..0e4ee75 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
@@ -34,6 +34,7 @@ nettools_do_patch() {
 	cd ${S}
 	quilt pop -a || true
 	if [ -d ${S}/.pc-nettools ]; then
+		rm -rf ${S}/.pc
 		mv ${S}/.pc-nettools ${S}/.pc
 		QUILT_PATCHES=${S}/debian/patches quilt pop -a
 		rm -rf ${S}/.pc ${S}/debian
-- 
1.9.1


