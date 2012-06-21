Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ShiZS-0002ar-K2
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 16:41:18 +0200
Received: by eaal1 with SMTP id l1so238953eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 07:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=GiHR8vi8F0TDOymGIlQ/pOXba5SUfwebr62mwGNofNY=;
	b=OW4IXH9hheKMQWZAij6H/7/9CH4jT1TJj6iD9hryGMTnBE7ea14Z5YNvwAxU7nZOH4
	cMXu9y/ILWlXAlI7xBNPKidzyGoyYMf59g2tjy+cCeWoAOCwVpZYLbd19TPo+Wq+1Nmf
	pUlCws1tmzsu+TvF3pNK44tLumQTXNZgBzfJaPbyGQXKZa28xaG/4AozU9E3SkPlytjW
	GsAw6tIrrEZ1psYtqVhqrC6Z0NHGnNgN/+yoY0jJ8LQgN9Y0pHYRBWVnmMXOQpCTAXVQ
	eVdyQ8sqzdo4J/ydPvI3l5kMle/Hy00U76nvPyVA4/yGVSwjnFbxp8alp1QHb30lABCW
	BaQg==
Received: by 10.14.37.2 with SMTP id x2mr5081426eea.72.1340289032657;
	Thu, 21 Jun 2012 07:30:32 -0700 (PDT)
Received: from ?IPv6:2001:610:612::b158:17:12ce:5b02?
	([2001:610:612:0:b158:17:12ce:5b02])
	by mx.google.com with ESMTPS id u14sm103437647eem.4.2012.06.21.07.30.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 07:30:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZc57=-7fEto_2dEL=yjDDoKH=HntQQFLTzZo=tqBSxcw@mail.gmail.com>
Date: Thu, 21 Jun 2012 16:30:27 +0200
Message-Id: <6BA43A2F-5293-4CBD-9DE7-39D3ABD0AF88@dominion.thruhere.net>
References: <CAJTo0LZc57=-7fEto_2dEL=yjDDoKH=HntQQFLTzZo=tqBSxcw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkQBZOzpni2VQqyaTOyKx9djc+UjyzW7NPpTju3Plc6XjhqYdl4ZRAGwDrHqU4TYCBUMxgr
Subject: Re: [RFC] Fetching single files
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
X-List-Received-Date: Thu, 21 Jun 2012 14:41:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jun. 2012, om 16:01 heeft Burton, Ross het volgende geschreven:

> Hi,
>=20
> I was looking at updating the webkit-gtk package to the latest
> upstream when I noticed that instead of just checking out the
> repository it checks out a selection of directories and includes in
> oe-core the essential top-level files.  I can see the rationale for
> this: a full checkout of webkit includes the full test suite and web
> site sources.
>=20
> However I'm not entirely keen on the package shipping the top-level
> files in oe-core, as that is asking for trouble.  One solution would
> be the ability to fetch a single file through the svn fetcher instead
> of a directory, which svn can do using "svn export" (checking out a
> file is an error).  This doens't bring any metadata along with it so
> it isn't actually a checkout that can be updated in the future, but
> for a single file I think this isn't a problem.
>=20
> In poky-contrib:ross/svn I've started implement a proof of concept on
> this.  So far using the singlefile=3D1 parameter the export logic is
> activated, the file is svn exported and stashed in the download
> directory, suitable renamed.  The next step is to hook this into the
> unpack stage so that the file gets renamed correctly on it's way to
> the workdir.
>=20
> But before I start looking at this I thought I'd mail the list and see
> if anyone has any comments.  So, anyone know of any problems, pitfalls
> or better solutions?

We didn't do single file fetches/checkouts in the past because it's a =
svn 1.6.x feature. I would be really happy if we declare that 1.6.x is =
the minimum we support. I would be even happier if we just fetch webkit =
(completely) from git :)

regards,

Koen=


