Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAfVN-0000eO-AK
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 11:44:29 +0100
Received: by wgbdr12 with SMTP id dr12so1089433wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 03:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=tYD67CUrZUxE8ObR4jqWp1Xynmvw8meS8TlR0CSCv7w=;
	b=Mt/x6c8Xaugo7/Js1RUpYHn5mF6GvjHb6vr+fHJ3nyHlfhXNzfuSvCFKdRyMepbvb2
	TejRSsG7FlZzQklWu8N0S3kmvOPz8r8I4vkE39qSaAHaePhKnn8xxBW9nRhzBqkxWf7c
	VIvQf8WYCG17/UEdRl/D5RbFrQ6mezN3F2B+bhAoptn8k1fHGFPJT67tungdv1n/TM37
	iyOaBzJ2KMYqbP7VQ9SMSRtI1/ZWDoDkgoX6ClgW5crPd31soi5ecHeZUzrGsx7moeU9
	I0+RJzmfQW7qiZkn8VNNnbVUgtIYpFhgZ/cf3IDqHRguPGBsCX1ccOWGEnucTNgF5H4X
	qryw==
Received: by 10.216.132.169 with SMTP id o41mr4237597wei.121.1332412534365;
	Thu, 22 Mar 2012 03:35:34 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bx13sm4177155wib.10.2012.03.22.03.35.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 03:35:32 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <16657624.ejDoFzWrx1@helios>
Date: Thu, 22 Mar 2012 11:35:30 +0100
Message-Id: <0E615ACC-662B-408B-BDAE-032723A55D15@dominion.thruhere.net>
References: <1332250734-14660-1-git-send-email-koen@dominion.thruhere.net>
	<16657624.ejDoFzWrx1@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQl6hxFSfIjoRxAyqsPCCdzLB2DLHKtulHU/PqYeBFTbOtNZiB8E0zALxC4t7lGEe0s+KSlA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC v2][PATCH 1/3] buildhistory: record all builds
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
X-List-Received-Date: Thu, 22 Mar 2012 10:44:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 mrt. 2012, om 14:51 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 20 March 2012 14:38:52 Koen Kooi wrote:
>> Allow empty commits, this also give a nice speedup since 'git status
>> --porcelain' doesn't need to get run.
>=20
> I guess my thinking before (without any verification) was that git =
commit would=20
> need to be running the equivalent of 'git status --porcelain' anyway =
and the=20
> second time it would be cached so there wouldn't be much impact. If =
the=20
> buildhistory repo is quite large or the machine is busy then it's =
entirely=20
> possible that wouldn't work out however.
>=20
> Since all image builds will force a commit anyway (as at least =
build-id must=20
> change), and for the majority of people most builds will be image =
builds, I=20
> think this is going to be a net improvement.
>=20
> Therefore I'll say:
>=20
> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

After a few more days of usage I'm going to create a follow-up patch =
that will do:

1) reinstate the global git status --porcelain and make a single, empty =
commit if nothing changed instead of N empty commits.
2) either parse the output of git status or re-run it to see which top =
level entries need to get committed and only run 'git add ; git commit' =
on those.

That will keep tracking all builds, but will be less noisy. But it will =
be slightly slower when the OS doesn't cache the git status, but I =
decided that I can personally live with that.

So what do you think about that? If you like the idea, would you like it =
as follow up or as a respin of the series?

regards,

Koen=


