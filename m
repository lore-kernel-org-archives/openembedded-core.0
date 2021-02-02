Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: vfJDdVndqtlkkrX4u7bMZ4MT4Qw6rj/H3KXJuQTIq9dsg95xnrvajvTf7+a1fweNB2NENCEypJ
 nqvVKCL+2yKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876898"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876898"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:26 -0800
IronPort-SDR: +i3ba86y3zxqHawXUpOoW07IpzyI/D0rLpOLHoaKjlyyOrWK10yXheSv7SQzfyb4UZnKYY4xB0
 s9aj1rNFT1qQ==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360938"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:25 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/25] sanity.bbclass: sanity check for if bitbake is present in PATH
Date: Tue,  2 Feb 2021 13:33:54 +0800
Message-Id: <59de426a624edcb02a0f7ad53ee5955d9f3b2cf3.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

If a user executes the environment script instead of sourcing it,
there's an error about an empty element in PATH. This is because
bitbake isn't present in environment variable PATH. Hence, this
patch adds a sanity check to verify if bitbake is present in
PATH and if bitbake isn't present issue a warning message.

[YOCTO #13822]

(From OE-Core rev: e08799913a7f207bc63e085eb98196fd61ed57bc)

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dbd80a923c9075d363f69ffd86b4392c210d668d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 0e7ad45c94..16275b2ea5 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -794,6 +794,11 @@ def check_sanity_everybuild(status, d):
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
+    #Check if bitbake is present in PATH environment variable
+    bb_check = bb.utils.which(d.getVar('PATH'), 'bitbake')
+    if not bb_check:
+        bb.warn("bitbake binary is not found in PATH, did you source the script?")
+
     # Check whether 'inherit' directive is found (used for a class to inherit)
     # in conf file it's supposed to be uppercase INHERIT
     inherit = d.getVar('inherit')
-- 
2.29.2

