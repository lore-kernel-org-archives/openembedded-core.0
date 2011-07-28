Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmQVe-0008TH-LN
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 15:20:18 +0200
Received: by wyg30 with SMTP id 30so115419wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 06:16:02 -0700 (PDT)
Received: by 10.227.165.204 with SMTP id j12mr28278wby.19.1311858962713;
	Thu, 28 Jul 2011 06:16:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h1sm680300wee.25.2011.07.28.06.16.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 06:16:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201107281400.54581.paul.eggleton@linux.intel.com>
Date: Thu, 28 Jul 2011 15:15:55 +0200
Message-Id: <49FB232D-B0CF-4A49-8E55-EA3825C1F900@dominion.thruhere.net>
References: <cover.1309883050.git.paul.eggleton@linux.intel.com>
	<e50edfa0e355ecfe38887adace64247e363150a8.1309883050.git.paul.eggleton@linux.intel.com>
	<613A1098-12B3-4A25-9E82-AC97326DBEA3@dominion.thruhere.net>
	<201107281400.54581.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1244.3)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] combo-layer-tool: add tool to manipulate combo layers
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
X-List-Received-Date: Thu, 28 Jul 2011 13:20:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 28 jul. 2011, om 15:00 heeft Paul Eggleton het volgende geschreven:

> On Thursday 28 July 2011 13:11:00 Koen Kooi wrote:
>> I've been playing with this script and I have a few remarks about it. =
First
>> the ones that aren't the fault of the script:
>>=20
>> 1) overlapping files like .gitignore breaks the script
>=20
> This can be a problem, yes. However if you know about these sorts of =
conflicts=20
> ahead of time you can mitigate them by adding the appropriate logic to =
a hook=20
> script (which can filter out stuff from the patches as they pass =
through).

Is that a hook in git or the combo script?

>=20
>> 2) git format-patch | git am is a lossy process, so you can't import
>> oe-core and bitbake from scratch:
>>=20
>> 	[14:08:48] Apply
>> =
/Users/koen/Projects/Angstrom/setup-scripts/sources/combo-layer/patch-d99a=

>> =
aa2f-57f3-4c07-aac3-afc0538cae88/bitbake/0020-codeparser.py-Ignore-incompl=
e
>> te-cache-files.patch [14:08:48] Applying: codeparser.py: Ignore =
incomplete
>> cache files error: patch failed: bitbake/lib/bb/codeparser.py:75
>> 	error: bitbake/lib/bb/codeparser.py: patch does not apply
>> 	Patch failed at 0001 codeparser.py: Ignore incomplete cache =
files
>> 	When you have resolved this problem run "git am --resolved".
>> 	If you would prefer to skip this patch, instead run "git am =
--skip".
>> 	To restore the original branch and stop patching run "git am =
--abort".
>=20
> Perhaps I'm being thick, but what's the reason for this failing?

I don't know, I had a number of strange failures, which I blame the =
format-patch | am construct for. Git sucks for non-Linus workflows, we =
just have to live with that.

>> 3) rotating disks are slow when trying to apply a few thousand =
patches
>=20
> I think this is kind of the fault of the script in that it's the =
default=20
> behaviour - frankly I never expected anyone to use combo-layer to =
build a=20
> combined repo from scratch dragging across the entire history. Ideally =
you=20
> would begin from an existing repository that you had manually combined=20=

> together, and combo-layer is the way of keeping it up-to-date after =
that=20
> point. We could easily automate the initial creation within the script =
if=20
> people think it's useful - I did think about doing that but I figured =
it's not=20
> something you expect to do very often.

With my distro maintainer hat on, I wouldn't use a combined repo for my =
day-to-day development setup, but I would hand it to my downstream =
users. The use-case I was trying to use it for is to create a git =
snapshot for a release where everything is in one place.

The current result: =
https://github.com/koenkooi/Angstrom-integration-layer

It is missing the angstrom buildscripts and config files, but it's a =
start.

Phil mentioned subtree, which is also worth looking at:

https://github.com/apenwarr/git-subtree

regards,

Koen



>=20
>> As for the script I only have one real complaint: The inability to =
set
>> branches so you can make a combo layer based on non-master (e.g. =
release)
>> branches.
>=20
> Agreed, this is an omission, shouldn't be too difficult to fix though. =
It's on my=20
> todo list, feel free to submit a patch if you want it fixed faster ;)
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre



