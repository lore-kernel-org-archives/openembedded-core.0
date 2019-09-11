Return-Path: <twoerner@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id ECE257EC43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 19:46:08 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id b136so48773285iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 12:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=cIeii1HPCuFL0UbtJUI+iqVQncD1Qh8l3DTJUmZezEU=;
	b=j+1YpponTCzDoiaRbPgX8AKGJWSefoPSOjcZcgznsqGVrkDhDIu9irPGVHIKiz7i9J
	naqVdb6HlaVLCQ54Nr2kW5NAgXFFhF4KtgY+MMzgZE0XLmHfH3V18PplfOQBY2jF69f1
	G05J+tsC+vb6IdTk1CFZeIm1IiMY84LiPTobZeBYovCCWJLWbpLHEdKzTiA6VjuuXudq
	S1fWKbN5dF0Bj/rDQVnYuytZRq26qmWKsq7AgFE//RmUSZqc5KBUxplZnjEH4iJIako7
	JDBIJa3AZOKeROW4gFkkOBiYiWyEBrWF12qqYgG3nWYZsqtPDWG1LV7WO9IbIa4GMCwS
	9Nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=cIeii1HPCuFL0UbtJUI+iqVQncD1Qh8l3DTJUmZezEU=;
	b=a7BtSFniOpKiTs4kV00O/l84VXUALQU6/lDsAesK9YqEcLZ6JLvGSwoMHv63jmDeo6
	YeTYJS0mMOrsdfpGuqlmxCXucMukBD7Gj4kHQdj++T+k5FAWlFqAGjHwHwm0I3ZFk0po
	KRtBszgcxaRnYr+HS5uKA9rlselwoqo3UHcrItL4KqHtvKCp5X4NTXkDi8uD5c9G22yT
	rEU+mtSzJK7kbL4pnjJWNOih0/mOfb8i8Uvabr8VwjoOHtOj5kwspD3/uybP5yhLuGR+
	S2PErJRW/r4d/PaSpUXxCtxITqRz44hoGS7KrwRC9ynQqsSUPd7PhDsK3YdHzJb26S+N
	rkrg==
X-Gm-Message-State: APjAAAURSttMW7Ks6HrywEhnoxYEixPykFm4Ov7esXdqnfaT1P7bi5v4
	mFgrI4xKXlLzWE9URD3bae2DY6D2JSk=
X-Google-Smtp-Source: APXvYqxj8u6+jB6Gd+U+z1y2h4aqs1f5jVv813GZ1RMCuSKjsN+QuFNsY3XcNiR905HsmmCx2OtAuw==
X-Received: by 2002:a6b:6619:: with SMTP id a25mr2506553ioc.286.1568231169902; 
	Wed, 11 Sep 2019 12:46:09 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	80sm44005404iou.13.2019.09.11.12.46.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Sep 2019 12:46:08 -0700 (PDT)
Date: Wed, 11 Sep 2019 15:46:06 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20190911194606.GA6574@linux-uys3>
MIME-Version: 1.0
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: using wic and extlinux together
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
X-List-Received-Date: Wed, 11 Sep 2019 19:46:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Maciej,

I'm working on an OE BSP layer and was hoping you could help direct
me somewhat. Ultimately what I'd like to do is add the string " debug
earlyprintk" to the kernel cmdline (for U-Boot). The BSP I'm working on uses
wic, and has a "--source bootimg-partition" configuration in its wic file.
This invokes scripts/lib/wic/plugins/source/bootimg-partition.py.

In theory there are two ways I could reach my goal:

1) tweak scripts/lib/wic/plugins/source/bootimg-partition.py to include the
   extra options
2) generate my own extlinux.conf file

Generating my own extlinux.conf file involves defining a bunch of
UBOOT_EXTLINUX_* variables. When I do this, the extlinux.conf file is created,
but it gets ignored/clobbered by the stuff wic does. It looks like the wic
code has an option to look for an extlinux.conf file, but for some reason it's
not finding the one OE is generating. Any idea where it is looking?

	configfile = cr.ks.bootloader.configfile
	...
	    custom_cfg = get_custom_config(configfile)

In any case, there is no apparent way to tweak what wic generates. Either wic
generates its own extlinux.conf file, or it uses the one it finds (wherever it
is looking).

Would it make sense for me (or you, if you want) to tweak
scripts/lib/wic/plugins/source/bootimg-partition.py to make use of any
UBOOT_EXTLINUX_* variables it might find when generating the extlinux.conf
file?

Best regards,
	Trevor

