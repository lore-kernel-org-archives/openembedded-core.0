Return-Path: <paul.eggleton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 041E9606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 20:04:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 06 Nov 2017 12:04:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,354,1505804400"; d="scan'208";a="1240470782"
Received: from sbairi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.36])
	by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2017 12:04:34 -0800
From: Paul Eggleton <paul.eggleton@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Tue, 07 Nov 2017 09:04:30 +1300
Message-ID: <14953303.KfuyF98Oh2@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <499138bd-32cc-1487-e36e-fc4e5aceb4b2@linux.intel.com>
References: <499138bd-32cc-1487-e36e-fc4e5aceb4b2@linux.intel.com>
MIME-Version: 1.0
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: automatic recipe upgrades - making them better and sweeter
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
X-List-Received-Date: Mon, 06 Nov 2017 20:04:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

On Tuesday, 7 November 2017 12:50:05 AM NZDT Alexander Kanavin wrote:
> I've been asked by RP to look into making automatic package upgrades 
> work better, so here's what I'd like to improve:
> 
> 1) when using 'devtool upgrade', remove the need to specify version and 
> source revision on the command line, if we want to upgrade to the latest 
> release. There is now distrodata/checkpkg code in place to determine 
> both, so 'devtool upgrade <recipe>' could simply default to that.

You could certainly have it dynamically inherit distrodata for the recipe (via 
the workspace bbappend) and then use that to get the required information. I'd 
avoided that extra complexity earlier but it may be that now it's actually 
easier than it was before. The only thing I would say is we need to produce 
clear error messages if we don't have the needed information to automatically 
figure out what the upgrade version should be.

> 2) help with LICENSE checksum changes a bit more; both devtool and AUH 
> have some code for this, so I want to review what they do, and 
> consolidate it in a single place. Maintainers should be able to see a 
> diff of what the changes are.

Agreed. For everyone else's benefit, Alex filed a bug for this a while ago:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=10801

I am keeping an eye on this one.

> 3) 'devtool finish' currently does not handle the recipe upgrade 
> situation well: the new recipe and patches are placed side by side with 
> the current recipe. The old stuff should be removed, and a tentative 
> commit should be created. So maybe add a 'devtool finish-upgrade'.

That's not what's supposed to happen - it should already be deleting the 
original files (it takes a record of the copied files when you run devtool 
upgrade, and then when you run devtool finish it deletes those and moves the 
new ones across from the workspace). If that's not working it's a bug and I 
would appreciate a reproducer. I'd certainly prefer that we keep to one finish 
command that does its best to "do the right thing" depending on the situation.
 
> 4) AUH should be stripped to its core business: sending useful emails to 
> maintainers, and leave the rest to devtool. If 'devtool upgrade' 
> succeeded, then corresponding patches should be attached, otherwise (if 
> patch rebase failed, or a fetch issue), at least it could tell what 
> happened and suggest a devtool upgrade command to get started. Any 
> duplicate functionality for upgrading (stuff that is also in devtool) 
> should be removed.

Agreed. There's a bug open for this one too:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=10598

BTW, you have impeccable timing as I am currently in the middle of preparing a 
fairly substantial changeset for devtool including implementing a dry-run mode 
for devtool finish (so you can see what it's going to do) and fixing the 
following bugs, among others:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=10939
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=11948
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=11516

Current WIP is on paule/devtool31 in poky-contrib.

Cheers,
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre

