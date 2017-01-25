Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id A783E71E52
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:07:54 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id j13so10757388iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 03:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jve/6P4idgybZ6DJi85AvEZjKtUjiIzPw0fp36h/+dc=;
	b=cYGBew2puvEJkvYws+taWFI/qb4y4HBV5lNpJsgk/XY74mgjueWTs0YakInQr429ra
	SH/lszz/5PrC1rGy5Ofo/3taLIbZF9lZN6CiRUA5olAk+6x6aolV8G4t8H3L0rF9iEJw
	FFV9xCogtR7HHUAKdN/hbSjjOiGjHX/hTRZdGBVwaFGH+WkZdgeE9Lu63tS7F3siuSlf
	OjwkTNhF3BVmUY4K+oDE9yJ6HxmD78mxX00a0IB2eLFsyMLBjXPdrPQ0OnQBjy0YHgDF
	nYkjSCS0wa6RkcLcbjcNftEakBrIMYAMEc36VFv4h+D26NPE5zMCofLv9FSf4i3Cwpc2
	N6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jve/6P4idgybZ6DJi85AvEZjKtUjiIzPw0fp36h/+dc=;
	b=i8rKsJZON7qAA3xrv1ftZ0t7t2lm55NJS/IbH6St2X3tWvqKsaPnkh0LdQQTctWH/D
	1nx0vtrKSeZa2BWXkvznMVZqDaTKlpatw+ZEeZnNxSf9zU2VvX/NICszhCZhC7R446Ps
	bryhbz+kmvEEXXZFmFlfBbNzj6vstRqO2+cCYW1W15GTvxO7Wr8H6ouW1vsh4DfYywCQ
	GqcjSLwUkHAfLH837QBsVO+orYnIflr429GtX5PAXDvvX7Qim2lkDkrNQApsgdlD0RpF
	+RUZmy4426nhOEr2PeAB8C5tUB42viDvlkZR2wtLXSpfbhmPyW/D303DRH3PmVA//b0/
	P6Kw==
X-Gm-Message-State: AIkVDXKsC8nGZOJWMU2Pnd1j/IS9gSLoQVSCv97WCGlfxAQNjgL9Pq9hvupeU9n3pojQp3bS
X-Received: by 10.107.200.146 with SMTP id y140mr32469916iof.73.1485342474023; 
	Wed, 25 Jan 2017 03:07:54 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A5635F.dip0.t-ipconnect.de.
	[87.165.99.95])
	by smtp.gmail.com with ESMTPSA id o1sm10095533itg.4.2017.01.25.03.07.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 03:07:53 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 12:07:48 +0100
Message-Id: <20170125110748.20037-1-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170125110625.19909-1-patrick.ohly@intel.com>
References: <20170125110625.19909-1-patrick.ohly@intel.com>
Subject: [PATCH v2] image_types.bbclass: rebuild .wks file when .wks.in changes
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
X-List-Received-Date: Wed, 25 Jan 2017 11:07:55 -0000

WKS_FILE(S) can refer to .wks.in files which get expanded during the
build by do_write_wks_template. The actual content of the .wks.in file
gets added to the recipe meta data during parsing, and thus we need to
ensure that the recipe gets re-parsed when the file changes.

This fixes two related problems:
- editing the .wks.in file and rebuilding an image did not recreate
  the image unless something else changed or "bitbake -c clean" was
  used explicitly
- when forcing a rebuild, the cached meta data and the actual one
  do not match, leading to "ERROR: Taskhash mismatch ... for ....bb.do_write_wks_template"

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image_types.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5b1746a68ce..50545d9fdf0 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -265,6 +265,10 @@ python () {
             d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
             d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
 
+            # We need to re-parse each time the file changes, and bitbake
+            # needs to be told about that explicitly.
+            bb.parse.mark_dependency(d, wks_file)
+
             try:
                 with open(wks_file, 'r') as f:
                     body = f.read()
-- 
2.11.0


