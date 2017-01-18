Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 17A586FF0E;
	Wed, 18 Jan 2017 10:02:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jan 2017 02:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,249,1477983600"; d="scan'208";a="214722695"
Received: from jayyinch-mobl6.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.188.18])
	by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2017 02:02:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-architecture@lists.openembedded.org,
	openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Date: Wed, 18 Jan 2017 23:02 +1300
Message-ID: <8251941.rtFFyTMRIg@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.13-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
MIME-Version: 1.0
Subject: Layer index enhancements
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
X-List-Received-Date: Wed, 18 Jan 2017 10:02:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

We've done some work recently on the OE layer index [1] and I thought it might 
be useful to give a summary of what's been implemented:

* Upgraded to Django 1.8. This was a bunch of work without much visible 
impact, however it does mean we are now on an LTS version of Django which is 
much easier to maintain and will receive security updates until some time in 
2018.

* Added the ability to search for recipes inheriting a specific class - just 
add inherits:classname to the search text. For example [2] - you can even 
search for recipes inheriting several classes [3] (i.e. all specified classes 
must be inherited in order to match). Note: any other search words are 
interpreted as part of a string that must be present - we haven't switched to 
doing keyword-based searching.

* Distros provided by each layer are now collected. I still have to sort out 
an issue with the collection so most of them aren't showing up in the index 
yet, but the capability exists.

* Update records - each time we do an update (every three hours) or when a 
manual update is triggered by Michael, we record the output against the layer 
plus a separate overall record for the update showing the output for all 
layers (if you log in this is available from Tools -> Updates, but anyone can 
access it at [4]). The latter also lets us see how long updates are taking. If 
you look over the recent update logs you can see we still have to fix up some 
issues with the data (e.g. because of branches and repos going away, missing 
dependencies or other metadata issues, etc.). Hopefully making this more 
visible will help us to tidy these up.

* The layer submission/editing page now lets you select a git web interface, 
so if you're submitting a layer that's hosted on a server providing a cgit, 
gitweb or gitlab web interface that isn't one of the common servers we know 
about (e.g. git.openembedded.org, github, etc.) then you won't have to figure 
out the syntax for the file/tree URLs, you just select the type and it'll set 
those fields automatically.

* Fixed a bug that caused recipes to show up twice in the search results if 
the searched string appeared in both the name and description. Exact matches 
on name now show up first in the search results as well.

* Fixed a recently introduced bug in the OE-Classic search that resulted in 
Internal Server errors when searching by name

* We now pick up layer dependencies (and recommends) specified in the 
layer.conf, but only if they match the layer name - we don't handle collection 
names yet, so this won't currently work where the collection name doesn't 
match the layer name (e.g. oe-core, meta-oe...).

* Counts for recipes, machines, classes, appends, and distros are now shown on 
each tab on the layer detail page

Thanks to Michael Halstead, Liam Howlett and Mark Hatle for helping me with 
these.

Cheers,
Paul


[1] https://layers.openembedded.org/

[2] 
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=inherits%3Acmake

[3]
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=inherits%3Acmake+inherits%3Apkgconfig

[4] https://layers.openembedded.org/layerindex/updates/


-- 

Paul Eggleton
Intel Open Source Technology Centre

