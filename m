Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 76C386E38B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 18:26:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jan 2014 10:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,707,1384329600"; d="scan'208";a="469772200"
Received: from acdivito-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.15])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2014 10:26:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jan 2014 18:26:05 +0000
Message-ID: <2192967.LGKIi1tr8F@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <5069586.lVvcYzeSdC@helios>
References: <1386375114-7702-1-git-send-email-raj.khem@gmail.com>
	<5069586.lVvcYzeSdC@helios>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: Specify lang in decoding strings
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
X-List-Received-Date: Thu, 23 Jan 2014 18:26:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 28 December 2013 22:52:18 Paul Eggleton wrote:
> On Friday 06 December 2013 16:11:54 Khem Raj wrote:
> > On systems where default locale is utf-8 we get errors like
> > 
> > File: 'buildhistory.bbclass', lineno: 38, function: write_pkghistory
> > 0034: if pkginfo.rconflicts:
> > 0035: f.write("RCONFLICTS = %s\n" % pkginfo.rconflicts)
> > 0036: f.write("PKGSIZE = %d\n" % pkginfo.size)
> > 0037: f.write("FILES = %s\n" % pkginfo.files)
> > *** 0038: f.write("FILELIST = %s\n" % pkginfo.filelist)
> > 0039:
> > 0040: for filevar in pkginfo.filevars:
> > 0041: filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
> > 0042: val = pkginfo.filevars[filevar]
> > Exception: UnicodeEncodeError: 'ascii' codec can't encode character
> > u'\xed' in position 337: ordinal not in range(128)
> > 
> > This patch specifies decode to use utf-8 so ascii and utf-8 based
> > locales both work
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > 
> >  meta/classes/buildhistory.bbclass |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/buildhistory.bbclass
> > b/meta/classes/buildhistory.bbclass index 1e6d968..4ff39a0 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -190,7 +190,7 @@ python buildhistory_emit_pkghistory() {
> > 
> >                  key = item[0]
> >                  
> >                  if key.endswith('_' + pkg):
> >                      key = key[:-len(pkg)-1]
> > 
> > -                pkgdata[key] = item[1].decode('string_escape')
> > +                pkgdata[key] = item[1].decode('utf-8', 'string_escape')
> > 
> >          pkge = pkgdata.get('PKGE', '0')
> >          pkgv = pkgdata['PKGV']
> 
> Khem, did you test that this actually works? Here it does not - I get
> strings with \n \t in them; reverting this change makes it interpret these
> as it should.

Unless I'm misunderstanding, I think the second parameter here is wrong, since 
according to the Python docs it's supposed to specify what to do when an error 
occurs, not specify another encoding to decode. Should it be 
.decode('utf-8').decode('string_escape') instead?

The problem that I have is I can't reproduce the failure that you observed, so 
I need you to help me to fix this properly.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

