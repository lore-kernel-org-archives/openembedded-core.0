Return-Path: <paul.eggleton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA0D605BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 20:17:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Nov 2017 12:17:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,360,1505804400"; 
   d="scan'208";a="4690445"
Received: from tkdhir-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.68.14])
	by orsmga002.jf.intel.com with ESMTP; 07 Nov 2017 12:17:50 -0800
From: Paul Eggleton <paul.eggleton@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 08 Nov 2017 09:17:46 +1300
Message-ID: <2194500.PL2B6VVPY9@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <a01ffbee-b133-0481-9836-11239fad8294@linux.intel.com>
References: <499138bd-32cc-1487-e36e-fc4e5aceb4b2@linux.intel.com>
	<14953303.KfuyF98Oh2@peggleto-mobl.ger.corp.intel.com>
	<a01ffbee-b133-0481-9836-11239fad8294@linux.intel.com>
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
X-List-Received-Date: Tue, 07 Nov 2017 20:17:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 8 November 2017 4:20:18 AM NZDT Alexander Kanavin wrote:
> On 11/06/2017 10:04 PM, Paul Eggleton wrote:
> >> 3) 'devtool finish' currently does not handle the recipe upgrade
> >> situation well: the new recipe and patches are placed side by side with
> >> the current recipe. The old stuff should be removed, and a tentative
> >> commit should be created. So maybe add a 'devtool finish-upgrade'.
> > 
> > That's not what's supposed to happen - it should already be deleting the
> > original files (it takes a record of the copied files when you run devtool
> > upgrade, and then when you run devtool finish it deletes those and moves
> > the new ones across from the workspace). If that's not working it's a bug
> > and I would appreciate a reproducer. I'd certainly prefer that we keep to
> > one finish command that does its best to "do the right thing" depending on
> > the situation.
> 
> For me it happens every time. I run 'devtool finish <recipe> ../meta' 
> and while the new files are placed into the correct dir in the layer, 
> the old ones all remain (which is especially annoying if I then need to 
> manually sort the added/deleted patch files).
> 
> Can you run a quick check to see if it happens on your side? Something 
> trivial, like ffmpeg would do. I can then file a bug.

You're right, I tried upgrading ffmpeg from 3.3.3 to 3.3.5 and it didn't 
remove the old files. I've gone ahead and filed a bug and will look at it 
today:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=12318
 
> Also, there shouldn't be a need to specify the destination at all, if 
> the recipe is modified or upgraded.

So there is a method to this madness, but it's less about your use case than 
it is people making customisations that they are best advised to put somewhere 
else - I'm trying to make the user think about where the changes should go 
beforehand, because the nature of devtool finish is that you can't easily go 
back and shift the changes elsewhere after you've run it. It would be trivial 
to add an option that put the recipe back where it came from without you 
having to be explicit though, so we could add that; potentially we could have 
a configuration option to make that the default for you and others who more 
commonly update the base metadata. Otherwise, I'm open to alternative 
suggestions, but preferably I still want to avoid making it easy for users to 
make a mistake and update the original metadata when they really should have 
pointed it at their own layer.

Cheers,
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre

