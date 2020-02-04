Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id C4E1D6119F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 08:43:20 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t2so21865214wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 00:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=qlIO2XtQc/yZf/wpckwIKch6rqxiKCG05p/6O00HoDY=;
	b=YPV4ZceYiA59Vw7UoX/H0Z2pw27TStx6ZFAXvMjkIj6ZOChAKhO6yW29mTNLfy6m/B
	/5bC5E+IYBjG8FMTe7RSrDohSwyuUYodj+I/xftj2g/wY/HzfUFqKCQUcB745IsitFcI
	vQOHT/doP1k7YLPBcLEl3ehXS1TmB8loOV01tNOb4qbcrV2LlYQY8+kdxkRiWRnnGYz/
	AO/93FimtzMrW0ORhoICRZJxv8c/8BP17trZXh5MEzwXpyfDd+o+QW/d+pK2imdgTXGC
	TiHQR+hMlecKadIzsK5LHt4KGi8rhgBkE0Yf9Y0bG3VyBSGG3vBiC00j1QPMdDLnMDye
	74pw==
X-Gm-Message-State: APjAAAW49G78YlzC85jjQVpZkc/kv/38nh4GeWPZM2NLwXf6huQ02YzJ
	fQuk+6rjAqL6H+Sj4PfQ4id+bgsd
X-Google-Smtp-Source: APXvYqwgQ0n4gQtzhTfUJleVuyAyBki5NZ+rU+tR4HSbBe+5LETUdDACbWLll+HW+/t9IbvIkQzVyA==
X-Received: by 2002:adf:f302:: with SMTP id i2mr20851234wro.21.1580805801174; 
	Tue, 04 Feb 2020 00:43:21 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id t81sm2826793wmg.6.2020.02.04.00.43.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 00:43:20 -0800 (PST)
Message-ID: <edb7d26f5a7a2edfdde15409818bed954ec27dfd.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 04 Feb 2020 08:43:19 +0000
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: nondeterministic -c testimage (python3 from hosttools vs recipe-sysroot-native)
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
X-List-Received-Date: Tue, 04 Feb 2020 08:43:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I have some OEQA image tests where external python3 scripts are invoked by the OEQA
test case.

Those external scripts use #!/usr/bin/env python3 as shebang.

Now it appears that if rm-work is enabled, those are run using python3 from the
tmp/hosttools/python3 symlink and without rm-work, they run using python3 from the
recipe-sysroot-native (which all makes sense).

But the whole testing becomes a bit nondeterministic... In particular, those external
python3 script import modules that
are not available in the recipe-sysroot-native (but
they are in the host's python3 installation).


What is the correct solution here - considering that
a) OEQA test cases themselves are run using hosttools' python3, and also considering
b) that additional hosttools symlinks are added if testimage is enabled (via
bitbake.conf)



1) Should testimage remove the recipe-sysroot-native from PATH (for the duration of the
test) so that everything runs in the same environment? Or 
2) should my image update TESTIMAGEDEPENDS and depend on python3-native and all the extra
python3 native module recipes from OE.


I'm inclined to send a patch to update PATH for the testimage run, but wanted to gauge
opinions first?


What is the correct approach here?



Cheers,
Andre'



