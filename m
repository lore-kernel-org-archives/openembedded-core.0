Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id D9A8A6AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 21:57:17 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so51307688igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 14:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:content-type:mime-version:content-transfer-encoding;
	bh=3u9NXAzvsJdNzJweGfB3FnaVTm5+VySq8Sm7Te1WECI=;
	b=lu/lJJjp72R+pPdxJXJOnKfl+grArCnjEhqeTgQ7b+qVOw8Eb0dQite+wbPdOsWXhB
	hy0O77GgOnHFCfEbJ5vQq4SswabEufOnqnOnsUMntaTMDflxfN54pqBmETzU+Ka3kZyq
	HwU2QXb9Eutx+4DoXBgRbP6Kwm5Ha4nhEyonGQeccwAKGEdCaMXYlggBlzWTRiRCtrFH
	ngqKw6FsnLpc/HNAAiOoMu2dOBokMzqmTZva6JfVrh/JrNSgifDk14tUn1cfjWhO8Wb7
	Qa7iCvdoMTgDDMZPOTe/R+YRXyCAQWru59K2af8bm+Z3PPX7PhC/yCtUFei7xuHokMV0
	1Acg==
X-Gm-Message-State: ALoCoQku3TO2VN01e5DAzxLw3QMNSDQtVrVdmfP10aeeEdgMnBecRqp13kJMNjT5OsOyRHZJCCoP
X-Received: by 10.50.43.138 with SMTP id w10mr17634465igl.19.1427147838423;
	Mon, 23 Mar 2015 14:57:18 -0700 (PDT)
Received: from pohly-mobl1 (p57A57677.dip0.t-ipconnect.de. [87.165.118.119])
	by mx.google.com with ESMTPSA id
	ie15sm7298993igb.12.2015.03.23.14.57.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Mar 2015 14:57:17 -0700 (PDT)
Message-ID: <1427147834.3412.89.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 22:57:14 +0100
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: systemd + run-postinsts.service
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
X-List-Received-Date: Mon, 23 Mar 2015 21:57:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

I'm using systemd from OE-core master to boot core-image-minimal. I'm
seeing a boot failure where "Run pending postinsts" (aka
run-postinsts.service) gets stuck during booting under very specific
circumstances:

     1. The package has a pkg_postinst_${PN} which (intentionally)
        failed during image building, thus delaying its execution to the
        first boot.
     2. The package uses "inherit systemd" to enable its own systemd
        service.

It seems to be "systemctl start <service name>" which is hanging,
because I can reproduce the same behavior without systemd.bbclass in the
following pkg_postinst:

pkg_postinst_${PN} () {
#!/bin/sh -e
   # Cannot run during image building...
   if [ x"$D" != "x" ]; then
      exit 1
   fi

   # Do something on target during first boot.

   systemctl enable foobar
   systemctl start foobar # <====
}

It works without the last line. The actual recipe is a bit more complex,
but I can try to create a dummy one if that would help.

Any idea what could be causing this and, more importantly, how to fix
it?




