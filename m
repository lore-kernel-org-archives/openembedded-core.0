Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id C184F78489;
	Mon, 12 Mar 2018 15:21:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2018 08:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,461,1515484800"; d="scan'208";a="24516586"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 12 Mar 2018 08:21:26 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <fe9f6f5b-1b12-91be-01e2-8b8e9b6eaae4@linux.intel.com>
Date: Mon, 12 Mar 2018 17:14:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: IMPORTANT: do_patch() fuzz warnings and how to deal with them
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
X-List-Received-Date: Mon, 12 Mar 2018 15:21:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

*Executive summary*

do_patch() will shortly start issuing warnings when recipe patches are 
applied with some of the patch context ignored. This email explains why 
this is necessary, and how the warnings can be eliminated.

*What is patch fuzz?*

Patch fuzz is a situation when the patch tool ignores some of the 
context lines in order to apply the patch. Consider this example:

Patch to be applied:

========
context line 1
context line 2
context line 3
+newly added line
context line 4
context line 5
context line 6
========

Original source code:

========
different context line 1
different context line 2
context line 3
context line 4
different context line 5
different context line 6
========

Outcome:

========
different context line 1
different context line 2
context line 3
newly added line
context line 4
different context line 5
different context line 6
========

Chances are, the newly added line was actually added in a completely 
wrong location, or it was already in the original source, and was added 
for the second time. This is especially possible, if the context line 3 
and 4 are blank or have only generic things in them like #endif or }. 
Even worse, there is currently no warning when this happens, and 
depending on the patched code, it can (and does) still compile without 
errors.

*What is changing*

When patch fuzz is detected, there will be a warning printed, similar to 
this:

     WARNING: vulkan-1.0.61.1-r0 do_patch:
     Some of the context lines in patches were ignored. This can lead to 
incorrectly applied patches.
     The context lines in the patches can be updated with devtool:

         devtool modify <recipe>
         devtool finish --force-patch-refresh <recipe> <layer_path>

     Then the updated patches and the source tree (in devtool's workspace)
     should be reviewed to make sure the patches apply in the correct place
     and don't introduce duplicate lines (which can, and does happen
     when some of the context is ignored).
     Details:
     Applying patch demos-Don-t-build-tri-or-cube.patch
     patching file demos/CMakeLists.txt
     Hunk #1 succeeded at 63 (offset 2 lines).
     Hunk #2 succeeded at 76 with fuzz 1 (offset 2 lines).

*How to elimimate the warnings?*

Use devtool command as explained by the warning. First, unpack the 
source into devtool workspace:

	devtool modify <recipe>

This will apply all the patches, and create new commits out of them in 
the workspace - with the patch context updated.

Then, replace the patches in the recipe layer:

         devtool finish --force-patch-refresh <recipe> <layer_path>

The patch updates need be reviewed (preferably, with a side-by-side diff 
tool) to ensure they are indeed doing the right thing:

1) they get applied in the correct location;
2) they do not introduce duplicate lines, or otherwise do things that 
are not anymore necessary.

To confirm these things, you can also review the patched source code in 
devtool's workspace, typically in <build_dir>/workspace/sources/<recipe>/

Once the review is done, you can create and publish a layer commit with 
the patch updates that modify the context. Devtool may also refresh 
other things in the patches, those can be discarded.


Alex

