Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 27DBE78BED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 14:42:32 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y9-v6so2863817wma.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/wNBEQn9cLUkCOBnu0cqZp4ai06hPnK3AgD+DOEJ1UI=;
	b=aRpBPD0yrkQ0ZgUOw2teM5qCFcI7t2oPnTQiCjN68pSpkzc8fJ2P8lulHIBYKPbud6
	gYEfZi7UI36ffVnVlxqimrs7pwdL2dY1ouLzhAvteDPlZZ5qVWee3GezhZHfJcRwZxIV
	/953GwIrUmQrCye36Se149ZmRwaLPZ+tgq/Di0Ulw9p+A7m6ICYW2Dd6TH0jIXNjzQm+
	BZIsa91GhKm9ZCw1FPbihdfibrASZSfaV6Yf2fGPPeE2ZmG2BvAfFfJRg5r5WxemEoh9
	SP3lVLGCn5h/x8s8DMyQOghRZvRS86GMbSj5fyB1vHTpjx/i8c7NeJFiHyVztTf0F/ze
	lU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/wNBEQn9cLUkCOBnu0cqZp4ai06hPnK3AgD+DOEJ1UI=;
	b=B9mNr4O1gV1aDNjrk5W9Wx6kKZEQyNBBS0EOT8j2SQs7+TuimOr3EMdJSZz4waFeHB
	0owwEKuIW6rib2MUGgvfsEpfSinr3OWjUjNr+Gdw4hQcNa9ZC0wqpEEPqoq+378VRaIx
	QkukrRtfM+ME0SgcxjmKqKMR2KqJMOti4O68aPbFCq7nDoS5kr9ar4ERFNC8Nu2iDK2j
	nAvxmZUqDHv0+fVCY+Z8L032IrMdugjjhysD0GMJrXTKVNkgARC5UXBYUf651qD4ZhVF
	hmEoW09gbTwfXGstWK0+hp65Gma43kiNFIrLhVWma77O08ZqGIunMNWcFqegtwLxdUSi
	Kyxg==
X-Gm-Message-State: AOUpUlHR4lyQIUVzYa8iIljiUe7a2iFKQPNRsFFDXuAocHu2lB732QWA
	dK9If1uF7AmPoiVTSfngcIjBwbC/
X-Google-Smtp-Source: AAOMgpf3tdqq9jDH1Ae/+5GRDI3HBcM+9c+z0Yq7aPfA0EK1MVbXHMANxX2bqCsnAIr3EDpyANGxaA==
X-Received: by 2002:a1c:e043:: with SMTP id
	x64-v6mr2306042wmg.58.1533220952832; 
	Thu, 02 Aug 2018 07:42:32 -0700 (PDT)
Received: from ip-172-31-46-180.eu-central-1.compute.internal
	(ec2-18-184-144-21.eu-central-1.compute.amazonaws.com.
	[18.184.144.21]) by smtp.gmail.com with ESMTPSA id
	h5-v6sm2218482wrr.19.2018.08.02.07.42.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Aug 2018 07:42:32 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2018 14:42:29 +0000
Message-Id: <1533220950-20222-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] net-tools: Ensure quilt only operates on local patches
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
X-List-Received-Date: Thu, 02 Aug 2018 14:42:33 -0000

When net-tools is built and the local patches haven't been applied, then
`quilt pop -a` will climb parent directories attempting to find a
{patches/.pc} directory; if this succeeds then we end up popping off
some completely unrelated patches from a parent directory.

Ensure that we do have a local patches directory and then turn off the
directory climbing so that we avoid this problem.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
I've been chasing this for an age...

I have a checkout that looks like this:

./poky
./meta-openembeded
./patches
./build

etc.

Inside patches I've got a quilt patch set which are backports from master which
I need for sumo.

I've had a problem for a while where some of those were getting reverted and
I've finally tracked it down to net-tools, which ends up reverting patches
which are unrelated to it. This happens when bitbake hasn't applied the patches
yet and so quilt ends up climbing parent directories until it finds something
it can reverse.

 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 5657fd8..a4e3285 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -48,7 +48,16 @@ PARALLEL_MAKE = ""
 # up all previously applied patches in the start
 nettools_do_patch() {
 	cd ${S}
-	quilt pop -a || true
+	# it's important that we only pop the existing patches when they've
+	# been applied, otherwise quilt will climb the directory tree
+	# and reverse out some completely different set of patches
+	if [ -d ${S}/patches ]; then
+		# whilst this is the default directory, doing it like this
+		# defeats the directory climbing that quilt will otherwise
+		# do; note the directory must exist to defeat this, hence
+		# the test inside which we operate
+		QUILT_PATCHES=${S}/patches quilt pop -a
+	fi
 	if [ -d ${S}/.pc-nettools ]; then
 		rm -rf ${S}/.pc
 		mv ${S}/.pc-nettools ${S}/.pc
-- 
2.7.4


