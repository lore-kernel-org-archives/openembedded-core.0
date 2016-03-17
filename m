Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0915273194
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 16:01:15 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id m184so104659857iof.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Pj/kgsHGFDZhsBEYtQIqulSFyPux75F3GlfvyPUhtUc=;
	b=mgzh3+YW56GPgao+XeBm4S7H6Kiw49tEBdaJ4Yf0F0y6jGN7vzBfVPdhFuAMhBAQfc
	onhFulmXhQa1PJHHNcjnk3VxDxK12geHE5pV5fW0uSbyTLaVvgyyHJYRQZ/2L2LBRL4L
	n5w2vKbI3GzR7uVPeIITCuD1mMP+72U5kcwK9SB7snEe4C4WXWL8Go0PdxfDqPwRZDg9
	4E572Ysm2mS5jWtPSPpRfNP68QqRLdheVzY4gkErsxTOaCi7v42EGkw/H5ahm0bmBoDV
	/YSsExxa/5ecRIBx5elCn7ABPexcl95DZyLEi2aIVW83ojlz1LvDdNuEraz/8pVYnTVX
	jkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Pj/kgsHGFDZhsBEYtQIqulSFyPux75F3GlfvyPUhtUc=;
	b=GRlhfgkRDuAp9JBbL6pLeijy+MzrvKpqIcxZM4o2yz4rMXKaA1q84mQpHA9jcVU1A+
	7z2k7T8cLOhPJT+HjS+o1Enc4lck+RdCKeT0kRZzOKyS16nI31oR27sixA0pn0kpejvd
	5d5ixitqeZnet1DaFyCQ+Q9HcVqbO6Ace+ePXLvpl02MglJ774uutDkZiYIYpd63eVCH
	Zv11tu6tTA8WIh1ZTy8xvuKFdxEjuJ+F3BqEgKRtzbmRP59JMuQhOVkeAlsHm8k8p/Kz
	JdcEmoiAB5LwThMn6ykmiXMI6QwsypnAmPwFFcUN/mFsb4bAU6FDawfGqtSjpjLVdNLM
	s/jw==
X-Gm-Message-State: AD7BkJIWf4O95Y7NCccOpeZdbdBId3tae15KAsFzR6hT49D/QDGf3PVg56i9J8oSlbfBZ//f
X-Received: by 10.107.13.65 with SMTP id 62mr10813361ion.186.1458230476174;
	Thu, 17 Mar 2016 09:01:16 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A57A7E.dip0.t-ipconnect.de.
	[87.165.122.126])
	by smtp.gmail.com with ESMTPSA id 8sm3878001ioe.8.2016.03.17.09.01.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 09:01:15 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 17:00:57 +0100
Message-Id: <1458230457-18785-3-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1458230457-18785-1-git-send-email-patrick.ohly@intel.com>
References: <1458230457-18785-1-git-send-email-patrick.ohly@intel.com>
Subject: [PATCH 3/3] sanity.bbclass: allow customizing config file update error messages
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
X-List-Received-Date: Thu, 17 Mar 2016 16:01:17 -0000

The default file pattern may be amiguous and "meld" might not always
be the preferred tool, so allow distros to override those parts of the
error messages.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/sanity.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2539bd8..e72a007 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -34,6 +34,9 @@ BBLAYERS_CONF_UPDATE_FUNCS += " \
     conf/site.conf:SCONF_VERSION:SITE_CONF_VERSION:oecore_update_siteconf \
 "
 
+SANITY_DIFF_TOOL ?= "meld"
+
+SANITY_LOCALCONF_SAMPLE ?= "${COREBASE}/meta*/conf/local.conf.sample"
 python oecore_update_localconf() {
     # Check we are using a valid local.conf
     current_conf  = d.getVar('CONF_VERSION', True)
@@ -45,7 +48,7 @@ files and merge any changes before continuing.
 
 Matching the version numbers will remove this message.
 
-\"meld conf/local.conf ${COREBASE}/meta*/conf/local.conf.sample\" 
+\"${SANITY_DIFF_TOOL} conf/local.conf ${SANITY_LOCALCONF_SAMPLE}\" 
 
 is a good way to visualise the changes."
     failmsg = d.expand(failmsg)
@@ -53,6 +56,7 @@ is a good way to visualise the changes."
     raise NotImplementedError(failmsg)
 }
 
+SANITY_SITECONF_SAMPLE ?= "${COREBASE}/meta*/conf/site.conf.sample"
 python oecore_update_siteconf() {
     # If we have a site.conf, check it's valid
     current_sconf = d.getVar('SCONF_VERSION', True)
@@ -64,7 +68,7 @@ files and merge any changes before continuing.
 
 Matching the version numbers will remove this message.
 
-\"meld conf/site.conf ${COREBASE}/meta*/conf/site.conf.sample\" 
+\"${SANITY_DIFF_TOOL} conf/site.conf ${SANITY_SITECONF_SAMPLE}\" 
 
 is a good way to visualise the changes."
     failmsg = d.expand(failmsg)
@@ -72,6 +76,7 @@ is a good way to visualise the changes."
     raise NotImplementedError(failmsg)
 }
 
+SANITY_BBLAYERCONF_SAMPLE ?= "${COREBASE}/meta*/conf/bblayers.conf.sample"
 python oecore_update_bblayers() {
     # bblayers.conf is out of date, so see if we can resolve that
 
@@ -80,7 +85,7 @@ python oecore_update_bblayers() {
 
     failmsg = """Your version of bblayers.conf has the wrong LCONF_VERSION (has ${LCONF_VERSION}, expecting ${LAYER_CONF_VERSION}).
 Please compare your file against bblayers.conf.sample and merge any changes before continuing.
-"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample" 
+"${SANITY_DIFF_TOOL} conf/bblayers.conf ${SANITY_BBLAYERCONF_SAMPLE}" 
 
 is a good way to visualise the changes."""
     failmsg = d.expand(failmsg)
-- 
2.1.4


