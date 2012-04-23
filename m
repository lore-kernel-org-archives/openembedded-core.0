Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SMJ9S-0000SM-98
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 15:17:58 +0200
Received: by wera1 with SMTP id a1so7545896wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 06:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6BFnK8gDvzY55bGhUPYxIK12qv1ww1s/WCOUQ96Omis=;
	b=Lfg/TZ+CmHufJPCrkYGlCJF4MogLDTPdghorl02u9iyJbXFltLzlpF7xxZQDI0DXQN
	yqODcyUhwqtLyVQPePcXBwy2c9rPWq870y+MIdGE9AEwH75iMedzXHtm+DXQZ2UGEKYn
	e3gAktb8NRDwkk1hitwashdU9YOzx6Ms1x9eoPqsEwry1lFCdx7sWv/m6Vluvj3AbEr6
	tu7by9ZykznhXB7mDpUOLZChZivwEHUDghIjVSk2QQ77YAbMhcrNb//f/aAjHYPVMz44
	hyHPCHwdc2+Z++wuwoY2GjeIO4+OfCdyiKpqzASVRvS47rlSiAqiMKczU+FdWXk3wqDL
	hz5A==
Received: by 10.180.80.70 with SMTP id p6mr21084584wix.21.1335186505112;
	Mon, 23 Apr 2012 06:08:25 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm34990719wib.9.2012.04.23.06.08.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Apr 2012 06:08:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <9301829E-837E-4C49-A3B8-57208CE9A196@dominion.thruhere.net>
Date: Mon, 23 Apr 2012 15:08:19 +0200
Message-Id: <3A2828E0-62CF-45BC-ABE9-5A41755B0C90@dominion.thruhere.net>
References: <4F8AC160.7020405@kth.se>
	<44025B47-33F8-44B8-94A1-2C8E8B866C1E@dominion.thruhere.net>
	<9301829E-837E-4C49-A3B8-57208CE9A196@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlYWA/KKVh89AeWXLjSC9geFqOHkP54Y2BNH7E8SSSdDUBLphx/dsBXJgbWvksyHPrGuoZ5
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] Python library hashlib is missig hash-code.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Apr 2012 13:17:58 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 23 apr. 2012, om 10:15 heeft Koen Kooi het volgende geschreven:

> Op 15 apr. 2012, om 16:35 heeft Koen Kooi het volgende geschreven:
>=20
>> My theory is that this is caused by the openssl /usr changes, can =
anyone confirm or deny that?
>=20
> I dug into this. The breakage was recorded by buildhistory:

[..]

> I'm going to band-aid it so we can get a working python hashlib module =
in the 'denzil' branch, hopefully someone will come up with a proper fix =
soon.

After spending some more time on this and getting a ton of help from RP:

Python can't link to anything in ${base_libdir} due to a combination of =
python having a stupid buildsystem and the patches we apply to make it =
less stupid. The only fix I found to get hashlib and ssl to work in =
python is to revert the patch to openssl that moves libcrypto around.

I really need python unbroken in the release branch, so I see a few =
scenarios:

1) revert openssl patch, seperate /usr doesn't work properly anyway in =
this release
2) fix python
3) revert openssl patch, statically link libcrypto into dhclient.
4) bbappend openssl in meta-angstrom to revert the openssl patch

There are probably more scenarios, but I'm going to have lunch before =
thinking some more about it. My question to all of you:

	How do you want to fix this for denzil and how do you want to =
fix this for master?

And to be clear: I'm mean getting things into the denzil branch of =
OE-core, not getting it into the release, it's too late for that.

regards,

koen=


