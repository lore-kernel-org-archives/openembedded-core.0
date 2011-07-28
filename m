Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmPUl-0006f6-6I
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 14:15:19 +0200
Received: by wyg30 with SMTP id 30so71433wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 05:11:03 -0700 (PDT)
Received: by 10.227.61.78 with SMTP id s14mr7002554wbh.86.1311855063747;
	Thu, 28 Jul 2011 05:11:03 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n6sm631880wed.40.2011.07.28.05.11.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 05:11:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <e50edfa0e355ecfe38887adace64247e363150a8.1309883050.git.paul.eggleton@linux.intel.com>
Date: Thu, 28 Jul 2011 14:11:00 +0200
Message-Id: <613A1098-12B3-4A25-9E82-AC97326DBEA3@dominion.thruhere.net>
References: <cover.1309883050.git.paul.eggleton@linux.intel.com>
	<e50edfa0e355ecfe38887adace64247e363150a8.1309883050.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
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
X-List-Received-Date: Thu, 28 Jul 2011 12:15:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 jul. 2011, om 18:28 heeft Paul Eggleton het volgende geschreven:

> From: Yu Ke <ke.yu@intel.com>
>=20
> This patch adds the script "combo-layer" to manipulate combo layer
> repos. A combo layer repo is a repo containing multiple component
> repos, e.g. oe-core, bitbake, BSP repos. The combo layer repo needs to
> be updated by syncing with the component repo upstream. This script
> is written to assist the combo layer handling.
>=20
> The combo layer tool provides three functionalities:
> - init: when the combo layer repo and component repo does not exist,
>  init will "git init" the combo layer repo, and also "git clone" the
>  component repos
>=20
> - update: combo layer tool will pull the latest commit from component
>  repo upstream, and apply the commits since last update commit to the
>  combo repo. If the user specifies interactive mode(--interactive),
>  they can edit the patch list to select which commits to apply.
>=20
> - splitpatch: split the combo repo commit into separate patches per
>  component repo, to facilitate upstream submission.
>=20
> Combo layer tool uses a config file to define the component repo info.
> Please check the combo-layer.conf.example for a detailed explanation
> of the config file fields.

I've been playing with this script and I have a few remarks about it. =
First the ones that aren't the fault of the script:

1) overlapping files like .gitignore breaks the script
2) git format-patch | git am is a lossy process, so you can't import =
oe-core and bitbake from scratch:=20

	[14:08:48] Apply =
/Users/koen/Projects/Angstrom/setup-scripts/sources/combo-layer/patch-d99a=
aa2f-57f3-4c07-aac3-afc0538cae88/bitbake/0020-codeparser.py-Ignore-incompl=
ete-cache-files.patch
	[14:08:48] Applying: codeparser.py: Ignore incomplete cache =
files
	error: patch failed: bitbake/lib/bb/codeparser.py:75
	error: bitbake/lib/bb/codeparser.py: patch does not apply
	Patch failed at 0001 codeparser.py: Ignore incomplete cache =
files=09
	When you have resolved this problem run "git am --resolved".
	If you would prefer to skip this patch, instead run "git am =
--skip".
	To restore the original branch and stop patching run "git am =
--abort".

3) rotating disks are slow when trying to apply a few thousand patches

As for the script I only have one real complaint: The inability to set =
branches so you can make a combo layer based on non-master (e.g. =
release) branches.

For the rest it does what it says on the tin :)

regards,

Koen=


