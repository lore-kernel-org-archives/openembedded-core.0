Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id B6A5665D00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 16:01:04 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id ig19so18379931igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 09:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=l2uUuf9Fi/Q9TTOi0j1str/7u1ndtAtEyjpVbo4bU5E=;
	b=NaWjM59rM422n5wfKjiclu4FCnqXq9owkirH5/J60QphkuMftaPRAfHoMCHd64n7b9
	tK05C9Lq19Vl0T3KLcq6GQY2YF1+UZ2mputWh4y9GLCNDbV8NfN8r4RGuV5HDxVdi6XJ
	twdM1YBGbZuYGLSTEFJqlrfo+HICdBP8BJVH6zX8mOCk1ghgZ4QMaDITDgBt8pccUDxj
	+OxYPaojFyquowPGu1ktauHMM2cs1PPJhD6s1PIXkiu5bAAs53poD+3PScwLdBdR14yT
	7Ks5bQsfkZ9PImljid/xVawJBlJIxJBKUF82lokPNxGAEnjJnBbpcBgTzH8zVSTa7vP2
	VPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l2uUuf9Fi/Q9TTOi0j1str/7u1ndtAtEyjpVbo4bU5E=;
	b=NHm27e0/rcZM7+5hrV1iDLYbYVVQoaJfrBtBBGcmyp06I1jRp2NT/EnMzImC1V/w0s
	IU4VClxZqAj2xKM4gvI3OuQsb6Cn+DN8XN6coboUuLm5YunaScI/iPbHrE4zUa4jaoEz
	v+LZWTTqoOWT11+o9nESQM122ffjYb6DzyhlVXBR9vho1oZTPO1pHTf0SwnaEVyLO8FN
	mRwxMLjVGCkT0lVfNZ38ICKd6DTLadCrF0rOxmJ4QjpEU9ap761gjEIsLSG6CGiFPI8O
	ajarRLYE83uMFfXpVVcbTMDXWYPC0EZWl2QiXIfRBStKhcdu7+WUNbdATssTWultJUen
	YJ0A==
X-Gm-Message-State: AD7BkJJOuZGOMsYL9wwmLJbNgVKwJDoId56OEo18wD5nRq3Z+ktYTU6aZUG824Q0jjpce4Oa
X-Received: by 10.50.155.72 with SMTP id vu8mr12244370igb.64.1458230465387;
	Thu, 17 Mar 2016 09:01:05 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A57A7E.dip0.t-ipconnect.de.
	[87.165.122.126])
	by smtp.gmail.com with ESMTPSA id 8sm3878001ioe.8.2016.03.17.09.01.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 09:01:04 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 17:00:55 +0100
Message-Id: <1458230457-18785-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/3] sanity.bbclass: expand error messages for version checks
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
X-List-Received-Date: Thu, 17 Mar 2016 16:01:06 -0000

The ${WORKDIR} variable was not getting expanded (anymore?), leading to
less helpful error messages like:

   Exception: NotImplementedError: Your version of bblayers.conf has the wrong LCONF_VERSION (has 7, expecting 8).
   Please compare your file against bblayers.conf.sample and merge any changes before continuing.
   "meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample"

   is a good way to visualise the changes.

   ERROR: Execution of event handler 'check_sanity_eventhandler' failed

After adding expansion, embedding ${LCONF_VERSION} and ${LAYER_CONF_VERSION}
in the error message seems a bit more readable and consistent.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/sanity.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 4873e64..334e362 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -48,6 +48,7 @@ Matching the version numbers will remove this message.
 \"meld conf/local.conf ${COREBASE}/meta*/conf/local.conf.sample\" 
 
 is a good way to visualise the changes."
+    failmsg = d.expand(failmsg)
 
     raise NotImplementedError(failmsg)
 }
@@ -66,6 +67,7 @@ Matching the version numbers will remove this message.
 \"meld conf/site.conf ${COREBASE}/meta*/conf/site.conf.sample\" 
 
 is a good way to visualise the changes."
+    failmsg = d.expand(failmsg)
 
     raise NotImplementedError(failmsg)
 }
@@ -76,11 +78,12 @@ python oecore_update_bblayers() {
     current_lconf = int(d.getVar('LCONF_VERSION', True))
     lconf_version = int(d.getVar('LAYER_CONF_VERSION', True))
 
-    failmsg = """Your version of bblayers.conf has the wrong LCONF_VERSION (has %s, expecting %s).
+    failmsg = """Your version of bblayers.conf has the wrong LCONF_VERSION (has ${LCONF_VERSION}, expecting ${LAYER_CONF_VERSION}).
 Please compare your file against bblayers.conf.sample and merge any changes before continuing.
 "meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample" 
 
-is a good way to visualise the changes.""" % (current_lconf, lconf_version)
+is a good way to visualise the changes."""
+    failmsg = d.expand(failmsg)
 
     if not current_lconf:
         raise NotImplementedError(failmsg)
-- 
2.1.4


