Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6B70572425
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 21:35:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Dec 2014 13:35:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,559,1413270000"; d="scan'208";a="636355807"
Received: from rginat-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.183])
	by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2014 13:35:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Thu, 11 Dec 2014 21:35:13 +0000
Message-ID: <1836192.Oio3XIGmkc@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <5489F3EC.1090206@linaro.org>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<5489EDA6.1000709@linaro.org> <5489F3EC.1090206@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Thu, 11 Dec 2014 21:35:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 11 December 2014 14:43:40 Trevor Woerner wrote:
> On 12/11/14 14:16, Trevor Woerner wrote:
> > Oops! (this worked before the "git pull")
> > 
> >     $ devtool add xannounce ~/devel/yocto/build/workflow/xannounce/
> >     NOTE: Creating workspace layer in
> >     /home/trevor/devel/yocto/build/workflow/build/workspace
> >     NOTE: Recipe
> >     /home/trevor/devel/yocto/build/workflow/build/workspace/recipes/xannou
> >     nce/xannounce.bb has been automatically created; further editing may
> >     be required to make it fully functional
> >     
> >     Traceback (most recent call last):
> >       File
> >     
> >     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/devtool",
> >     line 274, in <module>
> >     
> >         ret = main()
> >       
> >       File
> >     
> >     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/devtool",
> >     line 267, in main
> >     
> >         ret = args.func(args, config, basepath, workspace)
> >       
> >       File
> >     
> >     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/lib/devtool
> >     /standard.py", line 68, in add
> >     
> >         _add_md5(config, args.recipename, recipefile)
> >       
> >       File
> >     
> >     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/lib/devtool
> >     /standard.py", line 218, in _add_md5
> >     
> >         md5 = bb.utils.md5_file(filename)
> >       
> >       File
> >     
> >     "/home/trevor/devel/yocto/build/workflow/meta-poky/bitbake/lib/bb/util
> >     s.py", line 463, in md5_file
> >     
> >         with open(filename, "rb") as f:
> >     IOError: [Errno 2] No such file or directory:
> >     '/home/trevor/devel/yocto/build/workflow/build/workspace/recipes/xanno
> >     unce/xannounce.bb'> 
> > Sure enough...
> > 
> >     $ devtool-workflow> tree workspace/
> >     workspace/
> >     
> >     |-- appends
> >     |-- conf
> >     |
> >     |   `-- layer.conf
> >     
> >     `-- recipes
> >     
> >         `-- xannounce
> >     
> >     4 directories, 1 file
> > 
> > whereas before it was:
> >     $ tree workspace/
> >     workspace/
> >     
> >     |-- appends
> >     |
> >     |   `-- xannounce.bbappend
> >     |
> >     |-- conf
> >     |
> >     |   `-- layer.conf
> >     
> >     `-- recipes
> >     
> >         `-- xannounce
> >         
> >             `-- xannounce.bb
> >     
> >     4 directories, 3 files
> > 
> > For some reason my recipe and bbappends are not getting created :-(
>
> bisecting (manually) leads to this commit being safe:
> 
> ea50ec527483eb3a094588858baebd5fb23f71c6 devtool: rename deploy/undeploy
> to deploy-target/undeploy-target
> 
> and this one introducing the problem:
> 
> 770f203f73f358ce3c6c5ac12fe2775b812bdc6b devtool: fool bitbake into
> thinking it's outputting to a terminal

Thanks for the quick bisect - I've fixed it so that wrapper is only used when 
running bitbake through "devtool build", and now "devtool add" works properly 
again. This is why I should probably write some proper tests before trying to 
do anything further...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

