Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id E06EF7C4DB
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:41 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id a6so21848186plm.3
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=59XBNay+BGeZPnlZpE3sKlMbnpSWt9q3hoWV3MTOfZA=;
	b=Ot7Pdvd1Z4u7yKFYl7upUetkGxwsG8VOqV5kGRk1Xx9oVzg2g6eEtVOULpOMhTQoML
	7CORdyopCwhyVdrn6zRCZc+ponSH8Njd+R4Af5vlJiSj8JSt77fVRR9OUMG+IKx4aqgD
	SjbPPZSZrrJ66w8R1K0MmjzCNEDzzfliRkHMWW4sEGBlYYchHGMrWpb2Tigfok4P6rAO
	SIySRqitFi4GreDW2w3wGkqhjmvAYayiTN+R7DU1KQwt4MWmn6Q6IAykHVYP1gDyn/D8
	hJ3nDPxeFkRNMwFnNvYbEvmVe90ZPDKxs7LPDgsM4HZ/ZKyWCiQBvkExVS547Y8HNrXH
	k+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=59XBNay+BGeZPnlZpE3sKlMbnpSWt9q3hoWV3MTOfZA=;
	b=mYqwlqvw0MVoUzSIZAESAKY0v9pkhOH+5ykLEVaKrxbJTnJoG+M/kTve0M2DVmh1nM
	VVJ7nw8Rk5PSyWxWXCgJsyO6lrZrFFkwKFTr9NGelKJa2eab49OPSym+lvgPcALU1Bmw
	OHc+BVEw6wAJDdGuwZfYhZPDC6G3CVSlvht7mjSopXJJTklI/prz7MYlAYq34/YJVVYW
	hmVYmhzC3vIb3agSBJjk41U/Qgw8Mrd7A2wsXeYHN5oWZK2S4xlEhUU+2oPkptcJbbb4
	4EM+ta74ht1dw9k2ZiRKzF2KsziF+3zOVfWlMBOeYUHinVEZiMHKi2mmzYMTcez6cF7h
	o33Q==
X-Gm-Message-State: APjAAAWd2UR10JQqkHjxo2MrUrsZ2XSmk2vvTu5wsbjXecUeb27z3tER
	O4pgy8h/lZ51arY8FEWAdjPTtp7o
X-Google-Smtp-Source: APXvYqyhDAm0dBsQVW0jVavz74xRYsGOHer0n41WIVykvNazC0LdNRUlgf+s9FjFH7wNNOj5dgrFhA==
X-Received: by 2002:a17:90a:8912:: with SMTP id
	u18mr46130662pjn.21.1578364482811; 
	Mon, 06 Jan 2020 18:34:42 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.41
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:09 -0800
Message-Id: <7ce42a30a7508e8fcb496ba05cf6967dc04a988e.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 04/28] sstate: Ensure target sstate directory exists if unihash changes
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:42 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The previous patches meant the mkdir might no longer match the final target
directory. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0af4dae84099e8632a9ea6a4afdbea2f232bb170)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a46dd2e210..79ae392116 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -613,10 +613,8 @@ def sstate_package(ss, d):
 
     sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
     d.appendVar('SSTATE_PKG', '_'+ ss['task'] + ".tgz")
-    sstatepkg = d.getVar('SSTATE_PKG')
     bb.utils.remove(sstatebuild, recurse=True)
     bb.utils.mkdirhier(sstatebuild)
-    bb.utils.mkdirhier(os.path.dirname(sstatepkg))
     for state in ss['dirs']:
         if not os.path.exists(state[1]):
             continue
@@ -756,6 +754,8 @@ sstate_create_package () {
 		return
 	fi
 
+        mkdir -p `dirname ${SSTATE_PKG}`
+
         # Use pigz if available
         OPT="-czS"
         if [ -x "$(command -v pigz)" ]; then
-- 
2.17.1


