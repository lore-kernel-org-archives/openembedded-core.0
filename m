Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id E99BC731FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:38:41 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id r185so20836518ita.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oE2UWpNPJ00kGYCJnackDfKRCJvLP3n+s0fXN02eNmo=;
	b=guCTU0vHwPSWzaai+qd3vMbG5UiljtrsuGOf1eMlh3+WbxxP652+j2ZCTuMhRF4+7P
	ctLX8+QAJjKOPZYqViYXPBeT1W7Z3ZTT1fW4UU037/D9JTyjTqTX1ueGyJNOCmlot6Qx
	M/vx+PpGUs2KxJTKGy3eV4metN7d14LNIQsl6wfmvnl2SfM8ZhnWveWOZT+CqIlhq7EE
	kOs62WV/WncTv8Tx8S48ASTljntjjUifZVw5DS3M7l9aZl2vFNsmV3KfiX740a70UDtY
	KCLvct29ATRSaa+jIfCRxiE6GFtlV0qdjpPI889rpW0mTMby82s2XaQSW7POscYotGnT
	QOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=oE2UWpNPJ00kGYCJnackDfKRCJvLP3n+s0fXN02eNmo=;
	b=GFX2lLmPS3iSICahMM6ddstIdznvm2CK5Fqb7xK6Cl9ZUrE2FGGxj/psNuemZ7vXwe
	6TSqXM/raOh/WkYMShz0IdWlZE9h+T8NpqyXzUWxzY+DTlimC6yawpt0sSraVdesGtR3
	bZPVrDwjoNd7QH5yQlnCxHpI9tbOGFDembWz6Qunp9vNRXROgEF/TLrdJp12i13fSN18
	0UCBxHE2r7icsw+NJACfIx0LjSB+eDXmyQ82MIE4rAJj+B9kgcQw4jB6F0HJGyvLVI7V
	44yzKPmHq5SeAep78PZAdjPU8PnMIvsh16AD8kV1d4YjMeD6sLzcDhcEk/hdXTMVJusZ
	ed7w==
X-Gm-Message-State: AIkVDXLl5AiTuxRul3kw+bKP/xfSeqkJEf+QoD4x95oU7S9+KSGfeA/6006hPdvnCD9J24J/
X-Received: by 10.36.85.210 with SMTP id e201mr3613323itb.78.1484919522178;
	Fri, 20 Jan 2017 05:38:42 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id e24sm1362361itd.6.2017.01.20.05.38.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 05:38:41 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:38:05 +0100
Message-Id: <ccd453085faa5a7d05bbb838e7909f2e3e11a4b8.1484919259.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 08/12] runqemu: fix undefined variable reference in check_arg_path()
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
X-List-Received-Date: Fri, 20 Jan 2017 13:38:42 -0000

'arg' isn't defined, the right name there is 'p'.

This fixes a rather obscure error message when that code path
ends up being taken:

$ runqemu some/existing-file-name
runqemu - ERROR - name 'arg' is not defined
runqemu - ERROR - Try 'runqemu help' on how to use it

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 45cad90..8bed00a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -282,7 +282,7 @@ class BaseConfig(object):
                 self.check_arg_fstype(fst)
             else:
                 raise Exception("Can't find FSTYPE from: %s" % p)
-        elif os.path.isdir(p) or re.search(':', arg) and re.search('/', arg):
+        elif os.path.isdir(p) or re.search(':', p) and re.search('/', p):
             if self.is_deploy_dir_image(p):
                 logger.info('DEPLOY_DIR_IMAGE: %s' % p)
                 self.set("DEPLOY_DIR_IMAGE", p)
-- 
git-series 0.9.1

