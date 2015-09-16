Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id CDFFC60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 12:11:44 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so33321994igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 05:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:content-type:mime-version:content-transfer-encoding;
	bh=a6S1o9EgejN3kmX66cq9s4XLnZLInAxv/BpUzAe/PqA=;
	b=bYN7n+TnHcNMthgDAQiR6q4mKa5c2Fwf6M3xvrOENtJmlA0MjPHeMJQK9WNZXq2a7b
	sTWT48UAXg+hxvQhVNZf6/AH+Nngr9YDcs9JdqcWMwg3J72aLfpYyMAYsDDDlYMxCWVp
	DPNsyR5fuvoxX+ev1OcKSFDGXnHuYsdju9ohN8ndlWDCFReJeE9ZodMnEuGL+fvDbGc6
	Zym9ddJ38zWtzb1F7YDrOIGg/32Csxn6F3en9d0zCfPqUy0l/sSXf5gDw/T8ggrn9RkS
	1ThASrqHT7bZMhC6br5ZSyuwPWEbdY7t9OOzUMY5VHMCKb5eK93dSr973QU4IxLcbsPC
	Lzbw==
X-Gm-Message-State: ALoCoQmROFG8DW+eRI1VOCdeIA9k5dYeNGR3hpB0Xwi7fgkVLexUGp0cT40FlExuS/0o1urGNc1t
X-Received: by 10.50.103.66 with SMTP id fu2mr4234702igb.0.1442405504313;
	Wed, 16 Sep 2015 05:11:44 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F9BC.dip0.t-ipconnect.de. [93.232.249.188])
	by smtp.gmail.com with ESMTPSA id
	qq7sm1741561igb.13.2015.09.16.05.11.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 05:11:43 -0700 (PDT)
Message-ID: <1442405501.27156.9.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Sep 2015 14:11:41 +0200
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: udev + 60-persistent-storage.rules + IDE
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
X-List-Received-Date: Wed, 16 Sep 2015 12:11:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

I just noticed that udev (no longer) creates /dev/disk/by-uuid links for
my boot partition under qemu when booting a whole-disk image
(hdddirect). The device is then /dev/hda, with /dev/hda2 being the root
partition.

systemd's 60-persistent-storage.rules indeed skips the relevant rules
because "hd" is not listed:

KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*", GOTO="persistent_storage_end"

Adding "hd*" to that line fixes the problem. I'll send patches to
systemd and for OE-core.

I'm a bit puzzled a) that plain-old IDE block devices have never been
matched by 60-persistent-storage.rules (I checked the history) and b)
that this suddenly broke. I'm fairly sure that I had tested that (but I
cannot 100% guarantee that anymore).

Did indeed something change recently that led to /dev/hda?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




