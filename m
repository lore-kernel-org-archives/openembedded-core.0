Return-Path: <matt@madison.systems>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 26B60786D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:34:09 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id l24so6571151pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 11:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wIjgKYCOewxwZduYPTcRosx3kGE/rUHYOCBTi8KsiCo=;
	b=AkD4eENn8PulqRlQUlk1jRo1xJbYIusPgXSIfh0jImAoQpfCT5stVLjOOlzK9vP3L3
	ZgBvhVZPvasD/+Kfw38Gjjflv8FOaumSbuc7bXhSt4HSzHomTTtm3jrMByFxEvqfhSQj
	zltp2tlQCqCdnSFLHTGUmsDaHJQP2gZ5lNeJG/gPohFmcdbQxo8HVejtx/yOGYbdsHSW
	ZXtXR42IJPFJ+ul6pZxTksncq033FpuLptGYXsYZR//s03NGniafRZnoXDM9qt4mF1Mg
	MR2+qXF72pdGmnpCrLJ07yAXToFHGeG/hIBChVp9C1Pid8ZwzR2g/usUwzI1QAdNdyqn
	eJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wIjgKYCOewxwZduYPTcRosx3kGE/rUHYOCBTi8KsiCo=;
	b=jzZQZ1XJWY7DofHTOw7XIawgjjWmIuNpWrcUV7YIabey7CtZa+C21AMeyvmY2IFCxY
	WNaoeohD6AjZntIODBgZyVwookd5ny13ZoJ/8r9EhGxLRTrX8T/cE5QF1ZSTS8wgrqxh
	XpPy8g8YXsQCeik/hp6XI/01v3gsn0DSlqngL5HZo6XXwqsFrLb0rV7oOWFNUJ2ItPwD
	MdwVlhO5uEhJFQFsUsjZu7amJl4Z0GW5qaLWy2vGQRptiDNWR9HAZ180zZpAP/O2GaeB
	5Md16CfM2qgcOLep+micY6dYWAMaQ34HIq9qffrQKJojR6qAdU2+n7EFk8PUFcBYhLNq
	TfPQ==
X-Gm-Message-State: APf1xPCKC7N3U7TzdL6MRCWhRwSlt3pfsTrwyDO64LCyubPMs+VuYxzR
	VHWf920QG2v9tv08AIbE9LD+4P/q
X-Google-Smtp-Source: AH8x226gblpNbIVyvbV43+PNgD1RfGjFM018jNEgA0OCpY+RHn3cnFlyqnGB0DhrO6nTFuvS1qN8fg==
X-Received: by 10.99.176.68 with SMTP id z4mr9064333pgo.74.1519673651156;
	Mon, 26 Feb 2018 11:34:11 -0800 (PST)
Received: from ip-172-31-34-104.us-west-2.compute.internal
	(ec2-34-218-58-157.us-west-2.compute.amazonaws.com. [34.218.58.157])
	by smtp.gmail.com with ESMTPSA id 84sm8542736pge.23.2018.02.26.11.34.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Feb 2018 11:34:09 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 19:33:15 +0000
Message-Id: <1519673596-4750-8-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519673596-4750-1-git-send-email-matt@madison.systems>
References: <1519673596-4750-1-git-send-email-matt@madison.systems>
Subject: [PATCH 7/8] goarch.bbclass: disable shared runtime for nativesdk builds
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
X-List-Received-Date: Mon, 26 Feb 2018 19:34:10 -0000

While useful on embedded devices for saving disk space, use
of shared runtime in Go is not the usual practice, so disable
it for nativesdk builds.  We don't use it for native builds,
either, so this makes the SDK match the native environment
more closely.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/goarch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 1021b94..5c8ed33 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -24,6 +24,7 @@ GO_DYNLINK_x86 = "1"
 GO_DYNLINK_x86-64 = "1"
 GO_DYNLINK_powerpc64 = "1"
 GO_DYNLINK_class-native = ""
+GO_DYNLINK_class-nativesdk = ""
 
 # define here because everybody inherits this class
 #
-- 
2.7.4


