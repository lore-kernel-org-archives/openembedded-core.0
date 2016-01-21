Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A6C7B6E687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 20:38:31 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l65so235574331wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 12:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=dmBN1/uBjJG3ST4DzflkeR31oPznPySj2hAQ5azlQgw=;
	b=Nj2i9zLmz+w4vaGk8PrmtqNpYcNtH1BuSg582W2quSz65nlLQu4GCRElO4shp3Zju+
	DbsCZzauWM8YKpTg4kRYME0z12G6zPmxmeXQ70NxFtPvnN0u1GjBuCaPOnfy2qKze/Kd
	9Mexnrms6rLZG+tjNLs0s6YIRPlExdkqu5gi/4cU538qa0xUKURM8R4f2fwQq29huAY/
	Ld/5wYJjYqDp+zHCnZAzd0VHLlBdHggYrkgX01tchXQdePeA1UlPQQUlhu0ZtC/ZUeOU
	ehRIztjYCLDGRYXwJpnTrIQFKFOnrRaF2Ks17XQ5D2I8q+P4TScYFact+PdCrDpFztWD
	TxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dmBN1/uBjJG3ST4DzflkeR31oPznPySj2hAQ5azlQgw=;
	b=MHLrUwEjh2jTP2jk+K0LpHUVkiF+ZijTxwl602gGj0RUnISiFAx44szdPLpkhGzGHc
	56SNERGwc2iEXSC78oc1cY0STYoM6rT8V6d0kuB24X4Yu7EG9cCh5F9A5++VX+gGdlse
	tLYyHKcBJslzyHTl0HGOybl83RODS/c4PsqsEcdou8BtBeqxZiEla87hCy6TaDGIdkw7
	fu47lUSwWFf4X+h4atQcvhuKYgHMkpFeAshejx9wfBqSi7CKtnOIER6xmNNIVu5A07eK
	u2yaGHt7cwO1T8vkxqVVSmAtHPFlqR/KPyBjG5L+YIMUi8KEK3NFFm3gCznFhzXORByD
	oOSg==
X-Gm-Message-State: ALoCoQkX8fFU29yppV78DX9kdla2RfzG/z13YEOu97N/EokV2LqMjXn0FpDDaIZNXpGb/ctVvNzuvqQp4MQ3JYaB2QnAkQQU6g==
X-Received: by 10.194.234.41 with SMTP id ub9mr44195294wjc.9.1453408711998;
	Thu, 21 Jan 2016 12:38:31 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q75sm31483227wmd.6.2016.01.21.12.38.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 12:38:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 20:38:29 +0000
Message-Id: <1453408709-32367-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] update-alternatives: when warning about alt_link==alt_target, say what PN
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
X-List-Received-Date: Thu, 21 Jan 2016 20:38:33 -0000

A warning that doesn't say what the PN is doesn't really help.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/update-alternatives.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 825cc88..70a8185 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -252,7 +252,7 @@ python package_do_filedeps_append () {
             alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True) or d.getVar('ALTERNATIVE_TARGET', True) or alt_link
 
             if alt_link == alt_target:
-                bb.warn('alt_link == alt_target: %s == %s' % (alt_link, alt_target))
+                bb.warn('%s: alt_link == alt_target: %s == %s' % (pn, alt_link, alt_target))
                 alt_target = '%s.%s' % (alt_target, pn)
 
             if not os.path.lexists('%s/%s/%s' % (pkgdest, pkg, alt_target)):
-- 
2.6.4


