Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9C73860D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:55:01 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id u56so2116587wes.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:55:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NS0aXwfk/MBg21uzqnyVwSis9hVnE0WH+WXu0LlDWxQ=;
	b=XUBjWWH/KkQNqvtT0uJD3ELnlZ8OjtgVvywu2iZcHZwQEESyuwSMuOPifJoMk19Yq4
	TScuUxFdgYC2r40h4S1Sc+6P4yXenHtHi1QXL9PhQe6e27GeO8n23KA6el9aCldQ1qUj
	UNbbB7dcyurTFVNCXd57QAcmVKqfPbVcKEYfRiR97xkbLMh2izetXJAIFsixYYfWx3zD
	hLxVm8ZoJa40FQXR/Yh7/40xBTrYaKS+VSWxQXADsShLQiyopF76oWgFXbYFbwHL60Bs
	s8lNeNBAIfypmR4H27aXe7Bjt/S5Gtu2TSRp/9QhaI95b2TAKdGXhNdIZM+mceFwnzt1
	SYCQ==
X-Gm-Message-State: ALoCoQlTHqaDtDzD2ApyQGOSvKCrxTPGhRmiRLmgBuCLCwz06I6leHqI5cGJI6MIXwEhn1eniZhY
X-Received: by 10.180.90.230 with SMTP id bz6mr3919763wib.17.1389376501764;
	Fri, 10 Jan 2014 09:55:01 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id a9sm3686306wiy.10.2014.01.10.09.55.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 09:55:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2014 17:54:45 +0000
Message-Id: <1389376488-22286-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [RFC][PATCH][V2] cmake: respect ${S} and ${B}
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
X-List-Received-Date: Fri, 10 Jan 2014 17:55:02 -0000

Hi,

Here is V2 of my cmake ${S}/${B} patch.  The class isn't that changed since V1,
apart from the addition of a note if the recipe has set OECMAKE_SOURCEPATH or
_BUILDPATH.

Then there's the choice of what we do with the default for ${B}.  One patch sets
${B} in separatebuilddir.inc for libproxy and taglib in oe-core.  The
alternative is to set B in cmake.bbclass directly to ${WORKDIR}/build.

Either way, this change to the class isn't backwards-compatible with many
recipes in the wild due to various ways of doing out-of-tree builds in meta-oe.
A branch that fixes up meta-oe (by generally deleting lines) is available in
meta-oe-contrib:ross/cmake for reference.  Some recipes are using
OECMAKE_SOURCEPATH/_BUILDPATH, and others are doing out-of-tree builds
"manually" by passing arguments to EXTRA_OECMAKE and doing cd's in
do_compile_prepend. Yuck.

Personally, I'd say we should merge cmake.bbclass with B set inside it by
default.  In my testing against meta-oe, only piglit is troublesome and that can
set B=${S}, everything else seems to be working fine once the recipes were cleaned up.

Ross


