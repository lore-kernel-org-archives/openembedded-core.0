Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id CA1356D523
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:09 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w4so1681563plz.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NZ5aPOfJDg2J6TX8sSsFZegSyZAxkGzNqfLTqmoe1No=;
	b=Mk8kNKMK4D/h4khIsvxM3lfCVvFtxHYGLUm2cxauRslIC7OJ9OdmSUxJ+oP3ZOwpso
	fZaiQYUBa5Bbezhq0KUodFFF+F8OZ+67RFTIVjya5X99fz4vcG+t4kF5+8FJNMrg5aZM
	q5N+qt16V20dKXuv8ZcpRvuRFE9MuqRstbu1AWyTpCdz0KSk2JrpnpIHOmTFf2fOhaeT
	YXKBPNlhmIV8EjRISjj589rgH3dabk6M6h/MgIRc1sYuxcTeZdFCKBAYQ3vDmIUa5PTj
	vvMU5mUFCTWm+cxfzsO6Uw7nARntEEfi4h2P65no7XT28kDMhmHbtj+QppErBflYvO6S
	CAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NZ5aPOfJDg2J6TX8sSsFZegSyZAxkGzNqfLTqmoe1No=;
	b=SX07TBkmRJUVPy6qrbYJNmD8izbNy02RHBNMjVIkXPGfcnoYWHKAZXpd2SOcMbT+PT
	KkEvEVpUXP6yUDpfzcoVbQKBt5IlZJQ8Jjf8IjGBP8jxycWWHdtwnNz/+LTlzSi7qfeI
	S0gKAcwNNnaxqWYCCpBjDQNB6d/is3fd2Qg0DfoyxjYAX5GQB5Wrn/oqJoGwLp0BYwYy
	cfECUOEASq0rM10iZ9Q/chFP+L3CQQ8OwEFsQL0SXL5pV/Yavrd/4dayUcr2MRNp/tvW
	5lQoKM0YA8EeqwA+rA4imv4gYNK/fzoxJodeQIT2Hi9vY/cCOIBiI9vjc+J6rwHUVI1N
	C45Q==
X-Gm-Message-State: AA+aEWZ1kUsivJ+ppFLuuQC5/x1OwzTCUPKgQxyEIHvgvUcw+qT9HKx6
	VEv35ENjSnznXczBnb6eMuox2AqW
X-Google-Smtp-Source: AFSGD/XJABxpcxHid1DbQvOQMSzEJ/gBMP162VZ4WvPz1M6Q6UaqZE1A7A6suXJvEpMmix2tqd0/1A==
X-Received: by 2002:a17:902:aa4c:: with SMTP id
	c12mr465898plr.48.1544737150894; 
	Thu, 13 Dec 2018 13:39:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:16 -0800
Message-Id: <f491450556cb4396cccfbb0c600258c2607ac8b3.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 08/45] oeqa/selftest/buildoptions: Improve ccache test failure output
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:10 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The current failure mode doesn't show us what the logs actually looked like
and later cleans can lose them. Show the whole log in case of failure
to aid debugging intermittent problems on the autobuilder.

(From OE-Core rev: 7c3a0dc5978cea898b1ca51decf4d6e7cf9d519f)

(From OE-Core rev: 60b58e976dcc2a45a036e18cfcc87933a8859c9f)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index e60e32d..406b7e8 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -40,8 +40,9 @@ class ImageOptionsTests(OESelftestTestCase):
         self.add_command_to_tearDown('bitbake -c clean m4')
         bitbake("m4 -f -c compile")
         log_compile = os.path.join(get_bb_var("WORKDIR","m4"), "temp/log.do_compile")
-        res = runCmd("grep ccache %s" % log_compile, ignore_status=True)
-        self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % log_compile)
+        with open(log_compile, "r") as f:
+            loglines = "".join(f.readlines())
+        self.assertIn("ccache", loglines, msg="No match for ccache in m4 log.do_compile. For further details: %s" % log_compile)
 
     @OETestID(1435)
     def test_read_only_image(self):
-- 
2.7.4


