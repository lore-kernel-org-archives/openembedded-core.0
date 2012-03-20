Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9y3G-0006Ts-0E
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 13:20:34 +0100
Received: by wgbdr12 with SMTP id dr12so1182508wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 05:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=VIKnWUccUNKLAA/SuGs3H2cyEYVHPuWVoaqtyHxYY+g=;
	b=OhPMenZFMZq7OfrsDLSRKDnYEAxcr3PPL3DqY6cas5dxl/25qgsuVDKVTkkXa7DAk7
	Ywe5HvlFf688B829SZr9mMpaQs2DRu/Tvw8q4kMhdiX9fsPVp6GzZ0HNK4HBGAt0bMuh
	ltq2bniHlcGBgXZpW50S0VyLNmJ074oGiVeOQ1Ufv2otmOWEi+gdUraRfS9IsyWEynrv
	Cn9zuylQBXF0QDxP2qagLsg8X5C8dTd1rgRsH6JIThJfrUdlCTXC6wVrF0pBa/6U5YSk
	qDo6P14aVdKNS/lla0+OSaPH5oJmxXbr2hKoqUopElnHYi5aYV3zOou14r4KlhlsASFX
	YxLw==
Received: by 10.216.131.98 with SMTP id l76mr9204351wei.62.1332245501557;
	Tue, 20 Mar 2012 05:11:41 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fz9sm33600018wib.3.2012.03.20.05.11.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 05:11:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1812139.SkpSglmEkv@helios>
Date: Tue, 20 Mar 2012 13:11:38 +0100
Message-Id: <C78FED4E-E3C7-4369-9622-0A4C6AA009DC@dominion.thruhere.net>
References: <1332241255-5083-1-git-send-email-koen@dominion.thruhere.net>
	<1332241255-5083-3-git-send-email-koen@dominion.thruhere.net>
	<1812139.SkpSglmEkv@helios>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQklrCVNuBXUL5ehNS5sLG/4rSbmreFp97iwTkVYEJo28TjBZ9eFwJ3tYDB/KRPrDRRcKGGn
Subject: Re: [PATCH 3/3] buildhistory: remove duplicate entries from dot graph
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
X-List-Received-Date: Tue, 20 Mar 2012 12:20:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 mrt. 2012, om 12:48 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 20 March 2012 12:00:55 Koen Kooi wrote:
>> There are various conditions that lead to duplicate entries in the =
dot graph
>> which need to get fixed, but this patch is a catchall.
>=20
> Dependencies and recommends are already de-duped - are we getting =
duplicates=20
> in the package list as well?

=46rom what I'm seeing, only dupes in the dot files:

=
https://github.com/Angstrom-distribution/buildhistory/commit/b2a256e02e043=
49db51e663e35b2bb9989acc854#diff-1

>> Another benefit is that the sort order is now know, leading to less =
spurious
>> diffs in buildhistory commits.
>=20
> The package list is already sorted, and so are the dependencies and=20
> recommends, so how would the sort order be changing?

Those fields are not sorted in the package itself[1], re-running bitbake =
systemd-image after these changes:

 angstrom_feed_configs -> opkg [style=3Ddotted];
-angstrom_task_boot -> task_boot;
 angstrom_task_boot -> angstrom_version;
+angstrom_task_boot -> task_boot;
[..]
-htop -> ncurses_terminfo;
-htop -> libtinfo5;
 htop -> libncurses5;
-iw -> libnl_genl_3_200;
+htop -> libtinfo5;
+htop -> ncurses_terminfo;
 iw -> libnl_3_200;

I think I know why [2] doesn't work:

koen@dominion:/data/ssd/OE/buildhistory$ echo b c a | sort
b c a
koen@dominion:/data/ssd/OE/buildhistory$ echo -e b\\nc\\na | sort
a
b
c

Let me know how you want me to respin this series, each commit is an RFC =
on its own.

regards,

Koen

[1] =
https://github.com/openembedded/oe-core/commit/06b740d4ca077fb4c89ee6d1065=
fabb02da45ec6
[2] =
https://github.com/openembedded/oe-core/commit/830df6067c1ea4a5aab580b42ba=
7e1e84fe1bcbf=


