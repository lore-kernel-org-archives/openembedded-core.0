Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D13C7E32C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:17 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id a3so1056035pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9O8AjxGfbafrJOcoNfs9ojVjTv5BJh5ecBiw3sYpfeI=;
	b=AfxgCcvHPeggzOlvjB9Jipu9iyCq3g0Y8i7CDXTNBscg05PTR9/vFbRs64juQjYX+n
	UnS2bfK9ZebGIqT+NlcXrb/HPe4s+4XZcxG0lMnOHfwhh18H96rXhFq6jZ4pWUe3oSNH
	WFNZj0HLXke3iki03CPOcGpv8q/UPAbUpvtV8V8sWAUvH4zttH3d9uNtrEW3fEx6WETr
	qB1aUZElpiPPpr4bw6nTZ+cuzVoSPJ6XoXb8lD2S12llD/oB7qNytTxgOn5Wi2Vw/Z+g
	66jIcUjWGXT1b6XnqVXiDfLmek/Y8MNaOSOmSCoDTrr/tQxlzhVdPVRLo1YYNkyorxFp
	tBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9O8AjxGfbafrJOcoNfs9ojVjTv5BJh5ecBiw3sYpfeI=;
	b=TzoQPD5Z0yTmhokPe4hrgYbmymAUzjI4wyBZi2s9sZ+4yYSgRYvkDS9jndHKvNlaYl
	Ri0a572SG29La6T2QqlzI4s/f9nbRJrbbwk+X9YzhX50ZPHId8U2U88/6zM4uo8hgBUf
	uvUfSxQoo4s6NVOnH1A/QnUN3WBQl3/2Ho0CGDnGjPLC4UUzNmzgoqjk0bPibk4RlNow
	IHmMwQpaQCRwxiRf/Sn/n9FcgMe3WYW74fhqMUAJAtOz2QxvZtX8hsoaQ6ZKC+B8+GmZ
	JI29Mwfdts674991QL1CQsZ9vLfkDWiIPdzDNJIUjf9P6kKHPr+lO4xRAW/7NDi4FHe0
	eaFQ==
X-Gm-Message-State: APjAAAVexgpG/vAM9ascEj+82yoPQuyDX38/+1viFpbxrmSWsEXCp97e
	P12D3aWwdf3D0G4xQ5mS6j1uoxfP
X-Google-Smtp-Source: APXvYqxrGoA72xq0lqZHtKC2A9s93Kxs11DksT0Jyt6EbTsuq5bvbekKPemAQXwuZPbjSAxD16e/ZA==
X-Received: by 2002:a17:90a:730b:: with SMTP id
	m11mr30184899pjk.89.1559574438544; 
	Mon, 03 Jun 2019 08:07:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:54 -0700
Message-Id: <86c9f25d4535663606326e53c33a8927f79e8f52.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 11/21] npm: get npm package name from npm pack
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:17 -0000

From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>

Fixes [YOCTO #12534]

When using npm packages with exotic names, like "JSONSelect" (with
uppercase) or "@angular/cli" (with at sign and slash), there are three
different names:
  - the recipe name ("jsonselect" or "angular-cli")
  - the npm module name ("JSONSelect" or "@angular/cli")
  - the npm pack name ("JSONSelect" or "angular-cli")

The commit fa9c077068a2acea04389fa2b44eb2e93548fce2 allow to have
different recipe name and npm module name by setting the NPMPN variable.

This commit allows to have yet another npm pack name. The pack filename
is now dynamically retrieved from the 'npm pack' command.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/npm.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 6dbae6b..3dd2d13 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -53,8 +53,8 @@ npm_do_install() {
 	# be created in this directory
 	export HOME=${WORKDIR}
 	mkdir -p ${D}${libdir}/node_modules
-	npm pack .
-	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry ${NPMPN}-${PV}.tgz
+	local NPM_PACKFILE=$(npm pack .)
+	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry ${NPM_PACKFILE}
 	mv ${D}${libdir}/node_modules ${D}${libdir}/node
 	if [ -d ${D}${prefix}/etc ] ; then
 		# This will be empty
-- 
2.7.4


