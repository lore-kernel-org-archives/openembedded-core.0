Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 41F8B7F87A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:33:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id s1so13856579wro.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lsVAWn7dToG6GXGytdmJWcFHM5J9/QzJgUT65DzuCHw=;
	b=jc+OSkC/hyk1+9NWz6fLm3LEDykkygHBeHNE2bghfLnn0g6NoDq5lYrnyMYVayHuTE
	2efRwW1Mu1c07ZVMnc8mz+ERhyBVTBD4QTRnp0QEo+8M/Z1uIQE9Q46jArpcBr4XgTz2
	6vtG3F+aL7w1ZSMHeUPYa+fKf2PtqqPj8chFYsMjWP+7dx9l6LBc56p+wLKI2hVQLGf3
	4onAnoKnwNvBcNNkkSsBNlw8mlU0K59xQhLZxApv+vZ77PcorVhB/vn9569kxIPO/XDw
	HPMusGT3qYuVIxCRCEHJRP9I/RbRQtQ0GQt7M87JSZMFu46JKlGWsbNtT8F+zPB0v/kB
	JTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lsVAWn7dToG6GXGytdmJWcFHM5J9/QzJgUT65DzuCHw=;
	b=t6RHlNBFW0jw7cWCBO+vLua28B8WxKXUrolkBNzSSiDRnbJ3L6PDm2SytlVC1pmJrZ
	0gkM028EmlZ4fKdZp8Hyly4xDRMjyRRz5j3nzanOz/Aq+Ipiw4wmaoSuMW4nPXPSK2cs
	hIZ8sLSHoY+fuIO6iHBIeYeCDlJUcJ44+2QgOEElw5HHIKFPCl16nUJAvuImIMtJvn17
	4zjQFMWtrMr0af2JOFRG+1tNjKB3RJu0fx8c6EcGJ0/PoJdnEEkDYpwBPy0rga1nYKvX
	YBGGV/IOYleVHjFXm9RsJBrHRsXjoyHZFB6FJ7KIqKu8acWLbmnSgrOCAE/U4cuqFAQ5
	XY6g==
X-Gm-Message-State: APjAAAU2U8GpXTAZzh1kcizeUKyZHEIUBsw3NCGOe7prj+sJ/sog5Qin
	3nBXt7U40CyGhfhSaDD9pW7klHIkAqY=
X-Google-Smtp-Source: APXvYqyUzY/U1umSrma6+gW6zTOIP6c7XQMgDc0WKxOGx+oizU6YR93sExs+BuTFVo+brm7oh1pfFg==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr8717805wrt.195.1571844829806; 
	Wed, 23 Oct 2019 08:33:49 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a9sm29321247wmf.14.2019.10.23.08.33.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 08:33:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2019 16:33:46 +0100
Message-Id: <20191023153346.2382-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] buildhistory-analysis: filter out -src changes by default
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
X-List-Received-Date: Wed, 23 Oct 2019 15:33:49 -0000
Content-Transfer-Encoding: 8bit

Like the -dbg package, this package is automatically generated and contains
source filenames.  We expect this to change on every upgrade, so don't show the
differences unless the user wants to see all changes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 708e1b388e2..5b28774c980 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -413,7 +413,7 @@ def compare_dict_blobs(path, ablob, bblob, report_all, report_ver):
                 if abs(percentchg) < monitor_numeric_threshold:
                     continue
             elif (not report_all) and key in list_fields:
-                if key == "FILELIST" and path.endswith("-dbg") and bstr.strip() != '':
+                if key == "FILELIST" and (path.endswith("-dbg") or path.endswith("-src")) and bstr.strip() != '':
                     continue
                 if key in ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS']:
                     (depvera, depverb) = compare_pkg_lists(astr, bstr)
-- 
2.20.1


