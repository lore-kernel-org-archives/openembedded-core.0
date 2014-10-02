Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E4EB17175D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 14:28:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Oct 2014 07:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,638,1406617200"; d="scan'208";a="612136311"
Received: from cpariyar-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.78])
	by orsmga002.jf.intel.com with ESMTP; 02 Oct 2014 07:28:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 02 Oct 2014 15:28:45 +0100
Message-ID: <1562578.oLJUK6xils@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <5414722.IoP6y5qali@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1412233591.git.liezhi.yang@windriver.com>
	<1c8f43767c7d78872d38652ea808f30ea825bbef.1412233591.git.liezhi.yang@windriver.com>
	<5414722.IoP6y5qali@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] bash: Fix CVE-2014-7169
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
X-List-Received-Date: Thu, 02 Oct 2014 14:28:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 October 2014 13:28:54 Paul Eggleton wrote:
> On Thursday 02 October 2014 00:07:41 Robert Yang wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> > 
> > This is a followup patch to incomplete CVE-2014-6271 fix
> > code execution via specially-crafted environment
> > 
> > Change-Id: Ibb0a587ee6e09b8174e92d005356e822ad40d4ed
> > (From OE-Core master rev: 76a2d6b83472995edbe967aed80f0fcbb784b3fc)
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> > 
> >  .../bash/bash-3.2.48/cve-2014-7169.patch           |   16
> >  ++++++++++++++++
> >  meta/recipes-extended/bash/bash_3.2.48.bb          |    1 +
> >  2 files changed, 17 insertions(+)
> >  create mode 100644
> > 
> > meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
> > 
> > diff --git a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
> > b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch new file mode
> > 100644
> > index 0000000..2e734de
> > --- /dev/null
> > +++ b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
> > @@ -0,0 +1,16 @@
> > +Taken from http://www.openwall.com/lists/oss-security/2016/09/25/10
> > +
> > +Upstream-Status: Backport
> > +Index: bash-3.2.48/parse.y
> > +===================================================================
> > +--- bash-3.2.48.orig/parse.y	2008-04-29 18:24:55.000000000 -0700
> > ++++ bash-3.2.48/parse.y	2014-09-26 13:07:31.956080056 -0700
> > +@@ -2503,6 +2503,8 @@
> > +   FREE (word_desc_to_read);
> > +   word_desc_to_read = (WORD_DESC *)NULL;
> > +
> > ++  eol_ungetc_lookahead = 0;
> > ++
> > +   last_read_token = '\n';
> > +   token_to_read = '\n';
> > + }
> > diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb
> > b/meta/recipes-extended/bash/bash_3.2.48.bb index 5849ed0..e6a04cd 100644
> > --- a/meta/recipes-extended/bash/bash_3.2.48.bb
> > +++ b/meta/recipes-extended/bash/bash_3.2.48.bb
> > @@ -13,6 +13,7 @@ SRC_URI =
> > "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
> > file://build-tests.patch \
> > 
> >             file://test-output.patch \
> >             file://cve-2014-6271.patch;striplevel=0 \
> > 
> > +           file://cve-2014-7169.patch \
> > 
> >             file://run-ptest \
> >            
> >            "
> 
> Unfortunately these two only patch the 3.x version of the bash recipe,
> leaving the 4.x version unpatched.

I have just sent fixes for this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

