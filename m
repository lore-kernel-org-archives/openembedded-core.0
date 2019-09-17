Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Sep 2019 22:12:33 UTC
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA797FD6F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 22:12:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Sep 2019 15:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,518,1559545200"; d="scan'208";a="338129524"
Received: from mnazeli-mobl.gar.corp.intel.com (HELO linux.fritz.box)
	([10.255.175.201])
	by orsmga004.jf.intel.com with ESMTP; 17 Sep 2019 15:05:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jaewon Lee <JAEWON@xilinx.com>
Date: Wed, 18 Sep 2019 10:05:09 +1200
Message-ID: <2420065.Evh0tLMQLu@linux.fritz.box>
Organization: Intel Corporation
In-Reply-To: <BYAPR02MB5816F67E4B32AB35B425D15DAFA20@BYAPR02MB5816.namprd02.prod.outlook.com>
References: <1554163613-2791-1-git-send-email-jaewon.lee@xilinx.com>
	<BYAPR02MB5816F67E4B32AB35B425D15DAFA20@BYAPR02MB5816.namprd02.prod.outlook.com>
MIME-Version: 1.0
Cc: Bruce Ashfield <brucea@xilinx.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH] Introduce mechanism to keep nativesdk* sstate in esdk
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
X-List-Received-Date: Tue, 17 Sep 2019 22:12:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jaewon

Richard was waiting for me to review this - unfortunately another one that fell between the cracks - sorry about that.

On Friday, 30 August 2019 5:13:39 AM NZST Jaewon Lee wrote:
> > -----Original Message-----
> > From: Jaewon Lee <jaewon.lee@xilinx.com>
> > Sent: Monday, April 1, 2019 5:07 PM
> > To: openembedded-core@lists.openembedded.org; Alejandro Enedino
> > Hernandez Samaniego <alejandr@xilinx.com>; Manjukumar Harthikote
> > Matha <MANJUKUM@xilinx.com>; Bruce Ashfield <brucea@xilinx.com>
> > Cc: Jaewon Lee <JAEWON@xilinx.com>
> > Subject: [oe-core][master][PATCH] Introduce mechanism to keep nativesdk*
> > sstate in esdk
> > 
> > Using SDK_INCLUDE_NATIVESDK flag to toggle inclusion of all nativesdk*
> > sstate into esdk Currently locked-sigs.inc is generated during
> > do_sdk_depends which doesn't pull in nativesdk packages. Generating
> > another locked-sigs.inc in do_populate_sdk_ext and pruning it to only
> > nativesdk* packages by using a modified version of the already existing
> > function prune_locked_sigs and merging it with the current locked-sigs.inc
> > Also adding SDK_INCLUDE_NATIVESDK tasklistfn to the logic surrounding
> > setting tasklist file to not prune esdk sstate during creation
> > 
> > Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>

The commit message doesn't actually explain why you are adding this functionality. You explained it elsewhere (bug 13261) but it needs to be in here. I would also recommend adding a "Fixes [YOCTO #13261]" at the end so there's a reference back to the bug as well.

> > @@ -414,7 +433,7 @@ python copy_buildsystem () {
> > 
> >      sdk_include_toolchain = (d.getVar('SDK_INCLUDE_TOOLCHAIN') == '1')
> >      sdk_ext_type = d.getVar('SDK_EXT_TYPE')
> > -    if sdk_ext_type != 'minimal' or sdk_include_toolchain or derivative:
> > +    if (sdk_ext_type != 'minimal' or sdk_include_toolchain or derivative) and not sdk_include_nativesdk:
> >          # Create the filtered task list used to generate the sstate cache shipped with the SDK
> >          tasklistfn = d.getVar('WORKDIR') + '/tasklist.txt'
> >          create_filtered_tasklist(d, baseoutpath, tasklistfn, conf_initpath) @@ -

This logic change looks a bit odd. Are you sure this is correct?

Thanks
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



