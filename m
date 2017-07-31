Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 299DC78513
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 13:57:38 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id u207so95866989ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 06:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=IMkHyRskZAwL5j3CwfMqgVwuebJVJM6ithh+Q5waWqU=;
	b=J4H3B3P+4ZNpPTcYI7dkRIW1EBRTVwNVssZ5PvOcUepzDsocsP8RITQuh3KnWVGJIq
	9i9ExQxujUMZkDSrjaTORgrSNWo+FNY+fB5rcBdG9qiJhyNzXP46SiWOg8/9KXdg+sJQ
	FKTkb9cYGlCJ2tF73Eh1a7WpaDQ37AN/eNjTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=IMkHyRskZAwL5j3CwfMqgVwuebJVJM6ithh+Q5waWqU=;
	b=DPR4SQxzZI76dL0aWL1o6wnioH9iwlrFIZ25I/ZUNsW/2G3wOoCxlqzdfsRbx7hCt/
	M0p4AbCsLO3t3BGDgVvUmZqaqQCWCdUi9qP03ALMEpIfuD+5tx6Mbx29D6nMgtNNAecW
	XB+TZqvp8c3w7Chy3NjHZ3uTRW9NLjPaw7KJfWA1+l2E7AdHzylgY+QlmduZe5ID0Gsn
	TCq7lJcNE9UpTKH8zI8DQKPNwCTQztCUpbnpoGWeOnCvjcc4PDa08MJqOlvc238QNjhY
	T3iwNK2pvjxAQMV11wfV/nQVde2T9qLqFl+d3UWpkZ8mXyo/ibY88QgU7FUN4C/Q9GFy
	j6xA==
X-Gm-Message-State: AIVw113TUX4eP+6KFftu4OpCS3fSJEJL/hQ1lyWsDNn22N8BgL3qad8E
	BfkAaJUBcy6QyYhCLxO8bQ==
X-Received: by 10.37.33.65 with SMTP id h62mr14181713ybh.227.1501509459840;
	Mon, 31 Jul 2017 06:57:39 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1408:4167:b42c:54f:27db:36c0])
	by smtp.gmail.com with ESMTPSA id c65sm3879220ywd.2.2017.07.31.06.57.38
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Mon, 31 Jul 2017 06:57:39 -0700 (PDT)
Date: Mon, 31 Jul 2017 09:59:04 -0400
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Message-ID: <20170731135904.GL16135@bill-the-cat>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Chaining compression support fixes for morty / pyro
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
X-List-Received-Date: Mon, 31 Jul 2017 13:57:39 -0000
X-Groupsio-MsgNum: 100925
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ublo+h3cBgJ33ahC"
Content-Disposition: inline

--Ublo+h3cBgJ33ahC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Armin,

The following changes in master are relevant to both morty and pyro:

commit 0a7ce0b971a208956cb895ba5a869ec8c5d94703
Author: Tom Rini <trini@konsulko.com>
Date:   Fri Jul 21 18:06:33 2017 -0400

    image.bbclass: Correct chaining compression support

commit 98a2afeb3a53bec7a72a4a9846e1dba636cc6f3d
Author: Tom Rini <trini@konsulko.com>
Date:   Tue Jul 25 15:58:09 2017 -0400

    image: Fix "metadata is not deterministic" when chaining 2+ CONVERSION_=
CMDs

And fix the problem where you cannot make arbitrary combinations of say
"ext4", "u-boot" and "xz" images.  In the interest of full disclosure,
it is entirely possible that there are image types introduces in other
layers that have the same problem that the "u-boot" type had which lead
to 46bc438374de being done in the first place, which is to say a new
IMAGE_CMD that also cleaned up the intermediate files on its own.  This
may make this too risky to pull into stable branches and that's fine.
Thanks for your consideration!

--=20
Tom

--Ublo+h3cBgJ33ahC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZfzenAAoJEIf59jXTHXZS0H8P/10QHFenn7MR68ruA+9NN1SO
YANmmvHggWnt+ka2ln10aw2rNDPBayPAz/dUvEX9xXU5etjhG08lQh6fZH2iNqM5
1+1yBScHwCebgvcvYtv0aEHswOG/firqAw4jn5kUgdxDDa/T4bWjM6+e9uOhqt8u
ZjDOBXow+1osdmizrRptWxXvoRiuACTKGj3Y8DIDFnr7TsL2+WuVRDrNgpgLVujF
pnPMyqzglT9WqlWpSttZoUbTgURU/KMzviJOdZH+lSLRDnQ9UFfHq+9YX9SbJoqY
B2FSINuBN0r32yzqeg/FW3kGuiM4Byi2jQv3fuyLfDL9okFGNTyOuut+GAoJNBFo
TlYqwnwh1zDAnkzsGtkskmx91mzBDM82pYk30KFIZG8A4Qe//s9AdtnVcUKvgIjK
5/22cfpCKOZb1/ZNiI1kZgm6XkRfKalCn2USbO39xpXg605RO0Kdw+0gD/lc2Qta
l/kyNY3+rXk0cRbuJ08CE3rVRAUBxsfF83M3ojSjz773LfYgDoGrhYxXJ+tsjtoA
LDEsr53HMFmK9ELAeQ4kUmMacVj8dRJaFa/fGh3Laej6GgfZ2mMr3Oj+kYu+ric1
TIkg6luFG6ITo9DKLbRChQXGPKz5fzPSyuIYHZv37VLWXdTloXi5MSRrqGm4+5M6
gKoPITMVNZKP+TmYuiKu
=B5qI
-----END PGP SIGNATURE-----

--Ublo+h3cBgJ33ahC--
