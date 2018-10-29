Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EE84C7503E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 13:58:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9TDwlX4026716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 29 Oct 2018 13:58:49 GMT
Message-ID: <86baa5a7d55140c07262ff7c2ec928701e469a88.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 29 Oct 2018 13:58:47 +0000
In-Reply-To: <dc70690050312e882a3aef592bb93507a09715ad.camel@linuxfoundation.org>
References: <1540204485-22641-1-git-send-email-ee.peng.yeoh@intel.com>
	<e222c50a97c8b1b555cac324659e723b49b28413.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D043480FE86E@PGSMSX110.gar.corp.intel.com>
	<dc70690050312e882a3aef592bb93507a09715ad.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/4] oeqa/core/runner: write testresult to json files
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
X-List-Received-Date: Mon, 29 Oct 2018 13:58:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-29 at 10:44 +0000, richard.purdie@linuxfoundation.org
wrote:
> On Tue, 2018-10-23 at 06:39 +0000, Yeoh, Ee Peng wrote:
> > I submitted the revised patches below. Sorry for the missing
> > "version
> > #" in the patch title. After this, I will add the "version #" into
> > the patch title. 
> > 
> > Please let me know if any question or inputs. Thank you very much
> > for
> > your attention & sharing! 
> 
> Thanks for the changes. I was at a conference last week and then
> became
> unwell. I wanted to have a further look and test the patches before
> merging and I wanted a clearer head to do that.
> 
> Unfortunately I found another problem. On my build machine, it shows:
> 
> Traceback (most recent call last):
>   File "/media/build1/poky/scripts/oe-selftest", line 70, in <module>
>     ret = main()
>   File "/media/build1/poky/scripts/oe-selftest", line 57, in main
>     results = args.func(logger, args)
>   File "/media/build1/poky/meta/lib/oeqa/selftest/context.py", line
> 289, in run
>     rc = self._internal_run(logger, args)
>   File "/media/build1/poky/meta/lib/oeqa/selftest/context.py", line
> 248, in _internal_run
>     configuration = self._get_configuration(args)
>   File "/media/build1/poky/meta/lib/oeqa/selftest/context.py", line
> 217, in _get_configuration
>     metadata = metadata_from_bb()
>   File "/media/build1/poky/meta/lib/oeqa/utils/metadata.py", line 42,
> in metadata_from_bb
>     info_dict['layers'] = get_layers(data_dict['BBLAYERS'])
>   File "/media/build1/poky/meta/lib/oeqa/utils/metadata.py", line 81,
> in get_layers
>     layer_dict[layer_name] = git_rev_info(layer)
>   File "/media/build1/poky/meta/lib/oeqa/utils/metadata.py", line 61,
> in git_rev_info
>     from git import Repo, InvalidGitRepositoryError, NoSuchPathError
> ModuleNotFoundError: No module named 'git'
> 
> That is obviously easily fixed by installing the git module but it
> does
> raise some questions, in particular, why we have two code paths which
> do the same thing (one in metadata_scm.bbclass and one in
> lib/oeqa/utils/metadata.py).
> 
> It also means we've just added new module dependencies to oe-selftest
> and the other test utilities which we don't test for anywhere or have
> documented. Doing this last thing in M4 is bad.
> 
> So this is going to need a little more thought...

I've played with the patches today. The above can be addressed by using
the same code as we use in metadata_scm in the oeqa metadata file as a
quick fix. This all needs to be reworked in 2.7 after we sort out 2.6.
I've a patch queued. I also noticed that:

* We have pointless empty log entries in the json files
* SDKs don't record which MACHINE built them (in the unique identifier 
  or the configuration section)
* the identifiers for the configuration sections in the json files are 
  not unique and results from multiple runs were being overwritten 
  locally
* the patches call SDKMACHINE SDK_MACHINE which just confuses things
* The layer metadata config was being squashed into a single entry 
  with multiple contents, there is no good reason to do that in json, 
  just leave the fields separate
* The layer metadata was being obtained from different functions, 
  potentially leading to different processing
* The output data was not being placed in LOG_DIR
* The functions still had weird "_" prefixes

Since time is short, to fix these issues I'm going to include a set of
tweaks for the patches.

Cheers,

Richard




