Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web08.10961.1627571325167605865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 08:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=X0nbSHhN;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 186E62E891F
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 10:08:42 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1627571323; bh=NHNIkwxWqEmc6VE8trhJImm0QMDKKQlhUyAxZmf7fpA=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=X0nbSHhNERsWag0CvNFTiULZC5t2MpaSj0Zp1XtrVlmvDZJOWDYw0dGdGMpnUa32k
	 9+AQz5iBdZX7tcIcm4m7if7bmEUFcnphTCktcqRvC1Gzarfulvj/rT6dManrc3o7yM
	 uY2rtGt5QyqNahFLwlJwQRYLh6+6YRRAlVooAORbu8AYFIPo8jMP/WweHrjd/0izA+
	 2PHvfbysz4Qiv0Ec0Eks62cqOHHscrWuf3zn+HJTbe9lOXDorhGflBbX9tfQ0RGi9J
	 CWCaHOXAPw+LHu0f522d9FCkbF1s1bPaCoi5jHiigqG2NZJqZkMDwrOZC9KpVc8Ynb
	 6vMQQtypWBnHw==
Date: Thu, 29 Jul 2021 10:08:38 -0500
From: "Seebs" <seebs@seebs.net>
To: "openembedded-core" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH pseudo 4/4] Do not return address of local variable - unverified
Message-ID: <20210729100838.76076078@seebsdell>
In-Reply-To: <17af2450a5a.11cd2feba245412.5780322336925190641@ertelnet.rybnik.pl>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
	<20210727114906.191837-4-dwrobel@ertelnet.rybnik.pl>
	<20210727104712.385ad146@seebsdell>
	<17ae8cdb530.110af7c7857737.3405175808509729608@ertelnet.rybnik.pl>
	<20210727115246.04b8ffa4@seebsdell>
	<17aec78de72.dbb79e7b5562.7908341287383433208@ertelnet.rybnik.pl>
	<20210728151641.667338a5@seebsdell>
	<17af2450a5a.11cd2feba245412.5780322336925190641@ertelnet.rybnik.pl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Jul 2021 14:37:28 +0200
"Damian Wrobel" <dwrobel@ertelnet.rybnik.pl> wrote:

> the PSEUDO_MSG_OP is being unconditionally assigned to the msg.type
> before any real usage of the 'msg' structure. So, if I'm not mistaken
> that code was already tested and didn't work well and was reverted
> here[1].

I don't think that's identical.

	msg = (pseudo_msg_t) { .type = PSEUDO_MSG_OP };

zeros out a number of other fields.

Anyway, if it fails with msg declared static, I'd be interested in
a minimal reproducer for it, I don't see anything obvious that ought to
care about it, but I would easily believe that the other fields not
being zeroed out would cause weirdness, which is why I suggested a
complete assignment to it, not just overwriting the .type field.

-s
