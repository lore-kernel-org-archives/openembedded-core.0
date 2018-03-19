Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1331A78963
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 14:36:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 07:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,330,1517904000"; d="scan'208";a="26558483"
Received: from psivasub-mobl.gar.corp.intel.com (HELO [10.255.170.229])
	([10.255.170.229])
	by orsmga008.jf.intel.com with ESMTP; 19 Mar 2018 07:36:10 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1519721818-32415-1-git-send-email-anuj.mittal@intel.com>
	<1519786272-21483-1-git-send-email-anuj.mittal@intel.com>
	<CAJTo0LYQXYX9LxWdhyWXi19o2LP7Lha9=Fs-N1k=-M-e7Roc=w@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <27d33f25-911d-2eab-0491-39e7ae58db7a@intel.com>
Date: Mon, 19 Mar 2018 22:36:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYQXYX9LxWdhyWXi19o2LP7Lha9=Fs-N1k=-M-e7Roc=w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gstreamer: enable ptest support
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
X-List-Received-Date: Mon, 19 Mar 2018 14:36:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Ross,

On 03/15/2018 01:03 AM, Burton, Ross wrote:
> On 28 February 2018 at 02:51, Anuj Mittal <anuj.mittal@intel.com
> <mailto:anuj.mittal@intel.com>> wrote:
> 
>     +diff --git a/Makefile.am b/Makefile.am
>     +index de057c4..42e90fe 100644
>     +--- a/Makefile.am
>     ++++ b/Makefile.am
>     +@@ -96,6 +96,9 @@ check-torture:
>     +
>     + build-checks:
>     +       $(MAKE) -C tests/check build-checks
>     ++
>     ++install-ptest:
>     ++      $(MAKE) -C tests/check DESTDIR=$(DESTDIR) $@
>     + else
>     + check-valgrind: 
> 
>     +       echo "'check' library not installed, skipping"
> 
>  
> I'd say not to bother patching the top-level and instead call the right
> makefile from do_install_ptest.

I have made this change in v3.

> 
>     ++install-ptest: $(TESTS)
>     ++      @$(INSTALL) -d $(DESTDIR)
>     ++      @for dir in gst libs tools pipelines elements generic; do \
>     ++              if [ -x $$dir/.libs ]; then \
>     ++                      $(INSTALL) -d $(DESTDIR)/$$dir; \
>     ++                      $(INSTALL_PROGRAM) $$dir/.libs/*
>     $(DESTDIR)/$$dir/; \
>     ++              fi \
>     ++      done
> 
> 
> Can this do string functions on TESTS instead of hard-coding the list of
> directories?

TESTS is a list of <dir_name>/<test_name> and wouldn't have been
appropriate to get just the directory names. I used find to get the
first level directories instead.

Thanks,

Anuj

> 
> Ross


