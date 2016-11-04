Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BA80171B7B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 10:53:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c17so3286223wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 03:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vgzmR8lJTt1YikrYK3D2nPXBP+KXM7f6iXd0JW8+l3E=;
	b=LHvskkt7nCLYClKyyHiDGi0yaSi02ToxZUXiU+Q16CDRaMlGoIJZ1PD3mkBIqhVvGC
	aKz4svKwVxmnnUbAEJItJ0btktZlWqk5gV67lUBNutjwbl/cB9F7YSF2MCniz2FtceO2
	f2xXo13xhYt2JS0cL61U/XPo35nq5alv20p2xfDKA07MKJPOiBiFbIbWsfjMmOilKvT9
	A32FHEOKjTVeFnlyUPwZnYP9StSwtdmBZBJQQSjApjmlLNe+Rj5Xm2gzP2q4XhD/hHY2
	juzPS1XsJckufP+RxCquYoUGJn0c8bdrV1SBSDaLzUdaVRvh4OQDemyokSv3fpO6Nlv4
	oRgw==
X-Gm-Message-State: ABUngvfil233sDCvGwd+QWss17FJHdvtPhYXrkKhV18rkxhN008rdHUag8fpf3KwELeZ+Q==
X-Received: by 10.28.66.7 with SMTP id p7mr1218912wma.64.1478256815313;
	Fri, 04 Nov 2016 03:53:35 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k74sm3933587wmd.18.2016.11.04.03.53.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Nov 2016 03:53:34 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2016 10:53:33 +0000
Message-Id: <20161104105333.15896-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] image-buildinfo: treat staged changes as modified branch, too
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
X-List-Received-Date: Fri, 04 Nov 2016 10:53:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

When staging changes in a layer using git add, image-buildinfo
doesn't detect this as a modification, because of the way it
uses git diff.

Surely, merely staging, but not committing changes to git
should not result in image-buildhistory assuming that the
git repository hasn't been modified compared to the branch
HEAD, this state should be treated similarly to modifications
being unstaged.

We have to use both, git diff and git diff --cached to get the
desired result.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Reported-by: Lukasz Nowak <lnowak@tycoint.com>
Reviewed-by: Lukasz Nowak <lnowak@tycoint.com>
---
 meta/classes/image-buildinfo.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 3003f5d..da1edf7 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -28,7 +28,9 @@ def image_buildinfo_outputvars(vars, listvars, d):
 def get_layer_git_status(path):
     import subprocess
     try:
-        subprocess.check_output("cd %s; PSEUDO_UNLOAD=1 git diff --quiet --no-ext-diff" % path,
+        subprocess.check_output("""cd %s; export PSEUDO_UNLOAD=1; set -e;
+                                git diff --quiet --no-ext-diff
+                                git diff --quiet --no-ext-diff --cached""" % path,
                                 shell=True,
                                 stderr=subprocess.STDOUT)
         return ""
-- 
2.10.2


