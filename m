Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 80B3D73913
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:30:35 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so104896419iec.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ehAO0m27I/zEhN5c+HFJeSaAIik+XNsx/VN52j3g/uQ=;
	b=ODNWq5PCyuCVp7eCToI8psRV+ruAeRlcqUTfrU2h0P4T0yfIrbJjm0R2Ww+TqNrQ+c
	ZY3B7w6vkvMd4tsxafA5h9mSYWnogAxUXZvwp5RB3pRnIHk3932rWGMw3S7k+7ukBEAE
	800xFeAGPhM438a3pVCpG5tqB8o76slQh80nAldEcuXu2BoIlC/517HFv7GZ4c97PdQA
	Jw5yK1dBqVsIE6q9Oq/xq6ba7fyvap3FO0aceE+5BY/GvWsNWoPf74F56ZBd8IVFh11G
	j8IFtKp94ztVl0mUcKU8ZV8zidtjWf2uieaPWBUp/xEkHHBInlF0Q7PiGlTuK90EUk6U
	i7CA==
X-Gm-Message-State: ALoCoQm82n9N5/j39Mtzq8FeY/hp2WIjZOcHdXnCOFmW51NgmV8hGBXoOxNi245nbTHcfnfG0uZ+
X-Received: by 10.107.37.132 with SMTP id l126mr84322165iol.42.1426253432093; 
	Fri, 13 Mar 2015 06:30:32 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h15sm1257487ioh.27.2015.03.13.06.30.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:30:31 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:29:40 +0100
Message-Id: <ef456bc46e01a164e37470af85ad2eda6289e18a.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
References: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
Subject: [PATCH 11/11] combo-layer-hook-default.sh: handle patches without Signed-off-by
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
X-List-Received-Date: Fri, 13 Mar 2015 13:30:35 -0000

Inserting the "From rev" comment depended on having at least one
Signed-off-by line in the patch header. Some old repository commits in
openembedded-core and bitbake do not have those.

When inporting those, just insert at the end of the patch
header. While doing so, ensure that there's exactly one blank line
since the last non-blank line.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer-hook-default.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/combo-layer-hook-default.sh b/scripts/combo-layer-hook-default.sh
index 46f2b70..1e3a3b9 100755
--- a/scripts/combo-layer-hook-default.sh
+++ b/scripts/combo-layer-hook-default.sh
@@ -10,4 +10,11 @@ rev=$2
 reponame=$3
 
 sed -i -e "0,/^Subject:/s#^Subject: \[PATCH\] \($reponame: \)*\(.*\)#Subject: \[PATCH\] $reponame: \2#" $patchfile
-sed -i -e "0,/^Signed-off-by:/s#\(^Signed-off-by:.*\)#\($reponame rev: $rev\)\n\n\1#" $patchfile
+if grep -q '^Signed-off-by:' $patchfile; then
+    # Insert before Signed-off-by.
+    sed -i -e "0,/^Signed-off-by:/s#\(^Signed-off-by:.*\)#\(From $reponame rev: $rev\)\n\n\1#" $patchfile
+else
+    # Insert before final --- separator, with extra blank lines removed.
+    perl -e "\$_ = join('', <>); s/^(.*\S[ \t]*)(\n|\n\s*\n)---\n/\$1\n\nFrom $reponame rev: $rev\n---\n/s; print;" $patchfile >$patchfile.tmp
+    mv $patchfile.tmp $patchfile
+fi
-- 
2.1.4


