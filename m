Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 741A560196
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 12:08:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2014 05:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,804,1400050800"; d="scan'208";a="553955739"
Received: from tskannan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.122])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2014 05:06:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 05 Aug 2014 13:06:12 +0100
Message-ID: <7529088.QbdoQG0aee@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <lysilbch02.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <alpine.LFD.2.11.1408050640270.7701@localhost>
	<lysilbch02.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: i guess there's no way to *conditionally* add tasks?
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
X-List-Received-Date: Tue, 05 Aug 2014 12:08:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 05 August 2014 13:28:45 Enrico Scholz wrote:
> "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
> 
> writes:
> > addtask configure_ptest_base after do_configure before do_compile
> > addtask compile_ptest_base   after do_compile   before do_install
> > addtask install_ptest_base   after do_install   before do_package
> > do_populate_sysroot ...
> > 
> >     # Remove all '*ptest_base' tasks when ptest is not enabled
> >     
> >     if not(d.getVar('PTEST_ENABLED', True) == "1"):
> >         for i in ['do_configure_ptest_base', 'do_compile_ptest_base', 
'do_install_ptest_base']:
> >             bb.build.deltask(i, d)
> >   
> >   so i'm guessing there's no way to conditionally add task(s) to avoid
> > 
> > adding them, only to turn around and delete them, yes?
> 
> I solved similar issues by including files conditionally; e.g. above
> would be
> 
> ---
> ptest_inc = "${@['noop', 'ptest'][d.getVar('PTEST_ENABLED', True) == '1']}"
> include ptest-${ptest_inc}.inc
> 
> --- ptest-ptest.inc ---
> addtask configure_ptest_base after do_configure before do_compile
> addtask compile_ptest_base   after do_compile   before do_install
> addtask install_ptest_base   after do_install   before do_package
> do_populate_sysroot

The point is most of the time you shouldn't need to do this kind of thing 
anymore since the introduction of addtask/deltask python functions.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

