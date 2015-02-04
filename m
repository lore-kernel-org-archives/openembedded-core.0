Return-Path: <alexandru.damian@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 223BC60169
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 14:19:37 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id h11so10860194wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 06:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bdUIAse7j9bNOh5RTrQcjiuSNG1UnAKv39d61a6SSME=;
	b=WjQcXTsU/ITcKlvbMJI6NbDPxA5W5aIWEHiG/Rg98hysB1ta8uPAV9JYwv6+4IDy69
	LgFXVsp9XkUg/x7MZ8BPQYngpB1qNfdWfWRYI1NaXdZ3VLHXqKlgcTWZ1UIbT+x4fn7e
	t5iBHj7W6JCKDgwzT2y/YTKdwgtxoLGb+S7FLPJQbusnAMBQWju7jbZ35+oHvfabxZlc
	1m0KzL8cHu8AaKFpmkIA+W72DU9SqZXTXEauf4H+mvoJKdZICq+076TFjBbK/3E4PAjN
	3J8R9mF6DBZwUY+4x+jkwuK4+4Sa6Nh/l8DH2LTNcyfreW4q+w3cSNjbpY+cUHIKXdw8
	zguw==
X-Gm-Message-State: ALoCoQlClNIBUlf99nORRrJ0bX+7lQn/IWAldabYXCwIkvZrHOpC48f3/NSZ4/BOQdtwWxT4vU70
X-Received: by 10.180.38.66 with SMTP id e2mr15599268wik.62.1423145977394;
	Thu, 05 Feb 2015 06:19:37 -0800 (PST)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id 18sm7559856wjr.46.2015.02.05.06.19.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Feb 2015 06:19:36 -0800 (PST)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id 65D645622BA; Wed,  4 Feb 2015 14:13:59 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Feb 2015 14:13:56 +0000
Message-Id: <1423059237-10195-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] scripts/oe-selftest: fix startup backtrace
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
X-List-Received-Date: Thu, 05 Feb 2015 14:19:46 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Fixing a backtrace dump that happens if the script is started
without sourcing the oe-init-build-env first.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 scripts/oe-selftest | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 2332b22..74c998b 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -102,6 +102,8 @@ def add_include():
 
 def remove_include():
     builddir = os.environ.get("BUILDDIR")
+    if builddir is None:
+        return
     if "#include added by oe-selftest.py" \
         in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
             log.info("Removing the include from local.conf")
@@ -116,7 +118,7 @@ def remove_inc_files():
             for f in files:
                 if f == 'test_recipe.inc':
                     os.remove(os.path.join(root, f))
-    except OSError as e:
+    except (AttributeError, OSError,) as e:    # AttributeError may happen if BUILDDIR is not set
         pass
 
 def get_tests(exclusive_modules=[], include_hidden=False):
-- 
1.9.1


