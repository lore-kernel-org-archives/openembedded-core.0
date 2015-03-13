Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA0E73924
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:30:29 +0000 (UTC)
Received: by iegc3 with SMTP id c3so107542759ieg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=s8XQesAExycGypyvEv3T6hCsKGeu047tR926kYMh/9w=;
	b=Na4XRF8oSjjUcNQyqUByimFLVog6NBkYqYCExlI3oHr2y7goIvAQxACSz9fYtF2lbn
	CTDEme14ltEFnYiRO7sK0fJ6BzrMMUOz1YDbxx0ZpKWeQlK2193MX/4Y5vuGAJhap64f
	1zd+bPanKKmggQzknr4FxTd4Jutvi4D/8ev8FjIjAkBQBk9ZlBK0mQqjB6yC2lGq+U49
	Fn37WyE3Puyw3B/Ab3jkx3omFAbn3oC5mgjLYurEjDGlgkwvbFC7ktXfNYS3g/Katb9D
	g9dtCspliDOT1T4M82gqanJkOo8lPXJPC/UjnKAJb3Pjc0OwtICeG8NwfnGHwRpVln9u
	fxYA==
X-Gm-Message-State: ALoCoQmlxn9MOEgXh07AnF5j+LyVbDqH0bsrWNDDcGyI9MG8X6dpJQoNveByv0ZtyUghcTwR2TIJ
X-Received: by 10.50.43.138 with SMTP id w10mr110142881igl.19.1426253426384;
	Fri, 13 Mar 2015 06:30:26 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h15sm1257487ioh.27.2015.03.13.06.30.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:30:25 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:29:38 +0100
Message-Id: <47a0cfa7cab65d5fa1fbf004d1e5dc4e1c551eaa.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
References: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
Subject: [PATCH 09/11] combo-layer-hook-default.sh: avoid duplicating prefix
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
X-List-Received-Date: Fri, 13 Mar 2015 13:30:31 -0000

The existing patch might already have the desired prefix, perhaps
even multiple times (due to some previous import error). Ensure
that after the replace, the prefix is present exactly once.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer-hook-default.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer-hook-default.sh b/scripts/combo-layer-hook-default.sh
index 8b148ac..9dd5aed 100755
--- a/scripts/combo-layer-hook-default.sh
+++ b/scripts/combo-layer-hook-default.sh
@@ -9,5 +9,5 @@ patchfile=$1
 rev=$2
 reponame=$3
 
-sed -i -e "s#^Subject: \[PATCH\] \(.*\)#Subject: \[PATCH\] $reponame: \1#" $patchfile
+sed -i -e "s#^Subject: \[PATCH\] \($reponame: \)*\(.*\)#Subject: \[PATCH\] $reponame: \2#" $patchfile
 sed -i -e "0,/^Signed-off-by:/s#\(^Signed-off-by:.*\)#\($reponame rev: $rev\)\n\n\1#" $patchfile
-- 
2.1.4


