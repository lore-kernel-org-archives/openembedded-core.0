Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 773DD6101C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 23:28:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p2so209421wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 16:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1ELj6FnQ7y38pCHQBqd8H2QWgqEorS8avAxh/aybwHQ=;
	b=Nsqgvz2EIfFJV/4W51jgNcyAcowN5yJrkPghRGAcI5vYVMnSwSucs2MfRPIIMBeKUx
	uQzzlx62Uouah8pdefnYws+RaPA0i0QTjSc7+q0BJqRQWQ88w9Vh9jwt/uKY+Ory2bfj
	3PoVtnYmrjfQsMwjFCv8jWap6ljflNpVKtXXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1ELj6FnQ7y38pCHQBqd8H2QWgqEorS8avAxh/aybwHQ=;
	b=FqJLt+y3RH9BkWV9qU8WCiyWGEK+wARI1IbTGa3YenCxkyimlvRjTJKBifI1dfS+Xi
	VIZFoTMpfikDmkdU9vJvU7Wzb/M0/JSthVBOk9N144+cTE+YLPTLX2XVyZ7ct6vs46cB
	OPYSUwTRpH8hWZ3PDwcAD7LYBJzbjXJgY1jaANs2XCr4IR3sxuaMPpsRFOi0qeQG5AZD
	l1mqwkApNfD2pwC39mZM2+txOuMDQ3uh9rrTHxqfR98YFt2Vu11e7DiBkXDIgIbWvWwz
	FDQvbUgr/Or8qbOm03Ih+73LnE6Xid2f5J6fSCXuTEkLvRHbufsfIE+4+IZvcBog1IHV
	pCaQ==
X-Gm-Message-State: ANhLgQ3NKDoOmaqICyIyBP6LpkrCRSZqysQP0eMAvSbqCYvIyQ1yeTbU
	XBFkBGja4+nRPInVrZd7flg/tQmi3QQ=
X-Google-Smtp-Source: ADFU+vvXuf7uUnrwssICACqp+jcL/OM8TXFRh3ZkAs1kLCrFx8Lbi6czrrR7PSJS8l+iEGFDSPEC+A==
X-Received: by 2002:adf:ed86:: with SMTP id c6mr257363wro.53.1583882897736;
	Tue, 10 Mar 2020 16:28:17 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c85sm6254460wmd.48.2020.03.10.16.28.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 16:28:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2020 23:28:11 +0000
Message-Id: <20200310232814.48572-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
References: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/6] oeqa/testsdk: Use original PATH
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
X-List-Received-Date: Tue, 10 Mar 2020 23:28:17 -0000
Content-Transfer-Encoding: 8bit

We want to test the SDK with PATH from the original host, not with our own
tools injected via HOSTTOOLS. It even uses some tools which aren't in
HOSTTOOLS.

This is necessary after changing the SDK to not reset PATH to the system
default which is bad for other reasons and brings the testing into sync
with that change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdkext/testsdk.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 785b5dda53a..c5c46df6cda 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -25,11 +25,8 @@ class TestSDKExt(TestSDKBase):
 
         subprocesstweak.errors_have_output()
 
-        # extensible sdk can be contaminated if native programs are
-        # in PATH, i.e. use perl-native instead of eSDK one.
-        paths_to_avoid = [d.getVar('STAGING_DIR'),
-                        d.getVar('BASE_WORKDIR')]
-        os.environ['PATH'] = avoid_paths_in_environ(paths_to_avoid)
+        # We need the original PATH for testing the eSDK, not with our manipulations
+        os.environ['PATH'] = d.getVar("BB_ORIGENV", False).getVar("PATH")
 
         tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
         if not os.path.exists(tcname):
-- 
2.25.0


