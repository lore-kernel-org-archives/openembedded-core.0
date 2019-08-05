Return-Path: <loic.poulain@linaro.org>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id A54947ED96
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 16:05:40 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w13so79297817eds.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=ILbH5kziEASsh3JtohYvXmTkvGqzjq08qWOh9CQ/qnM=;
	b=yGkej34iClQTUqP+bIZutRB/SDsjKMwfZRoPoLu0/OmuyajI5QgpvEx/nEAbJuZArZ
	+TINnLXL8oMpocpCdBBypexLZyp0TlXZisV8/gdFutzAhPICpHjRLrljbzWcWQbIMdo+
	+fAs/W2aC0zYBgwi4DbTRjpoGlhIr53K6FmYIsLljG162/rHHFCRHGKNSf4q5pcjliNU
	yRf19HR65pxn+SRWnHohMNH6qtu7Wkl0mYiSRZE8sOcbGyiY3LFUCpF4LeibHrC6dFDZ
	Q8n2sZdMYwUQ7f1HSfCjU/Wdgcnj6AUDJl5JQSIR909gukQKzqRwYRM0tQi/CRMuOsbg
	EoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=ILbH5kziEASsh3JtohYvXmTkvGqzjq08qWOh9CQ/qnM=;
	b=IFuRp8EBf2UZG7VLK7T7j7GnRWfw51CPzYce/hOhf7tsSt5txDqq0Uhvt22rAMFC21
	ojlr5jMq7CGdzlPRZpifeCBGPzQoVJCfJHFiKoOyMDjmT5rOB278+usKJs4A3awYBHZv
	DhQgvM305bOtISGtdj78WmFWZ34EZYkuTJud5EyUgsonRkGtel2dpD0awu8zW+zS7xEN
	Esf1Bfh2aB0ODvFK/dTix9rIHFTO1xlB5jCCLW4Q6jOM/QeLLIw0gw0vd4raiv4jzdyU
	m/Dx7KYL4IgFr5sHx5kA7eVaiXWW2B4gTPVU8jbzPH/0zAuLOx1axUVxonDAOyL4TcRA
	jk1Q==
X-Gm-Message-State: APjAAAVZwUt23QlRABZFlGXfka7nz6H+a73ZOtZGw7sn3LtX6TYr4QFf
	RS25WNMsOE7lmmg2EbjrXfKVqJEbqtztG0T4lpNDOAhA
X-Google-Smtp-Source: APXvYqw+n7pAyyO/LCFJLXJ1J9wLRLp+wXs9obxBiMO3LXxP6F3YXkqNMKObAZK6uN/PrPE1N7PqzIgRXqhLxSdUDQw=
X-Received: by 2002:a17:906:95d0:: with SMTP id
	n16mr118652094ejy.116.1565021141004; 
	Mon, 05 Aug 2019 09:05:41 -0700 (PDT)
MIME-Version: 1.0
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 5 Aug 2019 18:06:03 +0200
Message-ID: <CAMZdPi_2=mFZFgwzUVis4BE7P3C4boOZmVB6_eYeLCaT0wLJaA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Automatic prebuilt management
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
X-List-Received-Date: Mon, 05 Aug 2019 16:05:41 -0000
Content-Type: multipart/alternative; boundary="0000000000002d071c058f60e1fb"

--0000000000002d071c058f60e1fb
Content-Type: text/plain; charset="UTF-8"

Hello,

Say a company works with an OE internal tree, with open-source and
closed-source packages. The company wants to release the tree so that its
customers can fully customize the images/distro. The closed sources being
only available internally, the company has to generate and handle prebuilt
binaries for proprietary packages. Ideally, with a unified public/internal
OE tree (same recipes for internal/public build).

This question is actually similar to an older thread:
https://marc.info/?l=openembedded-core&m=146779329804683

I started to work on this and added a 'generate-prebuilt' class which
generates a tarball of ${D} in deploy/prebuilts after do_install task.
Symmetrically, It's also possible to create an 'install-prebuilt' class
which bypasses do_fetch, do_unpack, ..., do_install with noexec flag and
instead uncompresses a previously generated prebuilt tarball into ${D} and
continue normally. But I would like something smarter, e.g. first trying to
check if the SRC_URI is available, if not switching on using the prebuilt
package if available (e.g. in a DIR_PREBUILT)...

Before going further is there already an existing solution for that? do you
have any recommendation on the easier/best way to achieve this?

Regards,
Loic

--0000000000002d071c058f60e1fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Say a company works w=
ith an OE internal tree, with open-source and closed-source packages. The c=
ompany wants to release the tree so that its customers can fully customize =
the images/distro. The closed sources being only available internally, the =
company has to generate and handle prebuilt binaries for proprietary packag=
es. Ideally, with a unified public/internal OE tree (same recipes for inter=
nal/public build). <br></div><div></div><div><br></div><div>This question i=
s actually similar to an older thread:<br></div><div><a href=3D"https://mar=
c.info/?l=3Dopenembedded-core&amp;m=3D146779329804683" target=3D"_blank">ht=
tps://marc.info/?l=3Dopenembedded-core&amp;m=3D146779329804683</a></div><di=
v><br></div><div></div><div>I started to work on this and added a &#39;gene=
rate-prebuilt&#39; class which generates a tarball of ${D} in deploy/prebui=
lts after do_install task. Symmetrically, It&#39;s also possible to create =
an &#39;install-prebuilt&#39; class which bypasses do_fetch, do_unpack, ...=
, do_install with noexec flag and instead uncompresses a previously generat=
ed prebuilt tarball into ${D} and continue normally. But I would like somet=
hing smarter, e.g. first trying to check if the SRC_URI is available, if no=
t switching on using the prebuilt package if available (e.g. in a DIR_PREBU=
ILT)...</div><div><br></div><div>Before going further is there already an e=
xisting solution for that? do you have any recommendation on the easier/bes=
t way to achieve this?<br></div><div><br></div><div>Regards,</div><div>Loic=
<br></div></div>

--0000000000002d071c058f60e1fb--
