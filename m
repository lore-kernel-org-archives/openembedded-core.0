Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 585D978EF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 21:58:02 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l2-v6so2521283wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 14:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7D4kEpZS2AozrXZvKmzJFLH5H8PZ8hZ8yy8ipAlPuig=;
	b=Qu1VFK74kKJL2RJXaWJG5xkeIluxphD8neZIz46Bc0+MrfrDUf0KuZ4FVtaJnqfvf1
	nlszru8kVQ4j5RQWW79E87RWFoZhEgMjNjig9ZHcquelPiNHmqk6Lug8/iQunoqdSKuA
	3hk+hUPhAgWEs4QloaO3XeQG7+xDVRFgSupA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7D4kEpZS2AozrXZvKmzJFLH5H8PZ8hZ8yy8ipAlPuig=;
	b=Z42qjMEOIHRWOfKDcVY8o7Flu6IuxODETScNpMWPtCyrZtQ65RXR81sF4wAwQo65sD
	LjfTnoGYiLAJbkkuDVtyeIKJPsliUvAYF3Bybj/+BS4DcAoQDBVdxe82yeJ8pa8lvEjP
	3S/jEeeJyFYVMl9iwaeMdrxq2pNUV144BISoGFxsmNW2QEdcLDqxSWs83vPOwrEthX+S
	SWvEtpKfcHzbqd+A54do1ZndkYecP+wQjnRj0udUFZFvqwij6o0k7DpLib2nRuWvclRg
	C6aw8XCkbj+bBNdaM4Pdy1jr9+sMjMqaTcVELows6AEqdUYBRec126UiaRaAk1d0Mgcy
	4QoA==
X-Gm-Message-State: AOUpUlENr8A9ogi16/iJ/oeI0WLThAYPvPWwvI2rc1dMB52j4QjutTsr
	06A03eXiYtpjAXrfPWyulxfxcykSr7o=
X-Google-Smtp-Source: AA+uWPyu9uFDARTpK4TMxujl2aFtZVeZUSQUXmLtMAhCoN2xuqabcvQKdLpNbtnCxrzS6GFA27c34w==
X-Received: by 2002:a1c:e708:: with SMTP id
	e8-v6mr2583975wmh.134.1533938282772; 
	Fri, 10 Aug 2018 14:58:02 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q2-v6sm1874773wmc.44.2018.08.10.14.58.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Aug 2018 14:58:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2018 22:57:58 +0100
Message-Id: <20180810215759.7843-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180810215759.7843-1-richard.purdie@linuxfoundation.org>
References: <20180810215759.7843-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] sstate: Remove DEPLOY_DIR_IMAGE from SSTATE_DUPWHITELIST
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
X-List-Received-Date: Fri, 10 Aug 2018 21:58:02 -0000

Replace the generic whitelist entry with entries for the three specific
'problem' cases in OE-Core. This means the general DEPLOY_DIR_IMAGE entry
doesn't mask problems for others as was recently encoutered by users
reported on irc. In the whitelisted cases they occur only in multilib builds
and the files are identical.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6743becf071..9927c76596e 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -25,7 +25,7 @@ PV[vardepvalue] = "${PV}"
 SSTATE_EXTRAPATH[vardepvalue] = ""
 
 # For multilib rpm the allarch packagegroup files can overwrite (in theory they're identical)
-SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_RPM}/noarch/"
+SSTATE_DUPWHITELIST = "${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_RPM}/noarch/"
 # Avoid docbook/sgml catalog warnings for now
 SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
 # sdk-provides-dummy-nativesdk and nativesdk-buildtools-perl-dummy overlap for different SDKMACHINE
@@ -33,6 +33,10 @@ SSTATE_DUPWHITELIST += "${DEPLOY_DIR_RPM}/sdk_provides_dummy_nativesdk/ ${DEPLOY
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_RPM}/buildtools_dummy_nativesdk/ ${DEPLOY_DIR_IPK}/buildtools-dummy-nativesdk/"
 # Archive the sources for many architectures in one deploy folder
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}"
+# ovmf/grub-efi/systemd-boot multilib recipes can generate identical overlapping files
+SSTATE_DUPWHITELIST += "${DEPLOY_DIR_IMAGE}/ovmf"
+SSTATE_DUPWHITELIST += "${DEPLOY_DIR_IMAGE}/grub-efi"
+SSTATE_DUPWHITELIST += "${DEPLOY_DIR_IMAGE}/systemd-boot"
 
 SSTATE_SCAN_FILES ?= "*.la *-config *_config postinst-*"
 SSTATE_SCAN_CMD ??= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
-- 
2.17.1


