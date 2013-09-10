Return-Path: <riku.voipio@linaro.org>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBC76BCB0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:55:43 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id n4so1936817qcx.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 07:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=re3J7qzEVPF55LnAr21wXPu4Lp4S7H1PCwSN3vYRCbc=;
	b=K9QI5KDba1OpeM3rxlwKZL90VRfENu+JYoDCEbM2eb6dQWawGcOFU5XR8DTSgiDF4G
	uQ4FO2VEMonVxPJb09Npm7mPg7nQwIF5hkXU5A+HC+mMpge0M6q16CW8LVtGjheznSSp
	2rExhRW26utDQQMYxJNIDMSuQTGwNrFOMQEbKc8U9hUn12nWW3z912lmzGar9/37n0e4
	eUn26BHbbTF+5avWw34OCTEjrsq+q6jefc2H1LM8eZDKryseUcPNxVdZUxhCnhQZileI
	hERZW93zYMbxfTUtEDBTNUT/tgpK7fCnoryTW0XmIFraeuNNYIijHQ6YrNToBxVj2j2Y
	PBlw==
X-Gm-Message-State: ALoCoQk2sZ37x8x0PIyIm0I2hyXiUB6B2kMaquYqvg0/xOWBr0CRFMOGkQRPzppwuBunnUsWu6Z5
MIME-Version: 1.0
X-Received: by 10.49.107.226 with SMTP id hf2mr32535294qeb.17.1378824944564;
	Tue, 10 Sep 2013 07:55:44 -0700 (PDT)
Received: by 10.49.81.137 with HTTP; Tue, 10 Sep 2013 07:55:44 -0700 (PDT)
Date: Tue, 10 Sep 2013 17:55:44 +0300
Message-ID: <CAAqcGH=avmRB5GS23tj+JjckQ1Y-RrTnTkQmBHTFggnwDbihRA@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Using pigz-native from sstate-cache while zlib-native is not there yet
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
X-List-Received-Date: Tue, 10 Sep 2013 14:55:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I've started observing build failures with pigz-native fails due
ttrying to use too old libz (from host), instead of the one in
sysroot. I take most don't see this bug because they have new enough
zlib on their host system.

| DEBUG: Executing shell function sstate_create_package
| gzip: /lib/x86_64-linux-gnu/libz.so.1: version `ZLIB_1.2.5.1' not
found (required by gzip)
| tar: Child returned status 1
| tar: Error is not recoverable: exiting now
| WARNING: exit code 2 from a shell command.
| DEBUG: Python function sstate_task_postfunc finished
| ERROR: Function failed: sstate_create_package

This seems to happen, because

1) pigz-native is extracted from sstate cache
2) zlib-native is outdated, and it's compilation is being started
3) another task trying to use gzip/pigz meanwhile

Simply setting DEPENDS_class-native = "zlib-native" in pigz.bb didn't
seem to help. These errors started around September 3rd, and it
unclear to me what exactly changed that exposed thise bug.

Full build log at:

https://ci.linaro.org/jenkins/job/openembedded-armv8-rootfs/label=oe_persistent_cloud,rootfs=lamp/484/consoleText

Any hints howto fix this would be appreciated,
Riku

