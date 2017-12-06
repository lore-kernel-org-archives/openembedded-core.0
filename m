Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 50BC570016
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 15:48:59 +0000 (UTC)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Dec 2017 07:49:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,368,1508828400"; 
   d="scan'208";a="399652"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga007.fm.intel.com with ESMTP; 06 Dec 2017 07:49:00 -0800
Date: Wed, 6 Dec 2017 09:58:46 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Joshua Lock <joshua.g.lock@linux.intel.com>
Message-ID: <20171206095846.31801244@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <94bca5d9-9b8d-814b-f464-e470dfddac15@linux.intel.com>
References: <20171205155142.190886-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<94bca5d9-9b8d-814b-f464-e470dfddac15@linux.intel.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] core/loader.py: fix regex to include all available test cases
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
X-List-Received-Date: Wed, 06 Dec 2017 15:49:00 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 Dec 2017 11:50:58 +0000
Joshua Lock <joshua.g.lock@linux.intel.com> wrote:

> On 05/12/17 15:51, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > 
> > Some test cases (i.e. eSDK.oeSDKExtSelfTest*) does not match with current regex,
> > fix it to accept these (and previous ones).
> > 
> > Without it, the following runtime exception is observed when executing eSDK
> > selftest (oe-selftest -r eSDK)
> > 
> >      Traceback (most recent call last):
> >        File "/openembedded-core/scripts/oe-selftest", line 70, in <module>
> >          ret = main()
> >        File "/openembedded-core/scripts/oe-selftest", line 57, in main
> >          results = args.func(logger, args)
> >        File "/openembedded-core/meta/lib/oeqa/selftest/context.py", line 253, in run
> >          rc = self._internal_run(logger, args)
> >        File "/openembedded-core/meta/lib/oeqa/selftest/context.py", line 205, in _internal_run
> >          self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
> >        File "/openembedded-core/meta/lib/oeqa/core/context.py", line 58, in loadTests
> >          modules_required, filters)
> >        File "/openembedded-core/meta/lib/oeqa/core/loader.py", line 69, in __init__
> >          self.modules = _built_modules_dict(modules)
> >        File "/openembedded-core/meta/lib/oeqa/core/loader.py", line 48, in _built_modules_dict
> >          module_name, class_name, test_name = m.groups()
> >      AttributeError: 'NoneType' object has no attribute 'groups'
> > 
> > Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>  
> 
> LGTM and fixes [YOCTO #12385], thanks!
> 

unfortunately, I found another way that this breaks ('bitbake  -c testimage core-image-full-cmdline', which also uses the core loader) so there is a need for a V2. 

> Acked-by: Joshua Lock <joshua.g.lock@intel.com>
> 
> > ---
> >   meta/lib/oeqa/core/loader.py | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
> > index 975a081ba4..9ab4df0a60 100644
> > --- a/meta/lib/oeqa/core/loader.py
> > +++ b/meta/lib/oeqa/core/loader.py
> > @@ -43,7 +43,7 @@ def _built_modules_dict(modules):
> >       for module in modules:
> >           # Assumption: package and module names do not contain upper case
> >           # characters, whereas class names do
> > -        m = re.match(r'^([^A-Z]+)(?:\.([A-Z][^.]*)(?:\.([^.]+))?)?$', module)
> > +        m = re.match(r'^([a-zA-Z]+)(?:\.([a-zA-Z][^.]*)(?:\.([^.]+))?)?$', module)
> >   
> >           module_name, class_name, test_name = m.groups()
> >   
> >   
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

