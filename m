Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3064B7FC09
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g24so4361865wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QwBCnFU5ZMZOzJnNrmyXTizNkY32vmUNNK6JRylTgMo=;
	b=WnSj6VStk12kv4isFgXVA+ftUVjk5iGFkwkuGnRjiq52Z4WlKMa72Nl2tdV0ZNrdHW
	GenAAcIF22tgxq+hxFzVNLx/I5NyfPTOhJ49dpa5fQbcVOfjZtNhKNK+VeBi92LbnzvE
	/VLsaz2Aoqd1FAr3HZjXigifbO3e1hZRbXMJwy8/fwHK3UoxqIAa6IzyJd7oACdvr8FB
	IwcjNYPT/+9kwurhRUYsMSQDf1wVU4mBekuO3yCVWvANDDlj3J9kpYXAb0bViUJOUUIU
	VTdx/O857+o4pT141YIMch3E0jncQ+ZFePhNEv7+DeTV2gsq3fIeYjZx6uTzXXHtm15S
	yvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QwBCnFU5ZMZOzJnNrmyXTizNkY32vmUNNK6JRylTgMo=;
	b=OrnmZiw7uuXCAuSfF0W28CfZMN69KbGEsQSDoQOcx8lEzBXt7nYgFVC7fDhExF5V1P
	kX4k/9wCxwheaA+wf7DwA3mg7zDNz2eMc6zSVs8s2afbMAwyg1htE/v63BpHRSfxA5X3
	FFoGfR+QPJ3ukOMKxrwFgt5jmNPMYAFcyhuC9KvFNQIg9Uxh5HsXKmxuumy67V0iKZW+
	qWGD2nxVbty8rdJEUGIFGVrITkwxMBSB3CDIKtEp8E/uFmxHxuHnl+qugHWJ5b0fsp3T
	ad7/k7ntfFZSvuBbEwG7YOgYhWQhtrgNpWiyBMNLKOrmEQrh5IIUicHjXkPCElkCzQon
	cxQw==
X-Gm-Message-State: APjAAAUbV7eUyLuXjMM23DX0xFrkmw0ponECCCwndqbO61XHgQtMaB1Y
	3DQE5ksK3C3FPbgViabkzxG5bnrMKKs=
X-Google-Smtp-Source: APXvYqyVULlMknpO3I5P79A6Hq3fiaoed4kGNueN9PVsWLNPx0j/IEsaWCqOOmbbvli1uVMoFKIqKA==
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr6616035wmf.162.1572072612640;
	Fri, 25 Oct 2019 23:50:12 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:42 -0700
Message-Id: <95d3ca54453cdb0662fae2a2cf7e8173611c86f4.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 10/28] sanity: check the format of SDK_VENDOR
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:12 -0000

From: Ross Burton <ross.burton@intel.com>

If SDK_VENDOR isn't formatted as -foosdk and is instead for example -foo-sdk
then the triple that are constructed are not in fact triples, which results in
mysterious compile errors.

Check in sanity.bbclass so this failure is detected early.

[ YOCTO #13573 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0efd8d4d0dbc30e6505b42f5603f18fa764d732)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2d3f49e..705062b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -798,6 +798,11 @@ def check_sanity_everybuild(status, d):
         elif d.getVar('SDK_ARCH', False) == "${BUILD_ARCH}":
             status.addresult('SDKMACHINE is set, but SDK_ARCH has not been changed as a result - SDKMACHINE may have been set too late (e.g. in the distro configuration)\n')
 
+    # If SDK_VENDOR looks like "-my-sdk" then the triples are badly formed so fail early
+    sdkvendor = d.getVar("SDK_VENDOR")
+    if not (sdkvendor.startswith("-") and sdkvendor.count("-") == 1):
+        status.addresult("SDK_VENDOR should be of the form '-foosdk' with a single dash\n")
+
     check_supported_distro(d)
 
     omask = os.umask(0o022)
-- 
2.7.4


